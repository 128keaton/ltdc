#include "types.h"

// color types

struct GRB8;
struct RGB24;

/** G3 R3 B2 color type */
struct GRB8
{
	u8 RGB;

	GRB8(): RGB(0) {}
	GRB8(u8 a): RGB(a) {}
	GRB8(RGB24 color);

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
	RGB24(GRB8 color);
};