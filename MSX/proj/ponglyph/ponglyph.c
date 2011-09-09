/* PONGLYPH */
#include "core.h"
#include "bios.h"
#include "video.h"

//-----------------------------------------------------------------------------
// D E F I N E S

// Menu layout
#define TITLE_X				16
#define TITLE_Y				32
#define MENU_X				24
#define MENU_Y				100
#define LINE_SPACE			10
#define TITLE_SPACE			16

#define ITEM_INVALID		(0x80 + 0)
#define ITEM_ACTION			(0x80 + 1)
#define ITEM_VARIABLE		(0x80 + 2)
#define ITEM_DUMMY			(0x80 + 3)

#define CENTER_X	(F10_SET(255) >> 1) // 127.5
#define CENTER_Y	(F10_SET(211) >> 1) // 105.5

#define OP_DRAW		1
#define OP_CLEAR	0

//-----------------------------------------------------------------------------
// M A C R O S

#define Cosinus(a) g_Sinus64[Modulo2((a + 16), 64)]
#define Sinus(a) g_Sinus64[a]

// Float 2.14
typedef i16 float2;
#define F1_SET(a)			((a) << 14)
#define F1_GET(a)			((a) >> 14)
#define F1_MUL(a, b)		(((a) >> 7) * ((b) >> 7))
#define F1_MUL_TINY(a, b)	((((a) >> 7) * (b)) >> 7)

// Float 8.8
typedef i16 float8;
#define F8_SET(a)			((a) << 8)
#define F8_GET(a)			((a) >> 8)
#define F8_MUL(a, b)		(((a) >> 4) * ((b) >> 4))
#define F8_MUL_TINY(a, b)	((((a) >> 4) * (b)) >> 4)

// Float 10.6
typedef i16 float10;
#define F10_SET(a)			((a) << 6)
#define F10_GET(a)			((a) >> 6)
#define F10_MUL(a, b)		(((a) >> 3) * ((b) >> 3))
#define F10_MUL_TINY(a, b)	((((a) >> 2) * ((b) >> 2)) >> 2)

#define VEC_ZERO(vec) { vec.x = 0; vec.y = 0; vec.z = 0; }
#define VEC_SET(vec, a, b, c) { vec.x = a; vec.y = b; vec.z = c; }
#define VEC_ADD(vec1, vec2) { vec1.x += vec2.x; vec1.y += vec2.y; vec1.z += vec2.z; }
#define VEC_SUB(vec1, vec2) { vec1.x -= vec2.x; vec1.y -= vec2.y; vec1.z -= vec2.z; }

//-----------------------------------------------------------------------------
// T Y P E S

typedef struct tagVectorU8
{
	u8 x, y;
} VectorU8;

typedef struct tagVectorI8
{
	i8 x, y;
} VectorI8;

typedef struct tagVectorU16
{
	u16 x, y;
} VectorU16;

typedef struct tagVectorI16
{
	i16 x, y;
} VectorI16;

typedef struct tagVector3D
{
	i16 x, y, z;
} Vector3D;

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

typedef struct tagPlayerData
{
	u8			score;
	Vector3D	position;
	float10		angle;
} PlayerData;

typedef struct tagGameData
{
	// System
	u8               frame;
	u8               page;
	u16              yOffset;
	void            (*state)(void);
	// Menu
	u8               menu;
	u8               item;
	u8               pressed;
	// WorkArea
	u8               bitToByte[256 * 8];
	i16              projZ[512];
	// 3d Settings
	u8               bAnaglyph;
	u8               power3d;
	// Gameplay
	i16              plyDepth;
	PlayerData       players[2];
	Vector3D         ballPos;
} GameData;

//-----------------------------------------------------------------------------
// P R O T O T Y P E S

void MainLoop();
void InitializeMenu(u8 menu);
void ResetMenu();

void DrawCharacter(u16 x, u16 y, u8 chr, u8 color);
void DrawText(u16 x, u16 y, const char* text, u8 color);
void DrawBackground();

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

// 3D
void ProjectPoint(const Vector3D* v3d, VectorU8* v2d);
u8   ProjectLenght(i16 length, i16 z);

void DrawLine3D(const Vector3D* vec1, const Vector3D* vec2, u8 bDraw);
void DrawLineH(const Vector3D* vec, i16 width, u8 bDraw);
void DrawSquare(const Vector3D* center, i16 size);
//void ClearSquare(const Vector3D* center, i16 size);

//-----------------------------------------------------------------------------
// R O M   D A T A

#include "data/sprt_alpha.h"

#include "trigo64.inc"
#include "rot256.inc"
#include "sqrt256.inc"
#include "projZ512.inc"

//-----------------------------------------------------------------------------
// Menu 0
const MenuEntry g_MenuMain[] =
{
	{ "PLAY",     1, 0, 0 },
	//{ "EDITOR",   ITEM_INVALID, 0, 0 },
	{ "CREDITS",  4, 0, 0 },
};

// Menu 1
const MenuEntry g_MenuMode[] =
{
	{ "SELECT TRACK", 3, 0, 0 },
	{ "TYPE",         ITEM_INVALID, 0, 0 },
	{ "PLAYERS",      ITEM_INVALID, 0, 0 },
	{ "",             ITEM_DUMMY, 0, 0 },
	{ "<BACK",        0, 0, 0 },
};

// Menu 3
const MenuEntry g_MenuTrackSelect[] =	
{
	{ "START GAME", ITEM_ACTION, StartGame, 0 },
	{ "TRACK",      ITEM_INVALID, 0, 0 },
	{ "SHADE",      ITEM_INVALID, 0, 0 },
	{ "",           ITEM_DUMMY, 0, 0 },
	{ "<BACK",      1, 0, 0 },
};

// Menu 4
const MenuEntry g_MenuCredits[] =
{
	{ "CODE:  AOINEKO", ITEM_DUMMY, 0, 0 },
	{ "GRAPH: SENSOKAN,AOINEKO", ITEM_DUMMY, 0, 0 },
	//{ "MUSIC: MAKOTO,NOE", ITEM_DUMMY, 0, 0 },
	{ "TRACK: AOINEKO,NOE", ITEM_DUMMY, 0, 0 },
	{ "", ITEM_DUMMY, 0, 0 },
	{ "THANKS TO ALL MSX VILLAGE", ITEM_DUMMY, 0, 0 },
	{ "MEMBERS FOR SUPPORT!", ITEM_DUMMY, 0, 0 },
	{ "", ITEM_DUMMY, 0, 0 },
	{ "<BACK", 0, 0, 0 },
};

const Menu g_Menus[] =
{
	{ "MAIN MENU",     0, g_MenuMain,        numberof(g_MenuMain) },
	{ "GAME MODE",     0, g_MenuMode,        numberof(g_MenuMode) },
	{ "TRACK SELECT",  0, 0/*g_MenuTrackSource*/, 0/*numberof(g_MenuTrackSource)*/ },
	{ "TRACK SELECT",  0, g_MenuTrackSelect, numberof(g_MenuTrackSelect) },
	{ "CREDITS",       0, g_MenuCredits,     numberof(g_MenuCredits) },
};

const u8 g_DefaultColor[] = { 0x02, 0x0A, 0x0A, 0x0E, 0x0E, 0x0A, 0x0A, 0x02 };
 
//-----------------------------------------------------------------------------
// R A M   D A T A

// Game data
extern VDP vdp;
GameData __at(0xC000+sizeof(VDP)) game;
u8* __at(0xC000+sizeof(VDP)+sizeof(GameData)) freeRam;

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
//#if 1
//	__asm
//		di
//		call	#0x0138 ;// RSLREG: Lit l'état courant du registre du slot primaire.
//		rrca
//		rrca
//		and		#3
//		ld		c, a
//		ld		b, #0
//		ld		hl, #0xFCC1
//		add		hl, bc
//		or		(hl)
//		ld		c, a
//		inc		hl
//		inc		hl
//		inc		hl
//		inc		hl
//		ld		a, (hl)
//		and		#0x0C
//		or		c
//		;//ld		(#0xC399),a
//		ld		h, a
//		ld		l, #0xF7
//		ld		(#0xFEDA), hl
//		ld		hl, #game_entry_point
//		ld		(#0xFEDC), hl
//		ld		a, #0xC9
//		ld		(#0xFEDE), a
//		ret
//	game_entry_point:
//		di
//		ld		b, #5 ;// delete hook
//		ld		a, #0xC9
//		ld		hl, #0xFEDA ;// HSTKE
//	del_hook:
//		ld		(hl), a
//		inc		hl
//		djnz	del_hook
//		;// Check if disk found
//		ld		a, (#0xFFA7)		              ;// checks if there is any diskrom (HPHYD)
//		cp		#0xC9
//		jr		z, return_clear
//		;// comprueba version de DOS y guarda
//		ld		c, #0x6F ;// _DOSVER_
//		call	#0xF37D ;// BDOS: Send DOSVER command to dos
//		ld		a, b
//		inc		a
//		;//ld		(DOSFOUND),a		;// Save dos version
//		;//call	InitDskError		;// Initialices Disk Error routines (mail me if you need them)
//		jp		game_start
//	return_clear:
//		xor		a
//		;//ld		(DOSFOUND),a
//		jp		game_start
//	game_start:
//		ld		hl, #_freeRam
//		ld		(#0xF6C6), hl ;// Fin de la zone des variables = 0C000h
//
//;//		ld		c, #0x1A
//;//		ld		de, #freeRam
//;//		call	#0xF37D
//;//		ld		c, #0x1B
//;//		ld		e, #0
//;//		call	#0xF37D
//;//		ld		c, #0x57
//;//		call	#0xF37D
//	__endasm;
//#endif

	__asm
	;game_entry_point:
		di
		;//ld		sp, (#0xFC4A)
		ld		sp, #0xE000
		ei
	__endasm;

	g_slotPort = (g_slotPort & 0xCF) | ((g_slotPort & 0x0C) << 2); // Set Page 2 slot the same as Page 1 ()

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
	u16 x;
	u8 i;

	// Init
	VideoInitialize();
	SetFreq(FREQ_60);
	SetScreen8(LINES_212);
	SetSpriteMode(SPRITE_ON, SPRITE_NO_MAG + SPRITE_SIZE_8, 0xF800 >> 11, 0xF700 >> 7);
	SetScreenColor(0, 0, COLOR8_BLACK);

	// Clear all VRAM
	ClearScreen8(COLOR8_BLACK);

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

	// Create 3D projection table
	for(x=0; x<512; x++)
	{
		game.projZ[x] = (512 - x) >> 3; // (512 - x) << 6 / 512
	}
	game.bAnaglyph = TRUE;
	game.power3d = 16;

	game.page = 0;
	game.state = StateTitle;
}

/** Initialize a given menu */
void InitializeMenu(u8 menu)
{
	u8 item;
	game.menu = menu;
	game.item = 0;
	while(game.item < g_Menus[game.menu].itemNum)
	{
		if(g_Menus[game.menu].items[game.item].nextIdx != ITEM_DUMMY)
			break;
		game.item++;
	}

	game.page = 1;
	SetPage8(game.page);

	FillVRAM(MENU_X, MENU_Y, 256 - MENU_X, 212 - MENU_Y, COLOR8_BLACK);
	
	DrawText(MENU_X, MENU_Y, g_Menus[game.menu].title, COLOR8_WHITE);
	for(item = 0; item < g_Menus[game.menu].itemNum; item++)
	{
		DrawText(MENU_X + 12, MENU_Y + TITLE_SPACE + LINE_SPACE * item, g_Menus[game.menu].items[item].text, g_Menus[game.menu].items[item].nextIdx == ITEM_INVALID ? COLOR8_GRAY : COLOR8_WHITE);
		if(g_Menus[game.menu].items[item].nextIdx == ITEM_VARIABLE)
			DrawText(MENU_X + 12 + 80, MENU_Y + TITLE_SPACE + LINE_SPACE * item, g_Menus[game.menu].items[item].action(ACTION_GET,0), COLOR8_WHITE);
	}

	VRAMtoVRAM(MENU_X, MENU_Y, MENU_X, MENU_Y + 256, 256 - MENU_X, 212 - MENU_Y);
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
	// Hide working screen (0)
	SetPage8(1);
	ClearScreen8(COLOR8_BLACK);

	// Build title
	DrawText(150, 64,       "PHENIX 2011", COLOR8_GRAY);
	DrawText(150, 64 + 256, "PHENIX 2011", COLOR8_GRAY);

	InitializeMenu(0);
	game.pressed = 0;
	game.page = 0;
	game.state = StateMainMenu;
}

/** State - Process main menu */
void StateMainMenu()
{
	u8 keyLine, i;

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
		{
			i = game.item;
			while(i > 0)
			{
				i--;
				if(g_Menus[game.menu].items[i].nextIdx != ITEM_DUMMY)
				{
					game.item = i;
					break;
				}
			}			
		}
		game.pressed++;
	}
	else if(((keyLine & KEY_DOWN) == 0) && (game.item < g_Menus[game.menu].itemNum - 1))
	{
		if(game.pressed == 0)
		{
			i = game.item;
			while(i < g_Menus[game.menu].itemNum)
			{
				i++;
				if(g_Menus[game.menu].items[i].nextIdx != ITEM_DUMMY)
				{
					game.item = i;
					break;
				}
			}
		}
		game.pressed++;
	}
	else
		game.pressed = 0;

	// Render
	FillVRAM(MENU_X, MENU_Y + TITLE_SPACE + game.yOffset, 8, LINE_SPACE * g_Menus[game.menu].itemNum, COLOR8_BLACK);
	DrawText(MENU_X, MENU_Y + TITLE_SPACE + game.yOffset + (LINE_SPACE * game.item), "@", COLOR8_WHITE);
	WaitRetrace();
}


//=============================================================================
//
//   M A I N   L O O P   -   S T A R T
//
//=============================================================================

/** State - Start game */
void StateStartGame()
{
	game.page = 0;
	SetPage8(game.page);

	SetScreenColor(0, 0, COLOR8_WHITE);
	//FillVRAM(0,   0, 256, 212, COLOR8_BLACK);
	//FillVRAM(0, 256, 256, 212, COLOR8_BLACK);
	ClearScreen8(COLOR8_WHITE);

	/* ... */
	DrawBackground();

	game.plyDepth = 0;

	game.players[0].score = 0;
	VEC_SET(game.players[0].position, F10_SET(50), F10_SET(50), F10_SET(0));
	game.players[0].angle = 0;

	game.players[1].score = 0;
	VEC_SET(game.players[1].position, F10_SET(-50), F10_SET(-50), F10_SET(256));
	game.players[1].angle = 0;

#define PLAYER_SIZE 20

	DrawSquare(&game.players[0].position, PLAYER_SIZE);
	DrawSquare(&game.players[1].position, PLAYER_SIZE);

	game.state = StateUpdateGame;
}

void DrawBackground()
{
	Vector3D vec1, vec2;
	i16 z;

#define FIELD_WIDTH		120
#define FIELD_HEIGHT	105
#define FIELD_DEPTH		256

	// Front
	VEC_SET(vec1, F10_SET(-FIELD_WIDTH), F10_SET(FIELD_HEIGHT), 0);
	VEC_SET(vec2, F10_SET(FIELD_WIDTH), F10_SET(FIELD_HEIGHT), 0);
	DrawLine3D(&vec1, &vec2, OP_DRAW);
	VEC_SET(vec1, F10_SET(FIELD_WIDTH), F10_SET(FIELD_HEIGHT), 0);
	VEC_SET(vec2, F10_SET(FIELD_WIDTH), F10_SET(-FIELD_HEIGHT), 0);
	DrawLine3D(&vec1, &vec2, OP_DRAW);
	VEC_SET(vec1, F10_SET(FIELD_WIDTH), F10_SET(-FIELD_HEIGHT), 0);
	VEC_SET(vec2, F10_SET(-FIELD_WIDTH), F10_SET(-FIELD_HEIGHT), 0);
	DrawLine3D(&vec1, &vec2, OP_DRAW);
	VEC_SET(vec1, F10_SET(-FIELD_WIDTH), F10_SET(-FIELD_HEIGHT), 0);
	VEC_SET(vec2, F10_SET(-FIELD_WIDTH), F10_SET(FIELD_HEIGHT), 0);
	DrawLine3D(&vec1, &vec2, OP_DRAW);

	z = 8;
	while(z <= 256)
	{
		//VEC_SET(vec1, F10_SET(FIELD_WIDTH), F10_SET(-FIELD_HEIGHT), F10_SET(z));
		//VEC_SET(vec2, F10_SET(-FIELD_WIDTH), F10_SET(-FIELD_HEIGHT), F10_SET(z));
		//DrawLine3D(&vec1, &vec2, OP_DRAW);
		VEC_SET(vec1, F10_SET(-FIELD_WIDTH), F10_SET(-FIELD_HEIGHT), F10_SET(z));
		DrawLineH(&vec1, F10_SET(FIELD_WIDTH*2), OP_DRAW);
		z += 8;
	}

	// Mid
	VEC_SET(vec1, F10_SET(-FIELD_WIDTH), F10_SET(FIELD_HEIGHT), F10_SET(128));
	VEC_SET(vec2, F10_SET(FIELD_WIDTH), F10_SET(FIELD_HEIGHT), F10_SET(128));
	DrawLine3D(&vec1, &vec2, OP_DRAW);
	VEC_SET(vec1, F10_SET(FIELD_WIDTH), F10_SET(FIELD_HEIGHT), F10_SET(128));
	VEC_SET(vec2, F10_SET(FIELD_WIDTH), F10_SET(-FIELD_HEIGHT), F10_SET(128));
	DrawLine3D(&vec1, &vec2, OP_DRAW);
	VEC_SET(vec1, F10_SET(FIELD_WIDTH), F10_SET(-FIELD_HEIGHT), F10_SET(128));
	VEC_SET(vec2, F10_SET(-FIELD_WIDTH), F10_SET(-FIELD_HEIGHT), F10_SET(128));
	DrawLine3D(&vec1, &vec2, OP_DRAW);
	VEC_SET(vec1, F10_SET(-FIELD_WIDTH), F10_SET(-FIELD_HEIGHT), F10_SET(128));
	VEC_SET(vec2, F10_SET(-FIELD_WIDTH), F10_SET(FIELD_HEIGHT), F10_SET(128));
	DrawLine3D(&vec1, &vec2, OP_DRAW);

	// back
	VEC_SET(vec1, F10_SET(-FIELD_WIDTH), F10_SET(FIELD_HEIGHT), F10_SET(FIELD_DEPTH));
	VEC_SET(vec2, F10_SET(FIELD_WIDTH), F10_SET(FIELD_HEIGHT), F10_SET(FIELD_DEPTH));
	DrawLine3D(&vec1, &vec2, OP_DRAW);
	VEC_SET(vec1, F10_SET(FIELD_WIDTH), F10_SET(FIELD_HEIGHT), F10_SET(FIELD_DEPTH));
	VEC_SET(vec2, F10_SET(FIELD_WIDTH), F10_SET(-FIELD_HEIGHT), F10_SET(FIELD_DEPTH));
	DrawLine3D(&vec1, &vec2, OP_DRAW);
	VEC_SET(vec1, F10_SET(FIELD_WIDTH), F10_SET(-FIELD_HEIGHT), F10_SET(FIELD_DEPTH));
	VEC_SET(vec2, F10_SET(-FIELD_WIDTH), F10_SET(-FIELD_HEIGHT), F10_SET(FIELD_DEPTH));
	DrawLine3D(&vec1, &vec2, OP_DRAW);
	VEC_SET(vec1, F10_SET(-FIELD_WIDTH), F10_SET(-FIELD_HEIGHT), F10_SET(FIELD_DEPTH));
	VEC_SET(vec2, F10_SET(-FIELD_WIDTH), F10_SET(FIELD_HEIGHT), F10_SET(FIELD_DEPTH));
	DrawLine3D(&vec1, &vec2, OP_DRAW);

	// Depth
	VEC_SET(vec1, F10_SET(-FIELD_WIDTH), F10_SET(FIELD_HEIGHT), 0);
	VEC_SET(vec2, F10_SET(-FIELD_WIDTH), F10_SET(FIELD_HEIGHT), F10_SET(FIELD_DEPTH));
	DrawLine3D(&vec1, &vec2, OP_DRAW);
	VEC_SET(vec1, F10_SET(FIELD_WIDTH), F10_SET(FIELD_HEIGHT), 0);
	VEC_SET(vec2, F10_SET(FIELD_WIDTH), F10_SET(FIELD_HEIGHT), F10_SET(FIELD_DEPTH));
	DrawLine3D(&vec1, &vec2, OP_DRAW);
	VEC_SET(vec1, F10_SET(-FIELD_WIDTH), F10_SET(-FIELD_HEIGHT), 0);
	VEC_SET(vec2, F10_SET(-FIELD_WIDTH), F10_SET(-FIELD_HEIGHT), F10_SET(FIELD_DEPTH));
	DrawLine3D(&vec1, &vec2, OP_DRAW);
	VEC_SET(vec1, F10_SET(FIELD_WIDTH), F10_SET(-FIELD_HEIGHT), 0);
	VEC_SET(vec2, F10_SET(FIELD_WIDTH), F10_SET(-FIELD_HEIGHT), F10_SET(FIELD_DEPTH));
	DrawLine3D(&vec1, &vec2, OP_DRAW);
}

/** State - Process game */
void StateUpdateGame()
{
	//Vector3D vec1, vec2;
	Vector3D vecMove;
	u8 keyLine, bMove;

	SetPage8(game.page);
	//game.page = 1 - game.page;
	game.yOffset = 256 * game.page;

	/* ... */
	//if(game.plyDepth > 256)
	//{
	//	VEC_SET(vec1, F10_SET(PLAYER_SIZE), F10_SET(10), F10_SET(512 - game.plyDepth));
	//	VEC_SET(vec2, F10_SET(PLAYER_SIZE), F10_SET(-10), F10_SET(512 - game.plyDepth));
	//}
	//else
	//{
	//	VEC_SET(vec1, F10_SET(PLAYER_SIZE), F10_SET(10), F10_SET(game.plyDepth));
	//	VEC_SET(vec2, F10_SET(PLAYER_SIZE), F10_SET(-10), F10_SET(game.plyDepth));
	//}
	//DrawLine3D(&vec1, &vec2, OP_CLEAR);
	//
	//game.plyDepth++;
	//if(game.plyDepth > 512)
	//{
	//	game.plyDepth = 0;
	//}
	//if(game.plyDepth > 256)
	//{
	//	vec1.z = F10_SET(512 - game.plyDepth);
	//	vec2.z = F10_SET(512 - game.plyDepth);
	//}
	//else
	//{
	//	vec1.z = F10_SET(game.plyDepth);
	//	vec2.z = F10_SET(game.plyDepth);
	//}
	//DrawLine3D(&vec1, &vec2, OP_DRAW);

	// 
	keyLine = GetKeyMatrixLine(8);

#define PLAYER_SPEED F10_SET(10)

	bMove = FALSE;
	VEC_SET(vecMove, 0, 0, 0);

	if((keyLine & KEY_LEFT) == 0)
	{
		if(game.players[0].position.x > F10_SET(-120+PLAYER_SIZE))
		{
			bMove = TRUE;
			vecMove.x -= PLAYER_SPEED;
		}
	}
	else if((keyLine & KEY_RIGHT) == 0)
	{
		if(game.players[0].position.x < F10_SET(120-PLAYER_SIZE))
		{
			bMove = TRUE;
			vecMove.x += PLAYER_SPEED;
		}
	}
	if((keyLine & KEY_UP) == 0)
	{
		if(game.players[0].position.y < F10_SET(100-PLAYER_SIZE))
		{
			bMove = TRUE;
			vecMove.y += PLAYER_SPEED;
		}
	}
	else if((keyLine & KEY_DOWN) == 0)
	{
		if(game.players[0].position.y > F10_SET(-100+PLAYER_SIZE))
		{
			bMove = TRUE;
			vecMove.y -= PLAYER_SPEED;
		}
	}

	if(bMove)
	{
		//ClearSquare(&game.players[0].position, PLAYER_SIZE);
		DrawBackground();
		VEC_ADD(game.players[0].position, vecMove);
		DrawSquare(&game.players[0].position, PLAYER_SIZE);
	}

	// 
	keyLine = GetKeyMatrixLine(0);
	if((keyLine & KEY_1) == 0)
	{
		if(game.power3d > 0)
			game.power3d--;
		game.state = StateStartGame;
	}
	if((keyLine & KEY_2) == 0)
	{
		if(game.power3d < 24)
			game.power3d++;
		game.state = StateStartGame;
	}

	WaitRetrace();
	game.frame++;
}

//=============================================================================
//
//   M A I N   L O O P   -   E N D
//
//=============================================================================

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

	FillVRAM(x, y, 8, 8, color);
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
				DrawCharacter(curX, curY, text[textIdx] - ' ', color);
				sprtIdx++;
			}
			curX += 8;
		}
		textIdx++;
	}
}

void ProjectPoint(const Vector3D* v3d, VectorU8* v2d)
{
	i16 X, Y, Z;

	//Z = game.projZ[F10_GET(v3d->z)];
	Z = g_Equa512[F10_GET(v3d->z)];
	X = CENTER_X + F10_MUL_TINY(v3d->x, Z);
	Y = CENTER_Y - F10_MUL_TINY(v3d->y, Z);

	v2d->x = F10_GET(X);
	v2d->y = F10_GET(Y);
}

u8 ProjectLenght(i16 length, i16 z)
{
	i16 X, Z;
	Z = g_Equa512[F10_GET(z)];
	X = F10_MUL_TINY(length, Z);
	return F10_GET(X);
}

void DrawSquare(const Vector3D* center, i16 size)
{
	Vector3D vec1, vec2;

	VEC_SET(vec1, center->x - F10_SET(size), center->y + F10_SET(size), center->z);
	VEC_SET(vec2, center->x + F10_SET(size), center->y + F10_SET(size), center->z);
	DrawLine3D(&vec1, &vec2, OP_DRAW);

	VEC_SET(vec1, center->x + F10_SET(size), center->y - F10_SET(size), center->z);
	DrawLine3D(&vec1, &vec2, OP_DRAW);

	VEC_SET(vec2, center->x - F10_SET(size), center->y - F10_SET(size), center->z);
	DrawLine3D(&vec1, &vec2, OP_DRAW);

	VEC_SET(vec1, center->x - F10_SET(size), center->y + F10_SET(size), center->z);
	DrawLine3D(&vec1, &vec2, OP_DRAW);
}

const u8 drawColor[3*2] = { COLOR8_WHITE, COLOR8_WHITE, COLOR8_WHITE, COLOR8_RED, COLOR8_CYAN, COLOR8_BLACK };
const u8 vdpOp[2] = { VDP_OP_IMP, VDP_OP_AND };

void DrawLine3D(const Vector3D* vec1, const Vector3D* vec2, u8 bDraw)
{
	VectorU8 scr1, scr2;
	i8 str1, str2, colIdx;

	ProjectPoint(vec1, &scr1);
	ProjectPoint(vec2, &scr2);

	colIdx = bDraw * 3;

	if(game.bAnaglyph)
	{
		str1 = F10_GET(game.power3d * g_Equa512[255 + F10_GET(vec1->z)]);
		str2 = F10_GET(game.power3d * g_Equa512[255 + F10_GET(vec2->z)]);
		Line(scr1.x - str1, scr1.y, scr2.x - str2, scr2.y, drawColor[colIdx + 0], vdpOp[bDraw]);
		Line(scr1.x + str1, scr1.y, scr2.x + str2, scr2.y, drawColor[colIdx + 1], vdpOp[bDraw]);
	}
	else
	{
		Line(scr1.x, scr1.y, scr2.x, scr2.y, drawColor[colIdx + 2], vdpOp[bDraw]);
	}
}

void DrawLineH(const Vector3D* vec, i16 width, u8 bDraw)
{
	VectorU8 scr;
	i8 str, colIdx;

	ProjectPoint(vec, &scr);
	width = ProjectLenght(width, vec->z);

	colIdx = bDraw * 3;

	if(game.bAnaglyph)
	{
		str = F10_GET(game.power3d * g_Equa512[255 + F10_GET(vec->z)]);
		LMMV(scr.x - str, scr.y, width - str, 1, drawColor[colIdx + 0], vdpOp[bDraw]);
		LMMV(scr.x + str, scr.y, width + str, 1, drawColor[colIdx + 1], vdpOp[bDraw]);
	}
	else
	{
		LMMV(scr.x, scr.y, width, 1, drawColor[colIdx + 2], vdpOp[bDraw]);
	}
}

//-----------------------------------------------------------------------------
// MENU CALLBACKS

/** Menu callback - Start game */
const char* StartGame(u8 op, i8 value)
{
	op; value;
	//game.track = value;
	game.state = StateStartGame;
	return "";
}
