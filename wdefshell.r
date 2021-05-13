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

#include "Processes.r"
#include "Menus.r"
#include "Windows.r"
#include "MacTypes.r"
#include "Finder.r"
#include "Icons.r"

resource 'icl8' (128, purgeable) {
	$"0000 0000 0000 0000 0000 0000 0000 0000"
	$"0000 0000 0000 0000 0000 0000 0000 0000"
	$"FFFF FFFF FFFF 0000 0000 0000 0000 0000"
	$"0000 0000 0000 0000 0000 0000 0000 0000"
	$"0000 0000 0000 FFFF FFFF 0000 0000 0000"
	$"0000 0000 0000 0000 0000 0000 0000 0000"
	$"FFFF FFFF FF00 0000 0000 FFFF FF00 0000"
	$"0000 0000 0000 0000 0000 0000 0000 0000"
	$"0000 0000 00FF FFFF FF00 0000 00FF 0000"
	$"0000 0000 0000 0000 0000 0000 0000 0000"
	$"0000 0000 0000 0000 00FF FFFF 0000 FF00"
	$"0000 0000 0000 0000 0000 0000 0000 0000"
	$"0000 0000 0000 0000 0000 0000 FF00 00FF"
	$"0000 0000 0000 0000 0000 0000 0000 0000"
	$"0000 0000 0000 0000 0000 0000 FF00 00FF"
	$"0000 0000 0000 0000 0000 0000 0000 0000"
	$"0000 0000 0000 0000 0000 0000 FF00 00FF"
	$"0000 0000 0000 0000 0000 0000 0000 0000"
	$"0000 0000 0000 0000 0000 00FF 0000 FF00"
	$"0000 0000 0000 0000 0000 0000 0000 0000"
	$"0000 0000 0000 0000 0000 FF00 00FF 0000"
	$"0000 0000 0000 0000 0000 0000 0000 0000"
	$"0000 0000 0000 00FF FFFF 0000 FF00 0000"
	$"0000 0000 0000 0000 0000 0000 0000 0000"
	$"0000 0000 0000 FF00 0000 0000 FF00 0000"
	$"0000 0000 0000 0000 0000 0000 0000 0000"
	$"0000 0000 00FF 0000 0000 00FF 0000 0000"
	$"0000 0000 0000 0000 0000 0000 0000 0000"
	$"0000 0000 00FF 0000 0000 00FF 0000 0000"
	$"0000 FFFF FFFF FFFF FFFF FFFF FFFF FF00"
	$"0000 0000 00FF 0000 0000 00FF 0000 0000"
	$"00FF 2B2B 2B2B 2B2B 2B2B 2B2B 2B2B 2BFF"
	$"0000 0000 FF00 0000 FFFF FF00 0000 0000"
	$"00FF 2B2B FCFC FCFC FCFC FCFC FC2B 2BFF"
	$"0000 00FF 0000 FFFF 0000 0000 0000 0000"
	$"00FF 2BFC 2A2A 2A2A 2A2A 2A2A 2A00 2BFF"
	$"0000 00FF 00FF 0000 0000 0000 0000 0000"
	$"00FF 2BFC 2A2A 2A2A 2A2A 2A2A 2A00 2BFF"
	$"0000 FF00 00FF 0000 0000 0000 0000 0000"
	$"00FF 2BFC 2A2A 2A2A 2A2A 2A2A 2A00 2BFF"
	$"0000 FF00 FF00 0000 0000 0000 0000 0000"
	$"00FF 2BFC 2A2A 2A2A 2A2A 2A2A 2A00 2BFF"
	$"0000 FF00 FF00 0000 0000 0000 0000 0000"
	$"00FF 2BFC 2A2A 2A2A 2A2A 2A2A 2A00 2BFF"
	$"0000 FF00 FF00 0000 0000 0000 0000 0000"
	$"00FF 2BFC 2A2A 2A2A 2A2A 2A2A 2A00 2BFF"
	$"0000 FF00 FF00 0000 0000 0000 0000 0000"
	$"00FF 2B2B 0000 0000 0000 0000 002B 2BFF"
	$"0000 FF00 00FF 0000 0000 0000 0000 0000"
	$"00FF 2B2B 2B2B 2B2B 2B2B 2B2B 2B2B 2BFF"
	$"0000 00FF 0000 FFFF FFFF 0000 0000 FFFF"
	$"FFFF 2B2B 2B2B 2B2B 2B2B 2B2B 2B2B 2BFF"
	$"0000 0000 FF00 0000 0000 FFFF FFFF 0000"
	$"00FF 2B2B 2B2B 2B2B 2B2B 2B2B 2B2B 2BFF"
	$"0000 0000 00FF FFFF FF00 0000 0000 00FF"
	$"FFFF 2BE3 2B2B 2B2B FFFF FFFF FF2B 2BFF"
	$"0000 0000 0000 0000 00FF FFFF FFFF FF00"
	$"00FF 2BD8 2B2B 2B2B 002B 002B 002B 2BFF"
	$"0000 0000 0000 0000 0000 0000 0000 0000"
	$"00FF 2B2B 2B2B 2B2B 2B2B 2B2B 2B2B 2BFF"
	$"0000 0000 0000 0000 0000 0000 0000 0000"
	$"0000 FFFF FFFF FFFF FFFF FFFF FFFF FF00"
	$"0000 0000 0000 0000 0000 0000 0000 0000"
	$"0000 FFFF FFFF FFFF FFFF FFFF FFFF FF"
};

resource 'icl4' (128, purgeable) {
	$"0000 0000 0000 0000 0000 0000 0000 0000"
	$"FFFF FF00 0000 0000 0000 0000 0000 0000"
	$"0000 00FF FF00 0000 0000 0000 0000 0000"
	$"FFFF F000 00FF F000 0000 0000 0000 0000"
	$"0000 0FFF F000 0F00 0000 0000 0000 0000"
	$"0000 0000 0FFF 00F0 0000 0000 0000 0000"
	$"0000 0000 0000 F00F 0000 0000 0000 0000"
	$"0000 0000 0000 F00F 0000 0000 0000 0000"
	$"0000 0000 0000 F00F 0000 0000 0000 0000"
	$"0000 0000 000F 00F0 0000 0000 0000 0000"
	$"0000 0000 00F0 0F00 0000 0000 0000 0000"
	$"0000 000F FF00 F000 0000 0000 0000 0000"
	$"0000 00F0 0000 F000 0000 0000 0000 0000"
	$"0000 0F00 000F 0000 0000 0000 0000 0000"
	$"0000 0F00 000F 0000 00FF FFFF FFFF FFF0"
	$"0000 0F00 000F 0000 0FCC CCCC CCCC CCCF"
	$"0000 F000 FFF0 0000 0FCC EEEE EEEE ECCF"
	$"000F 00FF 0000 0000 0FCE 7CCC 7CCC 70CF"
	$"000F 0F00 0000 0000 0FCE CC8C CC8C C0CF"
	$"00F0 0F00 0000 0000 0FCE 7CCC 7CCC 70CF"
	$"00F0 F000 0000 0000 0FCE CC8C CC8C C0CF"
	$"00F0 F000 0000 0000 0FCE 7CCC 7CCC 70CF"
	$"00F0 F000 0000 0000 0FCE CC8C CC8C C0CF"
	$"00F0 F000 0000 0000 0FCC 0000 0000 0CCF"
	$"00F0 0F00 0000 0000 0FCC CCCC CCCC CCCF"
	$"000F 00FF FF00 00FF FFCC CCCC CCCC CCCF"
	$"0000 F000 00FF FF00 0FCC CCCC CCCC CCCF"
	$"0000 0FFF F000 000F FFC8 CCCC FFFF FCCF"
	$"0000 0000 0FFF FFF0 0FC3 CCCC 0C0C 0CCF"
	$"0000 0000 0000 0000 0FCC CCCC CCCC CCCF"
	$"0000 0000 0000 0000 00FF FFFF FFFF FFF0"
	$"0000 0000 0000 0000 00FF FFFF FFFF FFF0"
};

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
		$"0000 0000 FC00 0000 FFC0 0000 FFF8 0000"
		$"07FC 0000 007E 0000 000F 0000 000F 0000"
		$"000F 0000 001E 0000 003C 0000 01F8 0000"
		$"03F8 0000 07F0 0000 07F0 3FFE 07F0 7FFF"
		$"0FE0 7FFF 1F00 7FFF 1C00 7FFF 3C00 7FFF"
		$"3800 7FFF 3800 7FFF 3800 7FFF 3800 7FFF"
		$"3C00 7FFF 1FC3 FFFF 0FFF FFFF 07FF FFFF"
		$"007E 7FFF 0000 7FFF 0000 3FFE 0000 3FFE"
	}
};

resource 'ics8' (128, purgeable) {
	$"FFFF FF00 0000 0000 0000 0000 0000 0000"
	$"0000 00FF FFFF 0000 0000 0000 0000 0000"
	$"0000 0000 0000 FF00 0000 0000 0000 0000"
	$"0000 0000 0000 FF00 0000 0000 0000 0000"
	$"0000 0000 FFFF 0000 0000 0000 0000 0000"
	$"0000 00FF 00FF 0000 0000 0000 0000 0000"
	$"0000 00FF FF00 0000 0000 0000 0000 0000"
	$"0000 FF00 0000 0000 00FF FFFF FFFF FF00"
	$"00FF 0000 0000 0000 FFFC FCFC FCFC FCFF"
	$"00FF 0000 0000 0000 FFFC 2A2A 2A2A 00FF"
	$"00FF 0000 0000 0000 FFFC 2A2A 2A2A 00FF"
	$"00FF 0000 0000 0000 FFFC 0000 0000 00FF"
	$"00FF 0000 0000 0000 FF2B 2B2B 2B2B 2BFF"
	$"0000 FFFF 0000 FFFF FF2B 2B2B FFFF 2BFF"
	$"0000 0000 FFFF 0000 FF2B 2B2B 2B2B 2BFF"
	$"0000 0000 0000 0000 00FD FDFD FDFD FD"
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

resource 'ics4' (128, purgeable) {
	$"FFF0 0000 0000 0000 000F FF00 0000 0000"
	$"0000 00F0 0000 0000 0000 00F0 0000 0000"
	$"0000 FF00 0000 0000 000F 0F00 0000 0000"
	$"000F F000 0000 0000 00F0 0000 0FFF FFF0"
	$"0F00 0000 FEEE EEEF 0F00 0000 FECC CC0F"
	$"0F00 0000 FECC CC0F 0F00 0000 FE00 000F"
	$"0F00 0000 FCCC CCCF 00FF 00FF FCCC FFCF"
	$"0000 FF00 FCCC CCCF 0000 0000 0FEF FEF0"
};

data 'ppat' (128) {
	$"0001 0000 001C 0000 004E 0000 0000 FFFF"
	$"0000 0000 8822 8822 8822 8822 0000 0000"
	$"8001 0000 0000 0008 0008 0000 0000 0000"
	$"0000 0048 0000 0048 0000 0000 0001 0001"
	$"0001 0000 0000 0000 0056 0000 0000 0000"
	$"0000 0000 0000 0000 0000 0000 0000 0000"
	$"CCCC CCCC FFFF"
};

data 'ppat' (129) {
	$"0001 0000 001C 0000 004E 0000 0000 FFFF"
	$"0000 0000 77DD 77DD 77DD 77DD 0000 0000"
	$"8001 0000 0000 0008 0008 0000 0000 0000"
	$"0000 0048 0000 0048 0000 0000 0001 0001"
	$"0001 0000 0000 0000 0056 0000 0000 0000"
	$"0000 0000 0000 0000 0000 0000 0000 0000"
	$"4444 4444 4444"
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
    "About Picture Puzzle\r\r"
    "Based on the Conceptis puzzle game https://www.conceptispuzzles.com.\r\r NOT FOR SALE OR RESALE."
};

/*
About box.
*/
resource 'WIND' (128) {
    {0, 0, 220, 320}, altDBoxProc;
    invisible;
    noGoAway;
    0, "";
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
