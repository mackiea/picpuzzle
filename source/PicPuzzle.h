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

#ifndef PICPUZZLE_H
#define PICPUZZLE_H

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
WindowRef _aboutBoxRef;

typedef struct {
    TEHandle handle;
    ControlHandle vScroll;
    INTEGER scrollPosition;
} AboutDocRecord;

AboutDocRecord _aboutDocRecord = { .handle=NULL, .vScroll=NULL, .scrollPosition=0 };

Byte _log_line = 0;
Point CHAR_DIM = { .h=10, .v=14 };

#ifndef TARGET_API_MAC_CARBON
    /* NOTE: this is checking whether the Dialogs.h we use *knows* about Carbon,
             not whether we are actually compiling for Carbon.
             If Dialogs.h is older, we add a define to be able to use the new name
             for NewUserItemUPP, which used to be NewUserItemProc. */

#define NewUserItemUPP NewUserItemProc
#endif

#endif // #define PICPUZZLE_H
