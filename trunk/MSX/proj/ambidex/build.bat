@ECHO off
SET PROGRAM=test

ECHO -- SDCC Compile --
sdcc -mz80 --no-std-crt0 --code-loc 0x4010 --data-loc 0xC000 %PROGRAM%.c

ECHO -- hex2bin --
hex2bin –e bin %PROGRAM%.ihx

ECHO -- Merge header --
copy /b rom_header.bin + /b %PROGRAM%.bin /b %PROGRAM%.rom

ECHO -- Fill ROM --
fillfile %PROGRAM%.rom 32768

PAUSE