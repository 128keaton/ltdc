@ECHO off
%MSX_ROOT%\tools\Trigo\Trigo.exe -num 16 -shift 8 -bytes 2 sin cos > %MSX_ROOT%\proj\carwar\trigo16.inc
%MSX_ROOT%\tools\Trigo\Trigo.exe -num 32 -shift 8 -bytes 2 sin cos > %MSX_ROOT%\proj\carwar\trigo32.inc
%MSX_ROOT%\tools\Trigo\Trigo.exe -num 64 -shift 8 -bytes 2 sin cos > %MSX_ROOT%\proj\carwar\trigo64.inc
%MSX_ROOT%\tools\Trigo\Trigo.exe -num 16 -shift 4 -bytes 1 rot > %MSX_ROOT%\proj\carwar\rot16.inc
%MSX_ROOT%\tools\Trigo\Trigo.exe -num 16 -shift 6 -bytes 1 rot > %MSX_ROOT%\proj\carwar\rot64.inc
%MSX_ROOT%\tools\Trigo\Trigo.exe -num 1024 -shift 3 -bytes 1 sqrt > %MSX_ROOT%\proj\carwar\sqrt1024.inc
pause