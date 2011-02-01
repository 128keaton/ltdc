#include "core.h"
#include "bios.h"

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
