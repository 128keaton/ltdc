@ECHO off
SET PROGRAM=carwar
SET LIBS=bios.c

ECHO -- SDCC Compile --
sdcc -c -mz80 --vc bios.c
REM ## sdcc -c -mz80 --vc 3d.c
sdcc -mz80 --no-std-crt0 --code-loc 0x4010 --data-loc 0xC000 --vc %PROGRAM%.c bios.rel
ECHO Compiled

ECHO -- hex2bin --
hex2bin –e bin %PROGRAM%.ihx
ECHO Converted

ECHO -- Merge header --
copy /b rom_header.bin + /b %PROGRAM%.bin /b %PROGRAM%.rom
ECHO Merged

ECHO -- Fill ROM --
fillfile %PROGRAM%.rom 32768
ECHO Filled