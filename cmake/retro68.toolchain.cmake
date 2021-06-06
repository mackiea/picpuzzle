#   Copyright 2012 Wolfgang Thaller.
#
#   This file is part of Retro68.
#
#   Retro68 is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   Retro68 is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with Retro68.  If not, see <http://www.gnu.org/licenses/>.

set( CMAKE_SYSTEM_NAME Retro68 )
set( CMAKE_SYSTEM_VERSION 1)

set( RETRO68_ROOT "/root/forks/Retro68-build/toolchain" CACHE PATH "path to root of Retro68 Toolchain" )
set( CMAKE_INSTALL_PREFIX "${RETRO68_ROOT}/m68k-apple-macos/" CACHE PATH "installation prefix" )
set( CMAKE_SYSTEM_PREFIX_PATH "${RETRO68_ROOT}/m68k-apple-macos/" )

set( MAKE_APPL "${RETRO68_ROOT}/bin/MakeAPPL" )
set( REZ "${RETRO68_ROOT}/bin/Rez" )
set( REZ_INCLUDE_PATH "${RETRO68_ROOT}/m68k-apple-macos/RIncludes" )

set( CMAKE_C_COMPILER "${RETRO68_ROOT}/bin/m68k-apple-macos-gcc" )
set( CMAKE_CXX_COMPILER "${RETRO68_ROOT}/bin/m68k-apple-macos-g++" )

set( REZ_TEMPLATES_PATH ${REZ_INCLUDE_PATH})

list( APPEND CMAKE_MODULE_PATH "${RETRO68_ROOT}/m68k-apple-macos/cmake" )
include(add_application)
