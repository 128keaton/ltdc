sfr at 0xA8 g_slotPort;

void main (void)
{
	_asm
		di
		ld sp, (#0xFC4A)
		ei
	_endasm;

	g_slotPort = (g_slotPort & 0xCF) | ((g_slotPort & 0x0C) << 2);

	// A partir de aqu�! Nuestro c�digo�
	while (1);
}
