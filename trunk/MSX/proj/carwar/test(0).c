/* 3D on MSX */

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

//----------------------------------------
// M A C R O S

#define POSI(a)    (a)
#define NEGA(a)    ((^a)++)

#define M2U(a)    (a << 8)
#define U2M(a)    (a >> 8)
#define UxU(a, b) ((a >> 4) * (b >> 4))

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

//----------------------------------------
// P R O T O T Y P E S

void MainLoop();
void TransXZ(ShortVec* ret, const ShortVec* vec, u8 angle, const ShortVec* pos);
void Project(ShortVec* ret, const ShortVec* vec, const ShortVec* cam);
void Update(ShortVec* camera, ShortVec* position, i8 angle);
void SetScreen8();
void DrawPoint8(char posX, char posY, char color);
void DrawLine8(char posX1, char posY1, char posX2, char posY2, char color);
void VPDCommand(int address);
void waitRetrace();
void WaitForVDP();
char Joystick(char n);
char Joytrig(char n);
void WriteToVRAM(i16 addr, u8 value);

///
sfr at 0xA8 g_slotPort;

/**
 *
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

#include "trigo.inc"

/**
 *
 */
void MainLoop()
{
	unsigned char clsScreen8[15] = 
	{// 32 33 34 35 36 37 38 39 40 41 42   43 44 45 46
		0, 0, 0, 0, 0, 0, 0, 0,	0, 1, 212, 0, 0, 0, 0xC0
	};
	u8 x = 128, y = 96;
	i8 i;
	u8 bEnd = 0/*, keyCode*/;
	//i16 addr;
	ShortVec camera = { M2U(0),  M2U(0),  M2U(3) };
	ShortVec position = { M2U(0),  M2U(0),  M2U(0) };
	i8 angle = 30;

	SetScreen8();

	VPDCommand((int)&clsScreen8);

	while(bEnd == 0)
	{
		DrawPoint8(x,     y - 1, 0);
		DrawPoint8(x + 1, y,     0);
		DrawPoint8(x - 1, y,     0);
		DrawPoint8(x,     y + 1, 0);

		/*addr = y;
		addr <<= 8;
		addr += x;
		WriteToVRAM(addr, 0xF0);*/

		x++;
	    if((i = Joystick(0) | Joystick(1) | Joystick(2)) != 0)
		{
			switch (i)
			{
		        case 1: // ↑
					y--;
					position.y -= 10;
					break;
		        case 3: // →
					position.x += 10;
					break;
				case 5: // ↓
					y++;
					position.y += 10;
					break;
		        case 7: // ←
					position.x -= 10;
					break;
			}
		}

		DrawPoint8(x,     y - 1, 255);
		DrawPoint8(x + 1, y,     255);
		DrawPoint8(x - 1, y,     255);
		DrawPoint8(x,     y + 1, 255);

		Update(&camera, &position, angle++);

		//waitRetrace();

		/*keyCode = KeyPressed();
		if(keyCode == 13)
			bEnd = 1;*/
	}
}

/**
* Builds a left-handed perspective projection matrix based on a field of view.
* @param    pOut    [in, out] Pointer to the D3DXMATRIX structure that is the result of the operation.
* @param    fovy    [in] Field of view in the y direction, in radians.
* @param    Aspect    [in] Aspect ratio, defined as view space width divided by height.
* @param    zn        [in] Z-value of the near view-plane.
* @param    zf        [in] Z-value of the far view-plane.
*/
/*D3DXMATRIX* MatrixPerspectiveFov(D3DXMATRIX *pOut, FLOAT fovY, FLOAT aspect, FLOAT zn, FLOAT zf)
{
   f32 yScale = cosf(fovY/2);
   f32 xScale = yScale / aspect;

// Left hand
// xScale     0          0               0
// 0        yScale       0               0
// 0          0       zf/(zf-zn)         1
// 0          0       -zn*zf/(zf-zn)     0

// Right hand
// xScale     0          0              0
// 0        yScale       0              0
// 0          0      zf/(zn-zf)        -1
// 0          0      zn*zf/(zn-zf)      0

   pOut = D3DXMatrixPerspectiveFovLH(pOut, fovY, aspect, zn, zf);

   return pOut;
}

/**
* Builds a left-handed perspective projection matrix.
* @param    pOut    [in, out] Pointer to the D3DXMATRIX structure that is the result of the operation.
* @param    w        [in] Width of the view volume at the near view-plane.
* @param    h        [in] Height of the view volume at the near view-plane.
* @param    zn        [in] Z-value of the near view-plane.
* @param    zf        [in] Z-value of the far view-plane.
*/
/*D3DXMATRIX* MatrixPerspective(D3DXMATRIX * pOut, FLOAT w, FLOAT h, FLOAT zn, FLOAT zf)
{
// Left hand
// 2*zn/w  0       0              0
// 0       2*zn/h  0              0
// 0       0       zf/(zf-zn)     1
// 0       0       zn*zf/(zn-zf)  0

// Right hand
// 2*zn/(r-l)   0            0              0
// 0            2*zn/(t-b)   0              0
// (l+r)/(l-r)  (t+b)/(b-t)  zf/(zf-zn)     1
// 0            0            zn*zf/(zn-zf)  0

   pOut = D3DXMatrixPerspectiveLH(pOut, w, h, zn, zf);

   return pOut;
}

#define F2U(val) (i16)(val * 256.f)

void CreateProfectionMatrix(ShortMat4& mat)
{
   f32 w  = 2.56f;
   f32 h  = 2.12f;
   f32 zn = 1.f;
   f32 zf = 127.f;

   mat[0].x = F2U(2*zn/w);
   mat[0].y = 0;
   mat[0].z = 0;
   mat[0].w = 0;

   mat[1].x = 0;
   mat[1].y = F2U(2*zn/h);
   mat[1].z = 0;
   mat[1].w = 0;

   mat[2].x = 0;
   mat[2].y = 0;
   mat[2].z = F2U(zf/(zf-zn));
   mat[2].w = 1;

   mat[3].x = 0;
   mat[3].y = 0;
   mat[3].z = F2U(zn*zf/(zn-zf));
   mat[3].w = 0;

// A  0  0  0
// 0  B  0  0
// 0  0  C  1
// 0  0  D  0
// *
// X  Y  Z  1

// A.x
// B.y
// C.z + 1
// D.z

// A.x / D.z
// B.y / D.z
// (C.z + 1) / D.z
// 1

}*/

/*ShortVec Trans(const ShortVec& vec, const ShortMat4& mat)
{
   ShortVec ret;
   ret.x = UxU(vec.x, mat[0].x) + UxU(vec.y, mat[1].x) + UxU(vec.z, mat[2].x) + mat[3].x;
   ret.y = UxU(vec.x, mat[0].y) + UxU(vec.y, mat[1].y) + UxU(vec.z, mat[2].y) + mat[3].y;
   ret.z = UxU(vec.x, mat[0].z) + UxU(vec.y, mat[1].z) + UxU(vec.z, mat[2].z) + mat[3].z;
   return ret;
}*/

void TransXZ(ShortVec* ret, const ShortVec* vec, u8 angle, const ShortVec* pos)
{
	angle >>= 2; 
	ret->x = UxU(vec->x, g_Cosinus[angle]) - UxU(vec->z, g_Sinus[angle]);
	ret->y = vec->y + pos->y;
	ret->z = UxU(vec->x, g_Sinus[angle]) + UxU(vec->z, g_Cosinus[angle]);
}

void Project(ShortVec* ret, const ShortVec* vec, const ShortVec* cam)
{
	ret->z = ((vec->z - cam->z) >> 5);
	ret->x = 128 + (vec->x - cam->x) / ret->z;
	ret->y = 106 + (vec->y - cam->y) / ret->z;
}

void Update(ShortVec* camera, ShortVec* position, i8 angle)
{
	#define POINT_NUM 8//5

	ShortVec local[POINT_NUM] =
	{
		{ M2U(1),  M2U(1),  M2U(-1) },
		{ M2U(1),  M2U(-1), M2U(-1) },
		{ M2U(-1), M2U(-1), M2U(-1) },
		{ M2U(-1), M2U(1),  M2U(-1) },
		//{ M2U(0),  M2U(0),  M2U(1) },
		{ M2U(1),  M2U(1),  M2U(1) },
		{ M2U(1),  M2U(-1), M2U(1) },
		{ M2U(-1), M2U(-1), M2U(1) },
		{ M2U(-1), M2U(1),  M2U(1) },
	};
	ShortVec world[POINT_NUM];
	ShortVec screen[POINT_NUM];
	i8 i;

	DrawLine8(screen[0].x, screen[0].y, screen[1].x, screen[1].y, 0);
	DrawLine8(screen[1].x, screen[1].y, screen[2].x, screen[2].y, 0);
	DrawLine8(screen[2].x, screen[2].y, screen[3].x, screen[3].y, 0);
	DrawLine8(screen[3].x, screen[3].y, screen[0].x, screen[0].y, 0);

	for(i=0; i<POINT_NUM; i++)
	{
		// clean
		//DrawPoint8(screen[i].x, screen[i].y, 0);

		// Transforme
		TransXZ(&world[i], &local[i], angle, position);
		Project(&screen[i], &world[i], camera);

		// draw
		//DrawPoint8(screen[i].x, screen[i].y, 255);
	}

	DrawLine8(screen[0].x, screen[0].y, screen[1].x, screen[1].y, 255);
	DrawLine8(screen[1].x, screen[1].y, screen[2].x, screen[2].y, 255);
	DrawLine8(screen[2].x, screen[2].y, screen[3].x, screen[3].y, 255);
	DrawLine8(screen[3].x, screen[3].y, screen[0].x, screen[0].y, 255);

	/*ShortMat4 local2world =
   {
       { M2U(1),   0,        0,       0 },
       { 0,        M2U(1),   0,       0 },
       { 0,        0,        M2U(1),  0 },
       { M2U(10),  M2U(10),  M2U(10), 0 },
   };

   ShortVec world[5];
   loop(i, 5)
       world[i] = Trans(local[i], local2world);

   ShortMat4 world2view =
   {
       { M2U(1),   0,        0,       0 },
       { 0,        M2U(1),   0,       0 },
       { 0,        0,        M2U(1),  0 },
       { M2U(10),  M2U(10),  M2U(10), 0 },
   };

   ShortVec view[5];
   loop(i, 5)
       view[i] = Trans(world[i], local2world);*/

   //ShortMat4 view2screen;
   //CreateProfectionMatrix(view2screen);
}
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
		ld		a,#0x80+#0
		out		(VDP_ADDR),a

		//; - modification registre 1 -
		ld		a,(RG1SAV)
		res		#4,a           //; bit 4 a 0
		res		#3,a           //; bit 3 a 0
		ld		(RG1SAV),a

		out		(VDP_ADDR),a
		ld		a,#0x80+#1
		out		(VDP_ADDR),a

		//; - modification registre 2 -
		ld		a,#0x1F // 00011111b
		out		(VDP_ADDR),a
		ld		a,#0x80+2
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
		ld    a,#0x80+#36 //; a ecrire sur le registre 36
		out   (VDP_ADDR),a

		ld    a,#0      //; donnee
		out   (VDP_ADDR),a
		ld    a,#0x80+#37 //; a ecrire sur le registre 37
		out   (VDP_ADDR),a

		//; - Y=96 -
		ld    a,5(ix)     //; donnee
		out   (VDP_ADDR),a
		ld    a,#0x80+#38 //; a ecrire sur le registre 38
		out   (VDP_ADDR),a

		ld    a,#0      //; donnee
		out   (VDP_ADDR),a
		ld    a,#0x80+#39 //; a ecrire sur le registre 39
		out   (VDP_ADDR),a

		//; - Couleur=255 -
		ld    a,6(ix)    //; donnee
		out   (VDP_ADDR),a
		ld    a,#0x80+#44 //; a ecrire sur le registre 44
		out   (VDP_ADDR),a

		//; - Selection page 0 -
		ld    a,#0      //; donnee
		out   (VDP_ADDR),a
		ld    a,#0x80+#45 //; a ecrire sur le registre 45
		out   (VDP_ADDR),a

		//; Execution macro VDP
		ld    a,#0x50  //; donnee (01010000b)
		out   (VDP_ADDR),a
		ld    a,#0x80+#46     //; a ecrire sur le registre 46
		out   (VDP_ADDR),a

		ei

	_endasm;
}

/**
 * LINE (128,96),(190,56),255
 */
void DrawLine8(char posX1, char posY1, char posX2, char posY2, char color)
{
	posX1; posY1; posX2; posY2; color;

	WaitForVDP();

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
		ld	a,#0x080+#17
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
		ld		a,#0x080+#15
		out		(VDP_ADDR),a
	WAIT_VDP:	
		nop
		in		a,(VDP_ADDR)
		rra
		jr		c,WAIT_VDP		
		xor		a
		out		(VDP_ADDR),a
		ld		a,#0x080+#15
		out		(VDP_ADDR),a		//; RAZ du registre 15
		ei

	_endasm;
}

///
char Joystick(char n)
{
	_asm
		ld		a,4(ix)
		call	0x00d5
		ld		l,a
	_endasm;
}

///
char Joytrig(char n)
{
	_asm
		ld		a,4(ix)
		call	0x00d8
		ld		h,#0x00
		ld		l,a
	_endasm;
}

void WriteToVRAM(i16 addr, u8 value)
{
	addr; value;

	WaitForVDP();

	_asm
		di

		;// Set 0 to register 14 (we don't use address bits 14-16)
		xor		a
		out		(#0x99),a
		ld		a,#14+#128
		out		(#0x99),a
		
		;// Set VRAM address to port 0
		ld		a,4(ix)
		out		(#0x99),a

		ld		a,5(ix)
		and		#0x3F		;// Set 2 last bits to 0
		or		#0x40		;// write access
		out		(#0x99),a

		;// Write value
		ld		a,6(ix)
		out		(#0x98),a

		ei
	_endasm;
}


