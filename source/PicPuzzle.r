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


#include "Processes.r"
#include "Menus.r"
#include "Windows.r"
#include "MacTypes.r"
#include "Finder.r"
#include "Icons.r"

resource 'ICN#' (128, purgeable) {
	{	/* array: 2 elements */
		/* [1] */
        $"0000 0000"
        $"03FE 0000"
        $"0C01 8000"
        $"13F8 4000"
        $"2C06 6000"
        $"2802 A000"
        $"5001 5000"
        $"5001 3000"
        $"5001 5000"
        $"5001 3000"
        $"5001 5000"
        $"5001 3000"
        $"51F1 5000"
        $"4E0E 3000"
        $"4000 5000"
        $"4002 3000"
        $"400C 5000"
        $"40FC 3000"
        $"4000 5000"
        $"4000 3000"
        $"43FE 7000"
        $"2402 2000"
        $"2402 4000"
        $"1201 2000"
        $"0C00 C000"
        $"0000 0000"
        $"02AA 0000"
        $"1555 4000"
        $"0AAA 8000"
        $"0154 0000"
        $"0000 0000"
        $"0000 0000"
		/* [2] */
        $"0000 0000"
        $"03FE 0000"
        $"0C01 8000"
        $"13F8 4000"
        $"2C06 6000"
        $"2802 A000"
        $"5001 5000"
        $"5001 3000"
        $"5001 5000"
        $"5001 3000"
        $"5001 5000"
        $"5001 3000"
        $"51F1 5000"
        $"4E0E 3000"
        $"4000 5000"
        $"4002 3000"
        $"400C 5000"
        $"40FC 3000"
        $"4000 5000"
        $"4000 3000"
        $"43FE 7000"
        $"2402 2000"
        $"2402 4000"
        $"1201 2000"
        $"0C00 C000"
        $"0000 0000"
        $"02AA 0000"
        $"1555 4000"
        $"0AAA 8000"
        $"0154 0000"
        $"0000 0000"
        $"0000 0000"
	}
};

resource 'ics#' (128, purgeable) {
	{	/* array: 2 elements */
		/* [1] */
		$"E000 1C00 0200 0200 0C00 1400 1800 207E"
		$"40FF 40C1 40C1 40C1 4081 338D 0C81 007E",
		/* [2] */
		$"E000 1C00 0200 0200 0C00 1C00 1800 207E"
		$"40FF 40FF 40FF 40FF 40FF 33FF 0CFF 007E"
	}
};

type 'R68L' as 'STR ';
resource 'R68L' (0, purgeable) {
    "LaunchAPPLServer (c) 2018"
};

resource 'FREF' (128, purgeable) {
    'APPL',
    0,
    ""
};

resource 'BNDL' (128, purgeable) {
    'R68L',
    0,
    {
        'ICN#', {
            0, 128
        },
        'FREF', {
            10, 128
        }
    }
};

resource 'MENU' (128) {
    128, textMenuProc;
    allEnabled, enabled;
    apple;
    {
        "About WDEF Shell...", noIcon, noKey, noMark, plain;
        "-", noIcon, noKey, noMark, plain;
    }
};

resource 'MENU' (129) {
    129, textMenuProc;
    allEnabled, enabled;
    "Game";
    {
        "New...", noIcon, "N", noMark, plain;
        "Close", noIcon, "W", noMark, plain;
        "-", noIcon, noKey, noMark, plain;
        "Restart", noIcon, "R", noMark, plain;
        "Solve", noIcon, "S", noMark, plain;        
        "-", noIcon, noKey, noMark, plain;
        "Quit", noIcon, "Q", noMark, plain;
    }
};

resource 'MBAR' (128) {
    { 128, 129 };
};

resource 'STR#' (128) {
    {
        "Standard Document Window",
        "Rounded Document Window",
        "Custom Window (10-byte stub)",
        "Custom Window (code resource)";
    }
};

data 'TEXT' (128) {
    "moof!\r\r"
    "Based on the Conceptis puzzle game https://www.conceptispuzzles.com.\r\r"
    "NOT FOR SALE OR RESALE.\r\r"
    "Copyright (c) 2021, Andrew Mackie All rights reserved.\r\r"

    "Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:\r\r"

    "Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.\r\r"
    "Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.\r\r"
    "All advertising materials mentioning features or use of this software must display the following acknowledgement: This product includes software developed by Andrew Mackie.\r\r"
    "Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.\r\r"
    "THIS SOFTWARE IS PROVIDED BY Andrew Mackie AS IS AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL <COPYRIGHT HOLDER> BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
};

/*
About box.
*/
resource 'WIND' (128) {
    {0, 0, 220, 320}, zoomDocProc;
    invisible;
    goAway;
    0, "About PicPuzzle";
    noAutoCenter;
};

/*
Victory box.
*/
resource 'DLOG' (128) {
    {50, 100, 240, 220}, dBoxProc,
    visible,
    noGoAway,
    0, 128,
    "",
    centerMainScreen;
};

resource 'DITL' (128) {
	{
		{ 120, 15, 140, 100 },
		Button { enabled, "Aw yeah!" };

		{ 190-10-20-5, 320-10-80-5, 190-10+5, 320-10+5 },
		UserItem { enabled };

		{ 10, 0, 30, 310 },
		StaticText { enabled, "Flawless victory!" };

		/*
		{ 40, 10, 56, 310 },
		EditText { enabled, "Edit Text Item" };

		{ 70, 10, 86, 310 },
		CheckBox { enabled, "Check Box" };

		{ 90, 10, 106, 310 },
		RadioButton { enabled, "Radio 1" };

		{ 110, 10, 126, 310 },
		RadioButton { enabled, "Radio 2" };
    */
    }
};

/* The 10-byte code resource stub trick.
 *
 * The bytes in this resource are 68K machine code for
 *     move.l L1(pc), -(sp)    | 2F3A 0004
 *     rts                     | 4E75
 * L1: dc.l 0x00000000         | 0000 0000
 *
 * The application loads this resource and replaces the final four bytes
 * with the address of the WDEF function in wdef.c, which is compiled as part
 * of the application.
 */
data 'WDEF' (128) {
    $"2F3A 0004 4E75 0000 0000"
};

resource 'SIZE' (-1) {
	reserved,
	acceptSuspendResumeEvents,
	reserved,
	canBackground,
	doesActivateOnFGSwitch,
	backgroundAndForeground,
	dontGetFrontClicks,
	ignoreChildDiedEvents,
	is32BitCompatible,
	isHighLevelEventAware,
	onlyLocalHLEvents,
	notStationeryAware,
	dontUseTextEditServices,
	reserved,
	reserved,
	reserved,
#ifdef TARGET_API_MAC_CARBON
	500 * 1024,	// Carbon apparently needs additional memory.
	500 * 1024
#else
	100 * 1024,
	100 * 1024
#endif
};
