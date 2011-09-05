@ECHO off
%MSX_ROOT%\tools\Trigo\Trigo.exe -num 16   -shift 8 -bytes 2 sin cos > trigo16.inc
%MSX_ROOT%\tools\Trigo\Trigo.exe -num 32   -shift 8 -bytes 2 sin cos > trigo32.inc
%MSX_ROOT%\tools\Trigo\Trigo.exe -num 64   -shift 8 -bytes 2 sin cos > trigo64.inc
%MSX_ROOT%\tools\Trigo\Trigo.exe -num 256  -shift 8 -bytes 2 sin cos > trigo256.inc
%MSX_ROOT%\tools\Trigo\Trigo.exe -num 16   -shift 4 -bytes 1 rot > rot16.inc
%MSX_ROOT%\tools\Trigo\Trigo.exe -num 16   -shift 6 -bytes 1 rot > rot64.inc
%MSX_ROOT%\tools\Trigo\Trigo.exe -num 16   -shift 8 -bytes 1 rot > rot256.inc
%MSX_ROOT%\tools\Trigo\Trigo.exe -num 256  -shift 4 -bytes 1 sqrt > sqrt256.inc
%MSX_ROOT%\tools\Trigo\Trigo.exe -num 1024 -shift 3 -bytes 1 sqrt > sqrt1024.inc
%MSX_ROOT%\tools\Trigo\Trigo.exe -num 512  -shift 6 -bytes 2 equa 0 1 1 -0.001953125 1.6 > projZ512.inc

pause