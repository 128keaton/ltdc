#include "stdafx.h"

typedef unsigned char u8;

struct SColor
{
	u8 R, G, B;
};

SColor ColorTable[256];

/** Main entry point */
int _tmain(int argc, _TCHAR* argv[])
{
	int R, G, B;
	FILE* file;

	// Build 256 colors palette
	for(int i=0; i<256; i++)
	{
		R = i / 32;
		G = (i & 0x1C) / 4;
		B = i & 0x03;
		ColorTable[i].R = R * 255 / 7;
		ColorTable[i].G = G * 255 / 7;
		ColorTable[i].B = B * 255 / 3;
	}
	fopen_s(&file, "msx_256.act", "wb");
	fwrite(ColorTable, sizeof(ColorTable), 1, file);
	fclose(file);

	// Build 16 colors palette
	for(int i=0; i<256; i++)
	{
		ColorTable[i].R = ColorTable[i].G = ColorTable[i].B = 0;
	}
	fopen_s(&file, "msx_16.act", "wb");
	fwrite(ColorTable, sizeof(ColorTable), 1, file);
	fclose(file);

	return 0;
}

