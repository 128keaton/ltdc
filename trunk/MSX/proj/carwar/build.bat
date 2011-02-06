@ECHO off
SET PROGRAM=carwar
SET LIBS=bios.c

REM ////////////////////////////////////////
ECHO --- SDCC Compile ---

ECHO Compile bios.c
sdcc -c -mz80 --vc bios.c

ECHO Compile video.c
sdcc -c -mz80 --vc video.c

ECHO Compile files.asm
sdasz80 -losg files.asm

REM ## ECHO Compile 3d.c
REM ## sdcc -c -mz80 --vc 3d.c

ECHO Compile %PROGRAM%.c
sdcc -mz80 --no-std-crt0 --code-loc 0x4010 --data-loc 0xC000 --vc %PROGRAM%.c bios.rel video.rel files.rel

ECHO ...compile completed

REM ////////////////////////////////////////
ECHO --- hex2bin ---
hex2bin –e bin %PROGRAM%.ihx
ECHO ...convert completed

REM ////////////////////////////////////////
ECHO --- Merge header ---
copy /b rom_header.bin + /b %PROGRAM%.bin /b %PROGRAM%.rom
ECHO ...merge completed

REM ////////////////////////////////////////
ECHO --- Fill ROM ---
fillfile %PROGRAM%.rom 32768
ECHO ...fill completed