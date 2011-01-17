#include "color.h"


RGB8::RGB8(RGB24 color)
{
	i32 r, g, b;
	
	r = color.R * 7 / 255;
	g = color.G * 7 / 255;
	b = color.B * 3 / 255;

	RGB = u8((r << 5) + (g << 2) + b);
}

RGB24::RGB24(RGB8 color)
{
	i32 r, g, b;

	r = color / 32;
	g = (color & 0x1C) / 4;
	b = color & 0x03;

	R = u8(r * 255 / 7);
	G = u8(g * 255 / 7);
	B = u8(b * 255 / 3);
}