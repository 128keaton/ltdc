/* 3D on MSX */
#include "core.h"
#include "bios.h"
#include "video.h"
#include "files.h"

//-----------------------------------------------------------------------------
// D E F I N E S
#define CAR_NUM				4

#define CAR_TURN_RIGHT  	0x01
#define CAR_TURN_LEFT   	0x02
#define CAR_MOVE			0x04

#define COLOR_KHAKI			RGB8(5,6,0)
#define COLOR_DARKKAKHI		RGB8(3,4,0)
#define COLOR_SKIN			RGB8(6,5,2)
#define COLOR_DARKSKIN		RGB8(4,3,1)
#define COLOR_PINK			RGB8(7,0,2)
#define COLOR_DARKPINK		RGB8(5,0,1)
#define COLOR_SAND			RGB8(6,6,2)
#define COLOR_LIGHTMAUVE	RGB8(5,5,3)
#define COLOR_GRAY			RGB8(5,5,2)
#define COLOR_DARKGRAY		RGB8(3,3,1)
#define COLOR_BROWN			RGB8(4,2,0)
#define COLOR_DARKBROWN		RGB8(2,1,0)
#define COLOR_YELLOW		RGB8(6,6,1)
#define COLOR_DARKYELLOW	RGB8(4,4,0)
#define COLOR_GREEN			RGB8(0,5,0)
#define COLOR_DARKGREEN		RGB8(0,3,0)
#define COLOR_WHITE			RGB8(7,7,3)
#define COLOR_LIGHTGRAY		RGB8(6,6,3)
#define COLOR_CYAN			RGB8(6,7,3)
#define COLOR_LIGHTBLUE		RGB8(5,6,3)
#define COLOR_BLUE			RGB8(2,4,3)
#define COLOR_DARKBLUE		RGB8(1,2,3)
#define COLOR_NAVYBLUE		RGB8(0,0,2)
#define COLOR_DARKNAVYBLUE	RGB8(0,0,1)
#define COLOR_MAUVE			RGB8(6,4,3)
#define COLOR_DARKMAUVE		RGB8(4,3,2)
#define COLOR_ORANGE		RGB8(7,4,0)
#define COLOR_DARKORANGE	RGB8(6,2,0)
#define COLOR_RED			RGB8(7,1,0)
#define COLOR_DARKRED		RGB8(5,1,0)
#define COLOR_BLACK			RGB8(0,0,0)
#define COLOR_LIME			RGB8(6,7,0)
#define COLOR_DARKLIME		RGB8(4,5,0)

#define BLOCK_SHADOW		3
#define ROAD_SHADOW			4
#define SHADOW_POWER		2

// Menu layout
#define TITLE_X				16
#define TITLE_Y				32
#define MENU_X				64
#define MENU_Y				100
#define LINE_SPACE			10
#define TITLE_SPACE			16

#define ITEM_INVALID		(0x80 + 0)
#define ITEM_ACTION			(0x80 + 1)
#define ITEM_VARIABLE		(0x80 + 2)

// Color operator
enum
{
	// Walls
	OP_NONE = 0,
		OP_WALL = 0,
		OP_BLADE,
		OP_BUMPER,
		OP_3____,
	// Special
	OP_SPECIAL = 4,
		OP_SPEEDER = 4,
		OP_JUMPER,
		OP_MAGMA,
		OP_HEALTH,
		OP_HOLE,
	// Roads
	OP_ROAD = 9,
		OP_ASPHALT = 9,
		OP_MUD,
		OP_SAND,
		OP_GRASS,
		OP_SNOW,
		OP_ICE,
		OP_WATER, // 15
};

// 
enum
{
	RULE_FIRST,
	RULE_RACE = RULE_FIRST, // Race
	RULE_SURVIVOR,          // Deathmatch
	RULE_TAG,               // Chat
	RULE_SOCCER,            // Soccer
	RULE_LAST = RULE_SOCCER,
};

// Tile render flag
#define ROT_0	0x00	// 0°
#define ROT_90	0x10	// 90°
#define ROT_180	0x20	// 180°
#define ROT_270	0x30	// 270°
//#define SYM_H	0x40	// Horizontal symmetry
//#define SYM_V	0x50	// Vertical symmetry
#define MARKER	0x80	// Ground marker include

#define SYM_H	0x01	// Horizontal symmetry
#define SYM_V	0x02	// Vertical symmetry
#define SYM_D	0x04	// Diagonal symmetry
#define BANK_2	0x08	// second tile bank

//-----------------------------------------------------------------------------
// T Y P E S

typedef struct tagVectorU8
{
	u8 x, y;
} VectorU8;

typedef struct tagVectorU16
{
	u16 x, y;
} VectorU16;

typedef struct tagVectorI16
{
	i16 x, y;
} VectorI16;

typedef struct tagCar
{
	u8 rotSpeed;
	u8 maxSpeed[4];
	u8 accel;
} Car;

typedef struct tagTrack
{
	const u8* name;
	u8 width;
	u8 height;
	const u8* tiles;
	struct tagVectorU8 offset;
	u8 rotation;
	struct tagVectorU8 startPos[4];
} Track;

enum ACTION_OP
{
	ACTION_SET,
	ACTION_GET,
	ACTION_INC,
	ACTION_DEC,
};

typedef struct tagMenuEntry
{
	const char* text;
	u8 nextIdx;
	const char* (*action)(u8, i8);
	i8 value;
} MenuEntry;

typedef struct tagMenu
{
	const char* title;
	const char* tips;
	struct tagMenuEntry* items;
	u8 itemNum;
} Menu;

typedef struct tagBackground
{
	u8 MaxSpeed;
	u8 Friction;
	u8 Grip; // Adherence
	u8 ColorLight;
	u8 ColorDark;
} Background;

typedef struct tagSmoke
{
	u8 step;
	VectorU8 pos;
} Smoke;

typedef struct tagPlayer
{
	u16 posX;  // position X
	u16 posY;  // position Y
	u8  posZ;
	u16 prevX; // previous position X
	u16 prevY; // previous position Y
	u8  prevZ;
	i16 velX;  // velocity X
	i16 velY;  // velocity Y
	u8  car;   // car index
	u8  flag;  // move flag
	u8  rot;   // rotation
	u8  jump;
	u16 validX; // last valid position X
	u16 validY; // last valid position Y
	u16 nextX;
	u16 nextY;
	u8  life;
	u8  sprt;
} Player;


typedef struct tagGameData
{
	u8               frame;
	u16              yOffset;
	u8               playerNum;
	struct tagPlayer players[4];
	void            (*state)(void);
	Smoke            smokes[12];
	VdpBuffer32      vdp32;
	VdpBuffer36      vdp36;
	// timer
	u8               count;
	u8               second;
	u8               minute;
	// Menu
	u8               menu;
	u8               item;
	u8               pressed;
	// options
	i8               rule;
	u8               page;
	u8               track;
	u8               shadeTrack;
	// buffers
	u8               fileBuffer[256];
	u8               colorCode[256];
	u8               blockGen[32*32];
	u8               bitToByte[256 * 8];
} GameData;

//-----------------------------------------------------------------------------
// P R O T O T Y P E S

void MainLoop();
void InitializePlayer(Player* ply, u8 car, u8 posX, u8 posY, u8 rot);
void InitializeMenu(u8 menu);
void ResetMenu();
void CheckJoy(Player* ply, u8 joy);
void CarToCarCollision(Player* ply1, Player* ply2);
void CarToWallCollision(Player* ply);
void DamageCar(Player* ply, u8 hit);
i8 AngleDifferent64(i8 angleA, i8 angleB);
//u8 VectorToAngle64(i16 x, i16 y);
u8 VectorToAngle256(i16 x, i16 y);
//u16 GetVectorLenght1024(i16 x, i16 y);
u16 GetVectorLenght256(i16 x, i16 y);
void CopyCropped16(u8 posX, u16 posY, u8 sizeX, u8 sizeY, u8 num, u8 mod8, u16 addr);
void VBlankInterrupt();

void DrawCharacter(u16 x, u16 y, u8 chr, u8 color);
void DrawText(u16 x, u16 y, const char* text, u8 color);

//void DebugPrintInt(i16 i, u8 x, u8 y);
void UpackTiles();
void BuildTile(u16 px, u16 py, u8 flag, u8 tile, u8 op, u8 op0);
void BuildTrack();
void ShadeTrack();

// Color process
u8 DarkenColor(u8 color, u8 power);
u8 GrayGradiant(u8 index);

// States
void StateInitialize();
void StateTitle();
void StateMainMenu();
void StateStartGame();
void StateUpdateGame();

// Menu callback
const char* StartGame(u8 op, i8 value);
const char* SelectRule(u8 op, i8 value);
const char* SelectPlayer(u8 op, i8 value);
const char* SelectShade(u8 op, i8 value);
const char* SelectTrack(u8 op, i8 value);


//-----------------------------------------------------------------------------
// M A C R O S

#define PosToPxl(a) ((a) >> 8)
#define PosXToSprt(a) (PosToPxl(a) - 6)
#define PosYToSprt(a) (PosToPxl(a) - 5)

#define HMMC(dx, dy, nx, ny, ram)        game.vdp36.DX = dx; game.vdp36.DY = dy; game.vdp36.NX = nx; game.vdp36.NY = ny; game.vdp36.CLR = ((u8*)ram)[0]; /*game.vdp36.ARG = 0;*/ game.vdp36.CMD = VDP_CMD_HMMC;                                  VPDCommand36((u16)&game.vdp36); VPDCommandLoop(ram);
#define LMMC(dx, dy, nx, ny, ram, op)    game.vdp36.DX = dx; game.vdp36.DY = dy; game.vdp36.NX = nx; game.vdp36.NY = ny; game.vdp36.CLR = ((u8*)ram)[0]; /*game.vdp36.ARG = 0;*/ game.vdp36.CMD = VDP_CMD_LMMC + op;                             VPDCommand36((u16)&game.vdp36); VPDCommandLoop(ram);
#define HMMM(sx, sy, dx, dy, nx, ny)     game.vdp32.SX = sx; game.vdp32.SY = sy; game.vdp32.DX = dx; game.vdp32.DY = dy; game.vdp32.NX = nx; game.vdp32.NY = ny; /*game.vdp32.CLR = 0; game.vdp32.ARG = 0;*/ game.vdp32.CMD = VDP_CMD_HMMM;      VPDCommand32((u16)&game.vdp32);
#define LMMM(sx, sy, dx, dy, nx, ny, op) game.vdp32.SX = sx; game.vdp32.SY = sy; game.vdp32.DX = dx; game.vdp32.DY = dy; game.vdp32.NX = nx; game.vdp32.NY = ny; /*game.vdp32.CLR = 0; game.vdp32.ARG = 0;*/ game.vdp32.CMD = VDP_CMD_LMMM + op; VPDCommand32((u16)&game.vdp32);
#define HMMV(dx, dy, nx, ny, col)        game.vdp36.DX = dx; game.vdp36.DY = dy; game.vdp36.NX = nx; game.vdp36.NY = ny; game.vdp36.CLR = col; /*game.vdp36.ARG = 0;*/ game.vdp36.CMD = VDP_CMD_HMMV;                                            VPDCommand36((u16)&game.vdp36);

#define Abs8(i)  (((u8)(i) & 0x80) ? ~((u8)(i) - 1) : (i))
#define Abs16(i) (((u16)(i) & 0x8000) ? ~((u16)(i) - 1) : (i))

#define RGB8(r,g,b) (((g) << 5) + ((r) << 2) + (b))
#define Modulo2(a,b) ((a) & ((b) - 1))

#define Merge4(a,b) (((a) & 0xF) << 4 | ((b) & 0xF))

#define TILE0(col0)\
	Merge4(0, col0),
#define TILE1(col0, flag1, tile1, col1)\
	Merge4(1, col0),\
	Merge4((tile1 & 0xF0) ? flag1 + BANK_2 : flag1, tile1),\
	Merge4(col1, 0xF),
#define TILE2(col0, flag1, tile1, col1, flag2, tile2, col2)\
	Merge4(2, col0),\
	Merge4((tile1 & 0xF0) ? flag1 + BANK_2 : flag1, tile1),\
	Merge4(col1, (tile2 & 0xF0) ? flag2 + BANK_2 : flag2),\
	Merge4(tile2, col2),
#define TILE3(col0, flag1, tile1, col1, flag2, tile2, col2, flag3, tile3, col3)\
	Merge4(3, col0),\
	Merge4((tile1 & 0xF0) ? flag1 + BANK_2 : flag1, tile1),\
	Merge4(col1, (tile2 & 0xF0) ? flag2 + BANK_2 : flag2),\
	Merge4(tile2, col2),\
	Merge4((tile3 & 0xF0) ? flag3 + BANK_2 : flag3, tile3),\
	Merge4(col3, 0xF),

//-----------------------------------------------------------------------------
// R O M   D A T A

// Sprites
// SX: 13
// SY: 11
// width: 16 sprites/car (208 px)
// height: 4 cars (44 px)
#include "data/sprt_car_1.h"
#include "data/sprt_car_2.h"
#include "data/sprt_car_3.h"
#include "data/sprt_car_4.h"
#include "data/sprt_shadow.h"
#include "data/sprt_alpha.h"
#include "data/sprt_track.h"
#include "data/sprt_title.h"
#include "data/sprt_pilots.h"

#include "trigo64.inc"
#include "rot256.inc"
#include "sqrt256.inc"

//-----------------------------------------------------------------------------
/** rotSpeed, maxSpeed (63), accel */
const Car g_Cars[5] = 
{
	// 0. Cop
	{ 5, { 10, 25, 35, 40 }, 6 },
	// 1. Camaro (Chevrolet)
	{ 4, { 5, 20, 35, 60 }, 7 },
	// 2. Ferrari
	{ 4, { 5, 20, 40, 55 }, 7 },
	// 3. Turtule
	{ 6, { 15, 30, 30, 30 }, 5 },
	// 4. Pilot
	{ 10, { 5, 10, 15, 20 }, 5 },
};

/** MaxSpeed (x/4), Friction (4), Grip (8), ColorLight, ColorDark */
const Background g_BG[] = 
{
	// 0. OP_WALL
	{ 0, 0, 0, COLOR_KHAKI, COLOR_DARKKAKHI },
	// 1. OP_BLADE
	{ 0, 0, 0, COLOR_SKIN, COLOR_DARKSKIN },
	// 2. OP_BUMPER
	{ 0, 0, 0, COLOR_PINK, COLOR_DARKPINK },
	// 3. 
	{ 0, 0, 0, 0, 0 },
	// 4. OP_SPEEDER
	{ 3, 2, 4, COLOR_MAUVE, COLOR_DARKMAUVE },
	// 5. OP_JUMPER
	{ 3, 2, 4, COLOR_ORANGE, COLOR_DARKORANGE },
	// 6. OP_MAGMA
	{ 1, 4, 8, COLOR_RED, COLOR_DARKRED },
	// 7. OP_HEALTH
	{ 1, 0, 0, COLOR_LIME, COLOR_DARKLIME },
	// 8. OP_HOLE
	{ 1, 0, 0, COLOR_BLACK, COLOR_BLACK },
	// 9. OP_ASPHALT
	{ 3, 4, 8, COLOR_GRAY, COLOR_DARKGRAY },
	// 10. OP_MUD
	{ 2, 8, 4, COLOR_BROWN, COLOR_DARKBROWN },
	// 11. OP_SAND
	{ 1, 8, 4, COLOR_YELLOW, COLOR_DARKYELLOW },
	// 12. OP_GRASS
	{ 2, 4, 4, COLOR_GREEN, COLOR_DARKGREEN },
	// 13. OP_SNOW
	{ 1, 8, 8, COLOR_WHITE, COLOR_LIGHTGRAY },
	// 14. OP_ICE
	{ 3, 2, 0, COLOR_CYAN, COLOR_LIGHTBLUE },
	// 15. OP_WATER
	{ 0, 2, 4, COLOR_BLUE, COLOR_DARKBLUE },
};
		
const u8 g_TrackTiles01[] = 
{
	// line 0
	TILE1(OP_ASPHALT, 0, 1, OP_SAND)
	TILE0(OP_ASPHALT)
	TILE0(OP_ASPHALT)
	TILE0(OP_ASPHALT)
	TILE1(OP_ASPHALT, SYM_D, 16, OP_ASPHALT)
	TILE0(OP_ASPHALT)
	TILE1(OP_ASPHALT, SYM_V, 1, OP_WALL)
	// line 1
	TILE1(OP_ASPHALT, SYM_H, 1, OP_SAND)
	TILE1(OP_ASPHALT, SYM_D, 8, OP_WALL)
	TILE1(OP_ASPHALT, SYM_V, 10, OP_WALL)
	TILE0(OP_WALL)
	TILE1(OP_ASPHALT, 0, 10, OP_WALL)
	TILE0(OP_ASPHALT)
	TILE1(OP_ASPHALT, SYM_H+SYM_V, 1, OP_WALL)
	// line 2
	TILE0(OP_WATER)
	TILE0(OP_WATER)
	TILE0(OP_WATER)
	TILE1(OP_WATER, SYM_V, 1, OP_WALL)
	TILE1(OP_ASPHALT, 0, 8, OP_WALL)
	TILE2(OP_SAND, 0, 24, OP_ASPHALT, SYM_D, 8, OP_WALL)
	TILE1(OP_SAND, SYM_D, 8, OP_WALL)
	// line 3
	TILE1(OP_SAND, SYM_H, 15, OP_WALL)
	TILE1(OP_SAND, 0, 27, OP_JUMPER)
	TILE2(OP_SAND, SYM_V, 1, OP_WATER, SYM_H, 15, OP_WALL)
	TILE0(OP_WATER)
	TILE0(OP_WALL)
	TILE1(OP_SAND, SYM_D, 8, OP_WALL)
	TILE1(OP_SAND, SYM_H, 15, OP_WALL)
	// line 4
	TILE1(OP_SAND, SYM_D+SYM_V, 25, OP_WATER)
	TILE1(OP_SAND, SYM_D+SYM_V, 25, OP_WATER)
	TILE1(OP_SAND, SYM_D+SYM_V, 25, OP_WATER)
	TILE0(OP_WATER)
	TILE1(OP_SAND, SYM_D+SYM_V, 25, OP_WATER)
	TILE1(OP_SAND, SYM_D+SYM_V, 25, OP_WATER)
	TILE1(OP_SAND, SYM_D+SYM_V, 25, OP_WATER)
	// line 5
	TILE1(OP_WATER, SYM_D+SYM_V, 25, OP_HOLE)
	TILE1(OP_WATER, SYM_D+SYM_V, 25, OP_HOLE)
	TILE1(OP_WATER, SYM_D+SYM_V, 25, OP_HOLE)
	TILE1(OP_WATER, SYM_D+SYM_V, 25, OP_HOLE)
	TILE1(OP_WATER, SYM_D+SYM_V, 25, OP_HOLE)
	TILE1(OP_WATER, SYM_D+SYM_V, 25, OP_HOLE)
	TILE1(OP_WATER, SYM_D+SYM_V, 25, OP_HOLE)
};

const Track g_Tracks[] = 
{
	{ "AOI1", 7, 6, g_TrackTiles01, { 16, 8 }, 64, { { 25, 100 }, { 40, 100 }, { 25, 120 }, { 40, 120 } } },
	{ "AOI2", 7, 6, g_TrackTiles01, { 16, 8 }, 128, { { 130, 180 }, { 130, 195 }, { 145, 180 }, { 145, 195 } } },
	{ "NOE1", 7, 6, g_TrackTiles01, { 16, 8 }, 0, { { 130, 180 }, { 130, 195 }, { 145, 180 }, { 145, 195 } } },
};

//-----------------------------------------------------------------------------
// Menu 0
const MenuEntry g_MenuMain[] =
{
	{ "PLAY",     1, 0, 0 },
	{ "EDITOR",   ITEM_INVALID, 0, 0 },
	{ "CREDITS",  ITEM_INVALID, 0, 0 },
};

// Menu 1
const MenuEntry g_MenuMode[] =
{
	{ "TYPE",         ITEM_VARIABLE, SelectRule, 0 },
	{ "PLAYERS",      ITEM_VARIABLE, SelectPlayer, 0 },
	{ "SELECT TRACK", 2, 0, 0 },
	{ "<BACK",        0, 0, 0 },
};

// Menu 2
const MenuEntry g_MenuTrack[] =
{
	{ "FROM ROM",  3, 0, 0 },
	{ "FROM DISK", ITEM_INVALID, 0, 0 },
	{ "<BACK",     1, 0, 0 },
};

// Menu 3
const MenuEntry g_MenuTrackList[] =
{
	{ "TRACK", ITEM_VARIABLE, SelectTrack, 0 },
	{ "SHADE", ITEM_VARIABLE, SelectShade, 0 },
	{ "START GAME",   ITEM_ACTION, StartGame, 2 },
	{ "<BACK", 3, 0, 0 },
};

const Menu g_Menus[] =
{
	{ "MAIN MENU",     "PRESS SPACE", g_MenuMain,      numberof(g_MenuMain) },
	{ "GAME MODE",     "PRESS SPACE", g_MenuMode,      numberof(g_MenuMode) },
	{ "TRACK SELECT",  "PRESS SPACE", g_MenuTrack,     numberof(g_MenuTrack) },
	{ "TRACK SELECT",  "PRESS SPACE", g_MenuTrackList, numberof(g_MenuTrackList) },
};

const u8 g_HeightTab[] = { 0, 2, 4, 5, 5, 6, 6, 7, 7, 8, 8, 8, 7, 7, 6, 6, 5, 5, 4, 2, 0 };

const u8 g_DefaultColor[] = { 0x02, 0x0A, 0x0A, 0x0E, 0x0E, 0x0A, 0x0A, 0x02 };

const u8 g_AnimIndex[] = { 0, 1, 0, 2 };

//                        0   32  64  96  128 160 192 224
//                        000 001 010 011 100 101 110 111
const u8 g_SmokeFrq[] = { 4,  4,  8,  16, 32, 64, 128, 255 };
 
//-----------------------------------------------------------------------------
// R A M   D A T A

// Game data
GameData __at(0xC000) game;

//-----------------------------------------------------------------------------
// P R O G R A M

///
__sfr __at(0xA8) g_slotPort;

//=============================================================================
//
//   C O D E
//
//=============================================================================

//-----------------------------------------------------------------------------
/** Program entry point */
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

//-----------------------------------------------------------------------------
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

/** State - initialize system */
void StateInitialize()
{
	u16 x, i;

	game.vdp36.ARG = 0; 
	game.vdp32.ARG = 0; 

	// Init
	SetFreq(FREQ_50);
	SetScreen8(LINES_212);
	SetSpriteMode(SPRITE_ON, SPRITE_NO_MAG + SPRITE_SIZE_8, 0xF800 >> 11, 0xF700 >> 7);

	game.count = 0;
	game.second = 0;
	game.minute = 0;
	SetHook(H_TIMI, (u16)VBlankInterrupt);

	game.rule = RULE_RACE;
	game.playerNum = 4;
	game.track = 0;
	game.shadeTrack = 0;

	// Clear all VRAM
	FillVRAM(0, 0,   256, 256, 0);
	FillVRAM(0, 256, 256, 256, 0);

	// Init color table
	for(x=0; x<256; x++)
		game.colorCode[x] = OP_NONE;

	game.colorCode[COLOR_KHAKI]        = OP_WALL;
	game.colorCode[COLOR_DARKKAKHI]    = OP_WALL;
	game.colorCode[COLOR_SKIN]         = OP_BLADE;
	game.colorCode[COLOR_DARKSKIN]     = OP_BLADE;
	game.colorCode[COLOR_PINK]         = OP_BUMPER;
	game.colorCode[COLOR_DARKPINK]     = OP_BUMPER;
	game.colorCode[COLOR_SAND]         = OP_ASPHALT;
	game.colorCode[COLOR_LIGHTMAUVE]   = OP_ASPHALT;
	game.colorCode[COLOR_GRAY]         = OP_ASPHALT;
	game.colorCode[COLOR_DARKGRAY]     = OP_ASPHALT;
	game.colorCode[COLOR_BROWN]        = OP_MUD;
	game.colorCode[COLOR_DARKBROWN]    = OP_MUD;
	game.colorCode[COLOR_YELLOW]       = OP_SAND;
	game.colorCode[COLOR_DARKYELLOW]   = OP_SAND;
	game.colorCode[COLOR_GREEN]        = OP_GRASS;
	game.colorCode[COLOR_DARKGREEN]    = OP_GRASS;
	game.colorCode[COLOR_WHITE]        = OP_SNOW;
	game.colorCode[COLOR_LIGHTGRAY]    = OP_SNOW;
	game.colorCode[COLOR_CYAN]         = OP_ICE;
	game.colorCode[COLOR_LIGHTBLUE]    = OP_ICE;
	game.colorCode[COLOR_BLUE]         = OP_WATER;
	game.colorCode[COLOR_DARKBLUE]     = OP_WATER;
	game.colorCode[COLOR_MAUVE]        = OP_SPEEDER;
	game.colorCode[COLOR_DARKMAUVE]    = OP_SPEEDER;
	game.colorCode[COLOR_ORANGE]       = OP_JUMPER;
	game.colorCode[COLOR_DARKORANGE]   = OP_JUMPER;
	game.colorCode[COLOR_RED]          = OP_MAGMA;
	game.colorCode[COLOR_DARKRED]      = OP_MAGMA;
	game.colorCode[COLOR_BLACK]        = OP_HOLE;
	game.colorCode[COLOR_NAVYBLUE]     = OP_HOLE;
	game.colorCode[COLOR_DARKNAVYBLUE] = OP_HOLE;
	game.colorCode[COLOR_LIME]         = OP_HEALTH;
	game.colorCode[COLOR_DARKLIME]     = OP_HEALTH;

	// Initialize (ASCII table) sprites
	for(x=0; x<sizeof(g_CharTable) / 8; x++)
	{
		RAMtoVRAM(Modulo2(x * 8, 256), 248 + (x / 32), 8, 1, (u16)&g_CharTable[x * 8]);
	}

	// Create default 8 bytes patern from a 8 bits byte
	for(x=0; x<256; x++)
	{
		for(i=0; i<8; i++)
		{
			if(x & (1 << (7 - (i & 0x07))))
				game.bitToByte[x * 8 + i] = 0xFF;
			else
				game.bitToByte[x * 8 + i] = 0x00;
		}		
	}

	// Init smoke
	for(x=0; x<12; x++)
		game.smokes[x].step = 0xFF;

	game.page = 0;
	game.state = StateTitle;
	//game.state = StateStartGame;
}

/** Initialize a given menu */
void InitializeMenu(u8 menu)
{
	u8 item;
	game.menu = menu;
	game.item = 0;

	game.page = 1;
	SetPage8(game.page);

	HMMV(MENU_X, MENU_Y, 256 - MENU_X, 212 - MENU_Y, COLOR_BLACK);
	
	DrawText(MENU_X, MENU_Y, g_Menus[game.menu].title, COLOR_WHITE);
	for(item = 0; item < g_Menus[game.menu].itemNum; item++)
	{
		DrawText(MENU_X + 12, MENU_Y + TITLE_SPACE + LINE_SPACE * item, g_Menus[game.menu].items[item].text, g_Menus[game.menu].items[item].nextIdx == ITEM_INVALID ? COLOR_GRAY : COLOR_WHITE);
		if(g_Menus[game.menu].items[item].nextIdx == ITEM_VARIABLE)
			DrawText(MENU_X + 12 + 80, MENU_Y + TITLE_SPACE + LINE_SPACE * item, g_Menus[game.menu].items[item].action(ACTION_GET,0), COLOR_WHITE);
	}

	HMMM(MENU_X, MENU_Y, MENU_X, MENU_Y + 256, 256 - MENU_X, 212 - MENU_Y);
}

void ResetMenu()
{
	u8 last_item;
	last_item = game.item;
	InitializeMenu(game.menu);
	game.item = last_item;
}


/** State - Initialize title */
void StateTitle()
{
	u8 i, j, byte;
	// Hide working screen (0)
	SetPage8(1);
	FillVRAM(0,   0, 256, 212, 0);
	FillVRAM(0, 256, 256, 212, 0);

	// Build title
	for(j=0; j<24; j++)
	{
		for(i=0; i<232; i++)
		{      
			byte = g_Title[(i >> 3) + (j * 232 >> 3)];
			if(byte & (1 << (7 - (i & 0x07))))
			{
				WriteVRAM(0, TITLE_X + i + 256 * (TITLE_Y + j), GrayGradiant(i + j));
			}
		}
		// Copy title to both screen
		HMMM(TITLE_X, TITLE_Y + j, TITLE_X, TITLE_Y + 256 + j, 232, 1);
	}

	InitializeMenu(0);
	game.pressed = 0;
	game.page = 0;
	game.state = StateMainMenu;
}

/** State - Process main menu */
void StateMainMenu()
{
	u8 keyLine;

	SetPage8(game.page);
	game.page = 1 - game.page;
	game.yOffset = 256 * game.page;

	// Handle activation
	keyLine = GetKeyMatrixLine(8);
	if((keyLine & KEY_SPACE) == 0
	|| Joytrig(1) != 0
	|| Joytrig(2) != 0)
	{
		if(g_Menus[game.menu].items[game.item].action != 0)
			g_Menus[game.menu].items[game.item].action(ACTION_SET, g_Menus[game.menu].items[game.item].value);
		if((g_Menus[game.menu].items[game.item].nextIdx & 0x80) == 0)
			InitializeMenu(g_Menus[game.menu].items[game.item].nextIdx);
		return;
	}

	if((keyLine & KEY_RIGHT) == 0)
	{
		if(g_Menus[game.menu].items[game.item].action != 0)
			g_Menus[game.menu].items[game.item].action(ACTION_INC, g_Menus[game.menu].items[game.item].value);
	}
	else if((keyLine & KEY_LEFT) == 0)
	{
		if(g_Menus[game.menu].items[game.item].action != 0)
			g_Menus[game.menu].items[game.item].action(ACTION_DEC, g_Menus[game.menu].items[game.item].value);
	}

	// Handle navigation
	if(game.pressed > 16)
		game.pressed = 0;
	if(((keyLine & KEY_UP) == 0) && (game.item > 0))
	{
		if(game.pressed == 0)
			game.item--;
		game.pressed++;
	}
	else if(((keyLine & KEY_DOWN) == 0) && (game.item < g_Menus[game.menu].itemNum - 1))
	{
		if(game.pressed == 0)
			game.item++;
		game.pressed++;
	}
	else
		game.pressed = 0;

	// Render
	HMMV(MENU_X, MENU_Y + TITLE_SPACE + game.yOffset, 8, LINE_SPACE * g_Menus[game.menu].itemNum, COLOR_BLACK);
	DrawText(MENU_X, MENU_Y + TITLE_SPACE + game.yOffset + (LINE_SPACE * game.item), "@", COLOR_WHITE);
	waitRetrace();
}


//=============================================================================
//
//   M A I N   L O O P   -   S T A R T
//
//=============================================================================

/** State - Start game */
void StateStartGame()
{
	u8 i;
	char file;

	game.page = 0;
	SetPage8(game.page);

	HMMV(0, 0, 256, 212, 0);
	HMMV(0, 256, 256, 212, 0);

	//----------------------------------------
	// Build background
	//UpackTiles();
	//BuildTrack();
	//if(game.shadeTrack)
	//	ShadeTrack();
	file = open("TRACK_01.SC8", O_RDONLY);
	for(i=0; i<212; i++) // copy line-by-line
	{
		read(file, (int)&game.fileBuffer, 256);
		HMMC(0, i, 256, 1, (u16)&game.fileBuffer);
	}	
	close(file);

	HMMM(0, 0, 0, 256, 256, 212);

	//----------------------------------------
	// Copy cars to VRAM
	PrintSprite(64, 64, "INIT\nCARS", (u16)&g_DefaultColor);

	CopyCropped16(0, 256 + 212 + 0,  13, 11, 16, 0, (u16)&g_Car1);
	CopyCropped16(0, 256 + 212 + 11, 13, 11, 16, 0, (u16)&g_Car2);
	CopyCropped16(0, 256 + 212 + 22, 13, 11, 16, 0, (u16)&g_Car3);
	CopyCropped16(0, 256 + 212 + 33, 13, 11, 16, 0, (u16)&g_Car4);
	RAMtoVRAM(16 * 13, 256 + 212, 13, 8, (u16)&g_Shadow);
	CopyCropped16(208, 476, 6, 8, 8 * 3, 1, (u16)&g_Pilots);

	//----------------------------------------
	// Initialize background backup
	PrintSprite(64, 64, "INIT\nTRACK\nBACKUP", (u16)&g_DefaultColor);
	for(i=0; i<CAR_NUM; i++)
	{
		InitializePlayer(&game.players[i], i, g_Tracks[game.track].startPos[i].x, g_Tracks[game.track].startPos[i].y, g_Tracks[game.track].rotation);
		HMMM(PosXToSprt(game.players[i].posX), (256 * 0) + PosYToSprt(game.players[i].posY), (13 * i) + (52 * 0), 212, 13, 11 + 1);
		HMMM(PosXToSprt(game.players[i].posX), (256 * 1) + PosYToSprt(game.players[i].posY), (13 * i) + (52 * 1), 212, 13, 11 + 1);
	}

	ClearSprite();
	for(i=0; i<32; i++)
		SetSpriteUniColor(i, 0, 248, 0, 0);

	// Reset counter
	game.minute = 0;
	game.second = 0;

	game.state = StateUpdateGame;
}

/** State - Process game */
void StateUpdateGame()
{
	u8 i, j, keyLine, dir, ground, op, friction, grip, car;
	Player* curPly;
	u16 x, y, speed, speedSq, maxSpeed;

	SetPage8(game.page);
	game.page = 1 - game.page;
	game.yOffset = 256 * game.page;

	for(i=0; i<CAR_NUM; i++)
		game.players[i].flag = 0;

	//----------------------------------------
	// Player 1 gameplay
	curPly = &game.players[0];
	keyLine = GetKeyMatrixLine(8);
	if((keyLine & KEY_LEFT) == 0)
		curPly->flag |= CAR_TURN_LEFT;
	if((keyLine & KEY_RIGHT) == 0)
		curPly->flag |= CAR_TURN_RIGHT;
	if((keyLine & KEY_UP) == 0)
		curPly->flag |= CAR_MOVE;

	//----------------------------------------
	// Player 2 gameplay
	curPly = &game.players[1];
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
	CheckJoy(&game.players[2], 1);

	//----------------------------------------
	// Player 4 gameplay
	CheckJoy(&game.players[3], 2);

	//----------------------------------------
	// Restore background
	for(i=0; i<CAR_NUM; i++)
	{
		HMMM((13 * i) + (52 * game.page), 212, PosXToSprt(game.players[i].prevX), game.yOffset + PosYToSprt(game.players[i].prevY) - game.players[i].prevZ, 13, 11 + 1 + game.players[i].prevZ);
	}

	//----------------------------------------
	// Update physic
	for(i=0; i<CAR_NUM; i++)
	{
		curPly = &game.players[i];

		car = (curPly->life == 0) ? 4 : curPly->car;

		if(curPly->jump == 0)
		{
			ground = ReadVRAM(game.page, PosToPxl(curPly->posX) + 256 * PosToPxl(curPly->posY));
			op = game.colorCode[ground];

			if(op >= OP_ROAD) // Backup last valid position
			{
				curPly->validX = curPly->posX;
				curPly->validY = curPly->posY;
			}
			else if(op < OP_SPECIAL)
			{
				curPly->prevX = curPly->posX;
				curPly->prevY = curPly->posY;
				curPly->nextX = curPly->validX;
				curPly->nextY = curPly->validY;
				curPly->velX = 0;
				curPly->velY = 0;
				//curPly->life = 0;
				break;
			}
			if(op == OP_HEALTH)
			{
				if(curPly->life < 255 - 5)
					curPly->life += 5;
				else
					curPly->life = 255;
			}

			// Friction: Slow down the speed
			friction = g_BG[op].Friction;
			maxSpeed = g_Cars[car].maxSpeed[g_BG[op].MaxSpeed];
			x = Abs16(curPly->velX);
			x >>= 8;
			y = Abs16(curPly->velY);
			y >>= 8;
			speedSq = (x * x) + (y * y);
			if(!(curPly->flag & CAR_MOVE) || (speedSq > maxSpeed * maxSpeed))
			{
				if(speedSq <= (friction * friction))
				{
					curPly->velX = 0;
					curPly->velY = 0;
				}
				else
				{
					dir = VectorToAngle256(curPly->velX, curPly->velY) >> 2;
					curPly->velX -= friction * g_Cosinus64[dir];
					curPly->velY -= friction * g_Sinus64[dir];
				}
			}

			// Grip: Transfert some part of velocity to car direction
			grip = g_BG[op].Grip;
			x = Abs16(curPly->velX);
			x >>= 8;
			y = Abs16(curPly->velY);
			y >>= 8;
			speed = GetVectorLenght256(x, y);
			if(speed <= grip)
			{
				curPly->velX = 0;
				curPly->velY = 0;
			}
			else
			{
				speed = grip;
				dir = VectorToAngle256(curPly->velX, curPly->velY) >> 2;
				curPly->velX -= grip * g_Cosinus64[dir];
				curPly->velY -= grip * g_Sinus64[dir];
			}

			// Engine velocity
			if(curPly->flag & CAR_TURN_LEFT)
			{
				curPly->rot += g_Cars[car].rotSpeed; 
			}
			if(curPly->flag & CAR_TURN_RIGHT)
			{
				curPly->rot -= g_Cars[car].rotSpeed; 
			}

			// Cap max speed
			if(curPly->flag & CAR_MOVE)
			{
				x = Abs16(curPly->velX);
				x >>= 8;
				y = Abs16(curPly->velY);
				y >>= 8;
				speedSq = (x * x) + (y * y);
				maxSpeed = g_Cars[car].maxSpeed[g_BG[op].MaxSpeed];
				if(speedSq < maxSpeed * maxSpeed)
				{
					speed += g_Cars[car].accel;
				}
			}
			if(op == OP_SPEEDER)
				speed += 8;
			else if(op == OP_JUMPER)
			{
				curPly->jump = 20;
			}

			dir = curPly->rot >> 2;
			curPly->velX += speed * g_Cosinus64[dir];
			curPly->velY += speed * g_Sinus64[dir];

			CarToWallCollision(curPly);
		}
		else
		{
			if(curPly->flag & CAR_TURN_LEFT)
			{
				curPly->rot += 2; 
			}
			if(curPly->flag & CAR_TURN_RIGHT)
			{
				curPly->rot -= 2; 
			}
			curPly->jump--;
		}

		curPly->nextX = (i16)curPly->posX + (curPly->velX >> 4);
		curPly->nextY = (i16)curPly->posY - (curPly->velY >> 4);
		if(curPly->nextY < (5 << 8))
			curPly->nextY = (5 << 8);
		else if(curPly->nextY > (206 << 8))
			curPly->nextY = (206 << 8);
	}

	// Check collision
	// 1 player
	// 2 players
	CarToCarCollision(&game.players[0], &game.players[1]);
	// 3 players
	CarToCarCollision(&game.players[0], &game.players[2]);
	CarToCarCollision(&game.players[1], &game.players[2]);
	// 4 players
	CarToCarCollision(&game.players[0], &game.players[3]);
	CarToCarCollision(&game.players[1], &game.players[3]);
	CarToCarCollision(&game.players[2], &game.players[3]);

	// Fix position
	for(i=0; i<CAR_NUM; i++)
	{
		curPly = &game.players[i];

		// Backup previous position
		curPly->prevX = curPly->posX;
		curPly->prevY = curPly->posY;
		curPly->prevZ = curPly->posZ;

		// Set new position
		curPly->posX = curPly->nextX;
		curPly->posY = curPly->nextY;
		curPly->posZ = g_HeightTab[curPly->jump];

		// Backup background at new position
		HMMM(PosXToSprt(curPly->posX), game.yOffset + PosYToSprt(curPly->posY) - curPly->posZ, (13 * i) + (52 * game.page), 212, 13, 11 + 1 + game.players[i].posZ);
	}

	//----------------------------------------
	// Draw game element
	for(i=0; i<CAR_NUM; i++)
	{
		curPly = &game.players[i];
		if(curPly->life != 0) 
		{
			// Draw car
			LMMM(13 * 16, 256 + 212, PosXToSprt(curPly->posX), game.yOffset + PosYToSprt(curPly->posY) + 2, 13, 8, VDP_OP_TIMP);
			LMMM(13 * (curPly->rot >> 4), 256 + 212 + (11 * i), PosXToSprt(curPly->posX), game.yOffset + PosYToSprt(curPly->posY) - curPly->posZ, 13, 11, VDP_OP_TIMP);
			
			// Spawn smoke
			j = g_SmokeFrq[curPly->life >> 5];
			if((j != 255) && Modulo2(game.frame, j) == 0)
			{
				j = (i * 3) + curPly->sprt;
				curPly->sprt++;
				if(curPly->sprt > 2)
					curPly->sprt = 0;
				game.smokes[j].step = 0;
				dir = curPly->rot >> 2;
				game.smokes[j].pos.x = PosToPxl(curPly->posX) - 4 - (g_Cosinus64[dir] >> 5);
				game.smokes[j].pos.y = PosToPxl(curPly->posY) - 4 + (g_Sinus64[dir] >> 5) - curPly->posZ;
			}
		}
		else // Draw pilot
		{
			if(curPly->flag & CAR_MOVE)
				curPly->sprt = Modulo2(++curPly->sprt, 4);
			else
				curPly->sprt = 0;
			LMMM(208 + 6 * (curPly->rot >> 5), 476 + 8 * g_AnimIndex[curPly->sprt], PosToPxl(curPly->posX) - 3, game.yOffset + PosToPxl(curPly->posY) - 4 - curPly->posZ, 6, 8, VDP_OP_TIMP);
		}

		//FillVRAM(0, game.yOffset + 198 + 3 * i, curPly->life, 2, COLOR_GREEN);
		//FillVRAM(curPly->life, game.yOffset + 198 + 3 * i, curPly->life - 255, 2, COLOR_RED);
	}
	for(i=0; i<12; i++)
	{
		if(game.smokes[i].step != 0xFF)
		{
			SetSpriteUniColor(i, game.smokes[i].pos.x, game.smokes[i].pos.y, 16 * 3 + game.smokes[i].step, 0x07);
			game.smokes[i].step++;
			if(game.smokes[i].step >= 8)
				game.smokes[i].step = 0xFF;
		}
		else
			SetSpriteUniColor(i, 0, 212, 0, 0);
	}

	// restart
	keyLine = GetKeyMatrixLine(7);
	if((keyLine & KEY_F5) == 0)
		game.state = StateStartGame;
	if((keyLine & KEY_ESC) == 0)
		game.state = StateTitle;

	//SetSpriteUniColor(0, 64+8*0, 64, game.minute >> 4,   0x0F);
	//SetSpriteUniColor(1, 64+8*1, 64, game.minute & 0x0F, 0x0F);
	//SetSpriteUniColor(2, 64+8*2, 64, ':' - '0',   0x0F);
	//SetSpriteUniColor(3, 64+8*3, 64, game.second >> 4,   0x0F);
	//SetSpriteUniColor(4, 64+8*4, 64, game.second & 0x0F, 0x0F);

	waitRetrace();
	game.frame++;
}

//=============================================================================
//
//   M A I N   L O O P   -   E N D
//
//=============================================================================

/** Initialize player data */
void InitializePlayer(Player* ply, u8 car, u8 posX, u8 posY, u8 rot)
{
	ply->car = car; // car index
	ply->posX = posX << 8; // position X
	ply->posY = posY << 8; // position Y
	ply->prevX = ply->posX; // previous position X
	ply->prevY = ply->posY; // previous position Y
	ply->validX = ply->posX;
	ply->validY = ply->posY;
	ply->rot = rot; // rotation
	ply->velX = 0; // velocity X
	ply->velY = 0; // velocity Y
	ply->jump = 0;
	ply->posZ = 0;
	ply->prevZ = 0;
	ply->life = 0xFF;
	ply->sprt = 0;
}

/***/
void CheckJoy(Player* ply, u8 joy)
{
	switch (Joystick(joy)) // Joy 1 direction
	{
	case 2: // up-right
	case 3: // right
	case 4: // down-right
		ply->flag |= CAR_TURN_RIGHT;
		break;
	case 6: // down-left
	case 7: // left
	case 8:// up-left
		ply->flag |= CAR_TURN_LEFT;
		break;
	}
	if(Joytrig(joy) != 0) // Joy 1 Button A
		ply->flag |= CAR_MOVE;
}

/***/
void DamageCar(Player* ply, u8 hit)
{
	if(ply->life > hit)
		ply->life -= hit;
	else
		ply->life = 0;
}

/***/
i8 AngleDifferent64(i8 angleA, i8 angleB)
{
	i8 diff;
	diff = angleB - angleA;
	if(diff < -32)
		diff += 64;
	if(diff > 32)
		diff -= 64;
	return diff;
}

/** x & y must be in the range -15 and +15 */
//u8 VectorToAngle64(i16 x, i16 y)
//{
//	while(Abs16(x) > 15 || Abs16(y) > 15)
//	{
//		x /= 2;
//		y /= 2;
//	}
//	x += 15; // x E [0;30]
//	y += 15; // x E [0;30]
//	return g_Rotation16[(x * 31) + y];
//}

/** x & y must be in the range -15 and +15 */
u8 VectorToAngle256(i16 x, i16 y)
{
	while(Abs16(x) > 15 || Abs16(y) > 15)
	{
		x >>= 2;
		y >>= 2;
	}
	x += 15; // x E [0;30]
	y += 15; // x E [0;30]
	return g_Rotation16[(x * 31) + y];
}

/***/
//u16 GetVectorLenght1024(i16 x, i16 y)
//{
//	u16 lenSq, ret;
//	u8 div;
//
//	div = 1;
//	lenSq = x*x + y*y; // get squared length
//	while(lenSq >= 1024)
//	{
//		lenSq /= 2;
//		div *= 2;
//	}
//	div = g_SquareRoot1024[div] >> 3; // squared-root the div factor
//	ret = g_SquareRoot1024[lenSq] >> 3; // get square root (.2^3)
//	return ret * div; // get length
//}

/***/
u16 GetVectorLenght256(i16 x, i16 y)
{
	u16 lenSq, ret;
	u8 div;

	div = 1;
	lenSq = x*x + y*y; // get squared length
	while(lenSq >= 256)
	{
		lenSq /= 2;
		div *= 2;
	}
	div = g_SquareRoot256[div] >> 4; // squared-root the div factor
	ret = g_SquareRoot256[lenSq] >> 4; // get square root (.2^3)
	return ret * div; // get length
}

/** Check collision */
#define CAR_CHECK_LEN 10
void CarToCarCollision(Player* ply1, Player* ply2)
{
	i16 x1, y1, x2, y2, dist;

	dist = ply2->nextX - ply1->nextX;
	x1 = dist >> 8;
	dist = ply2->nextY - ply1->nextY;
	y1 = dist >> 8;
	dist = (x1 * x1) + (y1 * y1);
	if(dist < CAR_CHECK_LEN * CAR_CHECK_LEN) // Collision occured
	{
		x1 = ply1->velX;
		y1 = ply1->velY;
		x2 = ply2->velX;
		y2 = ply2->velY;

		ply1->velX = x2 - x1;
		ply1->velY = y2 - y1;
		ply2->velX = x1 - x2;
		ply2->velY = y1 - y2;

		ply1->nextX = ply1->posX;
		ply1->nextY = ply1->posY;
		ply2->nextX = ply2->posX;
		ply2->nextY = ply2->posY;

		DamageCar(ply1, 4);
		DamageCar(ply2, 4);
	}
}

#define WALL_CHECK_LEN 4
void CarToWallCollision(Player* ply)
{
	u8 ground, op;

	if((ply->rot > 64) && (ply->rot < 192))
	{
		ground = ReadVRAM(game.page, PosToPxl(ply->posX) - WALL_CHECK_LEN + 256 * PosToPxl(ply->posY));
		op = game.colorCode[ground];
		if(op == OP_WALL)
		{
			ply->velX = Abs16(ply->velX) /*>> 1*/;
			ply->velY >>= 1;
			if(ply->flag & CAR_MOVE)
				DamageCar(ply, 5);
		}
	}
	else
	{
		ground = ReadVRAM(game.page, PosToPxl(ply->posX) + WALL_CHECK_LEN + 256 * PosToPxl(ply->posY));
		op = game.colorCode[ground];
		if(op == OP_WALL)
		{
			ply->velX = -(Abs16(ply->velX) /*>> 1*/);
			ply->velY >>= 1;
			if(ply->flag & CAR_MOVE)
				DamageCar(ply, 5);
		}
	}

	if(ply->rot < 128)
	{
		ground = ReadVRAM(game.page, PosToPxl(ply->posX) + 256 * (PosToPxl(ply->posY) - WALL_CHECK_LEN));
		op = game.colorCode[ground];
		if(op == OP_WALL)
		{
			ply->velX >>= 1;
			ply->velY = -(Abs16(ply->velY) /*>> 1*/);
			if(ply->flag & CAR_MOVE)
				DamageCar(ply, 5);
		}
	}
	else
	{
		ground = ReadVRAM(game.page, PosToPxl(ply->posX) + 256 * (PosToPxl(ply->posY) + WALL_CHECK_LEN));
		op = game.colorCode[ground];
		if(op == OP_WALL)
		{
			ply->velX >>= 1;
			ply->velY = Abs16(ply->velY) /*>> 1*/;
			if(ply->flag & CAR_MOVE)
				DamageCar(ply, 5);
		}
	}
}


/***/
void UpackTiles()
{
	u8 i, j, x, y;
	PrintSprite(64, 64, "UNPACK\nTILES", (u16)&g_DefaultColor);
	for(j=0; j<4; j++)
	{
		for(i=0; i<8; i++)
		{
			for(y=0; y<32; y++)
			{
				for(x=0; x<32/8; x++)
				{
					HMMC(i * 32 + x * 8, 256 + j * 32 + y, 8, 1, (u16)&game.bitToByte[g_TrackTiles[(i + j * 8) * 32 * 4 + y * 4 + x] * 8]);
				}
			}
		}
	}
	ClearSprite();
}

/***/
void BuildTile(u16 px, u16 py, u8 flag, u8 tile, u8 op, u8 op0)
{
	u8 byte, color;
	u16 x, y, lx, ly;

	if(flag & BANK_2)
		tile += 16;

	if((op0 == OP_WATER) && (op == OP_HOLE))
		color = COLOR_NAVYBLUE;
	else if((op0 == OP_ASPHALT) && (op == OP_ASPHALT))
		color = COLOR_SAND;	
	else
		color = g_BG[op].ColorLight;

	for(x=0; x<32; x++)
	{
		for(y=0; y<32; y++)
		{
			if(flag & SYM_D) { lx = y; ly = x; }
			else             { lx = x;	ly = y; }
			if(flag & SYM_H) { ly = 31 - ly; }
			if(flag & SYM_V) { lx = 31 - lx; }
			byte = g_TrackTiles[(tile << 7) + (lx >> 3) + (ly << 2)];
			if(byte & (1 << (7 - (lx & 0x07))))
				WriteVRAM(0, (px + x) + 256 * (py + y), color);
		}
	}
}

/***/
void BuildTrack()
{
	u8 i, j;
	u8 set0, op0;
	u8 flag1, tile1, op1;
	u8 flag2, tile2, op2;
	const u8* block;

	PrintSprite(64, 64, "BUILD\nTRACK", (u16)&g_DefaultColor);

	FillVRAM(0, 0, 128, 212, COLOR_KHAKI);
	FillVRAM(128, 0, 128, 212, COLOR_KHAKI);

	block = g_Tracks[game.track].tiles;
	for(j=0; j<6; j++)
	{
		for(i=0; i<7; i++)
		{
			set0 = *block++;
			op0 = set0 & 0x0F;
			set0 >>= 4;
			
			FillVRAM(g_Tracks[game.track].offset.x + (32 * i), g_Tracks[game.track].offset.y + (32 * j), 32, 32, g_BG[op0].ColorLight);
			
			if(set0 >= 1) // first tile
			{
				flag1 = *block++;
				tile1 = flag1 & 0x0F;
				flag1 >>= 4;

				flag2 = *block++; 
				op1 = flag2 >> 4;

				BuildTile(g_Tracks[game.track].offset.x + 32 * i, g_Tracks[game.track].offset.y + 32 * j, flag1, tile1, op1, op0);

				if(set0 >= 2) // second tile
				{
					flag2 &= 0x0F;

					tile2 = *block++;
					op2 = tile2 & 0x0F;
					tile2 >>= 4;

					BuildTile(g_Tracks[game.track].offset.x + 32 * i, g_Tracks[game.track].offset.y + 32 * j, flag2, tile2, op2, op0);

					if(set0 >= 3) // third tile
					{
					}
				}
			}
		}
	}

	ClearSprite();
}

/***/
void ShadeTrack()
{
	u8 cur, next;
	u16 x, y, i;

	PrintSprite(64, 64, "SHADE\nTRACK", (u16)&g_DefaultColor);

	cur = ReadVRAM(0, 0);
	for(x=0; x<256; x++)
	{
		for(y=0; y<211; y++)
		{
			cur = ReadVRAM(0, x + 256 * y);
			next = ReadVRAM(0, x + 256 * (y + 1));
			if(game.colorCode[cur] < OP_SPECIAL && game.colorCode[next] >= OP_SPECIAL)
			{
				for(i=0; i<BLOCK_SHADOW; i++)
				{
					cur = ReadVRAM(0, x + 256 * (y - i));
					if((y - i < 212) && (game.colorCode[cur] < OP_SPECIAL))
						WriteVRAM(0, x + 256 * (y - i), DarkenColor(cur, SHADOW_POWER));
					else
						break;
				}
				for(i=1; i<=ROAD_SHADOW; i++)
				{
					cur = ReadVRAM(0, x + 256 * (y + i));
					if((y + i < 212) && (game.colorCode[cur] >= OP_SPECIAL))
						WriteVRAM(0, x + 256 * (y + i), DarkenColor(cur, SHADOW_POWER));
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

u8 GrayGradiant(u8 index)
{
	u8 col;
	col = index & 0xF; // 0:16
	col >>= 1; // 0:8
	col += 2; // 2:10
	if(col > 5)
		col = 12 - col; // 2:5 & 6:3
	return (col << 5) + (col << 2) + (col >> 1);
}

void DrawCharacter(u16 x, u16 y, u8 chr, u8 color)
{
	u16 j;

	HMMV(x, y, 8, 8, color);
	for(j=0; j<8; j++)
	{
		LMMC(x, y + j, 8, 1, (u16)&game.bitToByte[g_CharTable[chr * 8 + j] * 8], VDP_OP_AND);
	}
}

void DrawText(u16 x, u16 y, const char* text, u8 color)
{
	u8 textIdx = 0, sprtIdx = 0;
	u16 curX = x;
	u16 curY = y;
	while(text[textIdx] != 0)
	{
		if(text[textIdx] == '\n')
		{
			curX = x;
			curY += LINE_SPACE;
		}
		else
		{
			if(text[textIdx] != ' ')
			{
				DrawCharacter(curX, curY, text[textIdx] - '0', color);
				sprtIdx++;
			}
			curX += 8;
		}
		textIdx++;
	}
}

//void DebugPrintInt(i16 i, u8 x, u8 y)
//{
//	SetSpriteUniColor(0, x + 0 * 8, y, (i / 100000) % 10, 0x0F);
//	SetSpriteUniColor(1, x + 1 * 8, y, (i / 10000) % 10, 0x0F);
//	SetSpriteUniColor(2, x + 2 * 8, y, (i / 1000) % 10, 0x0F);
//	SetSpriteUniColor(3, x + 3 * 8, y, (i / 100) % 10, 0x0F);
//	SetSpriteUniColor(4, x + 4 * 8, y, (i / 10) % 10, 0x0F);
//	SetSpriteUniColor(5, x + 5 * 8, y, i % 10, 0x0F);
//	SetSpriteUniColor(6, 0, 216, 0, 0);
//}

void CopyCropped16(u8 posX, u16 posY, u8 sizeX, u8 sizeY, u8 num, u8 mod8, u16 addr)
{
	//u8 i;
	//u8 oX, oY; // offset
	//u8 dX, dY; // bound
	//for(i=0; i<num; i++)
	//{
	//	oY = ((u8*)addr)[0];
	//	oX = oY >> 4;
	//	oY &= 0x0F;
	//	dY = ((u8*)addr)[1];
	//	dX = dY >> 4;
	//	dY &= 0x0F;
	//	addr += 2;
	//	if(mod8 == 0)
	//		RAMtoVRAM(posX + (i * sizeX) + oX, posY + oY, dX, dY, addr);
	//	else
	//		RAMtoVRAM(posX + Modulo2(i, 8) * sizeX + oX, posY + sizeY * (i / 8) + oY, dX, dY, addr);
	//	addr += dX * dY;
	//}


	u8 i, j;
	u8 oX, oY; // offset
	u8 dX, dY; // bound
	for(i=0; i<num; i++)
	{
		dY = ((u8*)addr)[0];
		oY = dY >> 4;
		dY &= 0x0F;
		addr += 1;
		for(j=0; j<dY; j++)
		{
			dX = ((u8*)addr)[0];
			oX = dX >> 4;
			dX &= 0x0F;
			addr += 1;
			if(mod8 == 0)
				RAMtoVRAM(posX + (i * sizeX) + oX, posY + oY + j, dX, 1, addr);
			else
				RAMtoVRAM(posX + Modulo2(i, 8) * sizeX + oX, posY + sizeY * (i / 8) + oY + j, dX, 1, addr);
			addr += dX;
		}
	}
}

void VBlankInterrupt() __naked
{
	__asm // backup registers
		di
        push    af
        push    bc
        push    de
        push    hl
	__endasm;

	game.count++;
	if(game.count == 60) // frame counter
	{
		game.count = 0;
		game.second++;
		if((game.second & 0x0F) == 0x0A)
		{
			game.second &= 0xF0;
			game.second += 0x10;
			if(game.second == 0x60)
			{
				game.second = 0;
				game.minute++;
				if((game.minute & 0x0F) == 0x0A)
				{
					game.minute &= 0xF0;
					game.minute += 0x10;
				}
			}
		}
	}

	__asm // restore registers
        pop     hl
        pop     de
        pop     bc
        pop     af
		ei
		ret
	__endasm;
}

//-----------------------------------------------------------------------------
// MENU CALLBACKS

/** Menu callback - Start game */
const char* StartGame(u8 op, i8 value)
{
	op; value;
	game.track = value;
	game.state = StateStartGame;
	return "";
}

/** Menu callback - Select game mode */
const char* SelectTrack(u8 op, i8 value)
{
	value;
	if(op == ACTION_INC)
	{
		if(game.track == 2)
			game.track = 0;
		else
			game.track++;
		ResetMenu();
	}
	else if(op == ACTION_DEC)
	{
		if(game.track == 0)
			game.track = 2;
		else
			game.track--;
		ResetMenu();
	}

	switch(game.track)
	{
	case 0: return "<AOI1>";
	case 1: return "<NOE1>";
	case 2: return "<NOE2>";
	}
}

/** Menu callback - Select game mode */
const char* SelectRule(u8 op, i8 value)
{
	value;
	if(op == ACTION_INC)
	{
		if(game.rule == RULE_LAST)
			game.rule = RULE_FIRST;
		else
			game.rule++;
		ResetMenu();
	}
	else if(op == ACTION_DEC)
	{
		if(game.rule == RULE_FIRST)
			game.rule = RULE_LAST;
		else
			game.rule--;
		ResetMenu();
	}

	switch(game.rule)
	{
	case RULE_RACE:     return "<RACE>";
	case RULE_SURVIVOR: return "<SURVIVOR>";
	case RULE_TAG:      return "<TAG>";
	case RULE_SOCCER:   return "<SOCCER>";
	}
}

/** Menu callback - Select game mode */
const char* SelectPlayer(u8 op, i8 value)
{
	value;
	if(op == ACTION_INC)
	{
		if(game.playerNum == 4)
			game.playerNum = 2;
		else
			game.playerNum++;
		ResetMenu();
	}
	else if(op == ACTION_DEC)
	{
		if(game.playerNum == 2)
			game.playerNum = 4;
		else
			game.playerNum--;
		ResetMenu();
	}

	if(game.playerNum == 2)
		return "<2>";
	else if(game.playerNum == 3)
		return "<3>";
	else if(game.playerNum == 4)
		return "<4>";
}

/** Menu callback - Select game mode */
const char* SelectShade(u8 op, i8 value)
{
	value;
	if(op == ACTION_INC || op == ACTION_DEC)
	{
		game.shadeTrack = 1 - game.shadeTrack;
		ResetMenu();
	}

	return game.shadeTrack ? "<ON>" : "<OFF>";
}