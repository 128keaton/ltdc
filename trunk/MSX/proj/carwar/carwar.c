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
#define COLOR_LIGHTBLUE	75
#define COLOR_BLUE		3
#define COLOR_GRAY		146
#define COLOR_ORANGE	93
#define COLOR_YELLOW	144
#define COLOR_WHITE     255

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
	OP_NONE = 0,
	OP_WALL,
	OP_BLADE,
	OP_ROCK,
	OP_BUMPER,

	OP_ROAD = 64,
	OP_MUD,
	OP_SAND,
	OP_GRASS,
	OP_SNOW,
	OP_ICE,
	OP_WATER,
	OP_SEA,
	OP_JUMPER,
	OP_SPEEDER,
	OP_HOLE,
	OP_MAGMA,
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
	u8 maxSpeed;
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
	u8 width;
	u8 height;
	TrackTile* tiles;
	struct tagVectorU8 startPos[4];
} Track;

typedef struct tagMenuEntry
{
	const char* text;
	u8 nextIdx;
	void (*action)(void);
} MenuEntry;

typedef struct tagMenu
{
	const char* title;
	const char* tips;
	struct tagMenuEntry* items;
	u8 itemNum;
} Menu;

typedef struct tagPlayer
{
	u16 posX;  // position X
	u16 posY;  // position Y
	u16 prevX; // previous position X
	u16 prevY; // previous position Y
	i16 velX;    // velocity X
	i16 velY;    // velocity Y
	u8 car;    // car index
	u8 flag;   // move flag
	u8 rot;    // rotation
} Player;

typedef struct
{
	u8               menu;
	u8               item;
	u8               pressed;
	u8               rule;
	u8               page;
	u16              yOffset;
	u8               colorCode[256];
	struct tagPlayer players[4];
	void            (*state)(void);
	u8               bitToByte[256 * 8];
	VdpBuffer32      vdp32;
	VdpBuffer36      vdp36;
} GameData;


//----------------------------------------
// M A C R O S

#define PosToPxl(a) (a >> 8)
#define PosXToSprt(a) (PosToPxl(a) - 6)
#define PosYToSprt(a) (PosToPxl(a) - 5)

#define HMMC(dx, dy, nx, ny, ram)     game.vdp36.DX = dx; game.vdp36.DY = dy; game.vdp36.NX = nx; game.vdp36.NY = ny; game.vdp36.CLR = ((u8*)ram)[0]; game.vdp36.ARG = 0; game.vdp36.CMD = VDP_CMD_HMMC;                             VPDCommand36((u16)&game.vdp36); VPDCommandLoop(ram);
#define HMMM(sx, sy, dx, dy, nx, ny)  game.vdp32.SX = sx; game.vdp32.SY = sy; game.vdp32.DX = dx; game.vdp32.DY = dy; game.vdp32.NX = nx; game.vdp32.NY = ny; game.vdp32.CLR = 0; game.vdp32.ARG = 0; game.vdp32.CMD = VDP_CMD_HMMM; VPDCommand32((u16)&game.vdp32);
#define HMMV(dx, dy, nx, ny, col)     game.vdp36.DX = dx; game.vdp36.DY = dy; game.vdp36.NX = nx; game.vdp36.NY = ny; game.vdp36.CLR = col; game.vdp36.ARG = 0; game.vdp36.CMD = VDP_CMD_HMMV;                                       VPDCommand36((u16)&game.vdp36);
#define LMMC(dx, dy, nx, ny, ram, op) game.vdp36.DX = dx; game.vdp36.DY = dy; game.vdp36.NX = nx; game.vdp36.NY = ny; game.vdp36.CLR = ((u8*)ram)[0]; game.vdp36.ARG = 0; game.vdp36.CMD = VDP_CMD_LMMC + op;                        VPDCommand36((u16)&game.vdp36); VPDCommandLoop(ram);

#define Abs8(i)  (((u8)i & 0x80) ? ~((u8)i - 1) : i)
#define Abs16(i) (((u16)i & 0x8000) ? ~((u16)i - 1) : i)

//----------------------------------------
// P R O T O T Y P E S

void MainLoop();
void InitializePlayer(Player* ply, u8 car, u8 posX, u8 posY);
void InitializeMenu(u8 menu);
void CheckCollision(u8 idx, u8 car1, u8 car2);
i8 AngleDifferent64(i8 angleA, i8 angleB);
//u8 VectorToAngle64(i16 x, i16 y);
u8 VectorToAngle256(i16 x, i16 y);
u16 GetVectorLenght(i16 x, i16 y);

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
void StartGame();

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

#include "trigo256.inc"
#include "rot256.inc"
#include "sqrt1024.inc"

const u8 defaultColor[] = { 0x01, 0x01, 0x09, 0x0d, 0x0d, 0x09, 0x01, 0x01 };

// rotSpeed, maxSpeed, accel
const Car cars[CAR_NUM] = 
{
	// Cop
	{ 5, 20, 4 },
	//
	{ 4, 30, 4 },
	// Ferrari
	{ 4, 25, 4 },
	// Turtule
	{ 6, 15, 4 },
};

const TrackTile trackTiles01[] = 
{
	// line 0
	{ 0 + ROT_0, COLOR_LIGHTBLUE, COLOR_GRAY },
	{ 2 + ROT_0, COLOR_LIGHTBLUE, COLOR_GRAY },
	{ 2 + ROT_0, COLOR_LIGHTBLUE, COLOR_GRAY },
	{ 0 + ROT_90, COLOR_LIGHTBLUE, COLOR_GRAY },
	{ 0 + ROT_0, COLOR_LIGHTBLUE, COLOR_GRAY },
	{ 2 + ROT_0, COLOR_LIGHTBLUE, COLOR_GRAY },
	{ 0 + ROT_90, COLOR_LIGHTBLUE, COLOR_GRAY },
	// line 1
	{ 2 + ROT_0, COLOR_LIGHTBLUE, COLOR_GRAY },
	{ 1 + ROT_0, COLOR_GRAY, COLOR_LIGHTBLUE },
	{ 2 + ROT_0, COLOR_GRAY, COLOR_LIGHTBLUE },
	{ 0 + ROT_270, COLOR_LIGHTBLUE, COLOR_GRAY },
	{ 0 + ROT_180, COLOR_LIGHTBLUE, COLOR_GRAY },
	{ 1 + ROT_90, COLOR_GRAY, COLOR_LIGHTBLUE },
	{ 2 + ROT_0, COLOR_LIGHTBLUE, COLOR_GRAY },
	// line 2
	{ 3 + ROT_0, COLOR_WHITE, COLOR_GRAY },
	{ 2 + ROT_0, COLOR_GRAY, COLOR_LIGHTBLUE },
	{ 2 + ROT_0, COLOR_GRAY, COLOR_LIGHTBLUE },
	{ 2 + ROT_0, COLOR_GRAY, COLOR_LIGHTBLUE },
	{ 2 + ROT_0, COLOR_GRAY, COLOR_LIGHTBLUE },
	{ 2 + ROT_0, COLOR_GRAY, COLOR_LIGHTBLUE },
	{ 9 + ROT_90, COLOR_YELLOW, COLOR_GRAY },
	// line 3
	{ 2 + ROT_0, COLOR_LIGHTBLUE, COLOR_GRAY },
	{ 2 + ROT_0, COLOR_GRAY, COLOR_LIGHTBLUE },
	{ 2 + ROT_0, COLOR_GRAY, COLOR_LIGHTBLUE },
	{ 2 + ROT_0, COLOR_GRAY, COLOR_LIGHTBLUE },
	{ 2 + ROT_0, COLOR_GRAY, COLOR_LIGHTBLUE },
	{ 1 + ROT_0, COLOR_LIGHTBLUE, COLOR_YELLOW },
	{ 2 + ROT_0, COLOR_LIGHTBLUE, COLOR_YELLOW },
	// line 4
	{ 2 + ROT_0, COLOR_LIGHTBLUE, COLOR_GRAY },
	{ 0 + ROT_0, COLOR_LIGHTBLUE, COLOR_GRAY },
	{ 2 + ROT_0, COLOR_LIGHTBLUE, COLOR_GRAY },
	{ 2 + ROT_0, COLOR_GRAY, COLOR_LIGHTBLUE },
	{ 11 + ROT_270, COLOR_ORANGE, COLOR_YELLOW },
	{ 4 + ROT_0, COLOR_LIGHTBLUE, COLOR_YELLOW },
	{ 2 + ROT_0, COLOR_LIGHTBLUE, COLOR_YELLOW },
	// line 5
	{ 0 + ROT_270, COLOR_LIGHTBLUE, COLOR_GRAY },
	{ 2 + ROT_0, COLOR_LIGHTBLUE, COLOR_GRAY },
	{ 1 + ROT_0, COLOR_GRAY, COLOR_LIGHTBLUE },
	{ 2 + ROT_0, COLOR_GRAY, COLOR_LIGHTBLUE },
	{ 1 + ROT_90, COLOR_YELLOW, COLOR_LIGHTBLUE },
	{ 2 + ROT_0, COLOR_LIGHTBLUE, COLOR_YELLOW },
	{ 0 + ROT_180, COLOR_LIGHTBLUE, COLOR_YELLOW },
};

const Track track01 = { 7, 6, trackTiles01, { { 25, 100 }, { 40, 100 }, { 25, 120 }, { 40, 120 } } };

// Menu 0
const MenuEntry menuMain[] =
{
	{ "PLAY",     3, 0 },
	{ "EDITOR",   ITEM_INVALID, 0 },
	{ "OPTIONS",  ITEM_INVALID, 0 },
	{ "CREDITS",  ITEM_INVALID, 0 },
};

// Menu 1
const MenuEntry menuMode[] =
{

	{ "RACE",     2, 0 },
	{ "SURVIVOR", 2, 0 },
	{ "TAG",      2, 0 },
	{ "SOCCER",   2, 0 },
	{ "BACK",     3, 0 },
};

// Menu 2
const MenuEntry menuTrack[] =
{
	{ "FROM ROM",  ITEM_ACTION, StartGame },
	{ "FROM DISK", ITEM_INVALID, 0 },
	{ "BACK",      1, 0 },
};

// Menu 3
const MenuEntry menuPlayer[] =
{
	{ "2 PLAYERS", 1, 0 },
	{ "3 PLAYERS", 1, 0 },
	{ "4 PLAYERS", 1, 0 },
	{ "BACK",      0, 0 },
};

const Menu menus[] =
{
	{ "",              "PRESS SPACE", menuMain,   numberof(menuMain) },
	{ "GAME MODE",     "PRESS SPACE", menuMode,   numberof(menuMode) },
	{ "TRACK SELECT",  "PRESS SPACE", menuTrack,  numberof(menuTrack) },
	{ "PLAYER SELECT", "PRESS SPACE", menuPlayer, numberof(menuPlayer) },
};

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
	game.colorCode[COLOR_BLACK]     = OP_HOLE;
	game.colorCode[COLOR_LIGHTBLUE] = OP_WALL;
	game.colorCode[COLOR_GRAY]      = OP_ROAD;
	game.colorCode[COLOR_ORANGE]    = OP_JUMPER;
	game.colorCode[COLOR_YELLOW]    = OP_SAND;
	game.colorCode[COLOR_WHITE]     = OP_ROAD;
	game.colorCode[DarkenColor(COLOR_BLACK, SHADOW_POWER)]     = OP_HOLE;
	game.colorCode[DarkenColor(COLOR_LIGHTBLUE, SHADOW_POWER)] = OP_WALL;
	game.colorCode[DarkenColor(COLOR_GRAY, SHADOW_POWER)]      = OP_ROAD;
	game.colorCode[DarkenColor(COLOR_ORANGE, SHADOW_POWER)]    = OP_JUMPER;
	game.colorCode[DarkenColor(COLOR_YELLOW, SHADOW_POWER)]    = OP_SAND;
	game.colorCode[DarkenColor(COLOR_WHITE, SHADOW_POWER)]     = OP_ROAD;

	// Initialize (ASCII table) sprites
	for(x=0; x<sizeof(charTable)/8; x++)
	{
		RAMtoVRAM((x * 8) % 256, 248 + (x / 32), 8, 1, (u16)&charTable[x * 8]);
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
	
	game.page = 0;
	//game.state = StateTitle;
	game.state = StateStartGame;
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
	
	DrawText(MENU_X, MENU_Y, menus[game.menu].title, COLOR_WHITE);
	for(item = 0; item < menus[game.menu].itemNum; item++)
	{
		DrawText(MENU_X + 12, MENU_Y + TITLE_SPACE + LINE_SPACE * item, menus[game.menu].items[item].text, menus[game.menu].items[item].nextIdx == ITEM_INVALID ? COLOR_GRAY : COLOR_WHITE);
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
			byte = title[(i / 8) + (j * 232 / 8)];
			if(byte & (1 << (7 - (i & 0x07))))
			{
				WriteVRAM(0, TITLE_X + i + 256 * (TITLE_Y + j), GrayGradiant(i + j));
			}
		}
		// Copy title to both screen
		VRAMtoVRAM(TITLE_X, TITLE_Y + j, TITLE_X, TITLE_Y + 256 + j, 232, 1);
	}

	InitializeMenu(0);
	game.pressed = 0;
	game.page = 0;
	game.state = StateMainMenu;
}

/** Menu callback - Start game */
void StartGame()
{
	game.state = StateStartGame;
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
		if(menus[game.menu].items[game.item].action != 0)
			menus[game.menu].items[game.item].action();
		if((menus[game.menu].items[game.item].nextIdx & 0x80) == 0)
			InitializeMenu(menus[game.menu].items[game.item].nextIdx);
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
	else if(((keyLine & KEY_DOWN) == 0) && (game.item < menus[game.menu].itemNum - 1))
	{
		if(game.pressed == 0)
			game.item++;
		game.pressed++;
	}
	else
		game.pressed = 0;

	// Render
	HMMV(MENU_X, MENU_Y + TITLE_SPACE + game.yOffset, 8, LINE_SPACE * menus[game.menu].itemNum, COLOR_BLACK);
	DrawText(MENU_X, MENU_Y + TITLE_SPACE + game.yOffset + (LINE_SPACE * game.item), "@", COLOR_WHITE);
	waitRetrace();
}

/** State - Start game */
void StateStartGame()
{
	u8 i;

	game.page = 0;
	SetPage8(game.page);

	//----------------------------------------
	// Build background
	//StateBuildTrack();
	//StateShadeTrack();
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
		InitializePlayer(&game.players[i], i, track01.startPos[i].x, track01.startPos[i].y);
		VRAMtoVRAM(PosXToSprt(game.players[i].posX), (256 * 0) + PosYToSprt(game.players[i].posY), (13 * i) + (52 * 0), 212, 13, 11);
		VRAMtoVRAM(PosXToSprt(game.players[i].posX), (256 * 1) + PosYToSprt(game.players[i].posY), (13 * i) + (52 * 1), 212, 13, 11);
	}

	ClearSprite();
	for(i=0; i<32; i++)
		SetSpriteUniColor(i, 0, 248, 0, 0);

	game.state = StateUpdateGame;
}

/** State - Process game */
void StateUpdateGame()
{
	u8 i, keyLine, dir;
	Player* curPly;
	u16 x, y, speed, speedSq;

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
		VRAMtoVRAM((13 * i) + (52 * game.page), 212, PosXToSprt(game.players[i].prevX), game.yOffset + PosYToSprt(game.players[i].prevY), 13, 11);
	}

	//----------------------------------------
	// Update physic
	for(i=0; i<CAR_NUM; i++)
	{
		curPly = &game.players[i];

		// Friction
#define FRICTION (2)
		x = Abs16(curPly->velX);
		x >>= 8;
		y = Abs16(curPly->velY);
		y >>= 8;
		speedSq = (x * x) + (y * y);
		if(speedSq <= (FRICTION * FRICTION))
		{
			curPly->velX = 0;
			curPly->velY = 0;
		}
		else
		{
			dir = VectorToAngle256(curPly->velX, curPly->velY);
			curPly->velX -= FRICTION * g_Cosinus256[dir];
			curPly->velY -= FRICTION * g_Sinus256[dir];
		}

		// Transfert some part of velocity to car direction
#define TRANSFERT (4)
		x = Abs16(curPly->velX);
		x >>= 8;
		y = Abs16(curPly->velY);
		y >>= 8;
		speed = GetVectorLenght(x, y);
		if(speed <= TRANSFERT)
		{
			curPly->velX = 0;
			curPly->velY = 0;
		}
		else
		{
			speed = TRANSFERT;
			dir = VectorToAngle256(curPly->velX, curPly->velY);
			curPly->velX -= TRANSFERT * g_Cosinus256[dir];
			curPly->velY -= TRANSFERT * g_Sinus256[dir];
		}

		// Engine velocity
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
			speed += cars[curPly->car].accel;
		}
		curPly->velX += speed * g_Cosinus256[curPly->rot];
		curPly->velY += speed * g_Sinus256[curPly->rot];

		// Cap max speed
		x = Abs16(curPly->velX);
		x >>= 8;
		y = Abs16(curPly->velY);
		y >>= 8;
		speedSq = (x * x) + (y * y);
		if(speedSq > cars[curPly->car].maxSpeed * cars[curPly->car].maxSpeed)
		{
			dir = VectorToAngle256(curPly->velX, curPly->velY);
			curPly->velX = cars[curPly->car].maxSpeed * g_Cosinus256[dir];
			curPly->velY = cars[curPly->car].maxSpeed * g_Sinus256[dir];
		}
	}

	// Check collision
	// 2 players
	CheckCollision(0, 0, 1);
	// 3 players
	CheckCollision(1, 0, 2);
	CheckCollision(2, 1, 2);
	// 4 players
	CheckCollision(3, 0, 3);
	CheckCollision(4, 1, 3);
	CheckCollision(5, 2, 3);

	// Fix position
	for(i=0; i<CAR_NUM; i++)
	{
		curPly = &game.players[i];

		// Apply velocity
		curPly->prevX = curPly->posX;
		curPly->prevY = curPly->posY;
		curPly->posX += curPly->velX / 8;
		curPly->posY -= curPly->velY / 8;

		if(curPly->posY < (5 << 8))
			curPly->posY = (5 << 8);
		else if(curPly->posY > (206 << 8))
			curPly->posY = (206 << 8);

		// Backup
		VRAMtoVRAM(PosXToSprt(curPly->posX), game.yOffset + PosYToSprt(curPly->posY), (13 * i) + (52 * game.page), 212, 13, 11);
	}

	//----------------------------------------
	// Draw cars
	for(i=0; i<CAR_NUM; i++)
	{
		VRAMtoVRAMTrans(13 * (game.players[i].rot / 16), 256 + 212 + (11 * i), PosXToSprt(game.players[i].posX), game.yOffset + PosYToSprt(game.players[i].posY), 13, 11);
	}
		
	waitRetrace();
}

/** Initialize player data */
void InitializePlayer(Player* ply, u8 car, u8 posX, u8 posY)
{
	ply->car = car; // car index
	ply->posX = posX << 8; // position X
	ply->posY = posY << 8; // position Y
	ply->prevX = ply->posX; // previous position X
	ply->prevY = ply->posY; // previous position Y
	ply->rot = 64; // rotation
	ply->velX = 0; // velocity X
	ply->velY = 0; // velocity Y
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
u16 GetVectorLenght(i16 x, i16 y)
{
	u16 lenSq, ret;
	u8 div;

	div = 1;
	lenSq = x*x + y*y; // get squared length
	while(lenSq >= 1024)
	{
		lenSq /= 2;
		div *= 2;
	}
	div = g_SquareRoot1024[div] >> 3; // squared-root the div factor
	ret = g_SquareRoot1024[lenSq] >> 3; // get square root (.2^3)
	return ret * div; // get length
}

/** Check collision */
void CheckCollision(u8 idx, u8 car1, u8 car2)
{
	i16 x1, y1, x2, y2, dist;

	dist = game.players[car2].posX - game.players[car1].posX;
	x1 = dist >> 8;
	dist = game.players[car2].posY - game.players[car1].posY;
	y1 = dist >> 8;
	dist = (x1 * x1) + (y1 * y1);
	if(dist < 11 * 11) // Collision occured
	{
		//SetSpriteUniColor(idx, 
		//	(game.players[car1].posX >> 8) + (x1 >> 1) - 4, 
		//	(game.players[car1].posY >> 8) + (y1 >> 1) - 4, 
		//	'X' - '0', 0x0F);

		x1 = game.players[car1].velX;
		y1 = game.players[car1].velY;
		x2 = game.players[car2].velX;
		y2 = game.players[car2].velY;

		game.players[car1].velX = x2 - x1;
		game.players[car1].velY = y2 - y1;
		game.players[car2].velX = x1 - x2;
		game.players[car2].velY = y1 - y2;

		//game.players[car1].posX = game.players[car1].prevX;
		//game.players[car2].posY = game.players[car2].prevY;
	}
}

/***/
void StateBuildTrack()
{
	u8 i, j, byte;
	u16 x, y, lx, ly;
	const TrackTile* block;

	PrintSprite(64, 64, "BUILD\nTRACK", (u16)&defaultColor);

	FillVRAM(0, 0, 128, 212, COLOR_LIGHTBLUE);
	FillVRAM(128, 0, 128, 212, COLOR_LIGHTBLUE);
	for(i=0; i<7; i++)
	{
		for(j=0; j<6; j++)
		{
			block = &track01.tiles[i + j * 7];
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
							WriteVRAM(0, (16 + 32 * i + x) + 256 * (8 + 32 * j + y), block->color1);
						else
							WriteVRAM(0, (16 + 32 * i + x) + 256 * (8 + 32 * j + y), block->color0);
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
			if(game.colorCode[cur] < OP_ROAD && game.colorCode[next] >= OP_ROAD)
			{
				for(i=0; i<BLOCK_SHADOW; i++)
				{
					cur = ReadVRAM(x + 256 * (y - i));
					if((y - i < 212) && (game.colorCode[cur] < OP_ROAD))
						WriteVRAM(0, x + 256 * (y - i), DarkenColor(cur, SHADOW_POWER));
					else
						break;
				}
				for(i=1; i<=ROAD_SHADOW; i++)
				{
					cur = ReadVRAM(x + 256 * (y + i));
					if((y + i < 212) && (game.colorCode[cur] >= OP_ROAD))
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
	col /= 2; // 0:8
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
		LMMC(x, y + j, 8, 1, (u16)&game.bitToByte[charTable[chr * 8 + j] * 8], VDP_OP_AND);
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