@ECHO off
SET PROGRAM=ponglyph
SET ROM=%MSX_ROOT%\tools\MakeROM
SET LIBS=bios.c

REM ////////////////////////////////////////
ECHO --- SDCC Build ---
REM // sdcc -mz80 --no-std-crt0 --code-loc 0x4010 --data-loc 0xC000 --vc --opt-code-speed out\%PROGRAM%.rel out\bios.rel out\video.rel out\files.rel -o out\
sdcc -mz80 --no-std-crt0 --code-loc 0x4010 --data-loc 0xC000 --vc --opt-code-speed out\%PROGRAM%.rel out\bios.rel out\video.rel -o out\

ECHO ...build completed

REM ////////////////////////////////////////
ECHO --- hex2bin ---
%ROM%\hex2bin �e bin out\%PROGRAM%.ihx
ECHO ...convert completed

REM ////////////////////////////////////////
ECHO --- Merge header ---
copy /b %ROM%\rom_header.bin + /b out\%PROGRAM%.bin /b out\%PROGRAM%.rom
ECHO ...merge completed

REM ////////////////////////////////////////
ECHO --- Fill ROM ---
%ROM%\fillfile out\%PROGRAM%.rom 32768
ECHO ...fill completed

copy out\%PROGRAM%.rom %PROGRAM%.rom