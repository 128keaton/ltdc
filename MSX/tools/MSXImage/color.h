#include "types.h"

// color types

struct RGB8;
struct RGB24;

/** R3 G3 B2 color type */
struct RGB8
{
	u8 RGB;

	RGB8(): RGB(0) {}
	RGB8(u8 a): RGB(a) {}
	RGB8(RGB24 color);

	operator u8() { return RGB; }
};

/** R8 G8 B8 color type */
struct RGB24
{
	u8 R, G, B;

	RGB24(): R(0), G(0), B(0) {}
	RGB24(u8 a, u8 b, u8 c): R(a), G(b), B(c) {}
	RGB24(u32 RGBA)
	{
		R = (RGBA >> 16) & 0xFF;
		G = (RGBA >> 8) & 0xFF;
		B = (RGBA >> 0) & 0xFF;
	}
	RGB24(RGB8 color);
};