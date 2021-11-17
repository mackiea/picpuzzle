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

#ifndef PUZZLES_H
#define PUZZLES_H

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

/*
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
    .name = "Medium"
};
*/

GamePak _pak = {
    .x = 30,
    .y = 10,
    .data = {
        0b00000000, 0b00001000, 0b00000000, 0b11011100, 0, 0, 0, 0,
        0b00001000, 0b00011000, 0b00000000, 0b00011100, 0, 0, 0, 0,
        0b10011100, 0b00001100, 0b01110000, 0b00001100, 0, 0, 0, 0,
        0b10001000, 0b00000010, 0b01110000, 0b00100000, 0, 0, 0, 0,
        0b11001000, 0b10000001, 0b00110001, 0b01000100, 0, 0, 0, 0,
        0b10011100, 0b11111100, 0b11111111, 0b00000100, 0, 0, 0, 0,
        0b10001000, 0b00011111, 0b11111000, 0b00000000, 0, 0, 0, 0,
        0b11111111, 0b11110000, 0b00001111, 0b11111100, 0, 0, 0, 0,
        0b00011100, 0b00001110, 0b00011110, 0b00011000, 0, 0, 0, 0,
        0b11111000, 0b00111000, 0b00111001, 0b11000100, 0, 0, 0, 0
    },
    .name = "Medium"
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

#endif // #define PUZZLES_H
