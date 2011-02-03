/* 3D on MSX */

#pragma sdcc_hash +

#include "core.h"
#include "bios.h"

//----------------------------------------
// D E F I N E S

#define VDP_DATA #0x98   // VDP data port (VRAM read/write)
#define VDP_ADDR #0x99   // VDP address (write only)
#define VDP_STAT #0x99   // VDP status (read only)
#define VDP_PALT #0x9A   // VDP palette latch (write only)
#define VDP_REGS #0x9B   // VDP register access (write only)

#define PSG_REGS #0xA0   // PSG register write port
#define PSG_DATA #0xA1   // PSG value write port
#define PSG_STAT #0xA2   // PSG value read port

#define PSL_STAT #0xA8   // slot status
#define KBD_STAT #0xA9   // keyboard status
#define GIO_REGS #0xAA   // General IO Register
#define PPI_REGS #0xAB   // PPI register

#define RTC_ADDR #0xB4   // RTC address
#define RTC_DATA #0xB5   // RTC data

#define RG0SAV  #0xF3DF
#define RG1SAV  #0xF3E0
#define RG2SAV  #0xF3E1
#define RG3SAV  #0xF3E2
#define RG4SAV  #0xF3E3
#define RG5SAV  #0xF3E4
#define RG6SAV  #0xF3E5
#define RG7SAV  #0xF3E6
#define RG8SAV  #0xF3E7
#define RG9SAV  #0xF3E8

#define VDP_SX	#32
#define VDP_SX8	#33
#define VDP_SY	#34
#define VDP_SY8	#35
#define VDP_DX	#36
#define VDP_DX8	#37
#define VDP_DY	#38
#define VDP_DY8	#39
#define VDP_NX	#40
#define VDP_NX8	#41
#define VDP_NY	#42
#define VDP_NY8	#43
#define VDP_CLR	#44
#define VDP_ARG	#45
#define VDP_CMD	#46

#define DISP_PAGE	(1 << 5)

#define SPRITE_OFF		0x02
#define SPRITE_ON		0x00

#define SPRITE_MAG		0x01
#define SPRITE_NO_MAG	0x00
#define SPRITE_SIZE_16	0x02
#define SPRITE_SIZE_8	0x00
#define SPRITE_MASK     0xFC // 1111 1100

#define LINES_192		0x00
#define LINES_212		0x80 // 1000 0000
#define LINES_MASK		0x7F // 0111 1111

#define FREQ_50			0x20 // 0000 0010
#define FREQ_60			0x00
#define FREQ_MASK		0xFD // 1111 1101


//----------------------------------------
// M A C R O S

#define VDP_REG(num) #(0x80+num)

#define POSI(a)    (a)
#define NEGA(a)    ((^a)++)

#define ScrPosX(a) ((a >> 8) - 6)
#define ScrPosY(a) ((a >> 8) - 5)

//----------------------------------------
// T Y P E S

typedef struct tagVdpBuffer36
{
	u16 DX;  // 36-37
	u16 DY;  // 38-39
	u16 NX;  // 40-41
	u16 NY;  // 42-43
	u8  CLR; // 44
	u8  ARG; // 45
	u8  CMD; // 46
} VdpBuffer36;

typedef struct tagVdpBuffer32
{
	u16 SX;  // 32-33
	u16 SY;  // 34-35
	u16 DX;  // 36-37
	u16 DY;  // 38-39
	u16 NX;  // 40-41
	u16 NY;  // 42-43
	u8  CLR; // 44
	u8  ARG; // 45
	u8  CMD; // 46
} VdpBuffer32;

typedef struct tagEntryTAS
{
	u8 posY;
	u8 posX;
	u8 index; // index in TGS table
	u8 reserved;
} EntryTAS;

typedef struct tagCar
{
	u8 rotSpeed;
	u8 accel;
} Car;

typedef struct tagPlayer
{
	u8 car;    // car index
	i16 posX;  // position X
	i16 posY;  // position Y
	i16 prevX; // previous position X
	i16 prevY; // previous position Y
	u16 rot;   // rotation
	u16 dX;    // velocity X
	u16 dY;    // velocity Y
	i8 speed;
} Player; // 16 bytes

struct GameData
{
	Car         cars[4];
	Player      players[4];
	VdpBuffer32 buffer32;
	VdpBuffer36 buffer36;
};

//----------------------------------------
// P R O T O T Y P E S

void MainLoop();
void InitializePlayer(Player* ply, u8 car, u8 posX, u8 posY);
void SetScreen8(u8 lines);
void SetSpriteMode(u8 activate, u8 flag, u16 tgs, u16 tas);
void SetPage8(i8 page);
void DrawPoint8(char posX, char posY, char color);
void DrawLine8(char posX1, char posY1, char posX2, char posY2, char color);
void waitRetrace();
void WaitForVDP();
void WriteToVRAM8(u16 addr, u8 value);
void SetFreq(u8 freq);
void PrintSprite(u8 X, u8 Y, const char* text);
void ClearSprite();
void SetSprite(u8 index, u8 X, u8 Y, u8 shape);

void RAMtoVRAM(u8 page, u8 dx, u8 dy, u8 nx, u8 ny, u16 ram);
void RAMtoVRAM16(u16 dx, u16 dy, u16 nx, u16 ny, u16 ram);
void RAMtoVRAMTrans(u8 page, u8 dx, u8 dy, u8 nx, u8 ny, u16 ram);
void FillVRAM(u16 dx, u16 dy, u16 nx, u16 ny, u8 color);
void VRAMtoVRAM(u8 sPage, u8 sx, u8 sy, u8 dPage, u8 dx, u8 dy, u8 nx, u8 ny);
void VRAMtoVRAM16(u16 sx, u16 sy, u16 dx, u16 dy, u16 nx, u16 ny);
void VRAMtoVRAMTrans(u8 sPage, u8 sx, u8 sy, u8 dPage, u8 dx, u8 dy, u8 nx, u8 ny);

void VPDCommand32(u16 address);
void VPDCommand36(u16 address);
void VPDCommandLoop(u16 address);

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

#include "trigo16.inc"

const u8 backgound[] = 
{
// Sprite[0]
	0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 
	0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 
	0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 
	0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 
	0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 
	0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 
	0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 
	0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 
	0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 
	0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 
	0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 0x92, 
};

const u8 defaultColor[] = { 0x0a, 0x0a, 0x0b, 0x0e, 0x0e, 0x0b, 0x0a, 0x0a };

Player __at(0xC000) ply[4];
VdpBuffer36 __at(0xC100) buffer36;
VdpBuffer32 __at(0xC200) buffer32;
//struct GameData __at(0xD000) game;

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

/**
 *
 */
void MainLoop()
{
	i8 i = 0;
	u8 bEnd = 0/*, keyCode*/;
	u8 page = 0;
	u8 keyLine;
	//Player ply[4];
	//Player* ply = 0xC000;
	Player* curPly;
	u16 x, y;
	u8 testSprt[4] = { 0x40, 0x40, 0, 0 };

	SetFreq(FREQ_50);
	SetScreen8(LINES_212);
	SetSpriteMode(SPRITE_ON, SPRITE_NO_MAG + SPRITE_SIZE_8, 0xF800 >> 11, 0xF700 >> 7);

	FillVRAM(0, 0,         256, 212, 0x92);
	FillVRAM(0, 212,       256, 44,  0);
	FillVRAM(0, 256 + 0,   256, 212, 0x92);
	FillVRAM(0, 256 + 212, 256, 44,  0);

	//----------------------------------------
	// Initialize sprites
	for(x=0; x<sizeof(charTable)/8; x++)
	{
		RAMtoVRAM16((x * 8) % 256, 248 + (x / 32), 8, 1, (u16)&charTable[x * 8]);
	}
	
	//----------------------------------------
	// Build background
	//PrintSprite(64, 64, "INIT\nTRACK");
	//for(x=0; x<=255; x++)
	//	for(y=0; y<=211; y++)
	//		DrawPoint8(x, y, x + y);
	//VRAMtoVRAM(0,   0, 0, 1,   0, 0, 128, 212);
	//VRAMtoVRAM(0, 128, 0, 1, 128, 0, 128, 212);
	//ClearSprite();

	//----------------------------------------
	// Copy cars to VRAM
	PrintSprite(64, 64, "INIT\nCARS");
	for(i=0; i<16; i++)
	{
		RAMtoVRAM(1, i * 13, 212 + 0,  13, 11, (u16)&car1[13 * 11 * i]);
		RAMtoVRAM(1, i * 13, 212 + 11, 13, 11, (u16)&car2[13 * 11 * i]);
		RAMtoVRAM(1, i * 13, 212 + 22, 13, 11, (u16)&car3[13 * 11 * i]);
		RAMtoVRAM(1, i * 13, 212 + 33, 13, 11, (u16)&car4[13 * 11 * i]);
	}
	ClearSprite();

	//----------------------------------------
	// Initialize background backup
	PrintSprite(64, 64, "INIT\nTRACK\nBACKUP");
	for(i=0; i<4; i++)
	{
		InitializePlayer(&ply[i], i, 50 + 50 * i, 100);
		//VRAMtoVRAM16(ScrPosX(ply[i].posX), (512 * 0) + ScrPosY(ply[i].posY), (13 * i) + (52 * 0), 212, 13, 11);
		//VRAMtoVRAM16(ScrPosX(ply[i].posX), (512 * 1) + ScrPosY(ply[i].posY), (13 * i) + (52 * 1), 212, 13, 11);
	}
	ClearSprite();


	//----------------------------------------
	// Main loop
	PrintSprite(64, 64, "LETS\nGO!");
	while(bEnd == 0)
	{
		SetPage8(page);
		page = 1 - page;

		//----------------------------------------
		// Player 1 gameplay
		curPly = &ply[0];
		keyLine = GetKeyMatrixLine(8);
		if((keyLine & KEY_LEFT) == 0)
		{
			curPly->rot++; 
			curPly->rot &= 0x0F;
		}
		if((keyLine & KEY_RIGHT) == 0)
		{
			curPly->rot--; 
			curPly->rot &= 0x0F;
		}
		if((keyLine & KEY_UP) == 0)
		{
			curPly->dX = g_Cosinus[curPly->rot];
			curPly->dY = g_Sinus[curPly->rot];
			curPly->speed += 2;
		}

		//----------------------------------------
		// Player 2 gameplay
		curPly = &ply[1];
		keyLine = GetKeyMatrixLine(5);
		if((keyLine & KEY_Z) == 0)
		{
			curPly->rot++; 
			curPly->rot &= 0x0F;
		}
		keyLine = GetKeyMatrixLine(3);
		if((keyLine & KEY_C) == 0)
		{
			curPly->rot--; 
			curPly->rot &= 0x0F;
		}
		keyLine = GetKeyMatrixLine(5);
		if((keyLine & KEY_X) == 0)
		{
			curPly->dX = g_Cosinus[curPly->rot];
			curPly->dY = g_Sinus[curPly->rot];
			curPly->speed += 2;
		}

		//----------------------------------------
		// Player 3 gameplay
		curPly = &ply[2];
		switch (Joystick(1)) // Joy 1 direction
		{
		case 2: // up-right
		case 3: // right
		case 4: // down-right
			curPly->rot--; 
			curPly->rot &= 0x0F;
			break;
		case 6: // down-left
		case 7: // left
		case 8:// up-left
			curPly->rot++; 
			curPly->rot &= 0x0F;
			break;
		}
		if(Joytrig(1) != 0) // Joy 1 Button A
		{
			curPly->dX = g_Cosinus[curPly->rot];
			curPly->dY = g_Sinus[curPly->rot];
			curPly->speed += 2;
		}

		//----------------------------------------
		// Player 4 gameplay
		curPly = &ply[3];
		switch (Joystick(2)) // Joy 2 direction
		{
		case 2: // up-right
		case 3: // right
		case 4: // down-right
			curPly->rot--; 
			curPly->rot &= 0x0F;
			break;
		case 6: // down-left
		case 7: // left
		case 8:// up-left
			curPly->rot++; 
			curPly->rot &= 0x0F;
			break;
		}
		if(Joytrig(2) != 0) // Joy 2 Button A
		{
			curPly->dX = g_Cosinus[curPly->rot];
			curPly->dY = g_Sinus[curPly->rot];
			curPly->speed += 2;
		}

		//----------------------------------------
		// Restore background
		for(i=0; i<4; i++)
		{
			//VRAMtoVRAM16((13 * i) + (52 * page), 212, ScrPosX(ply[i].prevX), (512 * page) + ScrPosY(ply[i].prevY), 13, 11);
			buffer36.DX = ply[i].prevX;
			buffer36.DX /= 256;
			buffer36.DX -= 7;
			buffer36.DY = (256 * page) + ScrPosY(ply[i].prevY);
			buffer36.NX = 13;
			buffer36.NY = 11;
			buffer36.CLR = 0x92;
			buffer36.ARG = 0;
			buffer36.CMD = 0xC0;
			VPDCommand36((u16)&buffer36);			
			//FillVRAM(ScrPosX(ply[i].prevX), (256 * page) + ScrPosY(ply[i].prevY), 13, 11, 0x92);
		}

		//----------------------------------------
		// Update physic
		for(i=0; i<4; i++)
		{
			curPly = &ply[i];

			curPly->speed--;
			if(curPly->speed < 0)
				curPly->speed = 0;
			else if(curPly->speed > 7)
				curPly->speed = 7;

			curPly->prevX = curPly->posX;
			curPly->prevY = curPly->posY;
			curPly->posX += curPly->speed * curPly->dX;
			curPly->posY -= curPly->speed * curPly->dY;

			// Backup
			//VRAMtoVRAM16(ScrPosX(ply[i].posX), (512 * page) + ScrPosY(ply[i].posY), (13 * i) + (52 * page), 212, 13, 11);
		}

		//----------------------------------------
		// Draw cars
		for(i=0; i<4; i++)
		{
			VRAMtoVRAMTrans(1, 13 * ply[i].rot, 212 + (11 * i), page, ScrPosX(ply[i].posX), ScrPosY(ply[i].posY), 13, 11);
		}

		waitRetrace();

		//keyCode = KeyPressed();
		//if(keyCode == 13)
		//	bEnd = 1;
	}
}

/** Initialize player data */
void InitializePlayer(Player* ply, u8 car, u8 posX, u8 posY)
{
	ply->car = car; // car index
	ply->posX = posX << 8; // position X
	ply->posY = posY << 8; // position Y
	ply->prevX = posX << 8; // previous position X
	ply->prevY = posY << 8; // previous position Y
	ply->rot = 0; // rotation
	ply->dX = 0; // velocity X
	ply->dY = 0; // velocity Y
	ply->speed = 0;
}

/**
 *
 */
void SetScreen8(u8 lines)
{
	lines;

	__asm

		//; Passage en SCREEN 8
	di //; on interdit les interruptions

		//; - modification registre 0 -
		ld		a,(RG0SAV)
		set		#3,a           //; bit 3 a 1 (mode 8)
		set		#2,a           //; bit 2 a 1 (mode 8)
		set		#1,a           //; bit 1 a 1 (mode 8)
		ld		(RG0SAV),a
		out		(VDP_ADDR),a

		ld		a,VDP_REG(0)
		out		(VDP_ADDR),a

		//; - modification registre 1 -
		ld		a,(RG1SAV)
		res		#4,a           //; bit 4 a 0 (mode 8)
		res		#3,a           //; bit 3 a 0 (mode 8)
		ld		(RG1SAV),a
		out		(VDP_ADDR),a

		ld		a,VDP_REG(1)
		out		(VDP_ADDR),a

		//; - modification registre 2 -
		ld		a,#0x1F // 00011111b (addr de la page graphique 0)
		out		(VDP_ADDR),a

		ld		a,VDP_REG(2)
		out		(VDP_ADDR),a

		//; - modification registre 9 -
		ld		a,(RG9SAV)
		res		#7,a           //; bit 7 a 0
		//and		#LINES_MASK ;// 0111 1111
		or		4(ix) ;// 192 (0x00) or 212 lines (0x80)?
		ld		(RG9SAV),a
		out		(VDP_ADDR),a

		ld		a,VDP_REG(9)
		out		(VDP_ADDR),a

	ei //; on autorise les interruptions

	
	__endasm;
}

/***/
//                    4            5         7-6      9-8
void SetSpriteMode(u8 activate, u8 flag, u16 tgs, u16 tas)
{
	activate; flag; tgs; tas;

	__asm

		//; Passage en SCREEN 8
	di //; on interdit les interruptions

		//; - modification registre 1 -
		ld		a,(RG1SAV)
		and		#0xFC ;// 1111 1100
		or		5(ix)
		ld		(RG1SAV),a
		out		(VDP_ADDR),a

		ld		a,VDP_REG(1)
		out		(VDP_ADDR),a

		//; - modification registre 5 -
		//ld		a,#0xEE ;// TAS addr (low)
		ld		a,8(ix) ;// TAS addr (low)
		out		(VDP_ADDR),a

		ld		a,VDP_REG(5)
		out		(VDP_ADDR),a

		//; - modification registre 6 -
		//ld		a,#0x1F ;// TGS addr
		ld		a,6(ix) ;// TGS addr
		out		(VDP_ADDR),a

		ld		a,VDP_REG(6)
		out		(VDP_ADDR),a

		//; - modification registre 8 -
		ld		a,(RG8SAV)
		and		#0xFD ;// 1111 1101
		or		4(ix)
		ld		(RG8SAV),a
		out		(VDP_ADDR),a

		ld		a,VDP_REG(8)
		out		(VDP_ADDR),a

		//; - modification registre 11 -
		//ld		a,#0x01 ;// TAS addr (high)
		ld		a,9(ix) ;// TAS addr (high)
		out		(VDP_ADDR),a

		ld		a,VDP_REG(11)
		out		(VDP_ADDR),a

	ei //; on autorise les interruptions
		
	__endasm;
}


/** Set frequence 50/60Hz */
void SetFreq(u8 freq)
{
	freq;

	WaitForVDP();

	__asm

		//; - modification registre 9 -
		ld		a,(RG9SAV)
		and		#FREQ_MASK ;// 1111 1101
		or		4(ix)
		ld		(RG9SAV),a
	di //; on interdit les interruptions
		out		(VDP_ADDR),a

		ld		a,VDP_REG(9)
	ei //; on autorise les interruptions
		out		(VDP_ADDR),a

	__endasm;
}

/** Set current page for mode 8 */
void SetPage8(i8 page)
{
	page;

	__asm
		//; - modification registre 2 -
		ld      a,4(ix)       //; donnee
		rrca
		rrca
		rrca
		or		#0x1F         //; += 00011111b
	di //; on interdit les interruptions
		out		(VDP_ADDR),a  
		ld		a,VDP_REG(2)     //; write to register R#2
	ei //; on autorise les interruptions
		out		(VDP_ADDR),a  

	__endasm;
}

/**
 * PSET (128,96),255
 */
void DrawPoint8(char posX, char posY, char color)
{
	posX; posY;	color;

	WaitForVDP();

	__asm

		//; - Preparation des registres -
		//; - X=128 -
		ld    a,4(ix)    //; donnee
	di //; on interdit les interruptions
		out   (VDP_ADDR),a
		ld    a,VDP_REG(36) //; a ecrire sur le registre 36
		out   (VDP_ADDR),a

		xor   a //; donnee
		out   (VDP_ADDR),a
		ld    a,VDP_REG(37) //; a ecrire sur le registre 37
		out   (VDP_ADDR),a

		//; - Y=96 -
		ld    a,5(ix)     //; donnee
		out   (VDP_ADDR),a
		ld    a,VDP_REG(38) //; a ecrire sur le registre 38
		out   (VDP_ADDR),a

		xor   a //; donnee
		out   (VDP_ADDR),a
		ld    a,VDP_REG(39) //; a ecrire sur le registre 39
		out   (VDP_ADDR),a

		//; - Couleur=255 -
		ld    a,6(ix)    //; donnee
		out   (VDP_ADDR),a
		ld    a,VDP_REG(44) //; a ecrire sur le registre 44
		out   (VDP_ADDR),a

		//; - Selection page 0 -
		xor   a //; donnee
		out   (VDP_ADDR),a
		ld    a,VDP_REG(45) //; a ecrire sur le registre 45
		out   (VDP_ADDR),a

		//; Execution macro VDP
		ld    a,#0x50  //; donnee (01010000b)
		out   (VDP_ADDR),a
		ld    a,VDP_REG(46)     //; a ecrire sur le registre 46
	ei //; on autorise les interruptions
		out   (VDP_ADDR),a

	__endasm;
}

/**
 * LINE (128,96),(190,56),255
 */
void DrawLine8(char posX1, char posY1, char posX2, char posY2, char color)
{
	posX1; posY1; posX2; posY2; color;

	WaitForVDP();
/*

	__asm

		//; a:							f: 
		//; b: DX						c: DY
		//; d: Maj						e: Min
		//; h: VDP Command argument		l:

		//; - X -
		ld    a,4(ix)                  //; input X1 parameter
		di
		out   (VDP_ADDR),a
		ld    a,#0x80+#36              //; write to register R#36
		out   (VDP_ADDR),a

		xor   a                        //; set A to 0 (only use 8 bits coordinate)
		out   (VDP_ADDR),a
		ld    a,#0x80+#37              //; write to register R#37
		out   (VDP_ADDR),a

		//; - Y -
		ld    a,5(ix)                  //; input Y1 parameter
		out   (VDP_ADDR),a
		ld    a,#0x80+#38              //; write to register R#38
		out   (VDP_ADDR),a

		xor   a                        //; set A to 0 (only use 8 bits coordinate)
		out   (VDP_ADDR),a
		ld    a,#0x80+#39              //; write to register R#39
		out   (VDP_ADDR),a

		//; - Color -
		ld    a,8(ix)                  //; input color parameter
		out   (VDP_ADDR),a
		ld    a,#0x80+#44              //; write to register R#44
		out   (VDP_ADDR),a

		ld    h,#0
		//; - Compute DX -
		ld    a,6(ix)                  //; input X1 parameter
		ld    b,4(ix)                  //; input X2 parameter
		sbc   a,b                      //; compute DX
		ld    b,a                      //; Put result in B
		//; - Check DX sign -
		cp    #0x80                    //; comparing the unsigned A to 128
		jr    c,DX_Is_Positive         //; if it is less, then jump to the label given
		neg                            //; multiplying A by -1
		ld    b,a                      //; Put result in B
		ld    a,h
		add   a,#0x04                  //; set DIX flag for command argument register
		ld    h,a
	DX_Is_Positive:                    //; after this label, A is between 0 and 128
	
		//; - Compute DY -
		ld    a,7(ix)                  //; input Y1 parameter
		ld    c,5(ix)                  //; input Y2 parameter
		sbc   a,c                      //; compute DY
		ld    c,a                      //; Put result in C
		//; - Check DY sign -
		cp    #0x80                    //; comparing the unsigned A to 128
		jr    c,DY_Is_Positive         //; if it is less, then jump to the label given
		neg                            //; multiplying A by -1
		ld    c,a                      //; Put result in C
		ld    a,h
		add   a,#0x08                  //; set DIY flag for command argument register
		ld    h,a
	DY_Is_Positive:                    //; after this label, A is between 0 and 128

		//; - Check DX > DY -
		ld    a,c
		cp    a,b
		jr    c,DX_Superior_DY

	DX_Superior_DY: // DX > DY

		ld    d,b
		ld    e,a
		jp    End_Compare

	DY_Superior_DX: // DX <= DY

		ld    d,a
		ld    e,b
		ld    a,h
		add   a,#0x01                  //; set MAJ flag for command argument register
		ld    h,a

	End_Compare:

		//; - Maj - 
		ld    a,d                      //; abs(max(DX, DY))
		out   (VDP_ADDR),a
		ld    a,#0x80+#40              //; write to register R#40
		out   (VDP_ADDR),a

		xor   a                        //; set 'a' to 0 (only use 8 bits coordinate)
		out   (VDP_ADDR),a
		ld    a,#0x80+#41              //; write to register R#41
		out   (VDP_ADDR),a

		//; - Min - 
		ld    a,e                      //; abs(min(DX, DY))
		out   (VDP_ADDR),a
		ld    a,#0x80+#42              //; write to register R#42
		out   (VDP_ADDR),a

		xor   a                        //; set 'a' to 0 (only use 8 bits coordinate)
		out   (VDP_ADDR),a
		ld    a,#0x80+#43              //; write to register R#43
		out   (VDP_ADDR),a

		//; - Set arguments -
		ld    a,h                      //; argument flags
		out   (VDP_ADDR),a
		ld    a,#0x80+#45              //; write to register R#45
		out   (VDP_ADDR),a

		//; Execute VDP macro
		ld    a,#0x70                  //; Executing the LINE command (01110000b)
		out   (VDP_ADDR),a
		ld    a,#0x80+#46              //; write to register R#46
		out   (VDP_ADDR),a

		ei

	__endasm;
*/
}

/**
 *
 */
void waitRetrace()
{
	__asm

		di
	WAIT_RETRACE:
		in		a,(0x99)
		and		#0x80
		cp		#0
		jr		z, WAIT_RETRACE
		ei

	__endasm;
}

/**
 * Commande VDP (écriture registres 32 à 46)
 */ 
void WaitForVDP()
{
	__asm
		
		//; Attente libération VDP
		ld		a,#2
	di //; on interdit les interruptions
		out		(VDP_ADDR),a
		ld		a,VDP_REG(15)
		out		(VDP_ADDR),a
	WAIT_VDP:	
		nop
		in		a,(VDP_ADDR)
		rra
		jr		c,WAIT_VDP		
		xor		a
		out		(VDP_ADDR),a
		ld		a,VDP_REG(15)
	ei //; on autorise les interruptions
		out		(VDP_ADDR),a		//; RAZ du registre 15

	__endasm;
}

/**
 *
 */
void WriteToVRAM8(u16 addr, u8 value)
{
	addr; value;

	WaitForVDP();

	
	__asm
		;// Set 0 to register 14 (we don't use address bits 14-16)
		ld		a,5(ix)     ;// Bits 14-15
		and		#0xC0		;// Keep only 2 last bits
        rla
        rla
	di //; on interdit les interruptions
		out		(VDP_ADDR),a
		ld		a,VDP_REG(14)
		out		(VDP_ADDR),a
		
		ld		a,4(ix)     ;// Bits 0-7
		out		(VDP_ADDR),a

		ld		a,5(ix)     ;// Bits 8-13
		and		#0x3F		;// Set 2 last bits to 0
		or		#0x40		;// write access
		out		(VDP_ADDR),a

		;// Write value
		ld		a,6(ix)
	ei //; on autorise les interruptions
		out		(VDP_DATA),a

	__endasm;
}

/**
 *
 */ 
void VPDCommandLoop(u16 address)
{
	address;

	__asm

		ld l,4(ix)
		ld h,5(ix)

		di

	SEND_NEXT_COLOR:

		inc		hl

		;// 3 - envoyer l'octet suivant à mettre en VRAM dans le registre 45 (le premier octet a été traité à l'étape 1) par un OUT du Z80
		;// Send next color
		ld		a,(hl)
		out		(VDP_ADDR),a
		ld		a,VDP_REG(44)
		out		(VDP_ADDR),a

	WAIT_REG2:	

		;// 4 - lire le registre d'état 2 (status)
		;// Get status ragister #2
		ld		a,#2
		out		(VDP_ADDR),a
		ld		a,VDP_REG(15)
		out		(VDP_ADDR),a

		;// 5 - lire le registre d'état du bit CE, si celui-ci est à 0, alors l'instruction est terminée, sinon on passe à l'étape 6
		nop
		in		a,(VDP_ADDR)
		ld		b,a ;// backup reg#2
		rra     ;// send CE bit into Carry
		jr		nc,COLOR_COPY_END

		;// 6 - tester l'état du bit TR, si celui-ci se trouve à 0, alors le processeur vidéo n'est pas
		;// prêt à recevoir l'octet suivant, recommencer en 4. Si par contre, ce bit est à 1, reprendre toute l'opération au niveau 3
		ld		a,b ;// restore reg#2
		rla     ;// send TR bit in the Carry
		jr		nc,WAIT_REG2
		jp		SEND_NEXT_COLOR

	COLOR_COPY_END:

		;// Clean status ragister #2
		xor		a
		out		(VDP_ADDR),a
		ld		a,VDP_REG(15)
		out		(VDP_ADDR),a

		ei

	__endasm;
}


/** Should be inline */
void RAMtoVRAM16(u16 dx, u16 dy, u16 nx, u16 ny, u16 ram)
{
	VdpBuffer36 buffer;
	
	buffer.DX = dx;
	buffer.DY = dy;
	buffer.NX = nx;
	buffer.NY = ny;
	buffer.CLR = ((u8*)ram)[0];
	buffer.ARG = 0;
	buffer.CMD = 0xF0;
	VPDCommand36((u16)&buffer);
	VPDCommandLoop(ram);
}


/** Should be inline */
void RAMtoVRAM(u8 page, u8 dx, u8 dy, u8 nx, u8 ny, u16 ram)
{
	VdpBuffer36 buffer;
	
	buffer.DX = dx;
	buffer.DY = dy + ((u16)page << 8);
	buffer.NX = nx;
	buffer.NY = ny;
	buffer.CLR = ((u8*)ram)[0];
	buffer.ARG = 0;
	buffer.CMD = 0xF0;
	VPDCommand36((u16)&buffer);
	VPDCommandLoop(ram);
}

/** Should be inline */
void RAMtoVRAMTrans(u8 page, u8 dx, u8 dy, u8 nx, u8 ny, u16 ram)
{
	VdpBuffer36 buffer;
	
	buffer.DX = dx;
	buffer.DY = dy + ((u16)page << 8);
	buffer.NX = nx;
	buffer.NY = ny;
	buffer.CLR = ((u8*)ram)[0];
	buffer.ARG = 0;
	buffer.CMD = 0xB8;
	VPDCommand36((u16)&buffer);
	VPDCommandLoop(ram);
}

/** Should be inline */
void FillVRAM(u16 dx, u16 dy, u16 nx, u16 ny, u8 color)
{
	VdpBuffer36 buffer;
	
	buffer.DX = dx;
	buffer.DY = dy;
	buffer.NX = nx;
	buffer.NY = ny;
	buffer.CLR = color;
	buffer.ARG = 0;
	buffer.CMD = 0xC0;
	VPDCommand36((u16)&buffer);
}

/** Should be inline */
void VRAMtoVRAM(u8 sPage, u8 sx, u8 sy, u8 dPage, u8 dx, u8 dy, u8 nx, u8 ny)
{
	VdpBuffer32 buffer;
	
	buffer.SX = sx;
	buffer.SY = sy + ((u16)sPage << 8);
	buffer.DX = dx;
	buffer.DY = dy + ((u16)dPage << 8);
	buffer.NX = nx;
	buffer.NY = ny;
	buffer.CLR = 0;
	buffer.ARG = 0;
	buffer.CMD = 0xD0;
	VPDCommand32((u16)&buffer);
}

void VRAMtoVRAM16(u16 sx, u16 sy, u16 dx, u16 dy, u16 nx, u16 ny)
{
	VdpBuffer32 buffer;
	
	buffer.SX = sx;
	buffer.SY = sy;
	buffer.DX = dx;
	buffer.DY = dy;
	buffer.NX = nx;
	buffer.NY = ny;
	buffer.CLR = 0;
	buffer.ARG = 0;
	buffer.CMD = 0xD0;
	VPDCommand32((u16)&buffer);
}

/** Should be inline */
void VRAMtoVRAMTrans(u8 sPage, u8 sx, u8 sy, u8 dPage, u8 dx, u8 dy, u8 nx, u8 ny)
{
	VdpBuffer32 buffer;
	
	buffer.SX = sx;
	buffer.SY = sy + ((u16)sPage << 8);
	buffer.DX = dx;
	buffer.DY = dy + ((u16)dPage << 8);
	buffer.NX = nx;
	buffer.NY = ny;
	buffer.CLR = 0;
	buffer.ARG = 0;
	buffer.CMD = 0x98;
	VPDCommand32((u16)&buffer);
}








/**
 * Commande VDP (écriture registres 32 à 46)
 */ 
void VPDCommand32(u16 address)
{
	address;

	WaitForVDP();

	__asm

		ld l,4(ix)
		ld h,5(ix)
		//; Envoi données VDP
		ld	a,#32		//; R32 avec incrémentation
	di
		out	(VDP_ADDR),a
		ld	a,VDP_REG(17)
		out	(VDP_ADDR),a         //; Ecriture séquentielle
		ld	c,VDP_ADDR+#2         //; Port séquentiel
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
	ei                      //; "EI" anticipé
		outi

	__endasm;
}

/**
 * Commande VDP (écriture registres 36 à 46)
 */ 
void VPDCommand36(u16 address)
{
	address;

	WaitForVDP();

	__asm

		ld l,4(ix)
		ld h,5(ix)
		;// Envoi données VDP
		ld	a,#36		;// R36 avec incrémentation
	di
		out	(VDP_ADDR),a
		ld	a,VDP_REG(17)
		out	(VDP_ADDR),a         ;// Ecriture séquentielle
		ld	c,VDP_ADDR+#2         ;// Port séquentiel
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
	ei                      ;// "EI" anticipé
		outi

	__endasm;
}

void PrintSprite(u8 X, u8 Y, const char* text)
{
	u8 sprtIdx = 0;
	u8 curX = X;
	u8 curY = Y;
	while(text[sprtIdx] != 0)
	{
		if(text[sprtIdx] == '\n')
		{
			curX = X;
			curY += 9;
		}
		else
		{
			SetSprite(sprtIdx, curX, curY, text[sprtIdx] - '0');
			curX += 8;
		}
		sprtIdx++;
	}
	SetSprite(sprtIdx, 0, 216, 0);
}

void ClearSprite()
{
	SetSprite(0, 0, 216, 0);
}

void SetSprite(u8 index, u8 X, u8 Y, u8 shape)
{
	EntryTAS sprt;
	sprt.posX = X;
	sprt.posY = Y;
	sprt.index = shape;
	//RAMtoVRAM(0, 0, 247, 4, 1, (u16)&sprt);
	//RAMtoVRAM(0, 0, 245, 8, 1, (u16)&defaultColor);
	RAMtoVRAM16((index * 16) % 256, 244 + (index / 16), 8, 1, (u16)&defaultColor);
	RAMtoVRAM16((index * 4) % 256, 246 + (index / 64), 4, 1, (u16)&sprt);
}
