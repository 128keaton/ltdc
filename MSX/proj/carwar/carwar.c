/* 3D on MSX */

#pragma preproc_asm +
#pragma sdcc_hash +

//----------------------------------------
// D E F I N E S

#define VDP_DATA #0x98   // VDP data port (VRAM read/write)
#define VDP_ADDR #0x99   // VDP address (write only)
#define VDP_STAT #0x99   // VDP status (read only)
#define VDP_PALT #0x9A   // VDP palette latch (write only)
#define VDP_REGS #0x9B   // VDP register access (write only)

#define VDP_REG(num) #(0x80+num)

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

//----------------------------------------
// M A C R O S

#define POSI(a)    (a)
#define NEGA(a)    ((^a)++)

#define M2U(a)     ((a) << 8)
#define U2M(a)     ((a) >> 8)
#define UxU(a, b)  (((a) >> 4) * ((b) >> 4))
#define UxU2(a, b) ((((a) >> 4) * (b)) >> 4)

//----------------------------------------
// T Y P E S

typedef char i8;
typedef unsigned char u8;
typedef int i16;
typedef unsigned int u16;

//typedef Vec3 int[3];
//typedef struct { i16 x, y, z, w; } ShortVec;
typedef struct { i16 x, y, z; } ShortVec;
//typedef ShortMat3 ShortVec[3];
//typedef ShortMat4 ShortVec[4];

typedef struct
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
} VdpBuffer;

//----------------------------------------
// P R O T O T Y P E S

void MainLoop();
//void SetShortVec(ShortVec* ret, i16 x, i16 y, i16 z);
//void TransXZ(ShortVec* ret, const ShortVec* vec, u8 g_Angle, const ShortVec* pos);
//void Project(ShortVec* ret, const ShortVec* vec, const ShortVec* cam);
//void TransXZIndex(i8 i);
//void Update();
void SetScreen8();
void SetPage8(i8 page);
void DrawPoint8(char posX, char posY, char color);
void DrawLine8(char posX1, char posY1, char posX2, char posY2, char color);
void DrawLine(int posX1, int posY1, int posX2, int posY2, char color);
void DrawLineSimple();
void VPDCommand(int address);
void waitRetrace();
void WaitForVDP();
char Joystick(char n);
char Joytrig(char n);
u8 GetKeyMatrixLine(u8 n);
void WriteToVRAM8(i16 addr, u8 value);
void SetTo50Hz();
void SetTo60Hz();
//void Fill8(u8 px, u8 py, u8 sx, u8 sy, u8 color);
void HMMC(u8 page, u8 dx, u8 dy, u8 nx, u8 ny, u16 ram);
void SetupHMMC(u16 address);

//----------------------------------------
// D A T A

// VDP command buffer
//u16 SX = 0;  // 32-33
//u16 SY = 0;  // 34-35
//u16 DX = 0;  // 36-37
//u16 DY = 0;  // 38-39
//u16 NX = 0;  // 40-41
//u16 NY = 0;  // 42-43
//u8  CLR = 0; // 44
//u8  ARG = 0; // 45
//u8  CMD = 0; // 46

// Sprites
// SX : 13
// SY : 11
// 16 sprites/car (208 px)
// 4 cars (44 px)
const u8 g_Sprite[8*8] =
{
	254, 254, 254, 254, 254, 254, 254, 254,
	254, 100,   0,   0,   0,   0, 200, 254,
	254,   0, 100,   0,   0, 200,   0, 254,
	254,   0,   0, 100, 200,   0,   0, 254,
	254,   0,   0, 200, 100,   0,   0, 254,
	254,   0, 200,   0,   0, 100,   0, 254,
	254, 200,   0,   0,   0,   0, 100, 254,
	254, 254, 254, 254, 254, 254, 254, 254,
};

//ShortVec g_Camera;
//ShortVec g_Position;
//u8 g_Angle, g_AngleIndex;

#define POINT_NUM 8//5
//ShortVec g_Local[POINT_NUM];
//ShortVec g_World[POINT_NUM];
//ShortVec g_Screen[POINT_NUM];
//VdpBuffer g_VdpBuffer;

///
sfr at 0xA8 g_slotPort;

/**
 * Program entry point
 */
void main(void)
{
	_asm
		di
		ld sp, (#0xFC4A)
		ei
	_endasm;

	g_slotPort = (g_slotPort & 0xCF) | ((g_slotPort & 0x0C) << 2);

	MainLoop();
}

//#include "trigo.inc"
//#include "proj.inc"

/**
 *
 */
void MainLoop()
{
	u8 clsScreen8[15] = 
	{// 32 33 34 35 36 37 38 39 40 41 42   43 44 45 46
		0, 0, 0, 0, 0, 0, 0, 0,	0, 1, 212, 0, 0, 0, 0xC0
	};

	u8 x = 128, y = 128;
	i16 i, j;
	u8 bEnd = 0/*, keyCode*/;
	i16 addr;
	i8 page = 0;
	u8 keyLine;

	//SetShortVec(&g_Local[0], M2U(1),  M2U(1),  M2U(-1));
	//SetShortVec(&g_Local[1], M2U(1),  M2U(-1), M2U(-1));
	//SetShortVec(&g_Local[2], M2U(-1), M2U(-1), M2U(-1));
	//SetShortVec(&g_Local[3], M2U(-1), M2U(1),  M2U(-1));
	//SetShortVec(&g_Local[4], M2U(1),  M2U(1),  M2U(1));
	//SetShortVec(&g_Local[5], M2U(1),  M2U(-1), M2U(1));
	//SetShortVec(&g_Local[6], M2U(-1), M2U(-1), M2U(1));
	//SetShortVec(&g_Local[7], M2U(-1), M2U(1),  M2U(1));

	//SetShortVec(&g_Camera, M2U(0), M2U(0), M2U(3));
	//
	//SetShortVec(&g_Position, M2U(0), M2U(0), M2U(0));
	//
	//g_Angle = 30;

	SetTo60Hz();
	SetScreen8();

	//Fill8(32, 32, 32, 32, 0xB0);

	VPDCommand((int)&clsScreen8);

	while(bEnd == 0)
	{
	/*	DrawPoint8(x,     y - 1, 0);
		DrawPoint8(x + 1, y,     0);
		DrawPoint8(x - 1, y,     0);
		DrawPoint8(x,     y + 1, 0);*/

		//addr = y;
		//addr <<= 8;
		//addr += x;
		addr = x + (y << 8);
		WriteToVRAM8(addr, 0x0F);
		HMMC(0, 100, 100, 8, 8, (u16)&g_Sprite);

		//x++;
	    if((i = Joystick(0) | Joystick(1) | Joystick(2)) != 0)
		{
			switch (i)
			{
			case 1: y--; break;
			case 2: y--; x++; break;
			case 3: x++; break;
			case 4: y++; x++; break;
			case 5: y++; break;
			case 6: y++; x--; break;
			case 7: x--; break;
			case 8: y--; x--; break;
			}

			//switch (i)
			//{
		 //       case 1: // ↑
			//		g_Position.y -= 10;
			//		break;
		 //       case 3: // →
			//		g_Position.x += 10;
			//		break;
			//	case 5: // ↓
			//		g_Position.y += 10;
			//		break;
		 //       case 7: // ←
			//		g_Position.x -= 10;
			//		break;
			//}
		}

	/*	DrawPoint8(x,     y - 1, 255);
		DrawPoint8(x + 1, y,     255);
		DrawPoint8(x - 1, y,     255);
		DrawPoint8(x,     y + 1, 255);*/

		//g_AngleIndex = g_Angle >> 2;
		//Update();
		//g_Angle += 4;

		for(i=0; i<10; i++) // rows
		{
			keyLine = GetKeyMatrixLine(i);
			for(j=0; j<8; j++) // characters
			{
				if(keyLine & 1 << j)
					DrawPoint8(10 + j, 10 + i, 0);
				else
					DrawPoint8(10 + j, 10 + i, 255);
			}
		}

		//for(i=0; i<10; i++) // rows
		//{
			for(j=0; j<256; j++) // characters
			{
				DrawPoint8(j, i, j);
			}
		//}


		//page = DISP_PAGE - page;
		//SetPage8(page);

		//waitRetrace();

		/*keyCode = KeyPressed();
		if(keyCode == 13)
			bEnd = 1;*/
	}
}

/**
 *
 */
//void SetShortVec(ShortVec* ret, i16 x, i16 y, i16 z)
//{
//	ret->x = x;
//	ret->y = y;
//	ret->z = z;
//}

/**
 *
 */
//void TransXZ(ShortVec* ret, const ShortVec* vec, u8 g_Angle, const ShortVec* pos)
//{
//	g_Angle >>= 2; 
//	ret->x = UxU(vec->x, g_Cosinus[g_Angle]) - UxU(vec->z, g_Sinus[g_Angle]);
//	ret->y = vec->y + pos->y;
//	ret->z = UxU(vec->x, g_Sinus[g_Angle]) + UxU(vec->z, g_Cosinus[g_Angle]);
//}

/**
 * 
 */
//void TransXZIndex(i8 i)
//{
//	g_World[i].x = UxU(g_Local[i].x, g_Cosinus[g_AngleIndex]) - UxU(g_Local[i].z, g_Sinus[g_AngleIndex]) + g_Position.x;
//	g_World[i].y = g_Local[i].y + g_Position.y;
//	g_World[i].z = UxU(g_Local[i].x, g_Sinus[g_AngleIndex]) + UxU(g_Local[i].z, g_Cosinus[g_AngleIndex]) + g_Position.z;
//}

/**
 *
 */
//void Project(ShortVec* ret, const ShortVec* vec, const ShortVec* cam)
//{
//#if 1
//	ret->z = ((vec->z - cam->z) >> 5);
//	ret->x = 128 + (vec->x - cam->x) / ret->z;
//	ret->y = 106 + (vec->y - cam->y) / ret->z;
//#else
//	ret->z = ((vec->z - cam->z) >> 5);
//	if(ret->z > 0)
//	{
//		ret->x = 0;
//		ret->y = 0;
//	}
//	else
//	{
//		ret->x = 128 + UxU2(vec->x - cam->x, g_ProjectionX[ret->z]);
//		ret->y = 106 + UxU2(vec->y - cam->y, g_ProjectionY[ret->z]);
//	}
//#endif
//}

/**
 * Update
 */
//void Update()
//{
//	i8 i;
//
//#define DRAW_LINE(sx, sy, dx, dy, clr) SX = sx; SY = sy; DX = dx; DY= dy; CLR = clr; DrawLineSimple();
//
//	DRAW_LINE(g_Screen[0].x, g_Screen[0].y, g_Screen[1].x, g_Screen[1].y, 0);
//	DRAW_LINE(g_Screen[1].x, g_Screen[1].y, g_Screen[2].x, g_Screen[2].y, 0);
//	DRAW_LINE(g_Screen[2].x, g_Screen[2].y, g_Screen[3].x, g_Screen[3].y, 0);
//	DRAW_LINE(g_Screen[3].x, g_Screen[3].y, g_Screen[0].x, g_Screen[0].y, 0);
//
//	DRAW_LINE(g_Screen[4].x, g_Screen[4].y, g_Screen[5].x, g_Screen[5].y, 0);
//	DRAW_LINE(g_Screen[5].x, g_Screen[5].y, g_Screen[6].x, g_Screen[6].y, 0);
//	DRAW_LINE(g_Screen[6].x, g_Screen[6].y, g_Screen[7].x, g_Screen[7].y, 0);
//	DRAW_LINE(g_Screen[7].x, g_Screen[7].y, g_Screen[4].x, g_Screen[4].y, 0);
//
//	DRAW_LINE(g_Screen[0].x, g_Screen[0].y, g_Screen[4].x, g_Screen[4].y, 0);
//	DRAW_LINE(g_Screen[1].x, g_Screen[1].y, g_Screen[5].x, g_Screen[5].y, 0);
//	DRAW_LINE(g_Screen[2].x, g_Screen[2].y, g_Screen[6].x, g_Screen[6].y, 0);
//	DRAW_LINE(g_Screen[3].x, g_Screen[3].y, g_Screen[7].x, g_Screen[7].y, 0);
//
//	for(i=0; i<POINT_NUM; i++)
//	{
//		// Clean
//		DrawPoint8(g_Screen[i].x, g_Screen[i].y, 0);
//
//		// Transform
//		//TransXZ(&g_World[i], &g_Local[i], g_Angle, &g_Position);
//		TransXZIndex(i);
//		Project(&g_Screen[i], &g_World[i], &g_Camera);
//
//		// Draw
//		DrawPoint8(g_Screen[i].x, g_Screen[i].y, 255);
//	}
//
//	DRAW_LINE(g_Screen[0].x, g_Screen[0].y, g_Screen[1].x, g_Screen[1].y, 128);
//	DRAW_LINE(g_Screen[1].x, g_Screen[1].y, g_Screen[2].x, g_Screen[2].y, 128);
//	DRAW_LINE(g_Screen[2].x, g_Screen[2].y, g_Screen[3].x, g_Screen[3].y, 128);
//	DRAW_LINE(g_Screen[3].x, g_Screen[3].y, g_Screen[0].x, g_Screen[0].y, 128);
//
//	DRAW_LINE(g_Screen[4].x, g_Screen[4].y, g_Screen[5].x, g_Screen[5].y, 128);
//	DRAW_LINE(g_Screen[5].x, g_Screen[5].y, g_Screen[6].x, g_Screen[6].y, 128);
//	DRAW_LINE(g_Screen[6].x, g_Screen[6].y, g_Screen[7].x, g_Screen[7].y, 128);
//	DRAW_LINE(g_Screen[7].x, g_Screen[7].y, g_Screen[4].x, g_Screen[4].y, 128);
//
//	DRAW_LINE(g_Screen[0].x, g_Screen[0].y, g_Screen[4].x, g_Screen[4].y, 128);
//	DRAW_LINE(g_Screen[1].x, g_Screen[1].y, g_Screen[5].x, g_Screen[5].y, 128);
//	DRAW_LINE(g_Screen[2].x, g_Screen[2].y, g_Screen[6].x, g_Screen[6].y, 128);
//	DRAW_LINE(g_Screen[3].x, g_Screen[3].y, g_Screen[7].x, g_Screen[7].y, 128);
//
//	/*ShortMat4 local2world =
//   {
//       { M2U(1),   0,        0,       0 },
//       { 0,        M2U(1),   0,       0 },
//       { 0,        0,        M2U(1),  0 },
//       { M2U(10),  M2U(10),  M2U(10), 0 },
//   };
//
//   ShortVec g_World[5];
//   loop(i, 5)
//       g_World[i] = Trans(g_Local[i], local2world);
//
//   ShortMat4 world2view =
//   {
//       { M2U(1),   0,        0,       0 },
//       { 0,        M2U(1),   0,       0 },
//       { 0,        0,        M2U(1),  0 },
//       { M2U(10),  M2U(10),  M2U(10), 0 },
//   };
//
//   ShortVec view[5];
//   loop(i, 5)
//       view[i] = Trans(g_World[i], local2world);*/
//
//   //ShortMat4 view2screen;
//   //CreateProfectionMatrix(view2screen);
//}

/**
 *
 */
void SetScreen8()
{
	_asm

		//; Passage en SCREEN 8
		//; - modification registre 0 -
		ld		a,(RG0SAV)
		set		#3,a           //; bit 3 a 1
		set		#2,a           //; bit 2 a 1
		set		#1,a           //; bit 1 a 1
		ld		(RG0SAV),a

		di                    //; on interdit les interruptions

		out		(VDP_ADDR),a
		ld		a,VDP_REG(0)
		out		(VDP_ADDR),a

		//; - modification registre 1 -
		ld		a,(RG1SAV)
		res		#4,a           //; bit 4 a 0
		res		#3,a           //; bit 3 a 0
		ld		(RG1SAV),a

		out		(VDP_ADDR),a
		ld		a,VDP_REG(1)
		out		(VDP_ADDR),a

		//; - modification registre 2 -
		ld		a,#0x1F // 00011111b
		out		(VDP_ADDR),a
		ld		a,VDP_REG(2)
		out		(VDP_ADDR),a

		ei                    //; on autorise les interruptions

	_endasm;
}

/**
 *
 */
void SetPage8(i8 page)
{
	page;

	_asm
		//; - modification registre 2 -
		ld      a,4(ix)       //; donnee
		or		#0x1F         //; += 00011111b
		di                    //; on interdit les interruptions
		out		(VDP_ADDR),a  
		ld		a,VDP_REG(2)     //; write to register R#2
		out		(VDP_ADDR),a  
		ei                    //; on autorise les interruptions

	_endasm;
}

/**
 * PSET (128,96),255
 */
void DrawPoint8(char posX, char posY, char color)
{
	posX; posY;	color;

	WaitForVDP();

	_asm

		//; - Preparation des registres -
		//; - X=128 -
		ld    a,4(ix)    //; donnee
		di
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
		out   (VDP_ADDR),a

		ei

	_endasm;
}

/**
 *
 */
//void DrawLine(int posX1, int posY1, int posX2, int posY2, char color)
//{
//	SX  = posX1; 
//	SY  = posY1; 
//	DX  = posX2; 
//	DY  = posY2; 
//	CLR = color;
//
//	DrawLineSimple();
//}

/**
 *
 */
//void DrawLineSimple()
//{
//	WaitForVDP();
//
//	_asm
//
//;//-----------------------------------------------------------
//;// Commande LINE du VDP
//;// Entrée : (SX,SY)-(DX,DY),R44
//;//-----------------------------------------------------------
//
//Do_Line_VDP:
//;// Calcul de DeltaY
//        xor     a               ;// RAZ du carry flag
//        ld      hl,(_DY)
//        ld      de,(_SY)
//        sbc     hl,de           ;// HL = DY-SY
//
//        rla                     ;// Préparation valeur R45 (DIY)
//        ld      (_ARG),a
//
//        and     a               ;// Test du résultat
//        jp      z,DeltaX        ;// si DeltaY est positif on passe à DeltaX
//        ex      de,hl           ;// sinon
//		ld      hl,#0            ;// on inverse
//        sbc     hl,de           ;// le résultat
//
//;// Calcul de DeltaX
//DeltaX: push    hl              ;// sauvegarde de DeltaY
//        xor     a               ;// RAZ du carry flag
//        ld      hl,(_DX)
//        ld      de,(_SX)
//        sbc     hl,de           ;// HL = DX-SX
//
//        ld      a,(_ARG)
//        rla
//        rla                     ;// Préparation valeur R45 (DIX)
//        ld      (_ARG),a
//
//        bit     1,a             ;// Test du résultat
//        jp      z,cpHLDE        ;// si DeltaX est positif on passe à MAJ
//        ex      de,hl           ;// sinon
//		ld      hl,#0            ;// on inverse
//        sbc     hl,de           ;// le résultat
//
//;// Calcul de MAJ
//cpHLDE: pop     de              ;// HL=abs(DeltaX) / DE=abs(DeltaY)
//        xor     a               ;// RAZ du carry flag
//
//        push    hl
//        sbc     hl,de           ;// Comparaison HL / DE
//        pop     hl
//
//        ld      a,(_ARG)
//        rla                     ;// Préparation valeur R45 (MAJ)
//        ld      (_ARG),a
//
//        bit     0,a             ;// Test du résultat
//        jp      z,DoIt          ;// si HL>DE on y va
//        ex      de,hl           ;// sinon on inverse les valeurs
//
//;// Exécution commande
//DoIt:   ld      (_NX),hl
//        ld      (_NY),de
//
//        ld      hl,(_SX)
//        ld      (_DX),hl
//
//        ld      hl,(_SY)
//        ld      (_DY),hl
//
//        ld      a,#0x70 ;//01110000b
//        ld      (_CMD),a         ;// Commande LINE
//
//	_endasm;
//
//	VPDCommand((int)&SX);
//}

/**
 * LINE (128,96),(190,56),255
 */
void DrawLine8(char posX1, char posY1, char posX2, char posY2, char color)
{
	posX1; posY1; posX2; posY2; color;

	WaitForVDP();
/*

	_asm

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

	_endasm;
*/
}

/**
 * Commande VDP (écriture registres 32 à 46)
 */ 
void VPDCommand(int address)
{
	address;

	WaitForVDP();

	_asm

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

	_endasm;
}

/**
 *
 */
void waitRetrace()
{
	_asm

		di
	WAIT_RETRACE:
		in		a,(0x99)
		and		#0x80
		cp		#0
		jr		z, WAIT_RETRACE
		ei

	_endasm;
}

/**
 * Commande VDP (écriture registres 32 à 46)
 */ 
void WaitForVDP()
{
	_asm
		
		//; Attente libération VDP
		ld		a,#2
		di
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
		out		(VDP_ADDR),a		//; RAZ du registre 15
		ei

	_endasm;
}

///
char Joystick(char n)
{
	n;
	_asm
		ld		a,4(ix)
		call	0x00d5
		ld		l,a
	_endasm;
}

///
char Joytrig(char n)
{
	n;
	_asm
		ld		a,4(ix)
		call	0x00d8
		ld		h,#0x00
		ld		l,a
	_endasm;
}

///
u8 GetKeyMatrixLine(u8 n)
{
	n;
	_asm
		ld		a,4(ix)
		call	0x0141
		ld		l,a
	_endasm;
}

void SetTo50Hz()
{
	WaitForVDP();

	_asm

		ld		a,#2
		di
		out		(VDP_ADDR),a ;// send 0 (50 hz)

		ld		a,VDP_REG(9)
		out		(VDP_ADDR),a ;// RAZ du registre 9

		ei
	_endasm;
}

void SetTo60Hz()
{
	WaitForVDP();

	_asm

		ld		a,#0
		di
		out		(VDP_ADDR),a ;// send 0 (60 hz)

		ld		a,VDP_REG(9)
		out		(VDP_ADDR),a ;// RAZ du registre 9

		ei
	_endasm;
}

/**
 *
 */
void WriteToVRAM8(i16 addr, u8 value)
{
	addr; value;

	WaitForVDP();

	
	_asm
		;// Set 0 to register 14 (we don't use address bits 14-16)
		ld		a,5(ix)     ;// Bits 14-15
		and		#0xC0		;// Keep only 2 last bits
        rla
        rla
		di
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
		out		(VDP_DATA),a

		ei
	_endasm;
		
	//_asm

	//	;// Set 0 to register 14 (we don't use address bits 14-16)
	//	xor		a
	//	di
	//	out		(VDP_ADDR),a
	//	ld		a,VDP_REG(14)
	//	out		(VDP_ADDR),a
	//	
	//	;// Set VRAM address to port 0
	//	ld		a,4(ix)
	//	out		(VDP_ADDR),a

	//	ld		a,5(ix)
	//	and		#0x3F		;// Set 2 last bits to 0
	//	or		#0x40		;// write access
	//	out		(VDP_ADDR),a

	//	;// Write value
	//	ld		a,6(ix)
	//	out		(VDP_DATA),a

	//	ei
	//_endasm;

}


/**
 *
 */
//void Fill8(u8 px, u8 py, u8 sx, u8 sy, u8 color)
//{
//	px; py; sx; sy; color;
//
//	WaitForVDP();
//
//	
//	_asm
//		di
//
//		ld		a,4(ix) ;// px
//		out		(VDP_ADDR),a
//		ld		a,VDP_REG(36) ;// DX 7-0
//		out		(VDP_ADDR),a
//		
//		xor		a ;// 0
//		out		(VDP_ADDR),a
//		ld		a,VDP_REG(37)
//		out		(VDP_ADDR),a ;// DX 8
//
//		ld		a,5(ix) ;// py
//		out		(VDP_ADDR),a
//		ld		a,VDP_REG(38) ;// DY 7-0
//		out		(VDP_ADDR),a
//		
//		xor		a ;// 0
//		out		(VDP_ADDR),a
//		ld		a,VDP_REG(39)
//		out		(VDP_ADDR),a ;// DY 9-8
//
//		ld		a,6(ix) ;// sx
//		out		(VDP_ADDR),a
//		ld		a,VDP_REG(40) ;// NX 7-0
//		out		(VDP_ADDR),a
//		
//		xor		a ;// 0
//		out		(VDP_ADDR),a
//		ld		a,VDP_REG(41)
//		out		(VDP_ADDR),a ;// NX 8
//
//		ld		a,7(ix) ;// sy
//		out		(VDP_ADDR),a
//		ld		a,VDP_REG(42) ;// NY 7-0
//		out		(VDP_ADDR),a
//		
//		xor		a ;// 0
//		out		(VDP_ADDR),a
//		ld		a,VDP_REG(43)
//		out		(VDP_ADDR),a ;// NY 8
//		
//		ld		a,8(ix) ;// color
//		out		(VDP_ADDR),a
//		ld		a,VDP_REG(44) ;// CR
//		out		(VDP_ADDR),a
//
//		xor		a ;// 0
//		out		(VDP_ADDR),a
//		ld		a,VDP_REG(45)
//		out		(VDP_ADDR),a
//
//		ld		a,#0xF0
//		out		(VDP_ADDR),a
//		ld		a,VDP_REG(46)
//		out		(VDP_ADDR),a
//
//		xor		a ;// 0
//		out		(VDP_ADDR),a
//		ld		a,VDP_REG(45)
//		out		(VDP_ADDR),a
//
//		ei
//	_endasm;
//}

void HMMC(u8 page, u8 dx, u8 dy, u8 nx, u8 ny, u16 ram)
{
	VdpBuffer buffer;
	
	page; ram;

	buffer.DX = dx;
	buffer.DY = dy /*+ (page * 512)*/;
	buffer.NX = nx;
	buffer.NY = ny;
	buffer.CLR = ((u8*)ram)[0];
	buffer.ARG = 0;
	buffer.CMD = 0xF0;
	SetupHMMC((u16)&buffer.DX);
	_asm

		ld l,9(ix)
		ld h,10(ix)

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

	_endasm;


	//_asm
	//	di
	//_endasm;
	//for(i=0; i<(nx*ny)-1; i++)
	//{
	//	WaitForVDP();
	//	_asm

	//		xor		a ;// 0
	//		out		(VDP_ADDR),a
	//		ld		a,VDP_REG(45)
	//		out		(VDP_ADDR),a
	//	
	//	_endasm;
	//}
	//_asm
	//	ei
	//_endasm;
}

void SetupHMMC(u16 address)
{
	address;

	WaitForVDP();

	_asm

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

	_endasm;
}
