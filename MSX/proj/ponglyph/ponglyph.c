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

#define CENTER_X			(F10_SET(255) >> 1) // 127.5
#define CENTER_Y			(F10_SET(211) >> 1) // 105.5

#define BG_COLOR			COLOR8_WHITE

#define PLAYER_SIZE			20
#define PLAYER_SPEED		10

#define BALL_SIZE			4
#define BALL_SPEED			8
#define BALL_IMPULSE		16
	
#define FIELD_WIDTH			120
#define FIELD_HEIGHT		105
#define FIELD_DEPTH			256

#define LINE_DRAW			0x1
#define LINE_STORE			0x2
#define LINE_DRAW_STORE		(LINE_DRAW + LINE_STORE)

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
#define F10_MUL_TINY(a, b)	((((a) >> 3) * ((b) >> 1)) >> 2)

#define VEC_ZERO(vec) { vec.x = 0; vec.y = 0; vec.z = 0; }
#define VEC_SET(vec, a, b, c) { vec.x = a; vec.y = b; vec.z = c; }
#define VEC_ADD(vec1, vec2) { vec1.x += vec2.x; vec1.y += vec2.y; vec1.z += vec2.z; }
#define VEC_SUB(vec1, vec2) { vec1.x -= vec2.x; vec1.y -= vec2.y; vec1.z -= vec2.z; }

#define ITEM game.lineTab[game.lineNum[game.page] + game.yOffset]
#define STORE_LINE(_dir, _color, _x1, _y1, _x2, _y2) { ITEM.dir = _dir; ITEM.color = _color; ITEM.x1 = _x1; ITEM.y1 = _y1; ITEM.x2 = _x2; ITEM.y2 = _y2; game.lineNum[game.page]++; }

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


enum PLAYER_MOVE
{
	MOVE_UP    = 0x1,
	MOVE_RIGHT = 0x2,
	MOVE_DOWN  = 0x4,
	MOVE_LEFT  = 0x8
};


typedef struct tagPlayerData
{
	u8			score;
	Vector3D	position;
	float10		angle;
	VectorI16	speed;
	u8          move;
} PlayerData;

enum LINE_DIR
{
	DIR_DIAG,
	DIR_HORI,
	DIR_VERT,
};

typedef struct tagLineData
{
	u8 dir, color;
	u16 x1, y1, x2, y2;
} LineData;


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
	// Option
	i8               anaglyphFx;
	i8               gameSpeed;
	u8               ballSpeed;
	// WorkArea
	u8               bitToByte[256 * 8];
	i16              projZ[512];
	LineData         lineTab[256 * 2];
	u8               lineNum[2];
	VectorU16        screenPos[2];
	LineData         bgTab[256];
	u8               bgIdx;
	// 3d Settings
	u8               bAnaglyph;
	u8               power3d;
	// Gameplay
	PlayerData       players[2];
	Vector3D         ballPos;
	Vector3D         ballDir;
} GameData;

//-----------------------------------------------------------------------------
// P R O T O T Y P E S

void MainLoop();
void InitializeMenu(u8 menu);
void ResetMenu();

void DrawCharacter(u16 x, u16 y, u8 chr, u8 color);
void DrawText(u16 x, u16 y, const char* text, u8 color);
void InitBackground();
void DrawBackground();
void DrawPlayer(i8 idx);
void DrawBall();
void ClearLines();
void MovePlayer(i8 id);
void MoveBall();
void CheckJoystick(i8 id);

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
const char* SelectAnaglyph(u8 op, i8 value);
const char* SelectSpeed(u8 op, i8 value);

// 3D
void ProjectPoint(const Vector3D* vec);
void ProjectLine(const Vector3D* vec1, const Vector3D* vec2);
void ProjectLineH(const Vector3D* vec, i16 width);
void ProjectLineV(const Vector3D* vec, i16 height);
void ProjectSquare(const Vector3D* min, const Vector3D* max);

void DrawLine3D(const Vector3D* vec1, const Vector3D* vec2, u8 bStore);
void DrawLineH(const Vector3D* vec, i16 width, u8 bStore);
void DrawLineV(const Vector3D* vec, i16 height, u8 bStore);
void DrawSquare(const Vector3D* min, const Vector3D* max, u8 bStore);

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
	{ "CREDITS",  2, 0, 0 },
};

// Menu 1
const MenuEntry g_MenuStart[] =	
{
	{ "START GAME", ITEM_ACTION, StartGame, 0 },
	{ "ANAGLYPH",   ITEM_VARIABLE, SelectAnaglyph, 0 },
	{ "SPEED",      ITEM_VARIABLE, SelectSpeed, 0 },
	{ "",           ITEM_DUMMY, 0, 0 },
	{ "<BACK",      0, 0, 0 },
};

// Menu 2
const MenuEntry g_MenuCredits[] =
{
	{ "CODE:  AOINEKO", ITEM_DUMMY, 0, 0 },
	{ "", ITEM_DUMMY, 0, 0 },
	{ "THANKS TO ALL MSX VILLAGE", ITEM_DUMMY, 0, 0 },
	{ "MEMBERS FOR SUPPORT!", ITEM_DUMMY, 0, 0 },
	{ "", ITEM_DUMMY, 0, 0 },
	{ "<BACK", 0, 0, 0 },
};

const Menu g_Menus[] =
{
	{ "MAIN MENU",     0, g_MenuMain,        numberof(g_MenuMain) },
	{ "GAME MODE",     0, g_MenuStart,       numberof(g_MenuStart) },
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
	__asm
	;game_entry_point:
		di
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
	SetSpriteMode(SPRITE_OFF, 0, 0, 0);
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
	game.lineNum[0] = 0;
	game.lineNum[1] = 0;
	game.anaglyphFx = 2;
	game.gameSpeed = 0;

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
	SetScreenColor(0, 0, COLOR8_BLACK);
	ClearScreen8(COLOR8_BLACK);

	// Build title
	DrawText(50, 32,       "PONGLYPH", COLOR8_RED);
	DrawText(52, 32 + 256, "PONGLYPH", COLOR8_CYAN);
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
	game.yOffset = 0;

	SetScreenColor(0, 0, BG_COLOR);
	ClearScreen8(BG_COLOR);

	game.bAnaglyph = TRUE;
	switch(game.anaglyphFx)
	{
		case 0:	game.bAnaglyph = FALSE; break;
		case 1:	game.power3d = 4; break;
		case 2: game.power3d = 8; break;
		case 3: game.power3d = 12; break;
	}
	switch(game.gameSpeed)
	{
		case 0: game.ballSpeed = 8; break;
		case 1: game.ballSpeed = 16; break;
		case 2: game.ballSpeed = 32; break;
	}

	game.page = 0;
	game.yOffset = 0;
	InitBackground();
	game.lineNum[0] = 0;
	game.lineNum[1] = 0;

	// Player 0
	game.players[0].score = 0;
	VEC_SET(game.players[0].position, F10_SET(50), F10_SET(50), F10_SET(0));
	game.players[0].angle = 0;

	// Player 1
	game.players[1].score = 0;
	VEC_SET(game.players[1].position, F10_SET(-50), F10_SET(-50), F10_SET(FIELD_DEPTH));
	game.players[1].angle = 0;

	// Ball
	VEC_SET(game.ballPos, 0, 0, F10_SET(128));
	VEC_SET(game.ballDir, 0, 0, F10_SET(game.ballSpeed));

	game.state = StateUpdateGame;
}

/** State - Process game */
void StateUpdateGame()
{
	u8 keyLine;

	// Flip page
	SetPage8(game.page);
	game.page = 1 - game.page;
	game.yOffset = 256 * game.page;

	// Change analglyph effect power
	keyLine = GetKeyMatrixLine(0);
	if((keyLine & KEY_1) == 0)
	{
		if(game.power3d > 0)
			game.power3d--;
		ClearScreen8(BG_COLOR);
	}
	if((keyLine & KEY_2) == 0)
	{
		if(game.power3d < 24)
			game.power3d++;
		ClearScreen8(BG_COLOR);
	}

	// Clear
	ClearLines();
	DrawBackground();

	DrawCharacter(128-12, 8 + game.yOffset, '0'+game.players[0].score-' ', COLOR8_WHITE);
	DrawCharacter(128-4,  8 + game.yOffset, '-'-' ', COLOR8_WHITE);
	DrawCharacter(128+4,  8 + game.yOffset, '0'+game.players[1].score-' ', COLOR8_WHITE);

	//--------------------------------------------------------------------------------
	// Move player 0

	// Keyboard
	game.players[0].move = 0;
	keyLine = GetKeyMatrixLine(8);
	if((keyLine & KEY_LEFT) == 0)
		game.players[0].move |= MOVE_LEFT;
	else if((keyLine & KEY_RIGHT) == 0)
		game.players[0].move |= MOVE_RIGHT;
	if((keyLine & KEY_DOWN) == 0)
		game.players[0].move |= MOVE_DOWN;
	else if((keyLine & KEY_UP) == 0)
		game.players[0].move |= MOVE_UP;
	CheckJoystick(0);

	MovePlayer(0);
	DrawPlayer(0);

	//--------------------------------------------------------------------------------
	// Move player 1

	game.players[1].move = 0;
	keyLine = GetKeyMatrixLine(5);
	if((keyLine & KEY_Z) == 0)
		game.players[1].move |= MOVE_LEFT;
	keyLine = GetKeyMatrixLine(3);
	if((keyLine & KEY_C) == 0)
		game.players[1].move |= MOVE_RIGHT;
	keyLine = GetKeyMatrixLine(5);
	if((keyLine & KEY_S) == 0)
		game.players[1].move |= MOVE_UP;
	else if((keyLine & KEY_X) == 0)
		game.players[1].move |= MOVE_DOWN;
	CheckJoystick(1);

	MovePlayer(1);
	DrawPlayer(1);

	//--------------------------------------------------------------------------------
	// Move ball
	MoveBall();
	DrawBall();

	// restart
	keyLine = GetKeyMatrixLine(7);
	if((keyLine & KEY_F5) == 0)
		game.state = StateStartGame;
	if((keyLine & KEY_ESC) == 0)
		game.state = StateTitle;

	WaitRetrace();
	game.frame++;
}

//=============================================================================
//
//   M A I N   L O O P   -   E N D
//
//=============================================================================

/***/
void DrawPlayer(i8 idx)
{
	Vector3D min, max;

	VEC_SET(min, game.players[idx].position.x - F10_SET(PLAYER_SIZE), game.players[idx].position.y - F10_SET(PLAYER_SIZE), game.players[idx].position.z);
	VEC_SET(max, game.players[idx].position.x + F10_SET(PLAYER_SIZE), game.players[idx].position.y + F10_SET(PLAYER_SIZE), game.players[idx].position.z);
	DrawSquare(&min, &max, LINE_DRAW_STORE);
}

/***/
void DrawBall()
{
	Vector3D min, max;
	VEC_SET(min, game.ballPos.x - F10_SET(BALL_SIZE), game.ballPos.y - F10_SET(BALL_SIZE), game.ballPos.z);
	VEC_SET(max, game.ballPos.x + F10_SET(BALL_SIZE), game.ballPos.y + F10_SET(BALL_SIZE), game.ballPos.z);
	DrawSquare(&min, &max, LINE_DRAW_STORE);

	VEC_SET(min, game.ballPos.x - F10_SET(BALL_SIZE), F10_SET(-FIELD_HEIGHT), game.ballPos.z);
	VEC_SET(max, game.ballPos.x + F10_SET(BALL_SIZE), F10_SET(-FIELD_HEIGHT), game.ballPos.z);
	DrawSquare(&min, &max, LINE_DRAW_STORE);

	//Vector3D p1, p2, p3, p4;
	//VEC_SET(p1, game.ballPos.x - F10_SET(BALL_SIZE), game.ballPos.y + F10_SET(BALL_SIZE), game.ballPos.z);
	//VEC_SET(p2, game.ballPos.x + F10_SET(BALL_SIZE), game.ballPos.y + F10_SET(BALL_SIZE), game.ballPos.z);
	//VEC_SET(p3, game.ballPos.x + F10_SET(BALL_SIZE), game.ballPos.y - F10_SET(BALL_SIZE), game.ballPos.z);
	//VEC_SET(p4, game.ballPos.x - F10_SET(BALL_SIZE), game.ballPos.y - F10_SET(BALL_SIZE), game.ballPos.z);

	//DrawLine3D(&p1, &p2, LINE_DRAW_STORE);
	//DrawLine3D(&p2, &p3, LINE_DRAW_STORE);
	//DrawLine3D(&p3, &p4, LINE_DRAW_STORE);
	//DrawLine3D(&p4, &p1, LINE_DRAW_STORE);
}

void InitBackground()
{
	Vector3D vec1, vec2;
	i16 z;

	game.lineNum[0] = 0;

	// Front
	VEC_SET(vec1, F10_SET(-FIELD_WIDTH), F10_SET(-FIELD_HEIGHT), 0);
	VEC_SET(vec2, F10_SET(FIELD_WIDTH), F10_SET(FIELD_HEIGHT), 0);
	DrawSquare(&vec1, &vec2, LINE_STORE);

	// Ground
	//for(z = 8; z <= 256; z += 8)
	//{
	//	VEC_SET(vec1, F10_SET(-FIELD_WIDTH), F10_SET(-FIELD_HEIGHT), F10_SET(z));
	//	DrawLineH(&vec1, F10_SET(FIELD_WIDTH*2), LINE_STORE);		
	//}

	// Mid
	//VEC_SET(vec1, F10_SET(-FIELD_WIDTH), F10_SET(-FIELD_HEIGHT), F10_SET(128));
	//VEC_SET(vec2, F10_SET(FIELD_WIDTH), F10_SET(FIELD_HEIGHT), F10_SET(128));
	//DrawSquare(&vec1, &vec2, LINE_STORE);

	// back
	VEC_SET(vec1, F10_SET(-FIELD_WIDTH), F10_SET(-FIELD_HEIGHT), F10_SET(FIELD_DEPTH));
	VEC_SET(vec2, F10_SET(FIELD_WIDTH), F10_SET(FIELD_HEIGHT), F10_SET(FIELD_DEPTH));
	DrawSquare(&vec1, &vec2, LINE_STORE);

	// Depth
	VEC_SET(vec1, F10_SET(-FIELD_WIDTH), F10_SET(FIELD_HEIGHT), 0);
	VEC_SET(vec2, F10_SET(-FIELD_WIDTH), F10_SET(FIELD_HEIGHT), F10_SET(FIELD_DEPTH));
	DrawLine3D(&vec1, &vec2, LINE_STORE);
	VEC_SET(vec1, F10_SET(FIELD_WIDTH), F10_SET(FIELD_HEIGHT), 0);
	VEC_SET(vec2, F10_SET(FIELD_WIDTH), F10_SET(FIELD_HEIGHT), F10_SET(FIELD_DEPTH));
	DrawLine3D(&vec1, &vec2, LINE_STORE);
	VEC_SET(vec1, F10_SET(-FIELD_WIDTH), F10_SET(-FIELD_HEIGHT), 0);
	VEC_SET(vec2, F10_SET(-FIELD_WIDTH), F10_SET(-FIELD_HEIGHT), F10_SET(FIELD_DEPTH));
	DrawLine3D(&vec1, &vec2, LINE_STORE);
	VEC_SET(vec1, F10_SET(FIELD_WIDTH), F10_SET(-FIELD_HEIGHT), 0);
	VEC_SET(vec2, F10_SET(FIELD_WIDTH), F10_SET(-FIELD_HEIGHT), F10_SET(FIELD_DEPTH));
	DrawLine3D(&vec1, &vec2, LINE_STORE);

	// Backup lines
	game.bgIdx = game.lineNum[0];
	for(z=0; z<game.bgIdx; z++)
	{
		game.bgTab[z].dir = game.lineTab[z].dir;
		game.bgTab[z].color = game.lineTab[z].color;
		game.bgTab[z].x1 = game.lineTab[z].x1;
		game.bgTab[z].y1 = game.lineTab[z].y1;
		game.bgTab[z].x2 = game.lineTab[z].x2;
		game.bgTab[z].y2 = game.lineTab[z].y2;
	}
	game.lineNum[0] = 0;
}

/***/
void DrawBackground()
{
	i16 i;
	for(i = 0; i < game.bgIdx; i++)
	{
		if(game.bgTab[i].dir == DIR_DIAG)
			Line(game.bgTab[i].x1, game.bgTab[i].y1 + game.yOffset, game.bgTab[i].x2, game.bgTab[i].y2 + game.yOffset, game.bgTab[i].color, VDP_OP_AND);
		else
			LMMV(game.bgTab[i].x1, game.bgTab[i].y1 + game.yOffset, game.bgTab[i].x2, game.bgTab[i].y2, game.bgTab[i].color, VDP_OP_AND);
	}
}

/***/
void ClearLines()
{
	i16 i;
	for(i = 0; i < game.lineNum[game.page]; i++)
	{
		if(game.lineTab[i + game.yOffset].dir == DIR_DIAG)
			Line(game.lineTab[i + game.yOffset].x1, game.lineTab[i + game.yOffset].y1, game.lineTab[i + game.yOffset].x2, game.lineTab[i + game.yOffset].y2, BG_COLOR, VDP_OP_IMP);
		else
			HMMV(game.lineTab[i + game.yOffset].x1, game.lineTab[i + game.yOffset].y1, game.lineTab[i + game.yOffset].x2, game.lineTab[i + game.yOffset].y2, BG_COLOR);
	}
	game.lineNum[game.page] = 0;
}

/** Move the given player */
void MovePlayer(i8 id)
{
	if(game.players[id].move & MOVE_LEFT)
	{
		if(game.players[id].speed.x > 0)
			game.players[id].speed.x = 0;
		else if(game.players[id].speed.x > -PLAYER_SPEED)
			game.players[id].speed.x--;
	}
	else if(game.players[id].move & MOVE_RIGHT)
	{
		if(game.players[id].speed.x < 0)
			game.players[id].speed.x = 0;
		else if(game.players[id].speed.x < PLAYER_SPEED)
			game.players[id].speed.x++;
	}
	else
	{
		game.players[id].speed.x /= 2;
	}

	if(game.players[id].speed.x != 0)
	{
		game.players[id].position.x += F10_SET(game.players[id].speed.x);
		if(game.players[id].position.x > F10_SET(FIELD_WIDTH-PLAYER_SIZE-1))
		{
			game.players[id].position.x = F10_SET(FIELD_WIDTH-PLAYER_SIZE-1);
			game.players[id].speed.x = 0;
		}
		else if(game.players[id].position.x < F10_SET(-FIELD_WIDTH+PLAYER_SIZE+1))
		{
			game.players[id].position.x = F10_SET(-FIELD_WIDTH+PLAYER_SIZE+1);
			game.players[id].speed.x = 0;
		}
	}

	if(game.players[id].move & MOVE_DOWN)
	{
		if(game.players[id].speed.y > 0)
			game.players[id].speed.y = 0;
		else if(game.players[id].speed.y > -PLAYER_SPEED)
			game.players[id].speed.y--;
	}
	else if(game.players[id].move & MOVE_UP)
	{
		if(game.players[id].speed.y < 0)
			game.players[id].speed.y = 0;
		else if(game.players[id].speed.y < PLAYER_SPEED)
			game.players[id].speed.y++;
	}
	else
	{
		game.players[id].speed.y /= 2;
	}

	if(game.players[id].speed.y != 0)
	{
		game.players[id].position.y += F10_SET(game.players[id].speed.y);
		if(game.players[id].position.y > F10_SET(FIELD_HEIGHT-PLAYER_SIZE-1))
		{
			game.players[id].position.y = F10_SET(FIELD_HEIGHT-PLAYER_SIZE-1);
			game.players[id].speed.y = 0;
		}
		else if(game.players[id].position.y < F10_SET(-FIELD_HEIGHT+PLAYER_SIZE+1))
		{
			game.players[id].position.y = F10_SET(-FIELD_HEIGHT+PLAYER_SIZE+1);
			game.players[id].speed.y = 0;
		}
	}
}

/***/
void MoveBall()
{
	i16 difX, difY, len;

	VEC_ADD(game.ballPos, game.ballDir);

	len = F10_SET(PLAYER_SIZE + BALL_SIZE);

	// Check depth collision
	if(game.ballPos.z < 0)
	{
		game.ballPos.z = 0;
		game.ballDir.z = -game.ballDir.z;

		difX = game.ballPos.x - game.players[0].position.x;
		difY = game.ballPos.y - game.players[0].position.y;
		if((Abs16(difX) <= len) && (Abs16(difY) <= len))
		{
			game.ballDir.x = difX >> 3;
			game.ballDir.y = difY >> 3;
			game.ballDir.z += BALL_IMPULSE;
		}
		else
		{
			game.players[1].score++;
			game.ballDir.z = F10_SET(game.ballSpeed);
		}
	}
	else if(game.ballPos.z > F10_SET(FIELD_DEPTH))
	{
		game.ballPos.z = F10_SET(FIELD_DEPTH);
		game.ballDir.z = -game.ballDir.z;

		difX = game.ballPos.x - game.players[1].position.x;
		difY = game.ballPos.y - game.players[1].position.y;
		if((Abs16(difX) <= len) && (Abs16(difY) <= len))
		{
			game.ballDir.x = difX >> 3;
			game.ballDir.y = difY >> 3;
			game.ballDir.z -= BALL_IMPULSE;
		}
		else
		{
			game.players[0].score++;
			game.ballDir.z = -F10_SET(game.ballSpeed);
		}
	}

	// Check horizontal collision
	if(game.ballPos.x < F10_SET(-FIELD_WIDTH))
	{
		game.ballPos.x = F10_SET(-FIELD_WIDTH);
		game.ballDir.x = -game.ballDir.x;
	}
	else if(game.ballPos.x > F10_SET(FIELD_WIDTH))
	{
		game.ballPos.x = F10_SET(FIELD_WIDTH);
		game.ballDir.x = -game.ballDir.x;
	}

	// Check vertical collision
	if(game.ballPos.y < F10_SET(-FIELD_HEIGHT))
	{
		game.ballPos.y = F10_SET(-FIELD_HEIGHT);
		game.ballDir.y = -game.ballDir.y;
	}
	else if(game.ballPos.y > F10_SET(FIELD_HEIGHT))
	{
		game.ballPos.y = F10_SET(FIELD_HEIGHT);
		game.ballDir.y = -game.ballDir.y;
	}
}

void CheckJoystick(i8 id)
{
	 // Joy direction
	switch (Joystick(id + 1))
	{
	case 1: // up
		game.players[id].move |= MOVE_UP;
		break;
	case 2: // up-right
		game.players[id].move |= MOVE_UP;
		game.players[id].move |= MOVE_RIGHT;
		break;
	case 3: // right
		game.players[id].move |= MOVE_RIGHT;
		break;
	case 4: // down-right
		game.players[id].move |= MOVE_RIGHT;
		game.players[id].move |= MOVE_DOWN;
		break;
	case 5: // down
		game.players[id].move |= MOVE_DOWN;
		break;
	case 6: // down-left
		game.players[id].move |= MOVE_LEFT;
		game.players[id].move |= MOVE_DOWN;
		break;
	case 7: // left
		game.players[id].move |= MOVE_LEFT;
		break;
	case 8:// up-left
		game.players[id].move |= MOVE_UP;
		game.players[id].move |= MOVE_LEFT;
		break;
	}
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

//#define PROJ_TAB game.projZ
#define PROJ_TAB g_Equa512

void ProjectPoint(const Vector3D* vec)
{
	i16 X, Y, Z;

	Z = PROJ_TAB[F10_GET(vec->z)];
	X = CENTER_X + F10_MUL_TINY(vec->x, Z);
	Y = CENTER_Y - F10_MUL_TINY(vec->y, Z);

	game.screenPos[0].x = F10_GET(X);
	game.screenPos[0].y = F10_GET(Y) + game.yOffset;
}

void ProjectLine(const Vector3D* vec1, const Vector3D* vec2)
{
	i16 X, Y, Z;

	Z = PROJ_TAB[F10_GET(vec1->z)];
	X = CENTER_X + F10_MUL_TINY(vec1->x, Z);
	Y = CENTER_Y - F10_MUL_TINY(vec1->y, Z);

	game.screenPos[0].x = F10_GET(X);
	game.screenPos[0].y = F10_GET(Y) + game.yOffset;

	Z = PROJ_TAB[F10_GET(vec2->z)];
	X = CENTER_X + F10_MUL_TINY(vec2->x, Z);
	Y = CENTER_Y - F10_MUL_TINY(vec2->y, Z);

	game.screenPos[1].x = F10_GET(X);
	game.screenPos[1].y = F10_GET(Y) + game.yOffset;
}

void ProjectLineH(const Vector3D* vec, i16 width)
{
	i16 X, Y, Z;

	Z = PROJ_TAB[F10_GET(vec->z)];

	X = CENTER_X + F10_MUL_TINY(vec->x, Z);
	Y = CENTER_Y - F10_MUL_TINY(vec->y, Z);

	game.screenPos[0].x = F10_GET(X);
	game.screenPos[0].y = F10_GET(Y) + game.yOffset;

	X = CENTER_X + F10_MUL_TINY(vec->x + width, Z);

	game.screenPos[1].x = F10_GET(X);
}

void ProjectLineV(const Vector3D* vec, i16 height)
{
	i16 X, Y, Z;

	Z = PROJ_TAB[F10_GET(vec->z)];

	X = CENTER_X + F10_MUL_TINY(vec->x, Z);
	Y = CENTER_Y - F10_MUL_TINY(vec->y + height, Z);

	game.screenPos[0].x = F10_GET(X);
	game.screenPos[0].x = F10_GET(Y) + game.yOffset;

	Y = CENTER_Y - F10_MUL_TINY(vec->y, Z);

	game.screenPos[1].y = F10_GET(Y) + game.yOffset;
}

void ProjectSquare(const Vector3D* min, const Vector3D* max)
{
	i16 X, Y, Z;

	Z = PROJ_TAB[F10_GET(min->z)];

	X = CENTER_X + F10_MUL_TINY(min->x, Z);
	Y = CENTER_Y - F10_MUL_TINY(max->y, Z);

	game.screenPos[0].x = F10_GET(X);
	game.screenPos[0].y = F10_GET(Y) + game.yOffset;

	X = CENTER_X + F10_MUL_TINY(max->x, Z);
	Y = CENTER_Y - F10_MUL_TINY(min->y, Z);

	game.screenPos[1].x = F10_GET(X);
	game.screenPos[1].y = F10_GET(Y) + game.yOffset;
}

#define LINE_DIAG(x1, y1, x2, y2, color)	if((bStore & LINE_DRAW) != 0) { Line(x1, y1, x2, y2, color, VDP_OP_AND); } if((bStore & LINE_STORE) != 0) { STORE_LINE(DIR_DIAG, color, x1, y1, x2, y2); }
#define LINE_HORI(x1, y1, x2, y2, color)	if((bStore & LINE_DRAW) != 0) { LMMV(x1, y1, x2, y2, color, VDP_OP_AND); } if((bStore & LINE_STORE) != 0) { STORE_LINE(DIR_HORI, color, x1, y1, x2, y2); }

/***/
void DrawLine3D(const Vector3D* vec1, const Vector3D* vec2, u8 bStore)
{
	i8 str1, str2;

	ProjectLine(vec1, vec2);

	if(game.bAnaglyph)
	{
		str1 = F10_GET(game.power3d * PROJ_TAB[255 + F10_GET(vec1->z)]);
		str2 = F10_GET(game.power3d * PROJ_TAB[255 + F10_GET(vec2->z)]);
		LINE_DIAG(game.screenPos[0].x - str1, game.screenPos[0].y, game.screenPos[1].x - str2, game.screenPos[1].y, COLOR8_RED);
		LINE_DIAG(game.screenPos[0].x + str1, game.screenPos[0].y, game.screenPos[1].x + str2, game.screenPos[1].y, COLOR8_CYAN);
	}
	else
	{
		LINE_DIAG(game.screenPos[0].x, game.screenPos[0].y, game.screenPos[1].x, game.screenPos[1].y, COLOR8_BLACK);
	}
}

/***/
void DrawLineH(const Vector3D* vec, i16 width, u8 bStore)
{
	i8 str;

	ProjectLineH(vec, width);

	if(game.bAnaglyph)
	{
		str = F10_GET(game.power3d * PROJ_TAB[255 + F10_GET(vec->z)]);

		LINE_HORI(game.screenPos[0].x - str, game.screenPos[0].y, 1 + game.screenPos[1].x - game.screenPos[0].x, 1, COLOR8_RED);
		LINE_HORI(game.screenPos[0].x + str, game.screenPos[0].y, 1 + game.screenPos[1].x - game.screenPos[0].x, 1, COLOR8_CYAN);
	}
	else
	{
		LINE_HORI(game.screenPos[0].x, game.screenPos[0].y, 1 + game.screenPos[1].x - game.screenPos[0].x, 1, COLOR8_BLACK);
	}
}

/***/
void DrawLineV(const Vector3D* vec, i16 height, u8 bStore)
{
	i8 str;

	ProjectLineV(vec, height);

	if(game.bAnaglyph)
	{
		str = F10_GET(game.power3d * PROJ_TAB[255 + F10_GET(vec->z)]);

		LINE_HORI(game.screenPos[0].x - str, game.screenPos[0].y, 1, 1 + game.screenPos[1].y - game.screenPos[0].y, COLOR8_RED);
		LINE_HORI(game.screenPos[0].x + str, game.screenPos[0].y, 1, 1 + game.screenPos[1].y - game.screenPos[0].y, COLOR8_CYAN);
	}
	else
	{
		LINE_HORI(game.screenPos[0].x, game.screenPos[0].y, 1, game.screenPos[1].y - game.screenPos[0].y, COLOR8_BLACK);
	}
}

/***/
void DrawSquare(const Vector3D* min, const Vector3D* max, u8 bStore)
{
	i8 str;

	ProjectSquare(min, max);

	if(game.bAnaglyph)
	{
		str = F10_GET(game.power3d * PROJ_TAB[255 + F10_GET(min->z)]);

		LINE_HORI(game.screenPos[0].x - str, game.screenPos[0].y, 1 + game.screenPos[1].x - game.screenPos[0].x, 1, COLOR8_RED);
		LINE_HORI(game.screenPos[0].x + str, game.screenPos[0].y, 1 + game.screenPos[1].x - game.screenPos[0].x, 1, COLOR8_CYAN);
		
		LINE_HORI(game.screenPos[0].x - str, game.screenPos[1].y, 1 + game.screenPos[1].x - game.screenPos[0].x, 1, COLOR8_RED);
		LINE_HORI(game.screenPos[0].x + str, game.screenPos[1].y, 1 + game.screenPos[1].x - game.screenPos[0].x, 1, COLOR8_CYAN);
		
		LINE_HORI(game.screenPos[0].x - str, game.screenPos[0].y, 1, 1 + game.screenPos[1].y - game.screenPos[0].y, COLOR8_RED);
		LINE_HORI(game.screenPos[0].x + str, game.screenPos[0].y, 1, 1 + game.screenPos[1].y - game.screenPos[0].y, COLOR8_CYAN);
		
		LINE_HORI(game.screenPos[1].x - str, game.screenPos[0].y, 1, 1 + game.screenPos[1].y - game.screenPos[0].y, COLOR8_RED);
		LINE_HORI(game.screenPos[1].x + str, game.screenPos[0].y, 1, 1 + game.screenPos[1].y - game.screenPos[0].y, COLOR8_CYAN);
	}
	else
	{
		LINE_HORI(game.screenPos[0].x, game.screenPos[0].y, 1 + game.screenPos[1].x - game.screenPos[0].x, 1, COLOR8_BLACK);
		LINE_HORI(game.screenPos[0].x, game.screenPos[1].y, 1 + game.screenPos[1].x - game.screenPos[0].x, 1, COLOR8_BLACK);
		LINE_HORI(game.screenPos[0].x, game.screenPos[0].y, 1, 1 + game.screenPos[1].y - game.screenPos[0].y, COLOR8_BLACK);
		LINE_HORI(game.screenPos[1].x, game.screenPos[0].y, 1, 1 + game.screenPos[1].y - game.screenPos[0].y, COLOR8_BLACK);
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

/** Menu callback - Select game mode */
const char* SelectAnaglyph(u8 op, i8 value)
{
	value;
	if(op == ACTION_INC)
	{
		game.anaglyphFx++;
		if(game.anaglyphFx > 3)
			game.anaglyphFx = 0;
		ResetMenu();
	}
	else if(op == ACTION_DEC)
	{
		game.anaglyphFx--;
		if(game.anaglyphFx < 0)
			game.anaglyphFx = 3;
		ResetMenu();
	}

	switch(game.anaglyphFx)
	{
	case 0:
		return "<OFF>";
	case 1:
		return "<LOW>";
	case 2:
		return "<MED>";
	case 3:
		return "<HIGH>";
	}
	return "";
}

/** Menu callback - Select game mode */
const char* SelectSpeed(u8 op, i8 value)
{
	value;
	if(op == ACTION_INC)
	{
		game.gameSpeed++;
		if(game.gameSpeed > 2)
			game.gameSpeed = 0;
		ResetMenu();
	}
	else if(op == ACTION_DEC)
	{
		game.gameSpeed--;
		if(game.gameSpeed < 0)
			game.gameSpeed = 2;
		ResetMenu();
	}

	switch(game.gameSpeed)
	{
	case 0:
		return "<LOW>";
	case 1:
		return "<MED>";
	case 2:
		return "<HIGH>";
	}
	return "";}
