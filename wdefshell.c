/*
    Copyright 2017 Wolfgang Thaller.

    This file is part of Retro68.

    Retro68 is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Retro68 is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Retro68.  If not, see <http://www.gnu.org/licenses/>.
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

// in wdef.c
extern pascal long MyWindowDefProc(short varCode, WindowRef window, short message, long param);

static Rect _initialWindowRect;

enum
{
    kMenuApple = 128,
    kMenuGame
};

enum
{
    kItemAbout = 1,

    kItemNewDoc  = 1,
    kItemClose   = 2,
    kItemRestart = 4,
    kItemSolve   = 5,
    kItemQuit    = 7
};

WindowPtr _window;

// typedef unsigned char Byte;
#define GameMaxXY 64
typedef struct {
    Byte x;
    Byte y;
    Byte data[GameMaxXY * GameMaxXY / 8];
    char name[16];
} GamePak;

typedef struct {
    Byte count;
    Byte run[20];
} Run;

enum eTriState {
    TRI_FALSE,
    TRI_TRUE,
    TRI_TRI
};

typedef struct {
    bool answers[GameMaxXY * GameMaxXY];
    enum eTriState guesses[GameMaxXY * GameMaxXY];
    
    // UI elements.
    Rect bounds;
    Byte width;
} Bitmap;

typedef struct {
    Byte x;
    Byte y;
    Run row[GameMaxXY];
    Run column[GameMaxXY];
    Bitmap bitmap;
    char name[16];
    Point maxHintCount;
} Game;

Game _game;

/*
GamePak _pak = {
    .x = 8,
    .y = 3,
    .data = {
        0b10100000, 0, 0, 0, 0, 0, 0, 0,
        0b01011111, 0, 0, 0, 0, 0, 0, 0,
        0b10100000, 0, 0, 0, 0, 0, 0, 0
    },
    .name = "Key"
};
*/

GamePak _pak = {
    .x = 10,
    .y = 10,
    .data = {
        0b00001100, 0b00000000, 0, 0, 0, 0, 0, 0,
        0b00001100, 0b00000000, 0, 0, 0, 0, 0, 0,
        0b00011110, 0b00000000, 0, 0, 0, 0, 0, 0,
        0b00010010, 0b00000000, 0, 0, 0, 0, 0, 0,
        0b00110011, 0b00000000, 0, 0, 0, 0, 0, 0,
        0b00111111, 0b00000000, 0, 0, 0, 0, 0, 0,
        0b01111111, 0b10000000, 0, 0, 0, 0, 0, 0,
        0b01100001, 0b10000000, 0, 0, 0, 0, 0, 0,
        0b11100001, 0b11000000, 0, 0, 0, 0, 0, 0,
        0b11110011, 0b11000000, 0, 0, 0, 0, 0, 0
    },
    .name = "Key"
};

/*
GamePak _pak = {
    .x = 10,
    .y = 10,
    .data = {
        0b11111111, 0b11000000, 0, 0, 0, 0, 0, 0,
        0b10000000, 0b01000000, 0, 0, 0, 0, 0, 0,
        0b11000000, 0b01000000, 0, 0, 0, 0, 0, 0,
        0b11100000, 0b01000000, 0, 0, 0, 0, 0, 0,
        0b11110000, 0b01000000, 0, 0, 0, 0, 0, 0,
        0b11111000, 0b01000000, 0, 0, 0, 0, 0, 0,
        0b10000000, 0b11000000, 0, 0, 0, 0, 0, 0,
        0b11100001, 0b11000000, 0, 0, 0, 0, 0, 0,
        0b11100011, 0b11000000, 0, 0, 0, 0, 0, 0,
        0b11111111, 0b11000000, 0, 0, 0, 0, 0, 0
    },
    .name = "Key"
};
*/

Byte _log_line = 0;
void _log(char *entry) {
    Str63 dump;
    dump[0] = strlen(entry);
    memcpy(dump+1, entry, dump[0]);
    MoveTo(300, _log_line++ * 10 + 40);
    DrawString(dump);
    _log_line %= 20;
}

void _logI(int i) {
    char entry[32];
    sprintf(entry, "%d", i);
    _log(entry);
}

void MakeNewWindow(ConstStr255Param title, short procID)
{
    _window = NewWindow(NULL, &_initialWindowRect, title, true, procID, (WindowPtr) -1, true, 0);
}

void InitCustomWDEF()
{
/* The 10-byte code resource stub trick.
 *
 * The bytes in this resource are 68K machine code for
 *     move.l L1(pc), -(sp)    | 2F3A 0004
 *     rts                     | 4E75
 * L1: dc.l 0x00000000         | 0000 0000
 *
 * The application loads this resource and replaces the final four bytes
 * with the address of MyWindowDefProc.
 */

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

void ShowAboutBox()
{
    WindowRef w = GetNewWindow(128, NULL, (WindowPtr) - 1);
    MoveWindow(w,
        qd.screenBits.bounds.right/2 - w->portRect.right/2,
        qd.screenBits.bounds.bottom/2 - w->portRect.bottom/2,
        false);
    ShowWindow(w);
    SetPort(w);

    Handle h = GetResource('TEXT', 128);
    HLock(h);
    Rect r = w->portRect;
    InsetRect(&r, 10,10);
    TETextBox(*h, GetHandleSize(h), &r, teJustLeft);

    ReleaseResource(h);
    while(!Button())
        ;
    while(Button())
        ;
    FlushEvents(everyEvent, 0);
    DisposeWindow(w);
}

#ifndef TARGET_API_MAC_CARBON
    /* NOTE: this is checking whether the Dialogs.h we use *knows* about Carbon,
             not whether we are actually compiling for Carbon.
             If Dialogs.h is older, we add a define to be able to use the new name
             for NewUserItemUPP, which used to be NewUserItemProc. */

#define NewUserItemUPP NewUserItemProc
#endif

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

void UpdateMenus()
{
    MenuRef m = GetMenu(kMenuGame);
    WindowRef w = FrontWindow();
    if(w) {
        // Close menu item: enabled if there is a window
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

static pascal Boolean StandardFileFilterProc (CInfoPBPtr cipbp)
{
	return false;
}

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
            GetMenuItemText(GetMenu(128), menuItem, str);
            OpenDeskAcc(str);
        }
    }
    else if(menuID == kMenuGame)
    {
        switch(menuItem)
        {
            case kItemNewDoc:
                // GetIndString(str,128,1);
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

                title[0] = strlen(_game.name);
                memcpy(title+1, _game.name, title[0]);
                MakeNewWindow(title, documentProc); // plain document window
                break;

            case kItemClose:    // close
                w = FrontWindow();
                if(w)
                {
                    if(GetWindowKind(w) < 0)
                        CloseDeskAcc(GetWindowKind(w));
                    else
                        DisposeWindow(FrontWindow());
                }
                break;

            case kItemRestart:
                for(int b=0;b<GameMaxXY*GameMaxXY;b++) {
                    _game.bitmap.guesses[b] = TRI_TRI;
                }
                InvalRect(&_game.bitmap.bounds);
                break;
            case kItemSolve:
                for(int b=0;b<GameMaxXY*GameMaxXY;b++) {
                    _game.bitmap.guesses[b] = _game.bitmap.answers[b] ? TRI_TRUE : TRI_FALSE;
                }
                InvalRect(&_game.bitmap.bounds);
                break;
            case kItemQuit:
                ExitToShell();
                break;
        }
    }
    HiliteMenu(0);
}

void loadGame(const GamePak *gamePak) {
    if(0 > gamePak->x > GameMaxXY || 0 > gamePak->y > GameMaxXY) {
        return;
    }
    
    _game.x = gamePak->x;
    _game.y = gamePak->y;
    _game.bitmap.width = 14;
    strncpy(_game.name, gamePak->name, 16);

    _game.maxHintCount.h=0;
    _game.maxHintCount.v=0;
    for(Byte y=0;y<_game.y;y++) {
        _game.row[y].count = 0;
        Byte xRun = 0;
        for(Byte x=0;x<_game.x;x++) {
            Byte data = gamePak->data[y*GameMaxXY/8+x/8];
            Byte mask = 0b10000000 >> (x % 8);
            bool bit = data & mask;
            _game.bitmap.answers[y*GameMaxXY + x] = bit;
            if(bit) {
                // Start or continuation of a run-length.
                xRun++;
            } else if(xRun > 0) {
                // un-length just ended.
                _game.row[y].run[_game.row[y].count++] = xRun;
                xRun = 0;
            }
            _game.bitmap.guesses[y*GameMaxXY + x] = TRI_TRI;
        }
        if(xRun > 0) {
            // Run-length just ended; add a hint.
            _game.row[y].run[_game.row[y].count++] = xRun;
        }
        if(_game.row[y].count > _game.maxHintCount.h) {
            _game.maxHintCount.h = _game.row[y].count;
        }
    }

    // Figure out the column hints.
    for(Byte x=0;x<_game.x;x++) {
        _game.column[x].count = 0;
        Byte run = 0;
        for(Byte y=0;y<_game.y;y++) {
            bool bit = _game.bitmap.answers[y*GameMaxXY + x];
            if(bit) {
                // Start or continuation of a run-length.
                run++;
            } else if(run > 0) {
                // un-length just ended.
                _game.column[x].run[_game.column[x].count++] = run;
                run = 0;
            }
        }
        if(run > 0) {
            // Run-length just ended; add a hint.
            _game.column[x].run[_game.column[x].count++] = run;
        }
        if(_game.column[x].count > _game.maxHintCount.v) {
            _game.maxHintCount.v = _game.column[x].count;
        }
    }
    
}

/**
 * Returns the upper-left point of the playfield.
 */
Point CHAR_DIM = { .h=10, .v=14 };
Point getBitmapOffset(const Game *game) {
    Point p = {
        .h=CHAR_DIM.h * game->maxHintCount.h,
        .v=CHAR_DIM.v * game->maxHintCount.v
    };
    return p;
}

/**
 * Draw the hints to the left or above the playing field.
 */
void drawHints(const Game *game) {
    Point offset = getBitmapOffset(game);
    Byte hint[2];
    Rect r;
    // Frame around row hints.
    SetRect(&r, 0, offset.v, offset.h, game->y * game->bitmap.width + offset.v);
    FrameRect(&r);
    // Frame around column hints.
    SetRect(&r, offset.h, 0, game->x * game->bitmap.width + offset.h, offset.v);
    FrameRect(&r);
    // char c[64];
    // sprintf(c, "Run 0: %d %d, %d %d", game->row[0].count, game->row[0].run[0], game->bitmap.bounds.left, game->bitmap.bounds.top);
    // _log(c);

    // Draw row hints.
    for(Byte y=0;y<game->y;y++) {
        for(Byte h=0;h<game->row[y].count;h++) {
            MoveTo(h*CHAR_DIM.h, (y+1)*game->bitmap.width + offset.v-2);
            if(game->row[y].run[h] <= 9) {
                hint[0] = 1;    // Pascal string size.
                hint[1] = '0' + game->row[y].run[h];
            } else if(game->row[y].run[h] <= 99) {
                hint[0] = 2;    // Pascal string size.
                hint[1] = '0' + game->row[y].run[h] / 10;
                hint[2] = '0' + game->row[y].run[h] % 10;
                h++;
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
        for(Byte h=0;h<game->column[x].count;h++) {
            MoveTo(x*game->bitmap.width + offset.h, (h+1)*CHAR_DIM.v-2);
            if(game->column[x].run[h] <= 9) {
                hint[0] = 1;    // Pascal string size.
                hint[1] = '0' + game->column[x].run[h];
            } else if(game->column[x].run[h] <= 99) {
                hint[0] = 2;    // Pascal string size.
                hint[1] = '0' + game->column[x].run[h] / 10;
                hint[2] = '0' + game->column[x].run[h] % 10;
                h++;
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

void drawPlayfield(Byte xx, Byte yy, Game *game) {
    Rect r;
    Point offset = getBitmapOffset(game);
    SetRect(
        &game->bitmap.bounds,
        offset.h,
        offset.v,
        offset.h + xx * game->bitmap.width,
        offset.v + yy * game->bitmap.width);
    for(Byte y=0;y<yy;y++) {
        for(Byte x=0;x<xx;x++) {
            Pattern cellColour = qd.gray;
            enum eTriState state = game->bitmap.guesses[y * GameMaxXY + x];
            if(state == TRI_FALSE) {
                cellColour = qd.white;
            } else if(state == TRI_TRUE) {
                cellColour = qd.black;
            }
            SetRect(
                &r,
                x     * game->bitmap.width + offset.h,
                y     * game->bitmap.width + offset.v,
                (x+1) * game->bitmap.width + offset.h-1,
                (y+1) * game->bitmap.width + offset.v-1
            );
                        
            FillRect(&r, &cellColour);

            // Draw lines to the right and bottom to create a grid.
            SetRect(
                &r,
                x     * game->bitmap.width + offset.h,
                (y+1) * game->bitmap.width + offset.v-1,
                (x+1) * game->bitmap.width + offset.h,
                (y+1) * game->bitmap.width + offset.v
            );
            Pattern *pattern;
            if(y%5 == 4) {
                pattern = (state == TRI_FALSE? &qd.black : &qd.white);
            } else {
                pattern = (state == TRI_TRI? &qd.black : &qd.gray);
            }
            FillRect(&r, pattern);

            SetRect(
                &r,
                (x+1) * game->bitmap.width + offset.h-1,
                y     * game->bitmap.width + offset.v,
                (x+1) * game->bitmap.width + offset.h,
                (y+1) * game->bitmap.width + offset.v
            );
            if(x%5 == 4) {
                pattern = (state == TRI_FALSE? &qd.black : &qd.white);
            } else {
                pattern = (state == TRI_TRI? &qd.black : &qd.gray);
            }
            FillRect(&r, pattern);
        }
    }
}

void drawGame() {
    drawPlayfield(_game.x, _game.y, &_game);
    drawHints(&_game);
}


void DoUpdate(WindowRef w)
{
    SetPort(w);
    BeginUpdate(w);

    drawGame();

    EndUpdate(w);
}

/**
 * Start up the game.
 */
void initGame() {
    loadGame(&_pak);
}

/**
 * Returns the bit at the given spot on the playfield.
 */
Point getBitAtPoint(const Point *p) {
    Point bit = {
        .h = (p->h - getBitmapOffset(&_game).h) / _game.bitmap.width,
        .v = (p->v - getBitmapOffset(&_game).v) / _game.bitmap.width
    };
    return bit;    
}

/**
 * Returns true if the given point is in the rectangle, false otherwise.
 */
bool isInside(const Point *point, const Rect *rect) {
    return rect->left<=point->h<rect->right && rect->top<=point->v<=rect->bottom;
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
 * Changes the state of a playfield pixel when the player clicks on it.
 * @return The new state; useful if the player is dragging the mouse
 *         to change multiples at a time.
 */
Point toggleBit(const Point *mouse, const Point *lastPoint) {
    Point bit = getBitAtPoint(mouse);
    if(bit.h<0 || bit.h >= _game.x || bit.v<0 || bit.v>_game.y) {
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
    return bit;
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
    initGame();

    Rect r;
    SetRect(&_initialWindowRect,0,38,520,330);

    Point lastBit = { .h=-1, .v=-1 };

    for(;;) {
        EventRecord e;
        WindowRef win;

        SystemTask();
        if(GetNextEvent(everyEvent, &e)) {
            Point windowPoint = {
                .h = e.where.h - _initialWindowRect.left,
                .v = e.where.v - _initialWindowRect.top
            };
            
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
                            if(TrackGoAway(win, e.where))
                                DisposeWindow(win);
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
                            if(isInside(&windowPoint, &_game.bitmap.bounds)) {
                                lastBit = toggleBit(&windowPoint, &lastBit);
                                InvalRect(&_game.bitmap.bounds);
                            }
                            break;
                        case inSysWindow:
                            SystemClick(&e, win);
                            break;
                    }
                    break;
                case updateEvt:
                    DoUpdate((WindowRef)e.message);
                    // Listen for dragging across cells.

                    if(lastBit.h != -1) {
                        if(isInside(&windowPoint, &_game.bitmap.bounds)) {
                            lastBit = toggleBit(&windowPoint, &lastBit);
                            InvalRect(&_game.bitmap.bounds);
                        }
                    }

                    break;
                case mouseUp:
                    lastBit.h = -1;
                    lastBit.v = -1;
                    break;
            }
        }        
    }
    return 0;
}
