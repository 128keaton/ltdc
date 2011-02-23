SET
%MSX_ROOT%\tools\MSXImage\MSXImage.exe -in %MSX_ROOT%\proj\carwar\data\sprt_cars.png -out %MSX_ROOT%\proj\carwar\data\sprt_car_1.h  -pos 0   0  -size 13 11 -num 16 1 -name car1   -trans 0xE300E3 
%MSX_ROOT%\tools\MSXImage\MSXImage.exe -in %MSX_ROOT%\proj\carwar\data\sprt_cars.png -out %MSX_ROOT%\proj\carwar\data\sprt_car_2.h  -pos 0   11 -size 13 11 -num 16 1 -name car2   -trans 0xE300E3 
%MSX_ROOT%\tools\MSXImage\MSXImage.exe -in %MSX_ROOT%\proj\carwar\data\sprt_cars.png -out %MSX_ROOT%\proj\carwar\data\sprt_car_3.h  -pos 0   22 -size 13 11 -num 16 1 -name car3   -trans 0xE300E3 
%MSX_ROOT%\tools\MSXImage\MSXImage.exe -in %MSX_ROOT%\proj\carwar\data\sprt_cars.png -out %MSX_ROOT%\proj\carwar\data\sprt_car_4.h  -pos 0   33 -size 13 11 -num 16 1 -name car4   -trans 0xE300E3 
%MSX_ROOT%\tools\MSXImage\MSXImage.exe -in %MSX_ROOT%\proj\carwar\data\sprt_pilote.png -out %MSX_ROOT%\proj\carwar\data\sprt_pilote.h -pos 0 0 -size 6 7 -num 4 8 -name pilote   -trans 0xE300E3 
REM ## %MSX_ROOT%\tools\MSXImage\MSXImage.exe -in %MSX_ROOT%\proj\carwar\data\sprt_cars.png -out %MSX_ROOT%\proj\carwar\data\sprt_shadow.h -pos 208 0  -size 13 11 -num 1  1 -name shadow -trans 0xE300E3 
%MSX_ROOT%\tools\MSXImage\MSXImage.exe -in %MSX_ROOT%\proj\carwar\data\alpabet.png -out %MSX_ROOT%\proj\carwar\data\sprt_alpha.h -pos 0 0 -size 8 8 -num 16 3 -color 1 -name charTable
%MSX_ROOT%\tools\MSXImage\MSXImage.exe -in %MSX_ROOT%\proj\carwar\data\sprt_track.png -out %MSX_ROOT%\proj\carwar\data\sprt_track.h -pos 0 0 -size 32 32 -num 8 2 -color 1 -name trackTiles
%MSX_ROOT%\tools\MSXImage\MSXImage.exe -in %MSX_ROOT%\proj\carwar\data\title.png -out %MSX_ROOT%\proj\carwar\data\sprt_title.h -pos 0 0 -size 232 24 -num 1 1 -color 1 -name title
pause