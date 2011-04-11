REM ## @ECHO off
SET CONV=%MSX_ROOT%\tools\MSXImage\MSXImage.exe
SET DATA=%MSX_ROOT%\proj\carwar\data
REM ## %CONV% -in %DATA%\cars.png    -out %DATA%\sprt_shadow.h -pos 208 0  -size 13  11 -num 1  1 -name g_Shadow     -trans 0xE300E3 
%CONV% -in %DATA%\cars.png    -out %DATA%\sprt_car_1.h  -pos 0   0  -size 13  11 -num 16 1 -name g_Car1       -trans 0xE300E3 -cropline16
%CONV% -in %DATA%\cars.png    -out %DATA%\sprt_car_2.h  -pos 0   11 -size 13  11 -num 16 1 -name g_Car2       -trans 0xE300E3 -cropline16 
%CONV% -in %DATA%\cars.png    -out %DATA%\sprt_car_3.h  -pos 0   22 -size 13  11 -num 16 1 -name g_Car3       -trans 0xE300E3 -cropline16
%CONV% -in %DATA%\cars.png    -out %DATA%\sprt_car_4.h  -pos 0   33 -size 13  11 -num 16 1 -name g_Car4       -trans 0xE300E3 -cropline16
%CONV% -in %DATA%\pilots.png  -out %DATA%\sprt_pilots.h -pos 0   0  -size 6   8  -num 8  3 -name g_Pilots     -trans 0x3F574B -cropline16
%CONV% -in %DATA%\alpabet.png -out %DATA%\sprt_alpha.h  -pos 0   0  -size 8   8  -num 16 4 -name g_CharTable  -trans 0xDA48B6 -color 2 
REM ## %CONV% -in %DATA%\track.png   -out %DATA%\sprt_track.h  -pos 0   0  -size 32  32 -num 8  2 -name g_TrackTiles -trans 0xDA48AA -color 2 
%CONV% -in %DATA%\track_tiles.png -out %DATA%\sprt_track.h -pos 0 0 -size 32  32 -num 8  4 -name g_TrackTiles -trans 0xDA48AA -color 2 
%CONV% -in %DATA%\title.png   -out %DATA%\sprt_title.h  -pos 0   0  -size 232 24 -num 1  1 -name g_Title      -color 2 
REM ## %CONV% -in %DATA%\cars.png    -out %DATA%\sprt_smoke.h  -pos 104 44 -size 5   5  -num 6  1 -name g_Smoke      -trans 0x3F574B
PAUSE