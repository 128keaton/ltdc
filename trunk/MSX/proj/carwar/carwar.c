/* 3D on MSX */
#include "core.h"
#include "bios.h"
#include "video.h"

//----------------------------------------
// M A C R O S

#define PosToPxl(a) (a >> 8)
#define PosXToSprt(a) (PosToPxl(a) - 6)
#define PosYToSprt(a) (PosToPxl(a) - 5)

#define HMMC(dx, dy, nx, ny, ram)        game.vdp36.DX = dx; game.vdp36.DY = dy; game.vdp36.NX = nx; game.vdp36.NY = ny; game.vdp36.CLR = ((u8*)ram)[0]; /*game.vdp36.ARG = 0;*/ game.vdp36.CMD = VDP_CMD_HMMC;                                  VPDCommand36((u16)&game.vdp36); VPDCommandLoop(ram);
#define LMMC(dx, dy, nx, ny, ram, op)    game.vdp36.DX = dx; game.vdp36.DY = dy; game.vdp36.NX = nx; game.vdp36.NY = ny; game.vdp36.CLR = ((u8*)ram)[0]; /*game.vdp36.ARG = 0;*/ game.vdp36.CMD = VDP_CMD_LMMC + op;                             VPDCommand36((u16)&game.vdp36); VPDCommandLoop(ram);
#define HMMM(sx, sy, dx, dy, nx, ny)     game.vdp32.SX = sx; game.vdp32.SY = sy; game.vdp32.DX = dx; game.vdp32.DY = dy; game.vdp32.NX = nx; game.vdp32.NY = ny; /*game.vdp32.CLR = 0; game.vdp32.ARG = 0;*/ game.vdp32.CMD = VDP_CMD_HMMM;      VPDCommand32((u16)&game.vdp32);
#define LMMM(sx, sy, dx, dy, nx, ny, op) game.vdp32.SX = sx; game.vdp32.SY = sy; game.vdp32.DX = dx; game.vdp32.DY = dy; game.vdp32.NX = nx; game.vdp32.NY = ny; /*game.vdp32.CLR = 0; game.vdp32.ARG = 0;*/ game.vdp32.CMD = VDP_CMD_LMMM + op; VPDCommand32((u16)&game.vdp32);
#define HMMV(dx, dy, nx, ny, col)        game.vdp36.DX = dx; game.vdp36.DY = dy; game.vdp36.NX = nx; game.vdp36.NY = ny; game.vdp36.CLR = col; /*game.vdp36.ARG = 0;*/ game.vdp36.CMD = VDP_CMD_HMMV;                                            VPDCommand36((u16)&game.vdp36);

#define Abs8(i)  (((u8)i & 0x80) ? ~((u8)i - 1) : i)
#define Abs16(i) (((u16)i & 0x8000) ? ~((u16)i - 1) : i)

#define RGB8(r,g,b) ((g << 5) + (r << 2) + (b))

//----------------------------------------
// D E F I N E S
#define CAR_NUM			4

#define CAR_TURN_RIGHT  0x01
#define CAR_TURN_LEFT   0x02
#define CAR_MOVE		0x04

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

#define BLOCK_SHADOW	3
#define ROAD_SHADOW		4
#define SHADOW_POWER	2

// Menu layout
#define TITLE_X			16
#define TITLE_Y			32
#define MENU_X			84
#define MENU_Y			100
#define LINE_SPACE		10
#define TITLE_SPACE		16

#define ITEM_INVALID	(0x80 + 0)
#define ITEM_ACTION		(0x80 + 1)

// Color operator
enum
{
	// Walls
	OP_NONE = 0,
		OP_WALL = 0,
		OP_BLADE,
		OP_BUMPER,
	// Special
	OP_SPECIAL = 4,
		OP_SPEEDER = 4,
		OP_JUMPER,
		OP_MAGMA,
		OP_SEA,
		OP_HOLE,
	// Roads
	OP_ROAD = 10,
		OP_ASPHALT = 10,
		OP_MUD,
		OP_SAND,
		OP_GRASS,
		OP_SNOW,
		OP_ICE,
		OP_WATER,
};

// 
enum
{
	RULE_RACE,     // Race
	RULE_SURVIVOR, // Deathmatch
	RULE_TAG,      // Chat
	RULE_SOCCER,   // Soccer
};

// Tile render flag
#define ROT_0	0x00	// 0°
#define ROT_90	0x10	// 90°
#define ROT_180	0x20	// 180°
#define ROT_270	0x30	// 270°
#define SYM_H	0x40	// Horizontal symmetry
#define SYM_V	0x50	// Vertical symmetry

//----------------------------------------
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
	u8 maxSpeed[3];
	u8 accel;
} Car;

typedef struct tagTrackTile
{
	u8 tile; // Tile index + rotation flag
	u8 color0;
	u8 color1;
} TrackTile;

typedef struct tagTrack
{
	const u8* name;
	u8 width;
	u8 height;
	TrackTile* tiles;
	struct tagVectorU8 offset;
	u8 rotation;
	struct tagVectorU8 startPos[4];
} Track;

typedef struct tagMenuEntry
{
	const char* text;
	u8 nextIdx;
	void (*action)(i8);
	i8 value;
} MenuEntry;

typedef struct tagMenu
{
	const char* title;
	const char* tips;
	struct tagMenuEntry* items;
	u8 itemNum;
} Menu;

typedef struct Background
{
	u8 MaxSpeed;
	u8 Friction;
	u8 Grip; // Adherence
	u8 ColorLight;
	u8 ColorDark;
} Background;

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
} Player;

typedef struct
{
	u8               frame;
	u8               menu;
	u8               item;
	u8               pressed;
	u8               rule;
	u8               page;
	u8               track;
	u16              yOffset;
	u8               colorCode[256];
	u8               playerNum;
	struct tagPlayer players[4];
	void            (*state)(void);
	u8               bitToByte[256 * 8];
	VectorU8         smoke[12];
	VdpBuffer32      vdp32;
	VdpBuffer36      vdp36;
	u8               blockGen[32*32];
} GameData;

//----------------------------------------
// P R O T O T Y P E S

void MainLoop();
void InitializePlayer(Player* ply, u8 car, u8 posX, u8 posY, u8 rot);
void InitializeMenu(u8 menu);
void CarToCarCollision(u8 idx, u8 car1, u8 car2);
void CarToWallCollision(u8 car);
i8 AngleDifferent64(i8 angleA, i8 angleB);
//u8 VectorToAngle64(i16 x, i16 y);
u8 VectorToAngle256(i16 x, i16 y);
//u16 GetVectorLenght1024(i16 x, i16 y);
u16 GetVectorLenght256(i16 x, i16 y);

void DrawCharacter(u16 x, u16 y, u8 chr, u8 color);
void DrawText(u16 x, u16 y, const char* text, u8 color);

void DebugPrintInt(i16 i, u8 x, u8 y);

// Color process
u8 DarkenColor(u8 color, u8 power);
u8 GrayGradiant(u8 index);

// States
void StateInitialize();
void StateTitle();
void StateMainMenu();
void StateBuildTrack();
void StateShadeTrack();
void StateStartGame();
void StateUpdateGame();

// Menu callback
void StartGame(i8 value);
void SelectPlayer(i8 value);
void SelectRule(i8 value);

//----------------------------------------
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
#include "data/sprt_smoke.h"

#include "trigo64.inc"
#include "rot256.inc"
#include "sqrt256.inc"

//----------------------------------------
/** rotSpeed, maxSpeed (63), accel */
const Car g_Cars[5] = 
{
	// 0. Cop
	{ 5, { 25, 35, 40 }, 6 },
	// 1. Camaro (Chevrolet)
	{ 4, { 20, 35, 60 }, 7 },
	// 2. Ferrari
	{ 4, { 20, 40, 55 }, 7 },
	// 3. Turtule
	{ 6, { 30, 30, 30 }, 5 },
	// 4. Pilot
	{ 8, { 15, 15, 15 }, 5 },
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
	{ 2, 2, 4, COLOR_MAUVE, COLOR_DARKMAUVE },
	// 5. OP_JUMPER
	{ 2, 2, 4, COLOR_ORANGE, COLOR_DARKORANGE },
	// 6. OP_MAGMA
	{ 0, 4, 8, COLOR_RED, COLOR_DARKRED },
	// 7. OP_SEA
	{ 0, 0, 0, COLOR_NAVYBLUE, COLOR_DARKNAVYBLUE },
	// 8. OP_HOLE
	{ 0, 0, 0, COLOR_BLACK, COLOR_BLACK },
	// 9. 
	{ 0, 0, 0, 0, 0 },
	// 10. OP_ASPHALT
	{ 2, 4, 8, COLOR_GRAY, COLOR_DARKGRAY },
	// 11. OP_MUD
	{ 1, 8, 4, COLOR_BROWN, COLOR_DARKBROWN },
	// 12. OP_SAND
	{ 0, 8, 4, COLOR_YELLOW, COLOR_DARKYELLOW },
	// 13. OP_GRASS
	{ 1, 4, 4, COLOR_GREEN, COLOR_DARKGREEN },
	// 14. OP_SNOW
	{ 0, 8, 8, COLOR_WHITE, COLOR_LIGHTGRAY },
	// 15. OP_ICE
	{ 2, 2, 0, COLOR_CYAN, COLOR_LIGHTBLUE },
	// 16. OP_WATER
	{ 0, 2, 4, COLOR_BLUE, COLOR_DARKBLUE },
};
		
const TrackTile g_TrackTiles01[] = 
{
	// line 0
	{ 0 + ROT_0, COLOR_KHAKI, COLOR_GRAY },
	{ 2 + ROT_0, COLOR_KHAKI, COLOR_GRAY },
	{ 2 + ROT_0, COLOR_KHAKI, COLOR_GRAY },
	{ 0 + ROT_90, COLOR_KHAKI, COLOR_GRAY },
	{ 0 + ROT_0, COLOR_KHAKI, COLOR_GRAY },
	{ 2 + ROT_0, COLOR_KHAKI, COLOR_GRAY },
	{ 0 + ROT_90, COLOR_KHAKI, COLOR_GRAY },
	// line 1
	{ 2 + ROT_0, COLOR_KHAKI, COLOR_GRAY },
	{ 1 + ROT_0, COLOR_GRAY, COLOR_KHAKI },
	{ 2 + ROT_0, COLOR_GRAY, COLOR_KHAKI },
	{ 0 + ROT_270, COLOR_KHAKI, COLOR_GRAY },
	{ 0 + ROT_180, COLOR_KHAKI, COLOR_GRAY },
	{ 1 + ROT_90, COLOR_GRAY, COLOR_KHAKI },
	{ 2 + ROT_0, COLOR_KHAKI, COLOR_GRAY },
	// line 2
	{ 3 + ROT_0, COLOR_WHITE, COLOR_GRAY },
	{ 2 + ROT_0, COLOR_GRAY, COLOR_KHAKI },
	{ 2 + ROT_0, COLOR_GRAY, COLOR_KHAKI },
	{ 2 + ROT_0, COLOR_GRAY, COLOR_KHAKI },
	{ 2 + ROT_0, COLOR_GRAY, COLOR_KHAKI },
	{ 2 + ROT_0, COLOR_GRAY, COLOR_KHAKI },
	{ 2 + ROT_0, COLOR_GRAY, COLOR_GRAY },
	// line 3
	{ 2 + ROT_0, COLOR_KHAKI, COLOR_GRAY },
	{ 2 + ROT_0, COLOR_GRAY, COLOR_KHAKI },
	{ 2 + ROT_0, COLOR_GRAY, COLOR_KHAKI },
	{ 2 + ROT_0, COLOR_GRAY, COLOR_KHAKI },
	{ 2 + ROT_0, COLOR_GRAY, COLOR_KHAKI },
	{ 1 + ROT_0, COLOR_KHAKI, COLOR_GRAY },
	{ 2 + ROT_0, COLOR_KHAKI, COLOR_GRAY },
	// line 4
	{ 9 + ROT_90, COLOR_YELLOW, COLOR_GRAY },
	{ 0 + ROT_0, COLOR_KHAKI, COLOR_YELLOW },
	{ 2 + ROT_0, COLOR_KHAKI, COLOR_YELLOW },
	{ 2 + ROT_0, COLOR_GRAY, COLOR_KHAKI },
	{ 11 + ROT_270, COLOR_ORANGE, COLOR_GRAY },
	{ 4 + ROT_0, COLOR_KHAKI, COLOR_GRAY },
	{ 2 + ROT_0, COLOR_KHAKI, COLOR_GRAY },
	// line 5
	{ 0 + ROT_270, COLOR_KHAKI, COLOR_YELLOW },
	{ 2 + ROT_0, COLOR_KHAKI, COLOR_YELLOW },
	{ 1 + ROT_0, COLOR_YELLOW, COLOR_KHAKI },
	{ 2 + ROT_0, COLOR_GRAY, COLOR_KHAKI },
	{ 1 + ROT_90, COLOR_GRAY, COLOR_KHAKI },
	{ 2 + ROT_0, COLOR_KHAKI, COLOR_GRAY },
	{ 0 + ROT_180, COLOR_KHAKI, COLOR_GRAY },
};

const TrackTile g_TrackTiles02[] = 
{
	// line 0
	{ 1 + ROT_0, COLOR_KHAKI, COLOR_GRAY },
	{ 5 + ROT_270, COLOR_KHAKI, COLOR_GRAY },
	{ 5 + ROT_270, COLOR_KHAKI, COLOR_GRAY },
	{ 2 + ROT_0, COLOR_KHAKI, COLOR_GRAY },
	{ 5 + ROT_0, COLOR_KHAKI, COLOR_BLACK },
	{ 2 + ROT_0, COLOR_KHAKI, COLOR_BLACK },
	{ 2 + ROT_0, COLOR_KHAKI, COLOR_BLACK },
	// line 1
	{ 1 + ROT_270, COLOR_KHAKI, COLOR_GRAY },
	{ 2 + ROT_0, COLOR_GRAY, COLOR_GRAY },
	{ 11 + ROT_90, COLOR_ORANGE, COLOR_GRAY },
	{ 2 + ROT_0, COLOR_BLACK, COLOR_BLACK },
	{ 9 + ROT_0, COLOR_YELLOW, COLOR_GRAY },
	{ 0 + ROT_90, COLOR_BLACK, COLOR_YELLOW },
	{ 2 + ROT_0, COLOR_BLACK, COLOR_BLACK },
	// line 2
	{ 2 + ROT_0, COLOR_KHAKI, COLOR_KHAKI },
	{ 2 + ROT_0, COLOR_KHAKI, COLOR_KHAKI },
	{ 2 + ROT_0, COLOR_KHAKI, COLOR_KHAKI },
	{ 11 + ROT_0, COLOR_ORANGE, COLOR_GRAY },
	{ 2 + ROT_0, COLOR_KHAKI, COLOR_KHAKI },
	{ 4 + ROT_0, COLOR_BLACK, COLOR_YELLOW },
	{ 2 + ROT_0, COLOR_BLACK, COLOR_BLACK },
	// line 3
	{ 1 + ROT_0, COLOR_KHAKI, COLOR_GRAY },
	{ 2 + ROT_0, COLOR_GRAY, COLOR_GRAY },
	{ 10 + ROT_0, COLOR_CYAN, COLOR_GRAY },
	{ 0 + ROT_180, COLOR_KHAKI, COLOR_GRAY },
	{ 2 + ROT_0, COLOR_KHAKI, COLOR_KHAKI },
	{ 1 + ROT_270, COLOR_KHAKI, COLOR_YELLOW },
	{ 1 + ROT_90, COLOR_KHAKI, COLOR_YELLOW },
	// line 4
	{ 10 + ROT_0, COLOR_MAUVE, COLOR_GRAY },
	{ 2 + ROT_0, COLOR_KHAKI, COLOR_KHAKI },
	{ 2 + ROT_0, COLOR_KHAKI, COLOR_KHAKI },
	{ 2 + ROT_0, COLOR_KHAKI, COLOR_KHAKI },
	{ 2 + ROT_0, COLOR_KHAKI, COLOR_KHAKI },
	{ 1 + ROT_0, COLOR_KHAKI, COLOR_YELLOW },
	{ 1 + ROT_180, COLOR_KHAKI, COLOR_YELLOW },
	// line 5
	{ 1 + ROT_270, COLOR_KHAKI, COLOR_GRAY },
	{ 10 + ROT_0, COLOR_CYAN, COLOR_GRAY },
	{ 2 + ROT_0, COLOR_GRAY, COLOR_GRAY },
	{ 3 + ROT_90, COLOR_WHITE, COLOR_GRAY },
	{ 9 + ROT_0, COLOR_YELLOW, COLOR_GRAY },
	{ 4 + ROT_0, COLOR_BLACK, COLOR_YELLOW },
	{ 2 + ROT_0, COLOR_KHAKI, COLOR_KHAKI },
};

const TrackTile g_TrackTiles03[] = 
{
	// line 0
	{ 2 + ROT_0, COLOR_KHAKI, COLOR_KHAKI },
	{ 1 + ROT_0, COLOR_KHAKI, COLOR_CYAN },
	{ 10 + ROT_0, COLOR_BLUE, COLOR_CYAN },
	{ 2 + ROT_0, COLOR_CYAN, COLOR_CYAN },
	{ 10 + ROT_0, COLOR_BLUE, COLOR_CYAN },
	{ 10 + ROT_0, COLOR_MAUVE, COLOR_CYAN },
	{ 1 + ROT_90, COLOR_KHAKI, COLOR_CYAN },
	// line 1
	{ 0 + ROT_0, COLOR_KHAKI, COLOR_CYAN },
	{ 10 + ROT_0, COLOR_MAUVE, COLOR_CYAN },
	{ 11 + ROT_270, COLOR_ORANGE, COLOR_CYAN },
	{ 1 + ROT_180, COLOR_KHAKI, COLOR_CYAN },
	{ 2 + ROT_0, COLOR_CYAN, COLOR_CYAN },
	{ 10 + ROT_0, COLOR_BLUE, COLOR_CYAN },
	{ 1 + ROT_180, COLOR_KHAKI, COLOR_CYAN },
	// line 2
	{ 9 + ROT_90, COLOR_BROWN, COLOR_CYAN },
	{ 1 + ROT_270, COLOR_KHAKI, COLOR_CYAN },
	{ 1 + ROT_180, COLOR_KHAKI, COLOR_CYAN },
	{ 2 + ROT_0, COLOR_KHAKI, COLOR_KHAKI },
	{ 9 + ROT_90, COLOR_WHITE, COLOR_CYAN },
	{ 1 + ROT_270, COLOR_KHAKI, COLOR_CYAN },
	{ 1 + ROT_90, COLOR_KHAKI, COLOR_CYAN },
	// line 3
	{ 2 + ROT_0, COLOR_BROWN, COLOR_BROWN },
	{ 2 + ROT_0, COLOR_KHAKI, COLOR_KHAKI },
	{ 2 + ROT_0, COLOR_KHAKI, COLOR_KHAKI },
	{ 2 + ROT_0, COLOR_KHAKI, COLOR_KHAKI },
	{ 10 + ROT_0, COLOR_MAUVE, COLOR_WHITE },
	{ 9 + ROT_0, COLOR_CYAN, COLOR_WHITE },
	{ 10 + ROT_0, COLOR_MAUVE, COLOR_CYAN },
	// line 4
	{ 9 + ROT_90, COLOR_GRAY, COLOR_BROWN },
	{ 2 + ROT_0, COLOR_KHAKI, COLOR_KHAKI },
	{ 2 + ROT_0, COLOR_KHAKI, COLOR_KHAKI },
	{ 2 + ROT_0, COLOR_KHAKI, COLOR_KHAKI },
	{ 2 + ROT_0, COLOR_KHAKI, COLOR_KHAKI },
	{ 0 + ROT_270, COLOR_KHAKI, COLOR_CYAN },
	{ 0 + ROT_90, COLOR_KHAKI, COLOR_CYAN },
	// line 5
	{ 2 + ROT_0, COLOR_KHAKI, COLOR_GRAY },
	{ 11 + ROT_0, COLOR_YELLOW, COLOR_GRAY },
	{ 9 + ROT_0, COLOR_BLUE, COLOR_GRAY },
	{ 9 + ROT_0, COLOR_YELLOW, COLOR_BLUE },
	{ 9 + ROT_0, COLOR_CYAN, COLOR_YELLOW },
	{ 3 + ROT_90, COLOR_WHITE, COLOR_CYAN },
	{ 0 + ROT_180, COLOR_KHAKI, COLOR_CYAN },
};

const Track g_Tracks[] = 
{
	{ "AOI1", 7, 6, g_TrackTiles01, { 16, 8 }, 64, { { 25, 100 }, { 40, 100 }, { 25, 120 }, { 40, 120 } } },
	{ "NOE1", 7, 6, g_TrackTiles02, { 16, 8 }, 128, { { 130, 180 }, { 130, 195 }, { 145, 180 }, { 145, 195 } } },
	{ "NOE2", 7, 6, g_TrackTiles03, { 16, 8 }, 0, { { 130, 180 }, { 130, 195 }, { 145, 180 }, { 145, 195 } } },
};

//----------------------------------------
// Menu 0
const MenuEntry g_MenuMain[] =
{
	{ "PLAY",     3, 0 },
	{ "EDITOR",   ITEM_INVALID, 0, 0 },
	{ "OPTIONS",  ITEM_INVALID, 0, 0 },
	{ "CREDITS",  ITEM_INVALID, 0, 0 },
};

// Menu 1
const MenuEntry g_MenuMode[] =
{
	{ "RACE",     2, SelectRule, RULE_RACE },
	{ "SURVIVOR", ITEM_INVALID, SelectRule, RULE_SURVIVOR },
	{ "TAG",      ITEM_INVALID, SelectRule, RULE_TAG },
	{ "SOCCER",   ITEM_INVALID, SelectRule, RULE_SOCCER },
	{ "BACK",     3, 0, 0 },
};

// Menu 2
const MenuEntry g_MenuTrack[] =
{
	{ "FROM ROM",  4, 0, 0 },
	{ "FROM DISK", ITEM_INVALID, 0, 0 },
	{ "BACK",      1, 0, 0 },
};

// Menu 3
const MenuEntry g_MenuPlayer[] =
{
	{ "2 PLAYERS", 1, SelectPlayer, 2 },
	{ "3 PLAYERS", 1, SelectPlayer, 3 },
	{ "4 PLAYERS", 1, SelectPlayer, 4 },
	{ "BACK",      0, 0, 0 },
};

// Menu 4
const MenuEntry g_MenuTrackList[] =
{
	{ "AOI1", ITEM_ACTION, StartGame, 0 },
	{ "NOE1", ITEM_ACTION, StartGame, 1 },
	{ "NOE2", ITEM_ACTION, StartGame, 2 },
	{ "BACK",           2, 0, 0 },
};

const Menu g_Menus[] =
{
	{ "",              "PRESS SPACE", g_MenuMain,      numberof(g_MenuMain) },
	{ "GAME MODE",     "PRESS SPACE", g_MenuMode,      numberof(g_MenuMode) },
	{ "TRACK SELECT",  "PRESS SPACE", g_MenuTrack,     numberof(g_MenuTrack) },
	{ "PLAYER SELECT", "PRESS SPACE", g_MenuPlayer,    numberof(g_MenuPlayer) },
	{ "TRACK SELECT",  "PRESS SPACE", g_MenuTrackList, numberof(g_MenuTrackList) },
};

const u8 g_HeightTab[] = { 0, 2, 4, 5, 5, 6, 6, 7, 7, 8, 8, 8, 7, 7, 6, 6, 5, 5, 4, 2, 0 };

const u8 g_DefaultColor[] = { 0x01, 0x01, 0x09, 0x0d, 0x0d, 0x09, 0x01, 0x01 };

const u8 g_AnimIndex[] = { 0, 1, 0, 2 };

//----------------------------------------
// R A M   D A T A

// Game data
GameData __at(0xC000) game;

//----------------------------------------
// P R O G R A M

///
__sfr __at(0xA8) g_slotPort;

//----------------------------------------
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

/** State - initialize system */
void StateInitialize()
{
	u16 x, i;

	game.vdp36.ARG = 0; 
	game.vdp32.ARG = 0; 

	// Init
	SetFreq(FREQ_60);
	SetScreen8(LINES_212);
	SetSpriteMode(SPRITE_ON, SPRITE_NO_MAG + SPRITE_SIZE_8, 0xF800 >> 11, 0xF700 >> 7);

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
	game.colorCode[COLOR_NAVYBLUE]     = OP_SEA;
	game.colorCode[COLOR_DARKNAVYBLUE] = OP_SEA;
	game.colorCode[COLOR_MAUVE]        = OP_SPEEDER;
	game.colorCode[COLOR_DARKMAUVE]    = OP_SPEEDER;
	game.colorCode[COLOR_ORANGE]       = OP_JUMPER;
	game.colorCode[COLOR_DARKORANGE]   = OP_JUMPER;
	game.colorCode[COLOR_RED]          = OP_MAGMA;
	game.colorCode[COLOR_DARKRED]      = OP_MAGMA;
	game.colorCode[COLOR_BLACK]        = OP_HOLE;

	// Initialize (ASCII table) sprites
	for(x=0; x<sizeof(g_CharTable) / 8; x++)
	{
		RAMtoVRAM((x * 8) % 256, 248 + (x / 32), 8, 1, (u16)&g_CharTable[x * 8]);
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

	//for(x=0; x<12; x++)
	//{
	//	game.smoke[x].x = 20 + 10 * (x % 4);
	//	game.smoke[x].y = 20 + 10 * (x / 4);
	//}
	
	game.track = 0;
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
	}

	HMMM(MENU_X, MENU_Y, MENU_X, MENU_Y + 256, 256 - MENU_X, 212 - MENU_Y);
}

/** State - Initialize title */
void StateTitle()
{
	u8 i, j, byte;
	// Hide working screen
	game.page = 1;
	SetPage8(game.page);
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
			g_Menus[game.menu].items[game.item].action(g_Menus[game.menu].items[game.item].value);
		if((g_Menus[game.menu].items[game.item].nextIdx & 0x80) == 0)
			InitializeMenu(g_Menus[game.menu].items[game.item].nextIdx);
		return;
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

/** State - Start game */
void StateStartGame()
{
	u8 i;
	const u8 colors[] = { 
		COLOR_GRAY, COLOR_GRAY, 
		COLOR_GRAY, COLOR_GRAY,
		COLOR_GRAY, COLOR_BROWN, 
		COLOR_YELLOW, COLOR_GREEN, 
		COLOR_WHITE, COLOR_CYAN, 
		COLOR_BLUE, COLOR_NAVYBLUE, 
		COLOR_MAUVE, COLOR_ORANGE, 
		COLOR_RED, COLOR_BLACK };

	game.page = 0;
	SetPage8(game.page);

	//----------------------------------------
	// Build background
	StateBuildTrack();
	//StateShadeTrack();
	//for(i=0; i<16; i++)
	//	FillVRAM(256 >> 2 * (i & 0xFFFC), 212 >> 2 * (i >> 2), 256 >> 2, 212 >> 2, colors[i]);

	HMMM(0, 0, 0, 256, 256, 212);

	//----------------------------------------
	// Copy cars to VRAM
	PrintSprite(64, 64, "INIT\nCARS", (u16)&g_DefaultColor);
	for(i=0; i<16; i++)
	{
		RAMtoVRAM(i * 13, 256 + 212 + 0,  13, 11, (u16)&g_Car1[13 * 11 * i]);
		RAMtoVRAM(i * 13, 256 + 212 + 11, 13, 11, (u16)&g_Car2[13 * 11 * i]);
		RAMtoVRAM(i * 13, 256 + 212 + 22, 13, 11, (u16)&g_Car3[13 * 11 * i]);
		RAMtoVRAM(i * 13, 256 + 212 + 33, 13, 11, (u16)&g_Car4[13 * 11 * i]);
	}
	RAMtoVRAM(16 * 13, 256 + 212, 13, 8, (u16)&g_Shadow);
	for(i = 0; i < 8 * 3; i++)
	{
		RAMtoVRAM(208 + (i % 8) * 6, 476 + 8 * (i / 8), 6, 8, (u16)&g_Pilots[6 * 8 * i]);
	}
	//for(i = 0; i < 6; i++)
	//{
	//	RAMtoVRAM(221 + (i * 5), 468, 5, 5, (u16)&g_Smoke[5 * 5 * i]); // 5x5 par 6x1
	//}

	//----------------------------------------
	// Initialize background backup
	PrintSprite(64, 64, "INIT\nTRACK\nBACKUP", (u16)&g_DefaultColor);
	for(i=0; i<CAR_NUM; i++)
	{
		InitializePlayer(&game.players[i], i, g_Tracks[game.track].startPos[i].x, g_Tracks[game.track].startPos[i].y, g_Tracks[game.track].rotation);
		HMMM(PosXToSprt(game.players[i].posX), (256 * 0) + PosYToSprt(game.players[i].posY), (13 * i) + (52 * 0), 212, 13, 11 + 1);
		HMMM(PosXToSprt(game.players[i].posX), (256 * 1) + PosYToSprt(game.players[i].posY), (13 * i) + (52 * 1), 212, 13, 11 + 1);
	}

	//for(i=0; i<12; i++) // Backup smoke
	//{
	//	HMMM(game.smoke[i].x, game.smoke[i].y, 104 + (5 * i), 212, 5, 5);
	//	HMMM(game.smoke[i].x, game.smoke[i].y, 104 + (5 * i), 217, 5, 5);
	//}

	ClearSprite();
	for(i=0; i<32; i++)
		SetSpriteUniColor(i, 0, 248, 0, 0);

	game.state = StateUpdateGame;
}

/** State - Process game */
void StateUpdateGame()
{
	u8 i, keyLine, dir, ground, op, friction, grip;
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
	curPly = &game.players[2];
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
	curPly = &game.players[3];
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
		HMMM((13 * i) + (52 * game.page), 212, PosXToSprt(game.players[i].prevX), game.yOffset + PosYToSprt(game.players[i].prevY) - game.players[i].prevZ, 13, 11 + 1 + game.players[i].prevZ);
	}
	//for(i=0; i<12; i++)
	//{
	//	HMMM(104 + (5 * i), 212 + (game.page * 5), game.smoke[i].x, game.yOffset + game.smoke[i].y, 5, 5);
	//}

	//----------------------------------------
	// Update physic
	for(i=0; i<CAR_NUM; i++)
	{
		curPly = &game.players[i];

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
				break;
			}

			// Friction: Slow down the speed
			friction = g_BG[op].Friction;
			maxSpeed = g_Cars[curPly->car].maxSpeed[g_BG[op].MaxSpeed];
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
				curPly->rot += g_Cars[curPly->car].rotSpeed; 
			}
			if(curPly->flag & CAR_TURN_RIGHT)
			{
				curPly->rot -= g_Cars[curPly->car].rotSpeed; 
			}

			// Cap max speed
			if(curPly->flag & CAR_MOVE)
			{
				x = Abs16(curPly->velX);
				x >>= 8;
				y = Abs16(curPly->velY);
				y >>= 8;
				speedSq = (x * x) + (y * y);
				maxSpeed = g_Cars[curPly->car].maxSpeed[g_BG[op].MaxSpeed];
				if(speedSq < maxSpeed * maxSpeed)
				{
					speed += g_Cars[curPly->car].accel;
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

			CarToWallCollision(i);
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
	CarToCarCollision(0, 0, 1);
	// 3 players
	CarToCarCollision(1, 0, 2);
	CarToCarCollision(2, 1, 2);
	// 4 players
	CarToCarCollision(3, 0, 3);
	CarToCarCollision(4, 1, 3);
	CarToCarCollision(5, 2, 3);

	// Fix position
	for(i=0; i<CAR_NUM; i++)
	{
		curPly = &game.players[i];

		// Apply velocity
		curPly->prevX = curPly->posX;
		curPly->prevY = curPly->posY;
		curPly->prevZ = curPly->posZ;

		curPly->posX = curPly->nextX;
		curPly->posY = curPly->nextY;
		curPly->posZ = g_HeightTab[curPly->jump];

		// Backup
		HMMM(PosXToSprt(curPly->posX), game.yOffset + PosYToSprt(curPly->posY) - curPly->posZ, (13 * i) + (52 * game.page), 212, 13, 11 + 1 + game.players[i].posZ);
	}

	//----------------------------------------
	// Draw cars
	for(i=0; i<CAR_NUM; i++)
	{
		curPly = &game.players[i];
		LMMM(13 * 16, 256 + 212, PosXToSprt(curPly->posX), game.yOffset + PosYToSprt(curPly->posY) + 3, 13, 8, VDP_OP_TIMP);
		LMMM(13 * (curPly->rot >> 4), 256 + 212 + (11 * i), PosXToSprt(curPly->posX), game.yOffset + PosYToSprt(curPly->posY) - curPly->posZ, 13, 11, VDP_OP_TIMP);
		//LMMM(208 + 6 * (curPly->rot >> 5), 476, PosToPxl(curPly->posX) - 3, game.yOffset + PosToPxl(curPly->posY) - 4 /*- curPly->posZ*/, 6, 8, VDP_OP_TIMP);
	}
	//for(i=0; i<12; i++)
	//{
	//	LMMM(221 + 5 * (game.frame % 6), 468, game.smoke[i].x, game.yOffset + game.smoke[i].y, 5, 5, VDP_OP_TIMP);
	//}
		
	waitRetrace();
	game.frame++;
}

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
		x /= 2;
		y /= 2;
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
void CarToCarCollision(u8 idx, u8 car1, u8 car2)
{
	i16 x1, y1, x2, y2, dist;

	idx;

	dist = game.players[car2].nextX - game.players[car1].nextX;
	x1 = dist >> 8;
	dist = game.players[car2].nextY - game.players[car1].nextY;
	y1 = dist >> 8;
	dist = (x1 * x1) + (y1 * y1);
	if(dist < CAR_CHECK_LEN * CAR_CHECK_LEN) // Collision occured
	{
		x1 = game.players[car1].velX;
		y1 = game.players[car1].velY;
		x2 = game.players[car2].velX;
		y2 = game.players[car2].velY;

		game.players[car1].velX = x2 - x1;
		game.players[car1].velY = y2 - y1;
		game.players[car2].velX = x1 - x2;
		game.players[car2].velY = y1 - y2;

		game.players[car1].nextX = game.players[car1].posX;
		game.players[car1].nextY = game.players[car1].posY;
		game.players[car2].nextX = game.players[car2].posX;
		game.players[car2].nextY = game.players[car2].posY;
	}
}

#define WALL_CHECK_LEN 4
void CarToWallCollision(u8 car)
{
	u8 /*i,*/ ground, op;
	Player* ply;
	ply = &game.players[car];

	if((ply->rot > 64) && (ply->rot > 64))
	{
		ground = ReadVRAM(game.page, PosToPxl(ply->posX) - WALL_CHECK_LEN + 256 * PosToPxl(ply->posY));
		op = game.colorCode[ground];
		if(op == OP_WALL)
		{
			ply->velX = Abs16(ply->velX) >> 1;
			ply->velY >>= 1;
		}
	}
	else
	{
		ground = ReadVRAM(game.page, PosToPxl(ply->posX) + WALL_CHECK_LEN + 256 * PosToPxl(ply->posY));
		op = game.colorCode[ground];
		if(op == OP_WALL)
		{
			ply->velX = -(Abs16(ply->velX) >> 1);
			ply->velY >>= 1;
		}
	}

	if(ply->rot < 128)
	{
		ground = ReadVRAM(game.page, PosToPxl(ply->posX) + 256 * (PosToPxl(ply->posY) - WALL_CHECK_LEN));
		op = game.colorCode[ground];
		if(op == OP_WALL)
		{
			ply->velX >>= 1;
			ply->velY = -(Abs16(ply->velY) >> 1);
		}
	}
	else
	{
		ground = ReadVRAM(game.page, PosToPxl(ply->posX) + 256 * (PosToPxl(ply->posY) + WALL_CHECK_LEN));
		op = game.colorCode[ground];
		if(op == OP_WALL)
		{
			ply->velX >>= 1;
			ply->velY = Abs16(ply->velY) >> 1;
		}
	}

	//for(i=2; i<WALL_CHECK_LEN; i++)
	//{
	//	ground = ReadVRAM(game.page, PosToPxl(ply->posX) - i + 256 * PosToPxl(ply->posY));
	//	op = game.colorCode[ground];
	//	if(op == OP_WALL)
	//	{
	//		ply->velX = Abs16(ply->velX) >> 1;
	//		ply->velY >>= 1;
	//		break;
	//	}
	//}
	//for(i=2; i<WALL_CHECK_LEN; i++)
	//{
	//	ground = ReadVRAM(game.page, PosToPxl(ply->posX) + i + 256 * PosToPxl(ply->posY));
	//	op = game.colorCode[ground];
	//	if(op == OP_WALL)
	//	{
	//		ply->velX = -(Abs16(ply->velX) >> 1);
	//		ply->velY >>= 1;
	//		break;
	//	}
	//}
	//for(i=2; i<WALL_CHECK_LEN; i++)
	//{
	//	ground = ReadVRAM(game.page, PosToPxl(ply->posX) + 256 * (PosToPxl(ply->posY) - i));
	//	op = game.colorCode[ground];
	//	if(op == OP_WALL)
	//	{
	//		ply->velX >>= 1;
	//		ply->velY = -(Abs16(ply->velY) >> 1);
	//		break;
	//	}
	//}
	//for(i=2; i<WALL_CHECK_LEN; i++)
	//{
	//	ground = ReadVRAM(game.page, PosToPxl(ply->posX) + 256 * (PosToPxl(ply->posY) + i));
	//	op = game.colorCode[ground];
	//	if(op == OP_WALL)
	//	{
	//		ply->velX >>= 1;
	//		ply->velY = Abs16(ply->velY) >> 1;
	//		break;
	//	}
	//}
}


/***/
void StateBuildTrack()
{
	u8 i, j, byte;
	u16 x, y, lx, ly;
	const TrackTile* block;

	PrintSprite(64, 64, "BUILD\nTRACK", (u16)&g_DefaultColor);

	FillVRAM(0, 0, 128, 212, COLOR_KHAKI);
	FillVRAM(128, 0, 128, 212, COLOR_KHAKI);
	for(i=0; i<7; i++)
	{
		for(j=0; j<6; j++)
		{
			block = &g_Tracks[game.track].tiles[i + j * 7];
			if((block->tile & 0x0F) == 2) // Plein block
			{
				FillVRAM(g_Tracks[game.track].offset.x + (32 * i), g_Tracks[game.track].offset.y + (32 * j), 32, 32, block->color1);
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
						byte = g_TrackTiles[((block->tile & 0x0F) << 7) + (lx >> 3) + (ly << 2)];
						if(byte & (1 << (7 - (lx & 0x07))))
							game.blockGen[x + (y << 5)] = block->color1;
						else
							game.blockGen[x + (y << 5)] = block->color0;
					}
				}
				HMMC(g_Tracks[game.track].offset.x + (i << 5), g_Tracks[game.track].offset.y + (j << 5), 32, 32, (u16)&game.blockGen);
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

void DebugPrintInt(i16 i, u8 x, u8 y)
{
	SetSpriteUniColor(0, x + 0 * 8, y, (i / 100000) % 10, 0x0F);
	SetSpriteUniColor(1, x + 1 * 8, y, (i / 10000) % 10, 0x0F);
	SetSpriteUniColor(2, x + 2 * 8, y, (i / 1000) % 10, 0x0F);
	SetSpriteUniColor(3, x + 3 * 8, y, (i / 100) % 10, 0x0F);
	SetSpriteUniColor(4, x + 4 * 8, y, (i / 10) % 10, 0x0F);
	SetSpriteUniColor(5, x + 5 * 8, y, i % 10, 0x0F);
	SetSpriteUniColor(6, 0, 216, 0, 0);
}

//----------------------------------------
// MENU CALLBACKS

/** Menu callback - Start game */
void StartGame(i8 value)
{
	game.track = value;
	game.state = StateStartGame;
}

/** Menu callback - Select player number */
void SelectPlayer(i8 value)
{
	game.playerNum = value;
}

/** Menu callback - Select game mode */
void SelectRule(i8 value)
{
	game.rule = value;
}


