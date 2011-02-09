/* 3D on MSX */

#include "core.h"
#include "bios.h"
#include "video.h"

//----------------------------------------
// D E F I N E S
#define CAR_NUM			4

#define CAR_TURN_RIGHT  0x01
#define CAR_TURN_LEFT   0x02
#define CAR_MOVE		0x04

#define COLOR_BLACK     0
#define COLOR_GREEN		224
#define COLOR_GRAY		146
#define COLOR_ORANGE	93
#define COLOR_YELLOW	144
#define COLOR_WHITE     255

#define BLOCK_SHADOW	3
#define ROAD_SHADOW		2
#define SHADOW_POWER	2

// Color operator
enum
{
	OP_NONE = 0,
	OP_HOLE,
	OP_WALL,
	OP_JUMP,
	OP_ROAD = 64,
	OP_SAND,
};

// Tile render flag
#define ROT_0	0x00	// 0°
#define ROT_90	0x10	// 90°
#define ROT_180	0x20	// 180°
#define ROT_270	0x30	// 270°
#define SYM_H	0x40	// Horizontal symmetry
#define SYM_V	0x50	// Vertical symmetry

//----------------------------------------
// M A C R O S

//#define ScrPosX(a) ((a >> 7) - 128 - 6)
//#define ScrPosY(a) ((a >> 7) - 128 - 5)
#define ScrPosX(a) ((a >> 8) - 6)
#define ScrPosY(a) ((a >> 8) - 5)

//----------------------------------------
// T Y P E S

typedef struct
{
	u8 mul;
	u8 div;
} DarkFactor;

typedef struct
{
	u8 rotSpeed;
	u8 maxSpeed;
	u8 accel;
} Car;

typedef struct
{
	u16 posX;  // position X
	u16 posY;  // position Y
	u16 prevX; // previous position X
	u16 prevY; // previous position Y
	i16 dX;    // velocity X
	i16 dY;    // velocity Y
	u8 car;    // car index
	u8 flag;   // move flag
	u8 rot;    // rotation
	u8 speed;
} Player; // 16 bytes

typedef struct
{
	u8 page;
	u16 yOffset;
	void (*state)(void);
	//Car         cars[4];
	//Player      players[4];
	//VdpBuffer32 buffer32;
	//VdpBuffer36 buffer36;
} GameData;

typedef struct
{
	u8 tile; // Tile index + rotation flag
	u8 color0;
	u8 color1;
} TrackTile;

//----------------------------------------
// P R O T O T Y P E S

void MainLoop();
void InitializePlayer(Player* ply, u8 car, u8 posX, u8 posY);
void CheckCollision(u8 car1, u8 car2);
u8 DarkenColor(u8 color, u8 power);

void StateInitialize();
void StateTitle();
void StateMainMenu();
void StateBuildTrack();
void StateShadeTrack();
void StateStartGame();
void StateUpdateGame();

//----------------------------------------
// D A T A

// Sprites
// SX : 13
// SY : 11
// 16 sprites/car (208 px)
// 4 cars (44 px)
#include "data/sprt_car_1.h"
#include "data/sprt_car_2.h"
#include "data/sprt_car_3.h"
#include "data/sprt_car_4.h"
#include "data/sprt_shadow.h"
#include "data/sprt_alpha.h"
#include "data/sprt_track.h"
#include "data/sprt_title.h"

#include "trigo64.inc"

const u8 defaultColor[] = { 0x01, 0x01, 0x09, 0x0d, 0x0d, 0x09, 0x01, 0x01 };

const Car cars[CAR_NUM] = 
{
	// Cop
	{ 5, 24, 4 },
	//
	{ 4, 32, 4 },
	// Ferrari
	{ 4, 30, 4 },
	// Turtule
	{ 6, 16, 4 },
};

const TrackTile track01[] = 
{
	// line 0
	{ 0 + ROT_0, COLOR_GREEN, COLOR_GRAY },
	{ 2 + ROT_0, COLOR_GREEN, COLOR_GRAY },
	{ 2 + ROT_0, COLOR_GREEN, COLOR_GRAY },
	{ 0 + ROT_90, COLOR_GREEN, COLOR_GRAY },
	{ 0 + ROT_0, COLOR_GREEN, COLOR_GRAY },
	{ 2 + ROT_0, COLOR_GREEN, COLOR_GRAY },
	{ 0 + ROT_90, COLOR_GREEN, COLOR_GRAY },
	// line 1
	{ 2 + ROT_0, COLOR_GREEN, COLOR_GRAY },
	{ 1 + ROT_0, COLOR_GRAY, COLOR_GREEN },
	{ 2 + ROT_0, COLOR_GRAY, COLOR_GREEN },
	{ 0 + ROT_270, COLOR_GREEN, COLOR_GRAY },
	{ 0 + ROT_180, COLOR_GREEN, COLOR_GRAY },
	{ 1 + ROT_90, COLOR_GRAY, COLOR_GREEN },
	{ 2 + ROT_0, COLOR_GREEN, COLOR_GRAY },
	// line 2
	{ 3 + ROT_0, COLOR_WHITE, COLOR_GRAY },
	{ 2 + ROT_0, COLOR_GRAY, COLOR_GREEN },
	{ 2 + ROT_0, COLOR_GRAY, COLOR_GREEN },
	{ 2 + ROT_0, COLOR_GRAY, COLOR_GREEN },
	{ 2 + ROT_0, COLOR_GRAY, COLOR_GREEN },
	{ 2 + ROT_0, COLOR_GRAY, COLOR_GREEN },
	{ 9 + ROT_90, COLOR_YELLOW, COLOR_GRAY },
	// line 3
	{ 2 + ROT_0, COLOR_GREEN, COLOR_GRAY },
	{ 2 + ROT_0, COLOR_GRAY, COLOR_GREEN },
	{ 2 + ROT_0, COLOR_GRAY, COLOR_GREEN },
	{ 2 + ROT_0, COLOR_GRAY, COLOR_GREEN },
	{ 2 + ROT_0, COLOR_GRAY, COLOR_GREEN },
	{ 1 + ROT_0, COLOR_GREEN, COLOR_YELLOW },
	{ 2 + ROT_0, COLOR_GREEN, COLOR_YELLOW },
	// line 4
	{ 2 + ROT_0, COLOR_GREEN, COLOR_GRAY },
	{ 0 + ROT_0, COLOR_GREEN, COLOR_GRAY },
	{ 2 + ROT_0, COLOR_GREEN, COLOR_GRAY },
	{ 2 + ROT_0, COLOR_GRAY, COLOR_GREEN },
	{ 11 + ROT_270, COLOR_ORANGE, COLOR_YELLOW },
	{ 4 + ROT_0, COLOR_GREEN, COLOR_YELLOW },
	{ 2 + ROT_0, COLOR_GREEN, COLOR_YELLOW },
	// line 5
	{ 0 + ROT_270, COLOR_GREEN, COLOR_GRAY },
	{ 2 + ROT_0, COLOR_GREEN, COLOR_GRAY },
	{ 1 + ROT_0, COLOR_GRAY, COLOR_GREEN },
	{ 2 + ROT_0, COLOR_GRAY, COLOR_GREEN },
	{ 1 + ROT_90, COLOR_YELLOW, COLOR_GREEN },
	{ 2 + ROT_0, COLOR_GREEN, COLOR_YELLOW },
	{ 0 + ROT_180, COLOR_GREEN, COLOR_YELLOW },
};

Player      __at(0xC000) players[CAR_NUM];
GameData    __at(0xC100) game;
VdpBuffer36 __at(0xC200) buffer36;
VdpBuffer32 __at(0xC300) buffer32;
u8          __at(0xC400) colorCode[256];
//struct GameData __at(0xD000) game;

//----------------------------------------
// P R O G R A M

///
__sfr __at(0xA8) g_slotPort;

/**
 * Program entry point
 */
void main(void)
{
	__asm
		di
		ld sp, (#0xFC4A)
		ei
	__endasm;

	g_slotPort = (g_slotPort & 0xCF) | ((g_slotPort & 0x0C) << 2);

	MainLoop();
}

//----------------------------------------
/** Main loop */
void MainLoop()
{
	// Set initial state
	game.state = StateInitialize;

	while(1)
	{
		// Update current state
		game.state();
	}
}

/** STATE initialize system */
void StateInitialize()
{
	u16 x;

	// Init
	//SetFreq(FREQ_50);
	SetScreen8(LINES_212);
	SetSpriteMode(SPRITE_ON, SPRITE_NO_MAG + SPRITE_SIZE_8, 0xF800 >> 11, 0xF700 >> 7);

	FillVRAM(0, 0,   256, 256, 0);
	FillVRAM(0, 256, 256, 256, 0);

	// Init color table
	for(x=0; x<256; x++)
		colorCode[x] = OP_NONE;

	colorCode[COLOR_BLACK]  = OP_HOLE;
	colorCode[COLOR_GREEN]  = OP_WALL;
	colorCode[COLOR_GRAY]   = OP_ROAD;
	colorCode[COLOR_ORANGE] = OP_JUMP;
	colorCode[COLOR_YELLOW] = OP_SAND;
	colorCode[COLOR_WHITE]  = OP_ROAD;
	colorCode[DarkenColor(COLOR_BLACK, SHADOW_POWER)]  = OP_HOLE;
	colorCode[DarkenColor(COLOR_GREEN, SHADOW_POWER)]  = OP_WALL;
	colorCode[DarkenColor(COLOR_GRAY, SHADOW_POWER)]   = OP_ROAD;
	colorCode[DarkenColor(COLOR_ORANGE, SHADOW_POWER)] = OP_JUMP;
	colorCode[DarkenColor(COLOR_YELLOW, SHADOW_POWER)] = OP_SAND;
	colorCode[DarkenColor(COLOR_WHITE, SHADOW_POWER)]  = OP_ROAD;

	//----------------------------------------
	// Initialize (ASCII table) sprites
	for(x=0; x<sizeof(charTable)/8; x++)
	{
		RAMtoVRAM((x * 8) % 256, 248 + (x / 32), 8, 1, (u16)&charTable[x * 8]);
	}
	
	game.page = 0;
	game.state = StateTitle;
}

#define TITLE_X	12
#define TITLE_Y	32

void StateTitle()
{
	u8 i, j, byte, col;
	// Hide working screen
	game.page = 1;
	SetPage8(game.page);
	// Build title
	for(j=0; j<24; j++)
	{
		for(i=0; i<232; i++)
		{
			byte = title[(i / 8) + (j * 232 / 8)];
			if(byte & (1 << (7 - (i & 0x07))))
			{
				col = (i + j) % 16; // 0:16
				col /= 2; // 0:8
				col += 2; // 2:10
				if(col > 5)
					col = 12 - col; // 2:5 & 6:3
				WriteVRAM(TITLE_X + i + 256 * (TITLE_Y + j), (col << 5) + (col << 2) + (col >> 1));
			}
		}
	}
	// Copy title to both screen
	VRAMtoVRAM(TITLE_X, TITLE_Y, TITLE_X, TITLE_Y + 256, 232, 24);
	PrintSprite(100, 150, "PRESS\n  A\n KEY", (u16)&defaultColor);

	game.state = StateMainMenu;
}

void StateMainMenu()
{
	u8 keyLine;

	SetPage8(game.page);
	game.page = 1 - game.page;

	keyLine = GetKeyMatrixLine(8);
	if((keyLine & KEY_SPACE) == 0
	|| Joytrig(1) != 0
	|| Joytrig(2) != 0) 
		game.state = StateStartGame;

	waitRetrace();
}

void StateStartGame()
{
	u8 i;

	game.page = 0;
	SetPage8(game.page);

	//----------------------------------------
	// Build background
	StateBuildTrack();
	StateShadeTrack();
	VRAMtoVRAM(0, 0, 0, 256, 256, 212);

	//----------------------------------------
	// Copy cars to VRAM
	PrintSprite(64, 64, "INIT\nCARS", (u16)&defaultColor);
	for(i=0; i<16; i++)
	{
		RAMtoVRAM(i * 13, 256 + 212 + 0,  13, 11, (u16)&car1[13 * 11 * i]);
		RAMtoVRAM(i * 13, 256 + 212 + 11, 13, 11, (u16)&car2[13 * 11 * i]);
		RAMtoVRAM(i * 13, 256 + 212 + 22, 13, 11, (u16)&car3[13 * 11 * i]);
		RAMtoVRAM(i * 13, 256 + 212 + 33, 13, 11, (u16)&car4[13 * 11 * i]);
	}

	//----------------------------------------
	// Initialize background backup
	PrintSprite(64, 64, "INIT\nTRACK\nBACKUP", (u16)&defaultColor);
	for(i=0; i<CAR_NUM; i++)
	{
		InitializePlayer(&players[i], i, 50 + 50 * i, 100);
		VRAMtoVRAM(ScrPosX(players[i].posX), (256 * 0) + ScrPosY(players[i].posY), (13 * i) + (52 * 0), 212, 13, 11);
		VRAMtoVRAM(ScrPosX(players[i].posX), (256 * 1) + ScrPosY(players[i].posY), (13 * i) + (52 * 1), 212, 13, 11);
	}

	ClearSprite();

	game.state = StateUpdateGame;
}

void StateUpdateGame()
{
	u8 i;
	u8 keyLine, angle;
	Player* curPly;

	SetPage8(game.page);
	game.page = 1 - game.page;
	game.yOffset = 256 * game.page;

	for(i=0; i<CAR_NUM; i++)
		players[i].flag = 0;

	//----------------------------------------
	// Player 1 gameplay
	curPly = &players[0];
	keyLine = GetKeyMatrixLine(8);
	if((keyLine & KEY_LEFT) == 0)
		curPly->flag |= CAR_TURN_LEFT;
	if((keyLine & KEY_RIGHT) == 0)
		curPly->flag |= CAR_TURN_RIGHT;
	if((keyLine & KEY_UP) == 0)
		curPly->flag |= CAR_MOVE;

	//----------------------------------------
	// Player 2 gameplay
	curPly = &players[1];
	keyLine = GetKeyMatrixLine(5);
	if((keyLine & KEY_Z) == 0)
		curPly->flag |= CAR_TURN_LEFT;
	keyLine = GetKeyMatrixLine(3);
	if((keyLine & KEY_C) == 0)
		curPly->flag |= CAR_TURN_RIGHT;
	keyLine = GetKeyMatrixLine(5);
	if((keyLine & KEY_X) == 0)
		curPly->flag |= CAR_MOVE;

	//----------------------------------------
	// Player 3 gameplay
	curPly = &players[2];
	switch (Joystick(1)) // Joy 1 direction
	{
	case 2: // up-right
	case 3: // right
	case 4: // down-right
		curPly->flag |= CAR_TURN_RIGHT;
		break;
	case 6: // down-left
	case 7: // left
	case 8:// up-left
		curPly->flag |= CAR_TURN_LEFT;
		break;
	}
	if(Joytrig(1) != 0) // Joy 1 Button A
		curPly->flag |= CAR_MOVE;

	//----------------------------------------
	// Player 4 gameplay
	curPly = &players[3];
	switch (Joystick(2)) // Joy 2 direction
	{
	case 2: // up-right
	case 3: // right
	case 4: // down-right
		curPly->flag |= CAR_TURN_RIGHT;
		break;
	case 6: // down-left
	case 7: // left
	case 8:// up-left
		curPly->flag |= CAR_TURN_LEFT;
		break;
	}
	if(Joytrig(2) != 0) // Joy 2 Button A
		curPly->flag |= CAR_MOVE;

	//----------------------------------------
	// Restore background
	for(i=0; i<CAR_NUM; i++)
	{
		VRAMtoVRAM((13 * i) + (52 * game.page), 212, ScrPosX(players[i].prevX), game.yOffset + ScrPosY(players[i].prevY), 13, 11);
	}

	//----------------------------------------
	// Update physic
	for(i=0; i<CAR_NUM; i++)
	{
		curPly = &players[i];

		if(curPly->flag & CAR_TURN_LEFT)
		{
			curPly->rot += cars[curPly->car].rotSpeed; 
		}
		if(curPly->flag & CAR_TURN_RIGHT)
		{
			curPly->rot -= cars[curPly->car].rotSpeed; 
		}
		if(curPly->flag & CAR_MOVE)
		{
			angle = curPly->rot / 4;
			curPly->dX = g_Cosinus[angle];
			curPly->dY = g_Sinus[angle];
			curPly->speed += 2;
		}

		if(curPly->speed > 0)
			curPly->speed--;
		if(curPly->speed > cars[curPly->car].maxSpeed)
			curPly->speed = cars[curPly->car].maxSpeed;

		curPly->prevX = curPly->posX;
		curPly->prevY = curPly->posY;
		curPly->posX += (curPly->speed * curPly->dX) / 8;
		curPly->posY -= (curPly->speed * curPly->dY) / 8;
	}

	// Check collision
	CheckCollision(0, 1);
	CheckCollision(0, 2);
	CheckCollision(0, 3);
	CheckCollision(1, 2);
	CheckCollision(1, 3);
	CheckCollision(2, 3);

	// Fix position
	for(i=0; i<CAR_NUM; i++)
	{
		curPly = &players[i];
		if(curPly->posY < (5 << 8))
			curPly->posY = (5 << 8);
		else if(curPly->posY > (206 << 8))
			curPly->posY = (206 << 8);

		// Backup
		VRAMtoVRAM(ScrPosX(curPly->posX), game.yOffset + ScrPosY(curPly->posY), (13 * i) + (52 * game.page), 212, 13, 11);
	}

	//----------------------------------------
	// Draw cars
	for(i=0; i<CAR_NUM; i++)
	{
		VRAMtoVRAMTrans(13 * (players[i].rot / 16), 256 + 212 + (11 * i), ScrPosX(players[i].posX), game.yOffset + ScrPosY(players[i].posY), 13, 11);
	}

	waitRetrace();
}

/** Initialize player data */
void InitializePlayer(Player* ply, u8 car, u8 posX, u8 posY)
{
	ply->car = car; // car index
	ply->posX = 128 + posX << 7; // position X
	ply->posY = 128 + posY << 7; // position Y
	ply->prevX = ply->posX; // previous position X
	ply->prevY = ply->posY; // previous position Y
	ply->rot = 0; // rotation
	ply->dX = 0; // velocity X
	ply->dY = 0; // velocity Y
	ply->speed = 0;
}

/***/
void CheckCollision(u8 car1, u8 car2)
{
	i16 x, y, dist;
	dist = players[car1].posX - players[car2].posX;
	x = dist >> 8;
	dist = players[car1].posY - players[car2].posY;
	y = dist >> 8;
	dist = (x * x) + (y * y);
	//if(car1 == 0 && car2 == 1)
	//{
	//	SetSpriteUniColor(0, 200, 8, (dist / 100000) % 10, 0x0F);
	//	SetSpriteUniColor(1, 208, 8, (dist / 10000) % 10, 0x0F);
	//	SetSpriteUniColor(2, 216, 8, (dist / 1000) % 10, 0x0F);
	//	SetSpriteUniColor(3, 224, 8, (dist / 100) % 10, 0x0F);
	//	SetSpriteUniColor(4, 232, 8, (dist / 10) % 10, 0x0F);
	//	SetSpriteUniColor(5, 240, 8, dist % 10, 0x0F);
	//	SetSpriteUniColor(6, 0, 216, 0, 0);
	//}
	if(dist < 11 * 11) // Collision occured
	{
		dist = players[car1].speed;
		players[car1].speed = players[car2].speed;
		players[car1].posX = players[car1].prevX;
		players[car2].speed = dist;
		players[car2].posY = players[car2].prevY;
	}
}

/***/
void StateBuildTrack()
{
	u8 i, j, byte;
	u16 x, y, lx, ly;
	const TrackTile* block;

	PrintSprite(64, 64, "BUILD\nTRACK", (u16)&defaultColor);

	//for(x=0; x<=255; x++)
	//	for(y=0; y<=211; y++)
	//	{
	//		i = (x + y) % 16; // 0:16
	//		i /= 2; // 0:8
	//		i += 2; // 2:10
	//		if(i > 5)
	//			i = 12 - i; // 2:5 & 6:3
	//		DrawPoint8(x, y, (i << 5) + (i << 2) + (i >> 1));
	//	}

	FillVRAM(0, 0, 256, 212, COLOR_GREEN);
	for(i=0; i<7; i++)
	{
		for(j=0; j<6; j++)
		{
			block = &track01[i + j * 7];
			if((block->tile & 0x0F) == 2) // Plein block
			{
				FillVRAM(16 + (32 * i), 8 + (32 * j), 32, 32, block->color1);
			}
			else
			{
				for(x=0; x<32; x++)
				{
					for(y=0; y<32; y++)
					{
						if((block->tile & 0xF0) == ROT_0)        { lx = x;      ly = y; }
						else if((block->tile & 0xF0) == ROT_90)  { lx = y;      ly = 31 - x; }
						else if((block->tile & 0xF0) == ROT_180) { lx = 31 - x; ly = 31 - y; }
						else if((block->tile & 0xF0) == ROT_270) { lx = 31 - y; ly = x; }
						else if((block->tile & 0xF0) == SYM_H)   { lx = x;      ly = 31 - y; }
						else /* SYM_V */                         { lx = 31 - x; ly = y; }
						byte = trackTiles[32 * 4 * (block->tile & 0x0F) + (lx / 8) + (ly * 32 / 8)];
						if(byte & (1 << (7 - (lx & 0x07))))
							WriteVRAM((16 + 32 * i + x) + 256 * (8 + 32 * j + y), block->color1);
						else
							WriteVRAM((16 + 32 * i + x) + 256 * (8 + 32 * j + y), block->color0);
					}
				}
			}
		}
	}
	ClearSprite();
}

/***/
void StateShadeTrack()
{
	u8 cur, next;
	u16 x, y, i;

	PrintSprite(64, 64, "SHADE\nTRACK", (u16)&defaultColor);

	cur = ReadVRAM(0);
	for(x=0; x<256; x++)
	{
		for(y=0; y<211; y++)
		{
			cur = ReadVRAM(x + 256 * y);
			next = ReadVRAM(x + 256 * (y + 1));
			if(colorCode[cur] < OP_ROAD && colorCode[next] >= OP_ROAD)
			{
				for(i=0; i<BLOCK_SHADOW; i++)
				{
					cur = ReadVRAM(x + 256 * (y - i));
					if((y - i < 212) && (colorCode[cur] < OP_ROAD))
						WriteVRAM(x + 256 * (y - i), DarkenColor(cur, SHADOW_POWER));
					else
						break;
				}
				for(i=1; i<=ROAD_SHADOW; i++)
				{
					cur = ReadVRAM(x + 256 * (y + i));
					if((y + i < 212) && (colorCode[cur] >= OP_ROAD))
						WriteVRAM(x + 256 * (y + i), DarkenColor(cur, SHADOW_POWER));
					else
						break;
				}
				y += i;
			}
		}
	}
	ClearSprite();
}

#define TransformColor(mul, shift) g = (g * mul) >> shift; r = (r * mul) >> shift; b = (b * mul) >> shift;

/** Darken a color using dark power (0-7) */
u8 DarkenColor(u8 color, u8 power)
{
	u8 g, r ,b;
	g = ((color & 0xE0) >> 5);
	r = ((color & 0x1C) >> 2);
	b = (color & 0x03);
	switch(power)
	{
	case 0: break;                       // x1
	case 1: TransformColor(7, 3); break; // x0.875
	case 2: TransformColor(3, 2); break; // x0.75
	case 3: TransformColor(5, 3); break; // x0.625
	case 4: TransformColor(1, 1); break; // x0.5
	case 5: TransformColor(3, 3); break; // x0.375
	case 6: TransformColor(1, 2); break; // x0.25
	case 7:                              // x0.125
	default: TransformColor(1, 3); break;
	}
	return (g << 5) + (r << 2) + b;
}
