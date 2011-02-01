#include "core.h"
#include "bios.h"

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
