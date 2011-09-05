REM ## @ECHO off
SET CONV=%MSX_ROOT%\tools\MSXImage\MSXImage.exe
SET DATA=%MSX_ROOT%\proj\ponglyph\data
%CONV% -in %DATA%\alpabet.png -out %DATA%\sprt_alpha.h  -pos 0   0  -size 8   8  -num 16 5 -name g_CharTable  -trans 0xDA48B6 -color 2 
PAUSE