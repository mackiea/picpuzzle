/*
    Copyright 2021 Andrew Mackie, based on Retro68's WDEF example.
    https://github.com/autc04/Retro68

    This file is part of PicPuzzle.

    PicPuzzle is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    PicPuzzle is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with PicPuzzle.  If not, see <http://www.gnu.org/licenses/>.
*/

#include <stdio.h>
#include <string.h>
#include <malloc.h>

#include <Quickdraw.h>
#include <Windows.h>
#include <Menus.h>
#include <Fonts.h>
#include <Resources.h>
#include <TextEdit.h>
#include <TextUtils.h>
#include <Dialogs.h>
#include <Devices.h>

#include "PicPuzzle.h"
#include "Puzzles.h"

/**
 * Pascalizes and dumps a string to the window. Debug only.
 * @param entry The C string to convert and print.
 */
void _log(char *entry) {
    Str63 dump;
    // Pascal string has size as first byte, then the string itself.
    dump[0] = strlen(entry);
    memcpy(dump+1, entry, dump[0]);
    MoveTo(300, _log_line++ * 10 + 40);
    DrawString(dump);
    _log_line %= 20;
}

/**
 * Dumps a number to the window. Debug only.
 * @param i The number to print.
 */
void _logI(int i) {
    char entry[32];
    sprintf(entry, "%d", i);
    _log(entry);
}

/**
 * Returns the upper-left point of the playfield in the window.
 * @param game The game to calculate for.
 */
Point getBitmapOffset(const Game *game) {
    Point p = {
        .h=CHAR_DIM.h * game->maxHintCount.h,
        .v=CHAR_DIM.v * game->maxHintCount.v
    };
    return p;
}

/**
 * Creates a new game instance.
 */
void MakeNewWindow(ConstStr255Param title, short procID)
{
    Rect *visibleRect = &((*FrontWindow()->visRgn)->rgnBBox);
    Rect bounds = { 
        .left=visibleRect->left,
        .top=visibleRect->top + LMGetMBarHeight()*2-1,
        .right= _game.bitmap.bounds.right+16,
        .bottom=_game.bitmap.bounds.bottom + LMGetMBarHeight()-1+LMGetMBarHeight()-1+16
        
    };
    _window = NewWindow(NULL, &bounds, title, true, procID, (WindowPtr) -1, true, 0);
}

/** The 10-byte code resource stub trick.
 *
 * The bytes in this resource are 68K machine code for
 *     move.l L1(pc), -(sp)    | 2F3A 0004
 *     rts                     | 4E75
 * L1: dc.l 0x00000000         | 0000 0000
 *
 * The application loads this resource and replaces the final four bytes
 * with the address of MyWindowDefProc.
 */
void InitCustomWDEF()
{
    Handle h = GetResource('WDEF', 128);
    HLock(h);
    *(WindowDefUPP*)(*h + 6) = NewWindowDefUPP(&MyWindowDefProc);
    // note: for 68K, the above is equivalent to:
    //    *(WindowDefProcPtr*)(*h + 6) = &MyWindowDefProc;
    // for PPC, it creates a routine descriptor data structure to get out of the emulator again.

    // On PPC only, we could also bypass the emulator by putting the routine descriptor into the resource,
    // and putting the pointer to the code into it here. This wouldn't work for the 68K version of this code, though.
    
    // By the way, this was the only part of this file relevant for dealing
    // with custom WDEFs.
}

/**
 * Shows the "About" box when prompted.
 */
void ShowAboutBox()
{
    _aboutBoxRef = GetNewWindow(128, NULL, (WindowPtr) - 1);
    MoveWindow(_aboutBoxRef,
        qd.screenBits.bounds.right/2 - _aboutBoxRef->portRect.right/2,
        qd.screenBits.bounds.bottom/2 - _aboutBoxRef->portRect.bottom/2,
        false);
    ShowWindow(_aboutBoxRef);
    SetPort(_aboutBoxRef);

    // Loads the text blurb.
    Handle h = GetResource('TEXT', 128);
    HLock(h);
    Rect r = _aboutBoxRef->portRect;
    
    Rect vRect = {
        .left = r.right-15,
        .top = r.top,
        .right = r.right,
        .bottom = r.bottom
    };

     
    r.right = r.right - 15;
    InsetRect(&r, 1,1);
    Rect view = r;
    r.bottom *= 2;
    _aboutDocRecord.handle = TENew(&r, &view);
    TESetText(*h, GetHandleSize(h), _aboutDocRecord.handle);
    TEPinScroll(0, -30, _aboutDocRecord.handle);
    TEUpdate(&view, _aboutDocRecord.handle);

    // TODO: The scrolling here is janky. It's needed because of the length of the license text.
    _aboutDocRecord.vScroll = NewControl(_aboutBoxRef, &vRect, "vScroll", false, 0, 0, 0, scrollBarProc, 0);
    SetControlMaximum(
        _aboutDocRecord.vScroll,
        (*_aboutDocRecord.handle)->nLines * (*_aboutDocRecord.handle)->lineHeight
    );
    ShowControl(_aboutDocRecord.vScroll);

    ReleaseResource(h);
}

/**
 * Processor for victory dialogue "OK" button.
 * @param dlg The dialog that owns the button.
 * @param itemNo Unused.
 */
pascal void ButtonFrameProc(DialogRef dlg, DialogItemIndex itemNo)
{
    DialogItemType type;
    Handle itemH;
    Rect box;

    GetDialogItem(dlg, 1, &type, &itemH, &box);
    InsetRect(&box, -4, -4);
    PenSize(3,3);
    FrameRoundRect(&box,16,16);
}

/**
 * Displays the victory box when the game is completed.
 * @param game The game which has been utterly defeated.
 */
void showVictoryBox(const Game *game)
{
    DialogPtr dlg = GetNewDialog(128,0,(WindowPtr)-1);
    InitCursor();

    DialogItemType type;
    Handle itemH;
    Rect box;

    GetDialogItem(dlg, 2, &type, &itemH, &box);
    SetDialogItem(dlg, 2, type, (Handle) NewUserItemUPP(&ButtonFrameProc), &box);

    // Draw the answer bitmap.
    GrafPtr port;
    GetPort(&port);
    SetPort(FrontWindow());

    // Generate bitmap.
    BitMap bitmap;
    bitmap.rowBytes = (game->x+7) / 8; // Add 7 to ensure it rounds up.
    bitmap.baseAddr = malloc(bitmap.rowBytes * game->y * 2);
    if(bitmap.baseAddr == NULL) {
        _log("DANGER TO MALLOC!");
        return;
    }
    SetRect(&bitmap.bounds, 0, 0, 0+game->x, 0+game->y);
    for(Byte y=0;y<game->y;y++) {
        Byte x=0;
        for(Byte xb=0;xb<bitmap.rowBytes;xb++) {
            bitmap.baseAddr[y*bitmap.rowBytes+xb] = 0x00;
            for(Byte b=0x80;b>=1;b/=2) {
                if(x>=game->x) {
                    break;
                } else if(game->bitmap.answers[y*GameMaxXY + x]) {
                    bitmap.baseAddr[y*bitmap.rowBytes + xb] += b;
                }
                x++;
            }
        }
    }
    
    Byte multiplier=2;
    const Rect portRect = dlg->portRect;
    short xMid = (portRect.right - portRect.left) / 2 + portRect.left;
    
    short dx = game->x/2 * multiplier;
    Rect r = { .top=30, .left=xMid-dx, .bottom=30+game->y * multiplier, .right=xMid+dx };
    CopyBits(&bitmap, &FrontWindow()->portBits, &bitmap.bounds, &r, srcCopy, NULL);

    SetPort(port);
    
    short item;
    do {
        ModalDialog(NULL, &item);
    } while(item != 1);

    free(bitmap.baseAddr);

    FlushEvents(everyEvent, -1);
    DisposeDialog(dlg);
}

/**
 * Keeps the menu items up to date when the game state changes.
 */
void UpdateMenus()
{
    MenuRef m = GetMenu(kMenuGame);
    WindowRef w = FrontWindow();
    if(w) {
        EnableItem(m,kItemRestart);
        EnableItem(m,kItemSolve);
        EnableItem(m,kItemClose);
    } else {
        DisableItem(m,kItemRestart);
        DisableItem(m,kItemSolve);
        DisableItem(m,kItemClose);
    }
        
    m = GetMenu(kMenuGame);
}

/**
 * TODO: Support loading games from file.
 */
static pascal Boolean StandardFileFilterProc (CInfoPBPtr cipbp)
{
	return false;
}

/**
 * Translates a compressed package into an active game.
 * @param gamePak The game data to load.
 */
void loadGame(const GamePak *gamePak, Game *game) {
    if(0 > gamePak->x > GameMaxXY || 0 > gamePak->y > GameMaxXY) {
        return;
    }
    
    game->x = gamePak->x;
    game->y = gamePak->y;
    game->bitmap.width = 14;
    strncpy(game->name, gamePak->name, 16);

    game->maxHintCount.h=0;
    game->maxHintCount.v=0;
    for(Byte y=0;y<_game.y;y++) {
        game->row[y].count = 0;
        Byte xRun = 0;
        for(Byte x=0;x<game->x;x++) {
            Byte data = gamePak->data[y*GameMaxXY/8+x/8];
            Byte mask = 0b10000000 >> (x % 8);
            bool bit = data & mask;
            game->bitmap.answers[y*GameMaxXY + x] = bit;

            // Figure out the row hints.
            if(bit) {
                // Start or continuation of a run-length.
                xRun++;
            } else if(xRun > 0) {
                // Run-length just ended.
                game->row[y].run[game->row[y].count++] = xRun;
                xRun = 0;
            }
            // Initialize all squares as unguessed.
            game->bitmap.guesses[y*GameMaxXY + x] = TRI_TRI;
        }
        if(xRun > 0) {
            // Run-length just ended; add a hint.
            game->row[y].run[game->row[y].count++] = xRun;
        }
        if(game->row[y].count > game->maxHintCount.h) {
            // We need to know the maximum number of hints to know where to offset the play area.
            game->maxHintCount.h = game->row[y].count;
        }
    }

    // Figure out the column hints.
    for(Byte x=0;x<game->x;x++) {
        game->column[x].count = 0;
        Byte run = 0;
        for(Byte y=0;y<game->y;y++) {
            bool bit = game->bitmap.answers[y*GameMaxXY + x];
            if(bit) {
                // Start or continuation of a run-length.
                run++;
            } else if(run > 0) {
                // un-length just ended.
                game->column[x].run[game->column[x].count++] = run;
                run = 0;
            }
        }
        if(run > 0) {
            // Run-length just ended; add a hint.
            game->column[x].run[game->column[x].count++] = run;
        }
        if(game->column[x].count > game->maxHintCount.v) {
            game->maxHintCount.v = game->column[x].count;
        }
    }
  
    // Set the playfield's bounds.
    Rect *visibleRect = &((*FrontWindow()->visRgn)->rgnBBox);
    game->bitmap.bounds.left   = visibleRect->left + getBitmapOffset(game).h;
    game->bitmap.bounds.top    = visibleRect->top  + getBitmapOffset(game).v;
    game->bitmap.bounds.right  = visibleRect->left + getBitmapOffset(game).h + game->x * game->bitmap.width;
    game->bitmap.bounds.bottom = visibleRect->top  + getBitmapOffset(game).v + game->y * game->bitmap.width;
}

/**
 * Handle a menu item selection.
 * @param menuCommand The value of the menu item selected.
 */
void DoMenuCommand(long menuCommand)
{
    Str255 str;
    WindowRef w;
    short menuID = menuCommand >> 16;
    short menuItem = menuCommand & 0xFFFF;
    Byte title[16];
    if(menuID == kMenuApple)
    {
        if(menuItem == kItemAbout)
            ShowAboutBox();
        else
        {
            GetMenuItemText(GetMenu(kMenuGame), menuItem, str);
            OpenDeskAcc(str);
        }
    }
    else if(menuID == kMenuGame)
    {
        switch(menuItem)
        {
            case kItemNewDoc:   // Start a new game.
                // GetIndString(str,128,1);
                // todo: Support loading games.
                /*
                Point p = { 20, 20 };
                FileFilterUPP upp = NewFileFilterProc(StandardFileFilterProc);
                INTEGER numt = 0;
                SFTypeList tl;
                DlgHookUPP dh;
                SFReply *rep = NULL;
                SFGetFile(p, (ConstStringPtr)"ABC", NULL, -1, tl, NULL, rep);
                if(!rep->good) {
                    return;
                }
                */
                loadGame(&_pak, &_game);

                // Pascalize the game name and set it as the title.
                title[0] = strlen(_game.name);
                memcpy(title+1, _game.name, title[0]);
                MakeNewWindow(title, documentProc);
                
                // TODO: Multiple games at a time?
                DisableItem(GetMenu(kMenuGame), kItemNewDoc);
                break;

            case kItemClose:    // End the current game.
                w = FrontWindow();
                if(w)
                {
                    if(GetWindowKind(w) < 0) {
                        CloseDeskAcc(GetWindowKind(w));
                    } else {
                        DisposeWindow(FrontWindow());
                        EnableItem(GetMenu(kMenuGame), kItemNewDoc);
                    }
                }
                break;

            case kItemRestart:  // Reset the game.
                for(int b=0;b<GameMaxXY*GameMaxXY;b++) {
                    _game.bitmap.guesses[b] = TRI_TRI;
                }
                InvalRect(&_game.bitmap.bounds);
                break;
            case kItemSolve:    // Show the solution.
                for(int b=0;b<GameMaxXY*GameMaxXY;b++) {
                    _game.bitmap.guesses[b] = _game.bitmap.answers[b] ? TRI_TRUE : TRI_FALSE;
                }
                InvalRect(&_game.bitmap.bounds);
                break;
            case kItemQuit: // Exit.
                ExitToShell();
                break;
        }
    }
    HiliteMenu(0);
}

/**
 * Draw the hints to the left or above the playing field.
 * @param game The game to get the hints from.
 */
void drawHints(const Game *game) {
    Point offset = getBitmapOffset(game);
    Byte hint[3];
    Rect r;
    // Frame around row hints.
    SetRect(&r, 0, offset.v, offset.h, game->y * game->bitmap.width + offset.v);
    FrameRect(&r);
    // Frame around column hints.
    SetRect(&r, offset.h, 0, game->x * game->bitmap.width + offset.h, offset.v);
    FrameRect(&r);

    // Draw row hints.
    for(Byte y=0;y<game->y;y++) {
        Byte rx = 0;
        for(Byte h=0;h<game->row[y].count;h++) {
            MoveTo(rx, (y+1)*game->bitmap.width + offset.v-2);
            if(game->row[y].run[h] <= 9) {
                hint[0] = 1;    // Pascal string size.
                hint[1] = '0' + game->row[y].run[h];
                rx += CHAR_DIM.h;
            } else if(game->row[y].run[h] <= 99) {
                hint[0] = 2;    // Pascal string size.
                hint[1] = '0' + game->row[y].run[h] / 10;
                hint[2] = '0' + game->row[y].run[h] % 10;
                rx += 2*CHAR_DIM.h;
            }
            DrawString(hint);
        }

        // Line at the bottom.
        Rect r;
        SetRect(
            &r,
            0,
            (y+1)*game->bitmap.width + offset.v - 1,
            offset.h,
            (y+1)*game->bitmap.width + offset.v
        );
        FrameRect(&r);
    }

    // Draw column hints.
    for(Byte x=0;x<game->x;x++) {
        Byte cy = CHAR_DIM.v;
        for(Byte h=0;h<game->column[x].count;h++) {
            MoveTo(x*game->bitmap.width + offset.h, cy-2);
            if(game->column[x].run[h] <= 9) {
                hint[0] = 1;    // Pascal string size.
                hint[1] = '0' + game->column[x].run[h];
                cy += CHAR_DIM.v;
            } else if(game->column[x].run[h] <= 99) {
                hint[0] = 2;    // Pascal string size.
                hint[1] = '0' + game->column[x].run[h] / 10;
                hint[2] = '0' + game->column[x].run[h] % 10;
                cy += 2*CHAR_DIM.v;
            }
            DrawString(hint);
        }

        // Line at the right side.
        Rect r;
        SetRect(
            &r,
            (x+1)*game->bitmap.width + offset.h - 1,
            0,
            (x+1)*game->bitmap.width + offset.h,
            offset.v
        );
        FrameRect(&r);
    }
}

/**
 * Updates a square on the sceen.
 * Man of these parameters could be calculated here, but are passed because they are precalculated
 * and improve speed when drawing the whole playfield.
 * @param Game The game to update.
 * @param x The X index of the square.
 * @param y The y index of the square
 * @param offset The offset of the game board.
 * @param y5Div The Y index modulus 5 -- used to draw a white line after every 5th row down.
 * @param yTop The vertical position on screen of the square's top.
 * @param yBottom The vertical position on screen of the square's bottom.
 */
inline void updateBit(
        const Game *game,
        Byte x,
        Byte y,
        const Point *offset,
        INTEGER y5Div,
        INTEGER yTop,
        INTEGER yBottom
    ) {
    INTEGER xLeft = x * game->bitmap.width + offset->h;
    INTEGER xRight = (x+1) * game->bitmap.width + offset->h;
    Pattern cellColour = qd.gray;
    enum eTriState state = game->bitmap.guesses[y * GameMaxXY + x];
    if(state == TRI_FALSE) {
        cellColour = qd.white;
    } else if(state == TRI_TRUE) {
        cellColour = qd.black;
    }
    Rect r;
    SetRect(
        &r,
        xLeft,
        yTop,
        xRight -1,
        yBottom-1
    );
                
    FillRect(&r, &cellColour);

    // Draw lines to the right and bottom to create a grid.
    SetRect(
        &r,
        xLeft,
        yBottom-1,
        xRight,
        yBottom
    );
    Pattern *pattern;
    if(y5Div == 4) {
        pattern = (state == TRI_FALSE? &qd.black : &qd.white);
    } else {
        pattern = (state == TRI_TRI? &qd.black : &qd.gray);
    }
    FillRect(&r, pattern);

    SetRect(
        &r,
        xRight-1,
        yTop,
        xRight,
        yBottom
    );
    if(x%5 == 4) {
        pattern = (state == TRI_FALSE? &qd.black : &qd.white);
    } else {
        pattern = (state == TRI_TRI? &qd.black : &qd.gray);
    }
    FillRect(&r, pattern);
}

void drawPlayfield(Byte xx, Byte yy, Game *game) {
    Rect r;
    Point offset = getBitmapOffset(game);
    for(Byte y=0;y<yy;y++) {
        INTEGER yTop = y * game->bitmap.width + offset.v;
        INTEGER yBottom = (y+1) * game->bitmap.width + offset.v;
        INTEGER y5Div = y%5;
        for(Byte x=0;x<xx;x++) {
            updateBit(game, x, y, &offset, y5Div, yTop, yBottom);
        }
    }

    // Paint the outer frame. Otherwise it won't be outlined if x and/or y are divisible by 5.
    FrameRect(&game->bitmap.bounds);
}

/**
 * Renders the entire game field.
 */
void drawGame() {
    drawHints(&_game);
    drawPlayfield(_game.x, _game.y, &_game);
}

/**
 * Performs game updates.
 */
void DoUpdate(WindowRef w)
{
    SetPort(w);
    BeginUpdate(w);

    // Draws the game only if the About box is not shown.
    if(w != _aboutBoxRef) {
        drawGame();
    }

    EndUpdate(w);
}

/**
 * Returns the playfield index at the given spot on the playfield.
 * @param p The point local to the window.
 * @return The index of the point, given its onscreen square.
 */
Point getBitAtPoint(const Point *p) {
    Point bit = {
        .h = (p->h - getBitmapOffset(&_game).h) / _game.bitmap.width,
        .v = (p->v - getBitmapOffset(&_game).v) / _game.bitmap.width
    };
    return bit;    
}

/**
 * Checks after every move if all black squares are uncovered.
 * White squares can remain indeterminate.
 * If so, it pops up a victory box.
 */
void checkForUltimateVictory(const Game *game) {
    for(Byte y=0;y<game->y;y++) {
        for(Byte x=0;x<game->x;x++) {
            uint16_t index = y * GameMaxXY + x;
            if((game->bitmap.guesses[index] != TRI_TRUE && game->bitmap.answers[index])) {
                return;
            }
        }
    }
    showVictoryBox(game);
}

/**
 * Changes the state of a playfield pixel when the player clicks on it and updates the UI.
 * @return The new state; useful if the player is dragging the mouse
 *         to change multiples at a time.
 */
Point toggleBit(const Point *mouse, const Point *lastPoint) {
    Point bit = getBitAtPoint(mouse);
    if(bit.h<0 || bit.h >= _game.x || bit.v<0 || bit.v>=_game.y) {
        Point none = { .h=-1, .v=-1 };
        return none;
    }
    
    // Do nothing if this point was already flipped this click.
    if(lastPoint->h == bit.h && lastPoint->v == bit.v) {
        return bit;
    }

    // Change guess state unknown->black->white.
    _game.bitmap.guesses[bit.v* GameMaxXY + bit.h]--;
    if(_game.bitmap.guesses[bit.v* GameMaxXY + bit.h] > 2) {
        _game.bitmap.guesses[bit.v* GameMaxXY + bit.h] = 2;
    }
    checkForUltimateVictory(&_game);

    // Update bit.
    Point offset = getBitmapOffset(&_game);
    INTEGER yTop = bit.v * _game.bitmap.width + offset.v;
    INTEGER yBottom = (bit.v+1) * _game.bitmap.width + offset.v;
    updateBit(&_game, bit.h, bit.v, &offset, bit.v%5, yTop, yBottom);
    return bit;
}

/**
 * Handles text scrolling in About box.
 */
void ScrollAboutText(ControlHandle controlPtr, int16_t part) {
    if(part == 0) {
        return;
    }
    ControlPtr control = *controlPtr;
    WindowPtr window = control->contrlOwner;

    if(part == inDownButton || part == inPageDown) {
        TEPinScroll(0, -10, _aboutDocRecord.handle);
    } else if(part == inUpButton || part == inPageUp) {
        TEPinScroll(0, 10, _aboutDocRecord.handle);
    } else if(part == inThumb) {
        TEPinScroll(0, -10, _aboutDocRecord.handle);
    } else {
        // TODO: Debug text.
        char s[10] = "---------";
        sprintf(s, "\px%dx", part);
        TESetText(s, 10, _aboutDocRecord.handle);
        Rect r = { .top=0, .left=300, .bottom=300, .right=300 };
        TEUpdate(&r, _aboutDocRecord.handle);
    }
}

int main()
{
    InitGraf(&qd.thePort);
    InitFonts();
    InitWindows();
    InitMenus();
    TEInit();
    InitDialogs(NULL);

    SetMenuBar(GetNewMBar(128));
    AppendResMenu(GetMenu(128), 'DRVR');
    DrawMenuBar();

    InitCustomWDEF();
    InitCursor();

    Point lastBit = { .h=-2, .v=-2 };

    for(;;) {
        EventRecord e;
        WindowRef win;
        ControlHandle c;
        char s[16];

        SystemTask();
        if(GetNextEvent(everyEvent, &e)) {
            
            switch(e.what) {
                case keyDown:
                    if(e.modifiers & cmdKey) {
                        UpdateMenus();
                        DoMenuCommand(MenuKey(e.message & charCodeMask));
                    }
                    break;
                case mouseDown:
                    switch(FindWindow(e.where, &win)) {
                        case inGoAway:
                            if(TrackGoAway(win, e.where)) {
                                DisposeWindow(win);
                                if(win != _aboutBoxRef) {
                                    EnableItem(GetMenu(kMenuGame), kItemNewDoc);
                                }
                            }
                            break;
                        case inDrag:
                            DragWindow(win, e.where, &qd.screenBits.bounds);
                            break;
                        case inMenuBar:
                            UpdateMenus();
                            DoMenuCommand(MenuSelect(e.where));
                            break;
                        case inContent:
                            SelectWindow(win);
                            Point absoluteMousePoint = e.where;
                            GlobalToLocal(&e.where);
                            if(win != _aboutBoxRef) {
                                lastBit = toggleBit(&e.where, &lastBit);
                            }
                            INTEGER controlClicked = FindControl(e.where, win, &c);
                            if(inThumb == controlClicked) {
                                INTEGER oldValue = GetControlValue(c);
                                INTEGER newValue = TrackControl(c, e.where, NULL);
                                TEPtr record = *_aboutDocRecord.handle;
                                TEPinScroll(
                                    0,
                                    (oldValue-newValue) * record->lineHeight,
                                    _aboutDocRecord.handle
                                );
                            } else if(inUpButton == controlClicked) {
                                // TODO: Figure out scrolling.
                                TEPinScroll(0, 10, _aboutDocRecord.handle);
                            } else if(inDownButton == controlClicked) {
                                TEPinScroll(0, -10, _aboutDocRecord.handle);
                            } else if(inPageUp == controlClicked) {
                                TEPinScroll(0, 100, _aboutDocRecord.handle);
                            } else if(inPageDown == controlClicked) {
                                TEPinScroll(0, -100, _aboutDocRecord.handle);
                            }

                            break;
                        case inSysWindow:
                            SystemClick(&e, win);
                            break;
                            break;
                    }
                    break;
                case updateEvt:
                    DoUpdate((WindowRef)e.message);
                    // Listen for dragging across cells.
                    if(lastBit.h != -2) {
                        GlobalToLocal(&e.where);
                        lastBit = toggleBit(&e.where, &lastBit);
                    }

                    break;
                case mouseUp:
                    lastBit.h = -2;
                    lastBit.v = -2;
                    break;
            }
        }        
    }
    return 0;
}
