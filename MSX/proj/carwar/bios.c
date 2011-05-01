
#include "core.h"
#include "bios.h"

//typedef struct tagSubRomData
//{
//	u16 SX; 
//	u16 SY; 
//	u16 DX; 
//	u16 DY; 
//	u16 NX; 
//	u16 NY; 
//	u8  CLR;
//	u8  ARG;
//	u8  CMD;
//} SubRomData;
//
//SubRomData __at(0xF562) subRom;

///
char Joystick(char n)
{
	n;
	__asm
		ld		a,4(ix)
		call	0x00d5
		ld		l,a
	__endasm;
}

///
char Joytrig(char n)
{
	n;
	__asm
		ld		a,4(ix)
		call	0x00d8
		ld		h,#0x00
		ld		l,a
	__endasm;
}

///
u8 GetKeyMatrixLine(u8 n)
{
	n;
	__asm
		ld		a,4(ix)
		call	0x0141
		ld		l,a
	__endasm;
}

// Hook
void SetHook(u16 hook, u16 function)
{
	if(function == 0)
	{
		*((u8*)hook) = 0xC9;
	}
	else
	{
		*((u8*)hook) = 0xC3;
		*((u16*)++hook) = function;
	}
}

// Files
void LoadToVRAM(const char* filename, u16 x, u16 y)
{
	filename; x; y;
	//subRom.SX = (u16)filename; 
	//subRom.SY = 0; 
	//subRom.DX = x; 
	//subRom.DY = y; 
	//subRom.NX = 0; 
	//subRom.NY = 0; 
	//subRom.CLR = 0;
	//subRom.ARG = 0;
	//subRom.CMD = 0;

#define EXTROM  #0x015F
#define BLTVD   #0x019D
#define SX		#0xF562 // X-coordinate of the source
#define SY		#0xF564 // Y-coordinate of the source
#define DX		#0xF566 // X-coordinate of the destination
#define DY		#0xF568 // Y-coordinate of the destination
#define NX		#0xF56A // number of dots in the X direction
#define NY		#0xF56C // number of dots in the Y direction
#define CDUMMY	#0xF56E // dummy (not required to be set)
#define ARG		#0xF56F // selects the direction and expansion RAM (same as VDP R#45)
#define LOGOP	#0xF570 // logical operation code (same as the logical operation code of VDP) 

	__asm
		;// Init data
		ld		l,4(ix)
		ld		h,5(ix)
		ld		(SX), hl
		ld		l,6(ix)
		ld		h,7(ix)
		ld		(DX), hl
		ld		l,8(ix)
		ld		h,9(ix)
		ld		(DY), hl
		xor		a 
		ld		(ARG), a ;// ARG doit toujours être mis à zéro !!!
		ld		(LOGOP), a ;// Idem LOGOP
		;// Call BLTVD function
		;//ld		hl, SX ;// #_subRom ;// 
		;//ld		ix, BLTVD
		;//call	EXTROM

;//		ld		hl, #BLTVD_Proc
;//		ld		de, #0xC000
;//		ld		bc, #0x00D0
;//		ldir
;//		jp		0xC000

	BLTVD_Proc:
		ld		ix, #0x019D
		ld		hl, #0xF562
		call	#0x015F
;//		ld		IX,	BLTVD	;// 019Dh
;//		ld		IY,	#0x3	;// 00000011b, Slot 3-0 (toujours la?)
;//		call	CALSLT		;// 1Ch
		ei
;//		jp		BLTVD_Exit
	
	BLTVD_Exit:

	__endasm;
}