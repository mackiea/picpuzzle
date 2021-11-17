export Retro68="../Retro68"
export Retro68Build="../Retro68-build"
export GCC=${Retro68Build}/toolchain/bin/m68k-apple-macos-gcc
export REZ=${Retro68Build}/build-host/Rez/Rez
# ${Retro68Build}/toolchain/bin/m68k-apple-macos-gcc source/PicPuzzle.c -obuild/PicPuzzle.wtf -I${Retro68Build}/toolchain/m68k-apple-macos/include/ -Wl --mac-flat -Wl --ffunction-sections -Werror --mac-flat  -Wl,-eMYWINDOWDEFPROC -Wl,-gc-sections

# ${Retro68Build}/toolchain/bin/m68k-apple-macos-gcc -O3 -DNDEBUG -ffunction-sections -std=gnu99 -I${Retro68}/libretro -Werror -Wl,--mac-flat -Wl,-eMYWINDOWDEFPROC -Wl,-gc-sections source/PicPuzzle.c

export C_DEFINES="-I/root/forks/Retro68/libretro"
export C_FLAGS="-O3 -DNDEBUG -ffunction-sections -std=gnu99"

echo "Generating wdefshell.r.rsrc.bin"
${REZ} source/wdefshell.r -I ${Retro68}/libretro:${Retro68Build}/toolchain/m68k-apple-macos/RIncludes -o build/wdefshell.r.rsrc.bin -debug

echo "Generating WDEF.rsrc.bin"
${REZ} -I ${Retro68}/libretro:${Retro68Build}/toolchain/m68k-apple-macos/RIncludes source/wdef.r -o build/WDEF.rsrc.bin  -debug

echo "Building C object Samples/Project3/CMakeFiles/WDEFShell.dir/wdefshell.c.obj"
${GCC} ${C_DEFINES} ${C_INCLUDES} ${C_FLAGS} -o build/wdefshell.c.obj -c source/wdefshell.c

echo "Preprocessing C source to CMakeFiles/WDEFShell.dir/wdefshell.c.i"
${GCC} ${C_DEFINES} ${C_INCLUDES} ${C_FLAGS} -E source/wdefshell.c > build/wdefshell.c.i

echo "Compiling C source to assembly CMakeFiles/WDEFShell.dir/wdefshell.c.s"
${GCC} ${C_DEFINES} ${C_INCLUDES} ${C_FLAGS} -S source/wdefshell.c -o build/wdefshell.c.s

echo "Building C object Samples/Project3/CMakeFiles/WDEFShell.dir/wdef.c.obj"
${GCC} ${C_DEFINES} ${C_INCLUDES} ${C_FLAGS} -o build/wdef.c.obj -c source/wdef.c

echo "Preprocessing C source to CMakeFiles/WDEFShell.dir/wdef.c.i"
${GCC} ${C_DEFINES} ${C_INCLUDES} ${C_FLAGS} -E source/wdef.c > build/wdef.c.i

echo "Compiling C source to assembly CMakeFiles/WDEFShell.dir/wdef.c.s"
${GCC} ${C_DEFINES} ${C_INCLUDES} ${C_FLAGS} -S source/wdef.c -o build/wdef.c.s


echo "------------- WDEF -------------"
echo "Building C object Samples/Project3/CMakeFiles/WDEF.dir/wdef.c.obj"
${GCC} ${C_DEFINES} ${C_INCLUDES} ${C_FLAGS} -o build/wdef.c.obj   -c source/wdef.c

echo "Preprocessing C source to CMakeFiles/WDEF.dir/wdef.c.i"
${GCC} ${C_DEFINES} ${C_INCLUDES} ${C_FLAGS} -E source/wdef.c > build/wdef.c.i

echo "Compiling C source to assembly CMakeFiles/WDEF.dir/wdef.c.s"
${GCC} ${C_DEFINES} ${C_INCLUDES} ${C_FLAGS} -S source/wdef.c -o build/wdef.c.s


echo "------------- PicPuzzle_APPL -------------"
echo "Generating PicPuzzle.bin, PicPuzzle.APPL, PicPuzzle.dsk, PicPuzzle.ad, %PicPuzzle.ad"
${REZ} ${Retro68}/libretro/Retro68APPL.r -I${Retro68}/libretro:${Retro68Build}/toolchain/m68k-apple-macos/RIncludes --copy build/PicPuzzle.code.bin -o build/PicPuzzle.bin -t APPL -c R68L --cc PicPuzzle.dsk --cc PicPuzzle.APPL --cc %PicPuzzle.ad build/PicPuzzle.r.rsrc.bin build/WDEF.rsrc.bin

echo "Generating PicPuzzle.r.rsrc.bin"
${REZ} source/PicPuzzle.r -I ${Retro68}/libretro:${Retro68Build}/toolchain/m68k-apple-macos/RIncludes -o build/PicPuzzle.r.rsrc.bin

echo "Generating WDEF.rsrc.bin"
${REZ} -I ${Retro68}/libretro:${Retro68Build}/toolchain/m68k-apple-macos/RIncludes source/wdef.r -o build/WDEF.rsrc.bin


echo "------------- PicPuzzle -------------"
echo "Building C object Samples/Project3/CMakeFiles/PicPuzzle.dir/PicPuzzle.c.obj"
${GCC} ${C_DEFINES} ${C_INCLUDES} ${C_FLAGS} -o build/PicPuzzle.c.obj -c source/PicPuzzle.c

echo "Preprocessing C source to CMakeFiles/PicPuzzle.dir/PicPuzzle.c.i"
${GCC} ${C_DEFINES} ${C_INCLUDES} ${C_FLAGS} -E source/PicPuzzle.c > build/PicPuzzle.c.i

echo "Compiling C source to assembly CMakeFiles/PicPuzzle.dir/PicPuzzle.c.s"
${GCC} ${C_DEFINES} ${C_INCLUDES} ${C_FLAGS} -S source/PicPuzzle.c -o build/PicPuzzle.c.s

echo "Building C object Samples/Project3/CMakeFiles/PicPuzzle.dir/wdef.c.obj"
${GCC} ${C_DEFINES} ${C_INCLUDES} ${C_FLAGS} -o build/wdef.c.obj -c source/wdef.c

echo "Preprocessing C source to CMakeFiles/PicPuzzle.dir/wdef.c.i"
${GCC} ${C_DEFINES} ${C_INCLUDES} ${C_FLAGS} -E source/wdef.c > build/wdef.c.i

echo "Compiling C source to assembly CMakeFiles/PicPuzzle.dir/wdef.c.s"
${GCC} ${C_DEFINES} ${C_INCLUDES} ${C_FLAGS} -S source/wdef.c -o build/wdef.c.s


echo "------------- WDEF_APPL -------------"
echo "Generating WDEFShell.bin, WDEFShell.APPL, WDEFShell.dsk, WDEFShell.ad, %WDEFShell.ad"
${REZ} ${Retro68}/libretro/Retro68APPL.r -I${Retro68}/libretro:${Retro68Build}/toolchain/m68k-apple-macos/RIncludes --copy build/WDEFShell.code.bin -o build/WDEFShell.bin -t APPL -c R68L --cc build/WDEFShell.dsk --cc build/WDEFShell.APPL --cc build/%WDEFShell.ad ${Retro68Build}/build-target/Samples/Project3/wdefshell.r.rsrc.bin build/WDEF.rsrc.bin


echo "------------- Linking -------------"
${GCC} -O3 -DNDEBUG  -Wl,-gc-sections build/PicPuzzle.c.obj build/wdef.c.obj  -o PicPuzzle.code.bin -L/root/forks/Retro68-build/build-target/libretro
