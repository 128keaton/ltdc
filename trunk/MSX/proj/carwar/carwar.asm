;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.0.0 #6037 (Oct 31 2010) (MINGW32)
; This file was generated Thu Feb 03 00:11:04 2011
;--------------------------------------------------------
	.module carwar
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _defaultColor
	.globl _backgound
	.globl _charTable
	.globl _shadow
	.globl _car4
	.globl _car3
	.globl _car2
	.globl _car1
	.globl _MainLoop
	.globl _InitializePlayer
	.globl _SetScreen8
	.globl _SetSpriteMode
	.globl _SetFreq
	.globl _SetPage8
	.globl _DrawPoint8
	.globl _DrawLine8
	.globl _waitRetrace
	.globl _WaitForVDP
	.globl _WriteToVRAM8
	.globl _VPDCommandLoop
	.globl _RAMtoVRAM16
	.globl _RAMtoVRAM
	.globl _RAMtoVRAMTrans
	.globl _Fill8
	.globl _VRAMtoVRAM
	.globl _VRAMtoVRAMTrans
	.globl _VPDCommand32
	.globl _VPDCommand36
	.globl _PrintSprite
	.globl _ClearSprite
	.globl _SetSprite
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
_g_slotPort	=	0x00a8
;--------------------------------------------------------
;  ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; overlayable items in  ram 
;--------------------------------------------------------
	.area _OVERLAY
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;carwar.c:211: void main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main_start::
_main:
;carwar.c:217: __endasm;
	
		 di
		 ld sp, (#0xFC4A)
		 ei
		
;carwar.c:219: g_slotPort = (g_slotPort & 0xCF) | ((g_slotPort & 0x0C) << 2);
	in	a,(_g_slotPort)
	and	a,#0xCF
	ld	c,a
	in	a,(_g_slotPort)
	and	a,#0x0C
	add	a,a
	add	a,a
	ld	b,a
	ld	a,c
	or	a,b
	out	(_g_slotPort),a
;carwar.c:221: MainLoop();
	call	_MainLoop
	ret
_main_end::
_car1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x21	; 33
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x6D	; 109	m
	.db #0x49	; 73	I
	.db #0x04	; 4
	.db #0x21	; 33
	.db #0x04	; 4
	.db #0xFB	; 251
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x91	; 145
	.db #0x92	; 146
	.db #0xBC	; 188
	.db #0x6D	; 109	m
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x21	; 33
	.db #0x42	; 66	B
	.db #0x04	; 4
	.db #0xD6	; 214
	.db #0x63	; 99	c
	.db #0x42	; 66	B
	.db #0xDA	; 218
	.db #0xB6	; 182
	.db #0x49	; 73	I
	.db #0x6D	; 109	m
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x21	; 33
	.db #0x63	; 99	c
	.db #0x04	; 4
	.db #0x1C	; 28
	.db #0x42	; 66	B
	.db #0x42	; 66	B
	.db #0xDA	; 218
	.db #0x92	; 146
	.db #0xFC	; 252
	.db #0x6D	; 109	m
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x92	; 146
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0x91	; 145
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x49	; 73	I
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x6D	; 109	m
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x21	; 33
	.db #0x00	; 0
	.db #0x6D	; 109	m
	.db #0xB8	; 184
	.db #0x49	; 73	I
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0xFB	; 251
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0xB6	; 182
	.db #0x49	; 73	I
	.db #0x6D	; 109	m
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0xD6	; 214
	.db #0x63	; 99	c
	.db #0x42	; 66	B
	.db #0x21	; 33
	.db #0x92	; 146
	.db #0xDA	; 218
	.db #0x6D	; 109	m
	.db #0x00	; 0
	.db #0x6D	; 109	m
	.db #0x04	; 4
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x1C	; 28
	.db #0x42	; 66	B
	.db #0x21	; 33
	.db #0xDA	; 218
	.db #0xDC	; 220
	.db #0x49	; 73	I
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x42	; 66	B
	.db #0x42	; 66	B
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x92	; 146
	.db #0x6D	; 109	m
	.db #0x49	; 73	I
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0x49	; 73	I
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x49	; 73	I
	.db #0x6D	; 109	m
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0xBC	; 188
	.db #0x49	; 73	I
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0xB6	; 182
	.db #0xDA	; 218
	.db #0x91	; 145
	.db #0x49	; 73	I
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x41	; 65	A
	.db #0x62	; 98	b
	.db #0x41	; 65	A
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0xFC	; 252
	.db #0x6D	; 109	m
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xB2	; 178
	.db #0xFB	; 251
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x63	; 99	c
	.db #0x04	; 4
	.db #0xDA	; 218
	.db #0x91	; 145
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x21	; 33
	.db #0x04	; 4
	.db #0x1C	; 28
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x91	; 145
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x21	; 33
	.db #0x41	; 65	A
	.db #0x63	; 99	c
	.db #0x42	; 66	B
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x6D	; 109	m
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x6D	; 109	m
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x42	; 66	B
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x49	; 73	I
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xB6	; 182
	.db #0xB8	; 184
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x92	; 146
	.db #0xDA	; 218
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0xB8	; 184
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0xB6	; 182
	.db #0x91	; 145
	.db #0x49	; 73	I
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x42	; 66	B
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0x6D	; 109	m
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x21	; 33
	.db #0x42	; 66	B
	.db #0x63	; 99	c
	.db #0x91	; 145
	.db #0x49	; 73	I
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xB2	; 178
	.db #0xFB	; 251
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x63	; 99	c
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x1C	; 28
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x21	; 33
	.db #0x42	; 66	B
	.db #0x63	; 99	c
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x6D	; 109	m
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x6D	; 109	m
	.db #0x98	; 152
	.db #0x24	; 36
	.db #0x49	; 73	I
	.db #0x98	; 152
	.db #0x6D	; 109	m
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xB6	; 182
	.db #0x92	; 146
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0x92	; 146
	.db #0xB6	; 182
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x91	; 145
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0x92	; 146
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x6D	; 109	m
	.db #0x21	; 33
	.db #0x41	; 65	A
	.db #0x42	; 66	B
	.db #0x63	; 99	c
	.db #0x6D	; 109	m
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x41	; 65	A
	.db #0x42	; 66	B
	.db #0x63	; 99	c
	.db #0x42	; 66	B
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0xFB	; 251
	.db #0xD6	; 214
	.db #0x1C	; 28
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x21	; 33
	.db #0x42	; 66	B
	.db #0x63	; 99	c
	.db #0x21	; 33
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x6D	; 109	m
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x49	; 73	I
	.db #0x98	; 152
	.db #0x6D	; 109	m
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x6D	; 109	m
	.db #0x98	; 152
	.db #0x49	; 73	I
	.db #0xDA	; 218
	.db #0x92	; 146
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0x6D	; 109	m
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x91	; 145
	.db #0x6D	; 109	m
	.db #0x41	; 65	A
	.db #0x42	; 66	B
	.db #0x42	; 66	B
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x6D	; 109	m
	.db #0x41	; 65	A
	.db #0x42	; 66	B
	.db #0x63	; 99	c
	.db #0x1C	; 28
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x10	; 16
	.db #0xFB	; 251
	.db #0xD6	; 214
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x63	; 99	c
	.db #0x21	; 33
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x63	; 99	c
	.db #0x42	; 66	B
	.db #0x21	; 33
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x42	; 66	B
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x6D	; 109	m
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x49	; 73	I
	.db #0xBC	; 188
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x49	; 73	I
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0xB6	; 182
	.db #0x21	; 33
	.db #0x49	; 73	I
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFC	; 252
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0x41	; 65	A
	.db #0x62	; 98	b
	.db #0x41	; 65	A
	.db #0x04	; 4
	.db #0x1C	; 28
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x6D	; 109	m
	.db #0xDA	; 218
	.db #0x49	; 73	I
	.db #0x63	; 99	c
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0xFB	; 251
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x6D	; 109	m
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x21	; 33
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x49	; 73	I
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x21	; 33
	.db #0x63	; 99	c
	.db #0x41	; 65	A
	.db #0x21	; 33
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x41	; 65	A
	.db #0x42	; 66	B
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x6D	; 109	m
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x49	; 73	I
	.db #0x49	; 73	I
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x6D	; 109	m
	.db #0xBC	; 188
	.db #0x91	; 145
	.db #0x49	; 73	I
	.db #0x21	; 33
	.db #0x04	; 4
	.db #0x1C	; 28
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x6D	; 109	m
	.db #0x49	; 73	I
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0xFB	; 251
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFC	; 252
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0x21	; 33
	.db #0x42	; 66	B
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x21	; 33
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x49	; 73	I
	.db #0x6D	; 109	m
	.db #0x21	; 33
	.db #0x42	; 66	B
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x42	; 66	B
	.db #0x21	; 33
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x6D	; 109	m
	.db #0x49	; 73	I
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x21	; 33
	.db #0x42	; 66	B
	.db #0x63	; 99	c
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x21	; 33
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x6D	; 109	m
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x21	; 33
	.db #0x1C	; 28
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x6D	; 109	m
	.db #0xBC	; 188
	.db #0x92	; 146
	.db #0x91	; 145
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0xFB	; 251
	.db #0x04	; 4
	.db #0x21	; 33
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x49	; 73	I
	.db #0xDA	; 218
	.db #0xB6	; 182
	.db #0xDA	; 218
	.db #0x42	; 66	B
	.db #0x63	; 99	c
	.db #0xD6	; 214
	.db #0x04	; 4
	.db #0x42	; 66	B
	.db #0x21	; 33
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x6D	; 109	m
	.db #0xFC	; 252
	.db #0x92	; 146
	.db #0xDA	; 218
	.db #0x42	; 66	B
	.db #0x42	; 66	B
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x63	; 99	c
	.db #0x21	; 33
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x91	; 145
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0x92	; 146
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x6D	; 109	m
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x6D	; 109	m
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0x49	; 73	I
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x21	; 33
	.db #0x1C	; 28
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0xFB	; 251
	.db #0xAE	; 174
	.db #0x63	; 99	c
	.db #0x21	; 33
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x6D	; 109	m
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x92	; 146
	.db #0x91	; 145
	.db #0x42	; 66	B
	.db #0x63	; 99	c
	.db #0x04	; 4
	.db #0x1C	; 28
	.db #0x04	; 4
	.db #0x42	; 66	B
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xB6	; 182
	.db #0xB6	; 182
	.db #0xDA	; 218
	.db #0xB6	; 182
	.db #0x42	; 66	B
	.db #0x42	; 66	B
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xBC	; 188
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0xB6	; 182
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x6D	; 109	m
	.db #0x24	; 36
	.db #0xB6	; 182
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x6D	; 109	m
	.db #0x49	; 73	I
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x6D	; 109	m
	.db #0xFC	; 252
	.db #0x6D	; 109	m
	.db #0x04	; 4
	.db #0x49	; 73	I
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x49	; 73	I
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x1C	; 28
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x6D	; 109	m
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x42	; 66	B
	.db #0xB2	; 178
	.db #0xD6	; 214
	.db #0x42	; 66	B
	.db #0x21	; 33
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x6D	; 109	m
	.db #0x04	; 4
	.db #0x21	; 33
	.db #0x42	; 66	B
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x21	; 33
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x6D	; 109	m
	.db #0x92	; 146
	.db #0xB6	; 182
	.db #0x92	; 146
	.db #0x41	; 65	A
	.db #0x63	; 99	c
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x6D	; 109	m
	.db #0xFC	; 252
	.db #0x92	; 146
	.db #0xB6	; 182
	.db #0xDA	; 218
	.db #0x92	; 146
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x49	; 73	I
	.db #0xB6	; 182
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0x49	; 73	I
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x6D	; 109	m
	.db #0x49	; 73	I
	.db #0xFC	; 252
	.db #0xDA	; 218
	.db #0x49	; 73	I
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x6D	; 109	m
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x1C	; 28
	.db #0xFB	; 251
	.db #0x63	; 99	c
	.db #0x42	; 66	B
	.db #0x21	; 33
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x41	; 65	A
	.db #0xAE	; 174
	.db #0xD6	; 214
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x21	; 33
	.db #0x42	; 66	B
	.db #0x62	; 98	b
	.db #0x63	; 99	c
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x91	; 145
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0x42	; 66	B
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0xB6	; 182
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0x6D	; 109	m
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0xFC	; 252
	.db #0x92	; 146
	.db #0xB6	; 182
	.db #0xB6	; 182
	.db #0xDA	; 218
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0xFC	; 252
	.db #0xB6	; 182
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x49	; 73	I
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x6D	; 109	m
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x21	; 33
	.db #0x42	; 66	B
	.db #0x63	; 99	c
	.db #0x21	; 33
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x1C	; 28
	.db #0xFB	; 251
	.db #0xD6	; 214
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x41	; 65	A
	.db #0x42	; 66	B
	.db #0x62	; 98	b
	.db #0x63	; 99	c
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x21	; 33
	.db #0x42	; 66	B
	.db #0x63	; 99	c
	.db #0x42	; 66	B
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x6D	; 109	m
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0x6D	; 109	m
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x91	; 145
	.db #0xB6	; 182
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0xB6	; 182
	.db #0x92	; 146
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xB6	; 182
	.db #0xFC	; 252
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0xFC	; 252
	.db #0xB6	; 182
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x6D	; 109	m
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x21	; 33
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x21	; 33
	.db #0x42	; 66	B
	.db #0x63	; 99	c
	.db #0x21	; 33
	.db #0x1C	; 28
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x21	; 33
	.db #0x1C	; 28
	.db #0xFB	; 251
	.db #0xD6	; 214
	.db #0x63	; 99	c
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x41	; 65	A
	.db #0x42	; 66	B
	.db #0x62	; 98	b
	.db #0x42	; 66	B
	.db #0x6D	; 109	m
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x21	; 33
	.db #0x42	; 66	B
	.db #0x63	; 99	c
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0x6D	; 109	m
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x6D	; 109	m
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0x49	; 73	I
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x49	; 73	I
	.db #0x91	; 145
	.db #0x92	; 146
	.db #0x6D	; 109	m
	.db #0x24	; 36
	.db #0xFC	; 252
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0xFC	; 252
	.db #0x6D	; 109	m
	.db #0x91	; 145
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x49	; 73	I
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x6D	; 109	m
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x21	; 33
	.db #0x42	; 66	B
	.db #0xD6	; 214
	.db #0xB2	; 178
	.db #0x63	; 99	c
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x21	; 33
	.db #0x1C	; 28
	.db #0x04	; 4
	.db #0x62	; 98	b
	.db #0x42	; 66	B
	.db #0x49	; 73	I
	.db #0x6D	; 109	m
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x21	; 33
	.db #0x42	; 66	B
	.db #0x42	; 66	B
	.db #0x92	; 146
	.db #0xB6	; 182
	.db #0x92	; 146
	.db #0x6D	; 109	m
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x21	; 33
	.db #0x92	; 146
	.db #0xDA	; 218
	.db #0xB6	; 182
	.db #0x92	; 146
	.db #0xBC	; 188
	.db #0x6D	; 109	m
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x49	; 73	I
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0x24	; 36
	.db #0x49	; 73	I
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x49	; 73	I
	.db #0xDA	; 218
	.db #0xFC	; 252
	.db #0x6D	; 109	m
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0xB6	; 182
	.db #0x49	; 73	I
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x6D	; 109	m
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x04	; 4
	.db #0xFB	; 251
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x42	; 66	B
	.db #0x63	; 99	c
	.db #0x04	; 4
	.db #0xD6	; 214
	.db #0x42	; 66	B
	.db #0x42	; 66	B
	.db #0x91	; 145
	.db #0x92	; 146
	.db #0xBC	; 188
	.db #0x49	; 73	I
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x21	; 33
	.db #0x42	; 66	B
	.db #0x04	; 4
	.db #0x1C	; 28
	.db #0x42	; 66	B
	.db #0x42	; 66	B
	.db #0xDA	; 218
	.db #0xB6	; 182
	.db #0x24	; 36
	.db #0x49	; 73	I
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0xB6	; 182
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0xFC	; 252
	.db #0x6D	; 109	m
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x49	; 73	I
	.db #0x6D	; 109	m
	.db #0xB6	; 182
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0x91	; 145
	.db #0x6D	; 109	m
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x49	; 73	I
	.db #0x49	; 73	I
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x6D	; 109	m
	.db #0x49	; 73	I
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_car2:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x42	; 66	B
	.db #0xDC	; 220
	.db #0x63	; 99	c
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x42	; 66	B
	.db #0x42	; 66	B
	.db #0xB8	; 184
	.db #0x63	; 99	c
	.db #0xBC	; 188
	.db #0xB8	; 184
	.db #0x98	; 152
	.db #0x74	; 116	t
	.db #0xBC	; 188
	.db #0x50	; 80	P
	.db #0x00	; 0
	.db #0xB2	; 178
	.db #0x74	; 116	t
	.db #0x42	; 66	B
	.db #0x41	; 65	A
	.db #0xB8	; 184
	.db #0x62	; 98	b
	.db #0xB8	; 184
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x74	; 116	t
	.db #0x42	; 66	B
	.db #0x21	; 33
	.db #0x74	; 116	t
	.db #0x42	; 66	B
	.db #0xB8	; 184
	.db #0x49	; 73	I
	.db #0x49	; 73	I
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x98	; 152
	.db #0x42	; 66	B
	.db #0x21	; 33
	.db #0x50	; 80	P
	.db #0x21	; 33
	.db #0x74	; 116	t
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0xBC	; 188
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0xBC	; 188
	.db #0xB8	; 184
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0x98	; 152
	.db #0xBC	; 188
	.db #0xB8	; 184
	.db #0xFC	; 252
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x98	; 152
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x50	; 80	P
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0x50	; 80	P
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x74	; 116	t
	.db #0x50	; 80	P
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x50	; 80	P
	.db #0x74	; 116	t
	.db #0xBC	; 188
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x42	; 66	B
	.db #0x98	; 152
	.db #0x63	; 99	c
	.db #0x50	; 80	P
	.db #0x74	; 116	t
	.db #0x98	; 152
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x50	; 80	P
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x74	; 116	t
	.db #0x42	; 66	B
	.db #0xDC	; 220
	.db #0x63	; 99	c
	.db #0x62	; 98	b
	.db #0x74	; 116	t
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x42	; 66	B
	.db #0x41	; 65	A
	.db #0x21	; 33
	.db #0xB8	; 184
	.db #0x62	; 98	b
	.db #0xBC	; 188
	.db #0x49	; 73	I
	.db #0x24	; 36
	.db #0x74	; 116	t
	.db #0xBC	; 188
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0xB2	; 178
	.db #0x74	; 116	t
	.db #0x42	; 66	B
	.db #0x21	; 33
	.db #0x98	; 152
	.db #0x21	; 33
	.db #0xB8	; 184
	.db #0xBC	; 188
	.db #0xBC	; 188
	.db #0x98	; 152
	.db #0xFC	; 252
	.db #0x50	; 80	P
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x74	; 116	t
	.db #0x42	; 66	B
	.db #0x98	; 152
	.db #0x74	; 116	t
	.db #0x98	; 152
	.db #0x98	; 152
	.db #0x74	; 116	t
	.db #0x04	; 4
	.db #0x50	; 80	P
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1C	; 28
	.db #0xBC	; 188
	.db #0xB8	; 184
	.db #0x98	; 152
	.db #0x50	; 80	P
	.db #0x74	; 116	t
	.db #0x50	; 80	P
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x98	; 152
	.db #0x04	; 4
	.db #0x50	; 80	P
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xB8	; 184
	.db #0xBC	; 188
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xB8	; 184
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x74	; 116	t
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x49	; 73	I
	.db #0x24	; 36
	.db #0x50	; 80	P
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x98	; 152
	.db #0x41	; 65	A
	.db #0x63	; 99	c
	.db #0xDC	; 220
	.db #0x49	; 73	I
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xB8	; 184
	.db #0x63	; 99	c
	.db #0xDC	; 220
	.db #0x62	; 98	b
	.db #0x62	; 98	b
	.db #0xBC	; 188
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0xBC	; 188
	.db #0x98	; 152
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x50	; 80	P
	.db #0x63	; 99	c
	.db #0x42	; 66	B
	.db #0x42	; 66	B
	.db #0xBC	; 188
	.db #0x41	; 65	A
	.db #0xB8	; 184
	.db #0x74	; 116	t
	.db #0x98	; 152
	.db #0xBC	; 188
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x74	; 116	t
	.db #0x42	; 66	B
	.db #0x42	; 66	B
	.db #0x21	; 33
	.db #0x98	; 152
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0x50	; 80	P
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xB2	; 178
	.db #0x74	; 116	t
	.db #0x98	; 152
	.db #0x41	; 65	A
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1C	; 28
	.db #0x74	; 116	t
	.db #0xBC	; 188
	.db #0x98	; 152
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x74	; 116	t
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xB8	; 184
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xBC	; 188
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0xBC	; 188
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x98	; 152
	.db #0x04	; 4
	.db #0x49	; 73	I
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0xFC	; 252
	.db #0x98	; 152
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x74	; 116	t
	.db #0xDC	; 220
	.db #0xBC	; 188
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x98	; 152
	.db #0xBC	; 188
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x50	; 80	P
	.db #0x74	; 116	t
	.db #0x62	; 98	b
	.db #0x63	; 99	c
	.db #0xBC	; 188
	.db #0xB8	; 184
	.db #0x74	; 116	t
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x98	; 152
	.db #0x74	; 116	t
	.db #0xDC	; 220
	.db #0xBC	; 188
	.db #0x63	; 99	c
	.db #0x41	; 65	A
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x74	; 116	t
	.db #0xB8	; 184
	.db #0x42	; 66	B
	.db #0x42	; 66	B
	.db #0x42	; 66	B
	.db #0xB8	; 184
	.db #0x74	; 116	t
	.db #0x50	; 80	P
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x50	; 80	P
	.db #0x18	; 24
	.db #0x63	; 99	c
	.db #0x42	; 66	B
	.db #0x42	; 66	B
	.db #0x21	; 33
	.db #0x98	; 152
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xB2	; 178
	.db #0x74	; 116	t
	.db #0x98	; 152
	.db #0x42	; 66	B
	.db #0x74	; 116	t
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xBC	; 188
	.db #0x74	; 116	t
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x74	; 116	t
	.db #0xBC	; 188
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x98	; 152
	.db #0xB8	; 184
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0xFC	; 252
	.db #0x98	; 152
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xBC	; 188
	.db #0xBC	; 188
	.db #0x04	; 4
	.db #0x49	; 73	I
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0xBC	; 188
	.db #0xBC	; 188
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x98	; 152
	.db #0x04	; 4
	.db #0x49	; 73	I
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x98	; 152
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x74	; 116	t
	.db #0xDC	; 220
	.db #0xBC	; 188
	.db #0xBC	; 188
	.db #0xB8	; 184
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x74	; 116	t
	.db #0x62	; 98	b
	.db #0x63	; 99	c
	.db #0x63	; 99	c
	.db #0x41	; 65	A
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x98	; 152
	.db #0x74	; 116	t
	.db #0xDC	; 220
	.db #0xBC	; 188
	.db #0xBC	; 188
	.db #0xB8	; 184
	.db #0x74	; 116	t
	.db #0x98	; 152
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xBC	; 188
	.db #0x98	; 152
	.db #0x42	; 66	B
	.db #0x42	; 66	B
	.db #0x42	; 66	B
	.db #0x21	; 33
	.db #0x98	; 152
	.db #0xBC	; 188
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0xB8	; 184
	.db #0x63	; 99	c
	.db #0x42	; 66	B
	.db #0x42	; 66	B
	.db #0x41	; 65	A
	.db #0x74	; 116	t
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x74	; 116	t
	.db #0x98	; 152
	.db #0x98	; 152
	.db #0x74	; 116	t
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xB2	; 178
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0xB8	; 184
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xBC	; 188
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0xBC	; 188
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x98	; 152
	.db #0xFC	; 252
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0x49	; 73	I
	.db #0x04	; 4
	.db #0x98	; 152
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x74	; 116	t
	.db #0xBC	; 188
	.db #0x98	; 152
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0xBC	; 188
	.db #0xDC	; 220
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x50	; 80	P
	.db #0x74	; 116	t
	.db #0xB8	; 184
	.db #0xBC	; 188
	.db #0x63	; 99	c
	.db #0x62	; 98	b
	.db #0x74	; 116	t
	.db #0x50	; 80	P
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x74	; 116	t
	.db #0x41	; 65	A
	.db #0x63	; 99	c
	.db #0xBC	; 188
	.db #0xDC	; 220
	.db #0x74	; 116	t
	.db #0x98	; 152
	.db #0x50	; 80	P
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x50	; 80	P
	.db #0x74	; 116	t
	.db #0xB8	; 184
	.db #0x42	; 66	B
	.db #0x42	; 66	B
	.db #0x42	; 66	B
	.db #0xB8	; 184
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x98	; 152
	.db #0x21	; 33
	.db #0x42	; 66	B
	.db #0x42	; 66	B
	.db #0x63	; 99	c
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x74	; 116	t
	.db #0x42	; 66	B
	.db #0x98	; 152
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x18	; 24
	.db #0xB2	; 178
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xBC	; 188
	.db #0xB8	; 184
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0xB8	; 184
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x74	; 116	t
	.db #0x24	; 36
	.db #0x49	; 73	I
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFC	; 252
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0x49	; 73	I
	.db #0xDC	; 220
	.db #0x63	; 99	c
	.db #0x41	; 65	A
	.db #0x98	; 152
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x98	; 152
	.db #0xBC	; 188
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0xBC	; 188
	.db #0x62	; 98	b
	.db #0x62	; 98	b
	.db #0xDC	; 220
	.db #0x63	; 99	c
	.db #0xB8	; 184
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0xBC	; 188
	.db #0x98	; 152
	.db #0x74	; 116	t
	.db #0xB8	; 184
	.db #0x41	; 65	A
	.db #0xBC	; 188
	.db #0x42	; 66	B
	.db #0x42	; 66	B
	.db #0x63	; 99	c
	.db #0x50	; 80	P
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x50	; 80	P
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0x98	; 152
	.db #0x21	; 33
	.db #0x42	; 66	B
	.db #0x42	; 66	B
	.db #0x74	; 116	t
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0x41	; 65	A
	.db #0x98	; 152
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x98	; 152
	.db #0xBC	; 188
	.db #0x1C	; 28
	.db #0x98	; 152
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x74	; 116	t
	.db #0xB2	; 178
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xDC	; 220
	.db #0x74	; 116	t
	.db #0x50	; 80	P
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x74	; 116	t
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x98	; 152
	.db #0x74	; 116	t
	.db #0x50	; 80	P
	.db #0x63	; 99	c
	.db #0x98	; 152
	.db #0x42	; 66	B
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x74	; 116	t
	.db #0x62	; 98	b
	.db #0x63	; 99	c
	.db #0xDC	; 220
	.db #0x42	; 66	B
	.db #0x50	; 80	P
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x74	; 116	t
	.db #0xBC	; 188
	.db #0x74	; 116	t
	.db #0x24	; 36
	.db #0x49	; 73	I
	.db #0xBC	; 188
	.db #0x62	; 98	b
	.db #0xB8	; 184
	.db #0x21	; 33
	.db #0x41	; 65	A
	.db #0x42	; 66	B
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x50	; 80	P
	.db #0xFC	; 252
	.db #0x98	; 152
	.db #0xBC	; 188
	.db #0xBC	; 188
	.db #0xB8	; 184
	.db #0x21	; 33
	.db #0x98	; 152
	.db #0x21	; 33
	.db #0x42	; 66	B
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x74	; 116	t
	.db #0x04	; 4
	.db #0x50	; 80	P
	.db #0x74	; 116	t
	.db #0x98	; 152
	.db #0x98	; 152
	.db #0x74	; 116	t
	.db #0x98	; 152
	.db #0x42	; 66	B
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x50	; 80	P
	.db #0x74	; 116	t
	.db #0x50	; 80	P
	.db #0x98	; 152
	.db #0xB8	; 184
	.db #0xBC	; 188
	.db #0x1C	; 28
	.db #0xB2	; 178
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x50	; 80	P
	.db #0x98	; 152
	.db #0x50	; 80	P
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x63	; 99	c
	.db #0xDC	; 220
	.db #0x42	; 66	B
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x50	; 80	P
	.db #0xBC	; 188
	.db #0x74	; 116	t
	.db #0x98	; 152
	.db #0xB8	; 184
	.db #0xBC	; 188
	.db #0x63	; 99	c
	.db #0xB8	; 184
	.db #0x42	; 66	B
	.db #0x42	; 66	B
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x74	; 116	t
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0xB8	; 184
	.db #0x62	; 98	b
	.db #0xB8	; 184
	.db #0x41	; 65	A
	.db #0x42	; 66	B
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x49	; 73	I
	.db #0x49	; 73	I
	.db #0xB8	; 184
	.db #0x42	; 66	B
	.db #0x74	; 116	t
	.db #0x21	; 33
	.db #0x42	; 66	B
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xBC	; 188
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x74	; 116	t
	.db #0x21	; 33
	.db #0x50	; 80	P
	.db #0x21	; 33
	.db #0x42	; 66	B
	.db #0x98	; 152
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x74	; 116	t
	.db #0xFC	; 252
	.db #0xB8	; 184
	.db #0xBC	; 188
	.db #0x98	; 152
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0xB8	; 184
	.db #0xBC	; 188
	.db #0x18	; 24
	.db #0xB2	; 178
	.db #0x00	; 0
	.db #0x50	; 80	P
	.db #0x74	; 116	t
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x50	; 80	P
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0x50	; 80	P
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x98	; 152
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x63	; 99	c
	.db #0x98	; 152
	.db #0x42	; 66	B
	.db #0x42	; 66	B
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x50	; 80	P
	.db #0xB8	; 184
	.db #0xBC	; 188
	.db #0x63	; 99	c
	.db #0xDC	; 220
	.db #0x42	; 66	B
	.db #0x42	; 66	B
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xBC	; 188
	.db #0x74	; 116	t
	.db #0x98	; 152
	.db #0x04	; 4
	.db #0xDC	; 220
	.db #0x62	; 98	b
	.db #0x62	; 98	b
	.db #0xB8	; 184
	.db #0x42	; 66	B
	.db #0x74	; 116	t
	.db #0x50	; 80	P
	.db #0x00	; 0
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x49	; 73	I
	.db #0x49	; 73	I
	.db #0xB8	; 184
	.db #0x42	; 66	B
	.db #0x98	; 152
	.db #0x21	; 33
	.db #0x42	; 66	B
	.db #0x98	; 152
	.db #0xB2	; 178
	.db #0x50	; 80	P
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0xB8	; 184
	.db #0x21	; 33
	.db #0x74	; 116	t
	.db #0xB8	; 184
	.db #0xBC	; 188
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xBC	; 188
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0xBC	; 188
	.db #0xBC	; 188
	.db #0xBC	; 188
	.db #0x98	; 152
	.db #0x98	; 152
	.db #0x74	; 116	t
	.db #0x04	; 4
	.db #0x50	; 80	P
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x74	; 116	t
	.db #0xFC	; 252
	.db #0xB8	; 184
	.db #0x04	; 4
	.db #0x50	; 80	P
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0x50	; 80	P
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x50	; 80	P
	.db #0x74	; 116	t
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x50	; 80	P
	.db #0x14	; 20
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x74	; 116	t
	.db #0x42	; 66	B
	.db #0x42	; 66	B
	.db #0x42	; 66	B
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x63	; 99	c
	.db #0xB8	; 184
	.db #0xBC	; 188
	.db #0x74	; 116	t
	.db #0x42	; 66	B
	.db #0x21	; 33
	.db #0x98	; 152
	.db #0xB2	; 178
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x50	; 80	P
	.db #0x62	; 98	b
	.db #0x62	; 98	b
	.db #0x98	; 152
	.db #0xBC	; 188
	.db #0x74	; 116	t
	.db #0x21	; 33
	.db #0xBC	; 188
	.db #0x1C	; 28
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x74	; 116	t
	.db #0xB8	; 184
	.db #0xBC	; 188
	.db #0x62	; 98	b
	.db #0x42	; 66	B
	.db #0x74	; 116	t
	.db #0xB8	; 184
	.db #0xBC	; 188
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xB8	; 184
	.db #0xB8	; 184
	.db #0x04	; 4
	.db #0x49	; 73	I
	.db #0xBC	; 188
	.db #0x42	; 66	B
	.db #0x21	; 33
	.db #0x74	; 116	t
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x74	; 116	t
	.db #0xFC	; 252
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0x49	; 73	I
	.db #0x24	; 36
	.db #0xBC	; 188
	.db #0xB8	; 184
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x50	; 80	P
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x98	; 152
	.db #0xBC	; 188
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0xFC	; 252
	.db #0xBC	; 188
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x50	; 80	P
	.db #0x74	; 116	t
	.db #0x41	; 65	A
	.db #0x42	; 66	B
	.db #0x98	; 152
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xBC	; 188
	.db #0x98	; 152
	.db #0xB8	; 184
	.db #0x42	; 66	B
	.db #0x42	; 66	B
	.db #0x63	; 99	c
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x74	; 116	t
	.db #0xB8	; 184
	.db #0xBC	; 188
	.db #0xBC	; 188
	.db #0xBC	; 188
	.db #0xDC	; 220
	.db #0xB8	; 184
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x50	; 80	P
	.db #0x74	; 116	t
	.db #0x41	; 65	A
	.db #0x63	; 99	c
	.db #0xBC	; 188
	.db #0xDC	; 220
	.db #0x98	; 152
	.db #0xBC	; 188
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x98	; 152
	.db #0x74	; 116	t
	.db #0xB8	; 184
	.db #0x42	; 66	B
	.db #0x63	; 99	c
	.db #0x62	; 98	b
	.db #0x74	; 116	t
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xBC	; 188
	.db #0xBC	; 188
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0xBC	; 188
	.db #0xDC	; 220
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x98	; 152
	.db #0xBC	; 188
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0x49	; 73	I
	.db #0x04	; 4
	.db #0x50	; 80	P
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x50	; 80	P
	.db #0x98	; 152
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x49	; 73	I
	.db #0x04	; 4
	.db #0xBC	; 188
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x50	; 80	P
	.db #0x74	; 116	t
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0xFC	; 252
	.db #0xBC	; 188
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x50	; 80	P
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0xFC	; 252
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x74	; 116	t
	.db #0x98	; 152
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xB8	; 184
	.db #0x63	; 99	c
	.db #0x42	; 66	B
	.db #0x42	; 66	B
	.db #0x41	; 65	A
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xBC	; 188
	.db #0x98	; 152
	.db #0xDC	; 220
	.db #0xBC	; 188
	.db #0xBC	; 188
	.db #0xB8	; 184
	.db #0x74	; 116	t
	.db #0xBC	; 188
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x98	; 152
	.db #0x74	; 116	t
	.db #0xDC	; 220
	.db #0xBC	; 188
	.db #0xBC	; 188
	.db #0xB8	; 184
	.db #0x74	; 116	t
	.db #0x98	; 152
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x74	; 116	t
	.db #0x62	; 98	b
	.db #0x63	; 99	c
	.db #0x63	; 99	c
	.db #0x41	; 65	A
	.db #0x50	; 80	P
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x74	; 116	t
	.db #0xDC	; 220
	.db #0xBC	; 188
	.db #0xBC	; 188
	.db #0xB8	; 184
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x98	; 152
	.db #0x04	; 4
	.db #0x49	; 73	I
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x98	; 152
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xBC	; 188
	.db #0xBC	; 188
	.db #0x04	; 4
	.db #0x49	; 73	I
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0xBC	; 188
	.db #0xBC	; 188
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x98	; 152
	.db #0xB8	; 184
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0xBC	; 188
	.db #0x98	; 152
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0xFC	; 252
	.db #0x74	; 116	t
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x74	; 116	t
	.db #0xFC	; 252
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x50	; 80	P
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0x50	; 80	P
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x74	; 116	t
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x74	; 116	t
	.db #0x98	; 152
	.db #0x42	; 66	B
	.db #0x41	; 65	A
	.db #0x74	; 116	t
	.db #0x50	; 80	P
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x63	; 99	c
	.db #0x42	; 66	B
	.db #0x42	; 66	B
	.db #0xB8	; 184
	.db #0x98	; 152
	.db #0xBC	; 188
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xB8	; 184
	.db #0xDC	; 220
	.db #0xBC	; 188
	.db #0xBC	; 188
	.db #0xBC	; 188
	.db #0xB8	; 184
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x50	; 80	P
	.db #0x98	; 152
	.db #0xDC	; 220
	.db #0xBC	; 188
	.db #0x63	; 99	c
	.db #0x41	; 65	A
	.db #0x74	; 116	t
	.db #0x50	; 80	P
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0xB8	; 184
	.db #0x62	; 98	b
	.db #0x63	; 99	c
	.db #0x42	; 66	B
	.db #0xB8	; 184
	.db #0x74	; 116	t
	.db #0x98	; 152
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0xDC	; 220
	.db #0xBC	; 188
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0xBC	; 188
	.db #0xBC	; 188
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x98	; 152
	.db #0x04	; 4
	.db #0x49	; 73	I
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x50	; 80	P
	.db #0x98	; 152
	.db #0x50	; 80	P
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xBC	; 188
	.db #0x04	; 4
	.db #0x49	; 73	I
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0xFC	; 252
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x50	; 80	P
	.db #0xFC	; 252
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x74	; 116	t
	.db #0x50	; 80	P
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0xB8	; 184
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0x50	; 80	P
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xB2	; 178
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x74	; 116	t
	.db #0x42	; 66	B
	.db #0x42	; 66	B
	.db #0x42	; 66	B
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x98	; 152
	.db #0x21	; 33
	.db #0x42	; 66	B
	.db #0x74	; 116	t
	.db #0xBC	; 188
	.db #0xB8	; 184
	.db #0x63	; 99	c
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1C	; 28
	.db #0xBC	; 188
	.db #0x21	; 33
	.db #0x74	; 116	t
	.db #0xBC	; 188
	.db #0x98	; 152
	.db #0x62	; 98	b
	.db #0x62	; 98	b
	.db #0x50	; 80	P
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0xBC	; 188
	.db #0xB8	; 184
	.db #0x74	; 116	t
	.db #0x42	; 66	B
	.db #0x62	; 98	b
	.db #0xBC	; 188
	.db #0xB8	; 184
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x74	; 116	t
	.db #0x21	; 33
	.db #0x42	; 66	B
	.db #0xBC	; 188
	.db #0x49	; 73	I
	.db #0x04	; 4
	.db #0xB8	; 184
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x74	; 116	t
	.db #0xB8	; 184
	.db #0xBC	; 188
	.db #0x24	; 36
	.db #0x49	; 73	I
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0xFC	; 252
	.db #0x50	; 80	P
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x74	; 116	t
	.db #0xBC	; 188
	.db #0x98	; 152
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0xBC	; 188
	.db #0xFC	; 252
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x42	; 66	B
	.db #0x42	; 66	B
	.db #0x98	; 152
	.db #0x63	; 99	c
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xB2	; 178
	.db #0x74	; 116	t
	.db #0x42	; 66	B
	.db #0x42	; 66	B
	.db #0xDC	; 220
	.db #0x63	; 99	c
	.db #0xBC	; 188
	.db #0xB8	; 184
	.db #0x50	; 80	P
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x50	; 80	P
	.db #0x74	; 116	t
	.db #0x42	; 66	B
	.db #0xB8	; 184
	.db #0x62	; 98	b
	.db #0x62	; 98	b
	.db #0xDC	; 220
	.db #0x04	; 4
	.db #0x98	; 152
	.db #0x74	; 116	t
	.db #0xBC	; 188
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x98	; 152
	.db #0x42	; 66	B
	.db #0x21	; 33
	.db #0x98	; 152
	.db #0x42	; 66	B
	.db #0xB8	; 184
	.db #0x49	; 73	I
	.db #0x49	; 73	I
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0xBC	; 188
	.db #0xB8	; 184
	.db #0x74	; 116	t
	.db #0x21	; 33
	.db #0xB8	; 184
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x50	; 80	P
	.db #0x00	; 0
	.db #0x50	; 80	P
	.db #0x04	; 4
	.db #0x74	; 116	t
	.db #0x98	; 152
	.db #0x98	; 152
	.db #0xBC	; 188
	.db #0xBC	; 188
	.db #0xBC	; 188
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0xBC	; 188
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x50	; 80	P
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0x04	; 4
	.db #0x74	; 116	t
	.db #0x98	; 152
	.db #0xFC	; 252
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0xB8	; 184
	.db #0x50	; 80	P
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_car3:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x08	; 8
	.db #0x0C	; 12
	.db #0x65	; 101	e
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x65	; 101	e
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0xB8	; 184
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x20	; 32
	.db #0x14	; 20
	.db #0xAE	; 174
	.db #0x1C	; 28
	.db #0x1C	; 28
	.db #0xAE	; 174
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1C	; 28
	.db #0x20	; 32
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x1C	; 28
	.db #0x1C	; 28
	.db #0xD2	; 210
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x1C	; 28
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x9C	; 156
	.db #0x18	; 24
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x1C	; 28
	.db #0x18	; 24
	.db #0xFC	; 252
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x0C	; 12
	.db #0x10	; 16
	.db #0x0C	; 12
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x18	; 24
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x65	; 101	e
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0xB8	; 184
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x65	; 101	e
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0xAE	; 174
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x14	; 20
	.db #0xAE	; 174
	.db #0x1C	; 28
	.db #0x1C	; 28
	.db #0xD2	; 210
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x20	; 32
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x1C	; 28
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0xFC	; 252
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x1C	; 28
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x18	; 24
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x0C	; 12
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x9C	; 156
	.db #0x14	; 20
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x10	; 16
	.db #0xB8	; 184
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x8A	; 138
	.db #0x18	; 24
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0xB2	; 178
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0xB2	; 178
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x8A	; 138
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0xBC	; 188
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x20	; 32
	.db #0x14	; 20
	.db #0xB2	; 178
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x1C	; 28
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x0C	; 12
	.db #0x20	; 32
	.db #0x1C	; 28
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x0C	; 12
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x9C	; 156
	.db #0x18	; 24
	.db #0x0C	; 12
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x98	; 152
	.db #0x10	; 16
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x8A	; 138
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x10	; 16
	.db #0x98	; 152
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0xD6	; 214
	.db #0xB2	; 178
	.db #0x8A	; 138
	.db #0x1C	; 28
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0xB2	; 178
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0xB2	; 178
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x1C	; 28
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x9C	; 156
	.db #0x14	; 20
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1C	; 28
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x98	; 152
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x98	; 152
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x1C	; 28
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x08	; 8
	.db #0x8A	; 138
	.db #0xD6	; 214
	.db #0xB2	; 178
	.db #0x8A	; 138
	.db #0x08	; 8
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0xB2	; 178
	.db #0xB2	; 178
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x9C	; 156
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x9C	; 156
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x1C	; 28
	.db #0x1C	; 28
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x98	; 152
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x98	; 152
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x1C	; 28
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0xB2	; 178
	.db #0x8A	; 138
	.db #0x08	; 8
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x08	; 8
	.db #0x8A	; 138
	.db #0x18	; 24
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0xB2	; 178
	.db #0xB2	; 178
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x9C	; 156
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x9C	; 156
	.db #0x18	; 24
	.db #0x1C	; 28
	.db #0x1C	; 28
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0xB8	; 184
	.db #0x10	; 16
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x18	; 24
	.db #0x8A	; 138
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0xB2	; 178
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0xBC	; 188
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x8A	; 138
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0xB2	; 178
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0xB2	; 178
	.db #0x14	; 20
	.db #0x20	; 32
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x1C	; 28
	.db #0x20	; 32
	.db #0x0C	; 12
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x0C	; 12
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x0C	; 12
	.db #0x18	; 24
	.db #0x9C	; 156
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x98	; 152
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x65	; 101	e
	.db #0x10	; 16
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x1C	; 28
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0xAE	; 174
	.db #0x1C	; 28
	.db #0x1C	; 28
	.db #0x65	; 101	e
	.db #0x0C	; 12
	.db #0x08	; 8
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0xD2	; 210
	.db #0x1C	; 28
	.db #0x1C	; 28
	.db #0xAE	; 174
	.db #0x14	; 20
	.db #0x20	; 32
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0xFC	; 252
	.db #0x18	; 24
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x1C	; 28
	.db #0x20	; 32
	.db #0x1C	; 28
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x18	; 24
	.db #0x24	; 36
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x0C	; 12
	.db #0x10	; 16
	.db #0x0C	; 12
	.db #0x24	; 36
	.db #0x1C	; 28
	.db #0x18	; 24
	.db #0x9C	; 156
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xB8	; 184
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x65	; 101	e
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x65	; 101	e
	.db #0x0C	; 12
	.db #0x08	; 8
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0xAE	; 174
	.db #0x1C	; 28
	.db #0x1C	; 28
	.db #0xAE	; 174
	.db #0x14	; 20
	.db #0x20	; 32
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x1C	; 28
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0xD2	; 210
	.db #0x1C	; 28
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x1C	; 28
	.db #0x20	; 32
	.db #0x1C	; 28
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0xFC	; 252
	.db #0x18	; 24
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x1C	; 28
	.db #0x18	; 24
	.db #0x9C	; 156
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x18	; 24
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x0C	; 12
	.db #0x10	; 16
	.db #0x0C	; 12
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x14	; 20
	.db #0x5C	; 92
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x65	; 101	e
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x65	; 101	e
	.db #0x0C	; 12
	.db #0x20	; 32
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xB8	; 184
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0xAE	; 174
	.db #0x1C	; 28
	.db #0x1C	; 28
	.db #0xAE	; 174
	.db #0x14	; 20
	.db #0x20	; 32
	.db #0x1C	; 28
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0xD2	; 210
	.db #0x1C	; 28
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x1C	; 28
	.db #0x18	; 24
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x1C	; 28
	.db #0x18	; 24
	.db #0x9C	; 156
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0xFC	; 252
	.db #0x18	; 24
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x10	; 16
	.db #0x0C	; 12
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x18	; 24
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x1C	; 28
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0x20	; 32
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0xB2	; 178
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x8A	; 138
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0xD6	; 214
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x10	; 16
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFC	; 252
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x1C	; 28
	.db #0x8A	; 138
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x04	; 4
	.db #0xFC	; 252
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x18	; 24
	.db #0x1C	; 28
	.db #0x1C	; 28
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0xB2	; 178
	.db #0xB2	; 178
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0x8A	; 138
	.db #0x18	; 24
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0xD6	; 214
	.db #0xB2	; 178
	.db #0x8A	; 138
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x1C	; 28
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFC	; 252
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x1C	; 28
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x0C	; 12
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0xFC	; 252
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x0C	; 12
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x1C	; 28
	.db #0x1C	; 28
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0xB2	; 178
	.db #0xB2	; 178
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0x8A	; 138
	.db #0xD6	; 214
	.db #0xB2	; 178
	.db #0x8A	; 138
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x1C	; 28
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFC	; 252
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x0C	; 12
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x0C	; 12
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x1C	; 28
	.db #0x1C	; 28
	.db #0x18	; 24
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0xB2	; 178
	.db #0xB2	; 178
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0x1C	; 28
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0x1C	; 28
	.db #0x18	; 24
	.db #0x8A	; 138
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x8A	; 138
	.db #0xB2	; 178
	.db #0xD6	; 214
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x1C	; 28
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0xFC	; 252
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x0C	; 12
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x0C	; 12
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1C	; 28
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x20	; 32
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0xB2	; 178
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0x1C	; 28
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x8A	; 138
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x10	; 16
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0x1C	; 28
	.db #0xD6	; 214
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x8A	; 138
	.db #0x1C	; 28
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0xFC	; 252
	.db #0x04	; 4
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x08	; 8
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x14	; 20
	.db #0x20	; 32
	.db #0x14	; 20
	.db #0x65	; 101	e
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x1C	; 28
	.db #0x20	; 32
	.db #0x1C	; 28
	.db #0xAE	; 174
	.db #0x1C	; 28
	.db #0x1C	; 28
	.db #0x65	; 101	e
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0xB8	; 184
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x1C	; 28
	.db #0x1C	; 28
	.db #0xD2	; 210
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x9C	; 156
	.db #0x18	; 24
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x1C	; 28
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x0C	; 12
	.db #0x10	; 16
	.db #0x0C	; 12
	.db #0x1C	; 28
	.db #0x18	; 24
	.db #0xFC	; 252
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0x18	; 24
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_car4:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x64	; 100	d
	.db #0x64	; 100	d
	.db #0x89	; 137
	.db #0x89	; 137
	.db #0x64	; 100	d
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x8D	; 141
	.db #0xD6	; 214
	.db #0xB1	; 177
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x8D	; 141
	.db #0x64	; 100	d
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x1C	; 28
	.db #0x8D	; 141
	.db #0xD6	; 214
	.db #0xB1	; 177
	.db #0x42	; 66	B
	.db #0x42	; 66	B
	.db #0x62	; 98	b
	.db #0xB1	; 177
	.db #0x44	; 68	D
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x64	; 100	d
	.db #0x44	; 68	D
	.db #0x64	; 100	d
	.db #0x44	; 68	D
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x42	; 66	B
	.db #0x8D	; 141
	.db #0xDC	; 220
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x44	; 68	D
	.db #0x44	; 68	D
	.db #0x64	; 100	d
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x89	; 137
	.db #0x89	; 137
	.db #0xBC	; 188
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x14	; 20
	.db #0x89	; 137
	.db #0x8D	; 141
	.db #0x8D	; 141
	.db #0x8D	; 141
	.db #0x89	; 137
	.db #0x89	; 137
	.db #0x64	; 100	d
	.db #0x44	; 68	D
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x64	; 100	d
	.db #0x89	; 137
	.db #0xB1	; 177
	.db #0x8D	; 141
	.db #0x89	; 137
	.db #0x64	; 100	d
	.db #0x44	; 68	D
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x44	; 68	D
	.db #0x64	; 100	d
	.db #0x64	; 100	d
	.db #0x44	; 68	D
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x44	; 68	D
	.db #0x89	; 137
	.db #0x64	; 100	d
	.db #0x44	; 68	D
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x64	; 100	d
	.db #0x64	; 100	d
	.db #0x89	; 137
	.db #0x21	; 33
	.db #0x8D	; 141
	.db #0x9C	; 156
	.db #0x44	; 68	D
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x64	; 100	d
	.db #0xB1	; 177
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x42	; 66	B
	.db #0x62	; 98	b
	.db #0xB1	; 177
	.db #0xDC	; 220
	.db #0x44	; 68	D
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x8D	; 141
	.db #0xD6	; 214
	.db #0xB1	; 177
	.db #0x42	; 66	B
	.db #0x21	; 33
	.db #0x42	; 66	B
	.db #0x8D	; 141
	.db #0x8D	; 141
	.db #0x64	; 100	d
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1C	; 28
	.db #0x8D	; 141
	.db #0xB1	; 177
	.db #0x64	; 100	d
	.db #0x44	; 68	D
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x89	; 137
	.db #0x89	; 137
	.db #0x44	; 68	D
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x64	; 100	d
	.db #0x44	; 68	D
	.db #0x64	; 100	d
	.db #0x21	; 33
	.db #0x8D	; 141
	.db #0x89	; 137
	.db #0x89	; 137
	.db #0x64	; 100	d
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x44	; 68	D
	.db #0x89	; 137
	.db #0x8D	; 141
	.db #0x8D	; 141
	.db #0x8D	; 141
	.db #0x89	; 137
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x14	; 20
	.db #0x64	; 100	d
	.db #0x89	; 137
	.db #0xB1	; 177
	.db #0x64	; 100	d
	.db #0x44	; 68	D
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x44	; 68	D
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x44	; 68	D
	.db #0x64	; 100	d
	.db #0x44	; 68	D
	.db #0xDC	; 220
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x64	; 100	d
	.db #0x89	; 137
	.db #0xB1	; 177
	.db #0x8D	; 141
	.db #0x8D	; 141
	.db #0x89	; 137
	.db #0xBC	; 188
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x44	; 68	D
	.db #0x64	; 100	d
	.db #0x89	; 137
	.db #0x21	; 33
	.db #0x62	; 98	b
	.db #0x89	; 137
	.db #0x89	; 137
	.db #0x44	; 68	D
	.db #0x44	; 68	D
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x64	; 100	d
	.db #0x89	; 137
	.db #0x8D	; 141
	.db #0xD6	; 214
	.db #0x42	; 66	B
	.db #0x62	; 98	b
	.db #0x89	; 137
	.db #0x64	; 100	d
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x64	; 100	d
	.db #0x8D	; 141
	.db #0xD6	; 214
	.db #0xD6	; 214
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x89	; 137
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x1C	; 28
	.db #0x44	; 68	D
	.db #0x8D	; 141
	.db #0x44	; 68	D
	.db #0x44	; 68	D
	.db #0x21	; 33
	.db #0x89	; 137
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x64	; 100	d
	.db #0x44	; 68	D
	.db #0x44	; 68	D
	.db #0x64	; 100	d
	.db #0x89	; 137
	.db #0x64	; 100	d
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x44	; 68	D
	.db #0x14	; 20
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x44	; 68	D
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x44	; 68	D
	.db #0x64	; 100	d
	.db #0x89	; 137
	.db #0xDC	; 220
	.db #0xBC	; 188
	.db #0x44	; 68	D
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	D
	.db #0x89	; 137
	.db #0xB1	; 177
	.db #0x8D	; 141
	.db #0x89	; 137
	.db #0x64	; 100	d
	.db #0x44	; 68	D
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x89	; 137
	.db #0x8D	; 141
	.db #0x21	; 33
	.db #0x62	; 98	b
	.db #0x42	; 66	B
	.db #0x89	; 137
	.db #0x89	; 137
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	D
	.db #0x64	; 100	d
	.db #0x64	; 100	d
	.db #0x89	; 137
	.db #0xB1	; 177
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x89	; 137
	.db #0x64	; 100	d
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x44	; 68	D
	.db #0x89	; 137
	.db #0x89	; 137
	.db #0xB1	; 177
	.db #0x8D	; 141
	.db #0x21	; 33
	.db #0xB1	; 177
	.db #0x64	; 100	d
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x44	; 68	D
	.db #0x64	; 100	d
	.db #0x64	; 100	d
	.db #0xD6	; 214
	.db #0xB2	; 178
	.db #0x64	; 100	d
	.db #0x89	; 137
	.db #0x44	; 68	D
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x20	; 32
	.db #0x1C	; 28
	.db #0x64	; 100	d
	.db #0x89	; 137
	.db #0x44	; 68	D
	.db #0x44	; 68	D
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x44	; 68	D
	.db #0x14	; 20
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x44	; 68	D
	.db #0xDC	; 220
	.db #0xBC	; 188
	.db #0x44	; 68	D
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x64	; 100	d
	.db #0xB1	; 177
	.db #0x8D	; 141
	.db #0x89	; 137
	.db #0x64	; 100	d
	.db #0x44	; 68	D
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x64	; 100	d
	.db #0xB1	; 177
	.db #0x8D	; 141
	.db #0x62	; 98	b
	.db #0x42	; 66	B
	.db #0x89	; 137
	.db #0x89	; 137
	.db #0x44	; 68	D
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x89	; 137
	.db #0x8D	; 141
	.db #0x21	; 33
	.db #0x42	; 66	B
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x89	; 137
	.db #0x64	; 100	d
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x64	; 100	d
	.db #0x89	; 137
	.db #0x21	; 33
	.db #0xB1	; 177
	.db #0x8D	; 141
	.db #0x21	; 33
	.db #0xB1	; 177
	.db #0x64	; 100	d
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x64	; 100	d
	.db #0x89	; 137
	.db #0x64	; 100	d
	.db #0xD6	; 214
	.db #0xB2	; 178
	.db #0x64	; 100	d
	.db #0x89	; 137
	.db #0x64	; 100	d
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x64	; 100	d
	.db #0x44	; 68	D
	.db #0x8D	; 141
	.db #0x89	; 137
	.db #0x44	; 68	D
	.db #0x64	; 100	d
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x1C	; 28
	.db #0x64	; 100	d
	.db #0x44	; 68	D
	.db #0x14	; 20
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	D
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x44	; 68	D
	.db #0xBC	; 188
	.db #0xDC	; 220
	.db #0x89	; 137
	.db #0x64	; 100	d
	.db #0x44	; 68	D
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x44	; 68	D
	.db #0x64	; 100	d
	.db #0x89	; 137
	.db #0x8D	; 141
	.db #0xB1	; 177
	.db #0x89	; 137
	.db #0x44	; 68	D
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x89	; 137
	.db #0x89	; 137
	.db #0x42	; 66	B
	.db #0x62	; 98	b
	.db #0x21	; 33
	.db #0x8D	; 141
	.db #0x89	; 137
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x64	; 100	d
	.db #0x89	; 137
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0xB1	; 177
	.db #0x89	; 137
	.db #0x64	; 100	d
	.db #0x64	; 100	d
	.db #0x44	; 68	D
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x64	; 100	d
	.db #0xB1	; 177
	.db #0x21	; 33
	.db #0x8D	; 141
	.db #0xB1	; 177
	.db #0x89	; 137
	.db #0x89	; 137
	.db #0x44	; 68	D
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	D
	.db #0x89	; 137
	.db #0x64	; 100	d
	.db #0xB2	; 178
	.db #0xD6	; 214
	.db #0x64	; 100	d
	.db #0x64	; 100	d
	.db #0x44	; 68	D
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x44	; 68	D
	.db #0x44	; 68	D
	.db #0x89	; 137
	.db #0x64	; 100	d
	.db #0x1C	; 28
	.db #0x20	; 32
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0x14	; 20
	.db #0x44	; 68	D
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xDC	; 220
	.db #0x44	; 68	D
	.db #0x64	; 100	d
	.db #0x44	; 68	D
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xBC	; 188
	.db #0x89	; 137
	.db #0x8D	; 141
	.db #0x8D	; 141
	.db #0xB1	; 177
	.db #0x89	; 137
	.db #0x64	; 100	d
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	D
	.db #0x44	; 68	D
	.db #0x89	; 137
	.db #0x89	; 137
	.db #0x62	; 98	b
	.db #0x21	; 33
	.db #0x89	; 137
	.db #0x64	; 100	d
	.db #0x44	; 68	D
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x64	; 100	d
	.db #0x89	; 137
	.db #0x62	; 98	b
	.db #0x42	; 66	B
	.db #0xD6	; 214
	.db #0x8D	; 141
	.db #0x89	; 137
	.db #0x64	; 100	d
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x89	; 137
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0xD6	; 214
	.db #0xD6	; 214
	.db #0x8D	; 141
	.db #0x64	; 100	d
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x89	; 137
	.db #0x21	; 33
	.db #0x44	; 68	D
	.db #0x44	; 68	D
	.db #0x8D	; 141
	.db #0x44	; 68	D
	.db #0x1C	; 28
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x64	; 100	d
	.db #0x89	; 137
	.db #0x64	; 100	d
	.db #0x44	; 68	D
	.db #0x44	; 68	D
	.db #0x64	; 100	d
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x14	; 20
	.db #0x44	; 68	D
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	D
	.db #0x64	; 100	d
	.db #0x89	; 137
	.db #0x44	; 68	D
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	D
	.db #0x9C	; 156
	.db #0x8D	; 141
	.db #0x21	; 33
	.db #0x89	; 137
	.db #0x64	; 100	d
	.db #0x64	; 100	d
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	D
	.db #0xDC	; 220
	.db #0xB1	; 177
	.db #0x62	; 98	b
	.db #0x42	; 66	B
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0xB1	; 177
	.db #0x64	; 100	d
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x64	; 100	d
	.db #0x8D	; 141
	.db #0x8D	; 141
	.db #0x42	; 66	B
	.db #0x21	; 33
	.db #0x42	; 66	B
	.db #0xB1	; 177
	.db #0xD6	; 214
	.db #0x8D	; 141
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	D
	.db #0x89	; 137
	.db #0x89	; 137
	.db #0x89	; 137
	.db #0x21	; 33
	.db #0x44	; 68	D
	.db #0x64	; 100	d
	.db #0xB1	; 177
	.db #0x8D	; 141
	.db #0x1C	; 28
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x64	; 100	d
	.db #0x89	; 137
	.db #0x89	; 137
	.db #0x8D	; 141
	.db #0x21	; 33
	.db #0x64	; 100	d
	.db #0x44	; 68	D
	.db #0x64	; 100	d
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x89	; 137
	.db #0x8D	; 141
	.db #0x8D	; 141
	.db #0x8D	; 141
	.db #0x89	; 137
	.db #0x44	; 68	D
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x44	; 68	D
	.db #0x64	; 100	d
	.db #0xB1	; 177
	.db #0x89	; 137
	.db #0x64	; 100	d
	.db #0x14	; 20
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	D
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x64	; 100	d
	.db #0x89	; 137
	.db #0x89	; 137
	.db #0x64	; 100	d
	.db #0x64	; 100	d
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x64	; 100	d
	.db #0x8D	; 141
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0xB1	; 177
	.db #0xD6	; 214
	.db #0x8D	; 141
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	D
	.db #0xB1	; 177
	.db #0x62	; 98	b
	.db #0x42	; 66	B
	.db #0x42	; 66	B
	.db #0xB1	; 177
	.db #0xD6	; 214
	.db #0x8D	; 141
	.db #0x1C	; 28
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xDC	; 220
	.db #0x8D	; 141
	.db #0x42	; 66	B
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x44	; 68	D
	.db #0x64	; 100	d
	.db #0x44	; 68	D
	.db #0x64	; 100	d
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xBC	; 188
	.db #0x89	; 137
	.db #0x89	; 137
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x64	; 100	d
	.db #0x44	; 68	D
	.db #0x44	; 68	D
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	D
	.db #0x64	; 100	d
	.db #0x89	; 137
	.db #0x89	; 137
	.db #0x8D	; 141
	.db #0x8D	; 141
	.db #0x8D	; 141
	.db #0x89	; 137
	.db #0x14	; 20
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x44	; 68	D
	.db #0x64	; 100	d
	.db #0x89	; 137
	.db #0x8D	; 141
	.db #0xB1	; 177
	.db #0x89	; 137
	.db #0x64	; 100	d
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x44	; 68	D
	.db #0x64	; 100	d
	.db #0x64	; 100	d
	.db #0x44	; 68	D
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x64	; 100	d
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x89	; 137
	.db #0x89	; 137
	.db #0x64	; 100	d
	.db #0xD6	; 214
	.db #0x8D	; 141
	.db #0x1C	; 28
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x8D	; 141
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0xB1	; 177
	.db #0xD6	; 214
	.db #0x44	; 68	D
	.db #0x64	; 100	d
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x64	; 100	d
	.db #0x62	; 98	b
	.db #0x42	; 66	B
	.db #0x42	; 66	B
	.db #0x44	; 68	D
	.db #0x64	; 100	d
	.db #0x44	; 68	D
	.db #0x44	; 68	D
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	D
	.db #0xB1	; 177
	.db #0x42	; 66	B
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x64	; 100	d
	.db #0x89	; 137
	.db #0x14	; 20
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xDC	; 220
	.db #0x89	; 137
	.db #0x89	; 137
	.db #0x21	; 33
	.db #0x8D	; 141
	.db #0x8D	; 141
	.db #0x89	; 137
	.db #0x64	; 100	d
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xBC	; 188
	.db #0x64	; 100	d
	.db #0x89	; 137
	.db #0x89	; 137
	.db #0x8D	; 141
	.db #0xB1	; 177
	.db #0x44	; 68	D
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x44	; 68	D
	.db #0x64	; 100	d
	.db #0x44	; 68	D
	.db #0x64	; 100	d
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x44	; 68	D
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x64	; 100	d
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	D
	.db #0x64	; 100	d
	.db #0x40	; 64
	.db #0x44	; 68	D
	.db #0x64	; 100	d
	.db #0x64	; 100	d
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x64	; 100	d
	.db #0x89	; 137
	.db #0x21	; 33
	.db #0x89	; 137
	.db #0x8D	; 141
	.db #0x44	; 68	D
	.db #0x40	; 64
	.db #0x44	; 68	D
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x89	; 137
	.db #0xB1	; 177
	.db #0x21	; 33
	.db #0x42	; 66	B
	.db #0xD6	; 214
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x44	; 68	D
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x40	; 64
	.db #0x89	; 137
	.db #0x8D	; 141
	.db #0x42	; 66	B
	.db #0x62	; 98	b
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x89	; 137
	.db #0x64	; 100	d
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x89	; 137
	.db #0x89	; 137
	.db #0x8D	; 141
	.db #0x42	; 66	B
	.db #0x21	; 33
	.db #0x89	; 137
	.db #0x89	; 137
	.db #0x44	; 68	D
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x40	; 64
	.db #0xDC	; 220
	.db #0x8D	; 141
	.db #0xB1	; 177
	.db #0xB1	; 177
	.db #0x8D	; 141
	.db #0x89	; 137
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0xDC	; 220
	.db #0x89	; 137
	.db #0x89	; 137
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x64	; 100	d
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x44	; 68	D
	.db #0x40	; 64
	.db #0x44	; 68	D
	.db #0x64	; 100	d
	.db #0x64	; 100	d
	.db #0x40	; 64
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	D
	.db #0x44	; 68	D
	.db #0x64	; 100	d
	.db #0x89	; 137
	.db #0x8D	; 141
	.db #0x44	; 68	D
	.db #0x64	; 100	d
	.db #0x44	; 68	D
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x64	; 100	d
	.db #0x21	; 33
	.db #0x8D	; 141
	.db #0xB2	; 178
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x89	; 137
	.db #0x44	; 68	D
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x89	; 137
	.db #0xB1	; 177
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x40	; 64
	.db #0x89	; 137
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x64	; 100	d
	.db #0x89	; 137
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x8D	; 141
	.db #0x8D	; 141
	.db #0x8D	; 141
	.db #0x89	; 137
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x40	; 64
	.db #0x89	; 137
	.db #0x8D	; 141
	.db #0x8D	; 141
	.db #0xB1	; 177
	.db #0xB1	; 177
	.db #0x89	; 137
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x40	; 64
	.db #0x9C	; 156
	.db #0xDC	; 220
	.db #0xB1	; 177
	.db #0x89	; 137
	.db #0x40	; 64
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x14	; 20
	.db #0x64	; 100	d
	.db #0x40	; 64
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x44	; 68	D
	.db #0x40	; 64
	.db #0x64	; 100	d
	.db #0x44	; 68	D
	.db #0x40	; 64
	.db #0x44	; 68	D
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x44	; 68	D
	.db #0x64	; 100	d
	.db #0x44	; 68	D
	.db #0x8D	; 141
	.db #0x89	; 137
	.db #0x44	; 68	D
	.db #0x64	; 100	d
	.db #0x44	; 68	D
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x64	; 100	d
	.db #0x89	; 137
	.db #0x21	; 33
	.db #0xD6	; 214
	.db #0xB2	; 178
	.db #0x21	; 33
	.db #0x89	; 137
	.db #0x64	; 100	d
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x89	; 137
	.db #0x89	; 137
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0xB1	; 177
	.db #0x89	; 137
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x89	; 137
	.db #0x8D	; 141
	.db #0x8D	; 141
	.db #0x42	; 66	B
	.db #0x21	; 33
	.db #0x8D	; 141
	.db #0x89	; 137
	.db #0x64	; 100	d
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x40	; 64
	.db #0x89	; 137
	.db #0xB1	; 177
	.db #0xB1	; 177
	.db #0x8D	; 141
	.db #0x89	; 137
	.db #0x89	; 137
	.db #0x40	; 64
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x40	; 64
	.db #0x89	; 137
	.db #0xDC	; 220
	.db #0x9C	; 156
	.db #0x64	; 100	d
	.db #0x40	; 64
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x64	; 100	d
	.db #0x64	; 100	d
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x40	; 64
	.db #0x64	; 100	d
	.db #0x64	; 100	d
	.db #0x44	; 68	D
	.db #0x40	; 64
	.db #0x44	; 68	D
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x44	; 68	D
	.db #0x64	; 100	d
	.db #0x44	; 68	D
	.db #0x8D	; 141
	.db #0x89	; 137
	.db #0x64	; 100	d
	.db #0x40	; 64
	.db #0x44	; 68	D
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x44	; 68	D
	.db #0x89	; 137
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0xB2	; 178
	.db #0x40	; 64
	.db #0x21	; 33
	.db #0x64	; 100	d
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x89	; 137
	.db #0x89	; 137
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0xB1	; 177
	.db #0x89	; 137
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x89	; 137
	.db #0x8D	; 141
	.db #0x8D	; 141
	.db #0x42	; 66	B
	.db #0x21	; 33
	.db #0x8D	; 141
	.db #0x89	; 137
	.db #0x64	; 100	d
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x89	; 137
	.db #0xB1	; 177
	.db #0xB1	; 177
	.db #0x8D	; 141
	.db #0x89	; 137
	.db #0x89	; 137
	.db #0x40	; 64
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x40	; 64
	.db #0x89	; 137
	.db #0xDC	; 220
	.db #0x9C	; 156
	.db #0x64	; 100	d
	.db #0x40	; 64
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x64	; 100	d
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x44	; 68	D
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x64	; 100	d
	.db #0x64	; 100	d
	.db #0x44	; 68	D
	.db #0x40	; 64
	.db #0x64	; 100	d
	.db #0x44	; 68	D
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x44	; 68	D
	.db #0x40	; 64
	.db #0x44	; 68	D
	.db #0x8D	; 141
	.db #0x89	; 137
	.db #0x21	; 33
	.db #0x89	; 137
	.db #0x64	; 100	d
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0x44	; 68	D
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0xD6	; 214
	.db #0x42	; 66	B
	.db #0x21	; 33
	.db #0xB1	; 177
	.db #0x89	; 137
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x64	; 100	d
	.db #0x89	; 137
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x62	; 98	b
	.db #0x42	; 66	B
	.db #0x8D	; 141
	.db #0x89	; 137
	.db #0x40	; 64
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	D
	.db #0x89	; 137
	.db #0x89	; 137
	.db #0x21	; 33
	.db #0x42	; 66	B
	.db #0x8D	; 141
	.db #0x89	; 137
	.db #0x89	; 137
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x89	; 137
	.db #0x8D	; 141
	.db #0xB1	; 177
	.db #0xB1	; 177
	.db #0x8D	; 141
	.db #0xDC	; 220
	.db #0x40	; 64
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x89	; 137
	.db #0x89	; 137
	.db #0xDC	; 220
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x64	; 100	d
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x1C	; 28
	.db #0x8D	; 141
	.db #0xD6	; 214
	.db #0x64	; 100	d
	.db #0x89	; 137
	.db #0x89	; 137
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x64	; 100	d
	.db #0x44	; 68	D
	.db #0xD6	; 214
	.db #0xB1	; 177
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x8D	; 141
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x44	; 68	D
	.db #0x44	; 68	D
	.db #0x64	; 100	d
	.db #0x44	; 68	D
	.db #0x42	; 66	B
	.db #0x42	; 66	B
	.db #0x62	; 98	b
	.db #0x64	; 100	d
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x14	; 20
	.db #0x89	; 137
	.db #0x64	; 100	d
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x42	; 66	B
	.db #0xB1	; 177
	.db #0x44	; 68	D
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x64	; 100	d
	.db #0x89	; 137
	.db #0x8D	; 141
	.db #0x8D	; 141
	.db #0x21	; 33
	.db #0x89	; 137
	.db #0x89	; 137
	.db #0xDC	; 220
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x44	; 68	D
	.db #0xB1	; 177
	.db #0x8D	; 141
	.db #0x89	; 137
	.db #0x89	; 137
	.db #0x64	; 100	d
	.db #0xBC	; 188
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x64	; 100	d
	.db #0x44	; 68	D
	.db #0x64	; 100	d
	.db #0x44	; 68	D
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_shadow:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_charTable:
	.db #0x7C	; 124
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0x7C	; 124
	.db #0x18	; 24
	.db #0x38	; 56
	.db #0x78	; 120	x
	.db #0x38	; 56
	.db #0x38	; 56
	.db #0x38	; 56
	.db #0x38	; 56
	.db #0x7C	; 124
	.db #0x7C	; 124
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0x0E	; 14
	.db #0x1C	; 28
	.db #0x38	; 56
	.db #0x70	; 112	p
	.db #0xFE	; 254
	.db #0x7C	; 124
	.db #0xEE	; 238
	.db #0x0E	; 14
	.db #0x1C	; 28
	.db #0x0E	; 14
	.db #0xCE	; 206
	.db #0xEE	; 238
	.db #0x7C	; 124
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0x7E	; 126
	.db #0x1E	; 30
	.db #0x0E	; 14
	.db #0x0E	; 14
	.db #0x0E	; 14
	.db #0xFE	; 254
	.db #0xE0	; 224
	.db #0xE0	; 224
	.db #0x7C	; 124
	.db #0x1E	; 30
	.db #0xCE	; 206
	.db #0xEE	; 238
	.db #0x7C	; 124
	.db #0x7C	; 124
	.db #0xE6	; 230
	.db #0xE0	; 224
	.db #0xF8	; 248
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0x7C	; 124
	.db #0x7E	; 126
	.db #0xFE	; 254
	.db #0x0E	; 14
	.db #0x0E	; 14
	.db #0x1C	; 28
	.db #0x1C	; 28
	.db #0x38	; 56
	.db #0x38	; 56
	.db #0x7C	; 124
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0x7C	; 124
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0x7C	; 124
	.db #0x7C	; 124
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0x3E	; 62
	.db #0x0E	; 14
	.db #0x0E	; 14
	.db #0xCE	; 206
	.db #0x7C	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x30	; 48
	.db #0x30	; 48
	.db #0x00	; 0
	.db #0x30	; 48
	.db #0x30	; 48
	.db #0x60	; 96
	.db #0x18	; 24
	.db #0x30	; 48
	.db #0x60	; 96
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0x60	; 96
	.db #0x30	; 48
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7C	; 124
	.db #0x7C	; 124
	.db #0x00	; 0
	.db #0x7C	; 124
	.db #0x7C	; 124
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x0C	; 12
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x06	; 6
	.db #0x0C	; 12
	.db #0x18	; 24
	.db #0x3C	; 60
	.db #0x66	; 102	f
	.db #0x66	; 102	f
	.db #0x0C	; 12
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x3C	; 60
	.db #0x42	; 66	B
	.db #0x9A	; 154
	.db #0xA4	; 164
	.db #0xA4	; 164
	.db #0x98	; 152
	.db #0x42	; 66	B
	.db #0x3C	; 60
	.db #0x7C	; 124
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xFE	; 254
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xFC	; 252
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xFC	; 252
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xFC	; 252
	.db #0x7C	; 124
	.db #0xEE	; 238
	.db #0xE0	; 224
	.db #0xE0	; 224
	.db #0xE0	; 224
	.db #0xE0	; 224
	.db #0xEE	; 238
	.db #0x7C	; 124
	.db #0xFC	; 252
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xFC	; 252
	.db #0x7C	; 124
	.db #0xEE	; 238
	.db #0xE0	; 224
	.db #0xF8	; 248
	.db #0xE0	; 224
	.db #0xE0	; 224
	.db #0xEE	; 238
	.db #0x7C	; 124
	.db #0x7C	; 124
	.db #0xEE	; 238
	.db #0xE0	; 224
	.db #0xF8	; 248
	.db #0xE0	; 224
	.db #0xE0	; 224
	.db #0xE0	; 224
	.db #0xE0	; 224
	.db #0x7C	; 124
	.db #0xEE	; 238
	.db #0xE0	; 224
	.db #0xE0	; 224
	.db #0xEE	; 238
	.db #0xE6	; 230
	.db #0xEE	; 238
	.db #0x7C	; 124
	.db #0x6C	; 108	l
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xFE	; 254
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0x7C	; 124
	.db #0x38	; 56
	.db #0x38	; 56
	.db #0x38	; 56
	.db #0x38	; 56
	.db #0x38	; 56
	.db #0x38	; 56
	.db #0x7C	; 124
	.db #0x0C	; 12
	.db #0x0E	; 14
	.db #0x0E	; 14
	.db #0x0E	; 14
	.db #0x0E	; 14
	.db #0x0E	; 14
	.db #0xEE	; 238
	.db #0x7C	; 124
	.db #0xEC	; 236
	.db #0xEE	; 238
	.db #0xEC	; 236
	.db #0xF8	; 248
	.db #0xEC	; 236
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xEC	; 236
	.db #0x60	; 96
	.db #0xE0	; 224
	.db #0xE0	; 224
	.db #0xE0	; 224
	.db #0xE0	; 224
	.db #0xE0	; 224
	.db #0xEE	; 238
	.db #0x7C	; 124
	.db #0xEE	; 238
	.db #0xFE	; 254
	.db #0xD6	; 214
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xDE	; 222
	.db #0xFE	; 254
	.db #0xFE	; 254
	.db #0xF6	; 246
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0x7C	; 124
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0x7C	; 124
	.db #0x7C	; 124
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xFC	; 252
	.db #0xE0	; 224
	.db #0xE0	; 224
	.db #0xE0	; 224
	.db #0x7C	; 124
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0x7E	; 126
	.db #0x0E	; 14
	.db #0x0E	; 14
	.db #0x0E	; 14
	.db #0xFC	; 252
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xFC	; 252
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0x7C	; 124
	.db #0xEE	; 238
	.db #0xE0	; 224
	.db #0x7C	; 124
	.db #0x0E	; 14
	.db #0xCE	; 206
	.db #0xEE	; 238
	.db #0x7C	; 124
	.db #0xFE	; 254
	.db #0xFE	; 254
	.db #0x38	; 56
	.db #0x38	; 56
	.db #0x38	; 56
	.db #0x38	; 56
	.db #0x38	; 56
	.db #0x38	; 56
	.db #0x6E	; 110	n
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0x7E	; 126
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0x7C	; 124
	.db #0x38	; 56
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xD6	; 214
	.db #0xFE	; 254
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0x6C	; 108	l
	.db #0x38	; 56
	.db #0x6C	; 108	l
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0x6C	; 108	l
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0x7C	; 124
	.db #0x38	; 56
	.db #0x38	; 56
	.db #0x38	; 56
	.db #0x38	; 56
	.db #0xFE	; 254
	.db #0x0E	; 14
	.db #0x1C	; 28
	.db #0x38	; 56
	.db #0x38	; 56
	.db #0x70	; 112	p
	.db #0xE0	; 224
	.db #0xFE	; 254
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_Sinus:
	.dw #0x0000
	.dw #0x0061
	.dw #0x00B5
	.dw #0x00EC
	.dw #0x0100
	.dw #0x00EC
	.dw #0x00B5
	.dw #0x0061
	.dw #0x0000
	.dw #0xFF9F
	.dw #0xFF4B
	.dw #0xFF14
	.dw #0xFF00
	.dw #0xFF14
	.dw #0xFF4B
	.dw #0xFF9F
_g_Cosinus:
	.dw #0x0100
	.dw #0x00EC
	.dw #0x00B5
	.dw #0x0061
	.dw #0x0000
	.dw #0xFF9F
	.dw #0xFF4B
	.dw #0xFF14
	.dw #0xFF00
	.dw #0xFF14
	.dw #0xFF4B
	.dw #0xFF9F
	.dw #0x0000
	.dw #0x0061
	.dw #0x00B5
	.dw #0x00EC
_backgound:
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
_defaultColor:
	.db #0x0A	; 10
	.db #0x0A	; 10
	.db #0x0B	; 11
	.db #0x0E	; 14
	.db #0x0E	; 14
	.db #0x0B	; 11
	.db #0x0A	; 10
	.db #0x0A	; 10
;carwar.c:227: void MainLoop()
;	---------------------------------
; Function MainLoop
; ---------------------------------
_MainLoop_start::
_MainLoop:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-19
	add	hl,sp
	ld	sp,hl
;carwar.c:231: u8 page = 0;
	ld	-2 (ix),#0x00
;carwar.c:237: u8 testSprt[4] = { 0x40, 0x40, 0, 0 };
	ld	hl,#0x0008
	add	hl,sp
	ex	de,hl
	ld	a,#0x40
	ld	(de),a
	ld	c,e
	ld	b,d
	inc	bc
	ld	a,#0x40
	ld	(bc),a
	ld	c,e
	ld	b,d
	inc	bc
	inc	bc
	ld	a,#0x00
	ld	(bc),a
	ld	hl,#0x0003
	add	hl,de
	ld	(hl),#0x00
;carwar.c:239: SetFreq(FREQ_50);
	ld	a,#0x20
	push	af
	inc	sp
	call	_SetFreq
	inc	sp
;carwar.c:240: SetScreen8(LINES_212);
	ld	a,#0x80
	push	af
	inc	sp
	call	_SetScreen8
	inc	sp
;carwar.c:241: SetSpriteMode(SPRITE_ON, SPRITE_NO_MAG + SPRITE_SIZE_8, 0xF800 >> 11, 0xF700 >> 7);
	ld	hl,#0x01EE
	push	hl
	ld	hl,#0x001F
	push	hl
	ld	l, #0x00
	push	hl
	call	_SetSpriteMode
	pop	af
	pop	af
;carwar.c:243: Fill8(0, 0, 0,   256, 212, 0x92);
	ld	hl,#0x92D4
	ex	(sp),hl
	ld	hl,#0x0000
	push	hl
	ld	l, #0x00
	push	hl
	call	_Fill8
	pop	af
	pop	af
	pop	af
;carwar.c:244: Fill8(0, 0, 212, 256, 44,  0);
	ld	hl,#0x002C
	push	hl
	ld	l, #0xD4
	push	hl
	ld	l, #0x00
	push	hl
	call	_Fill8
	pop	af
	pop	af
;carwar.c:245: Fill8(1, 0, 0,   256, 212, 0x92);
	ld	hl,#0x92D4
	ex	(sp),hl
	ld	hl,#0x0000
	push	hl
	ld	l, #0x01
	push	hl
	call	_Fill8
	pop	af
	pop	af
	pop	af
;carwar.c:246: Fill8(1, 0, 212, 256, 44,  0);
	ld	hl,#0x002C
	push	hl
	ld	l, #0xD4
	push	hl
	ld	l, #0x01
	push	hl
	call	_Fill8
	pop	af
	pop	af
;carwar.c:248: InitializePlayer(&ply[0], 0, 50, 100);
	ld	hl,#0x6432
	ex	(sp),hl
	ld	a,#0x00
	push	af
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_InitializePlayer
	pop	af
;carwar.c:249: InitializePlayer(&ply[1], 1, 100, 100);
	inc	sp
	ld	hl,#0x6464
	ex	(sp),hl
	ld	a,#0x01
	push	af
	inc	sp
	ld	hl,#0xC010
	push	hl
	call	_InitializePlayer
	pop	af
;carwar.c:250: InitializePlayer(&ply[2], 2, 150, 100);
	inc	sp
	ld	hl,#0x6496
	ex	(sp),hl
	ld	a,#0x02
	push	af
	inc	sp
	ld	hl,#0xC020
	push	hl
	call	_InitializePlayer
	pop	af
;carwar.c:251: InitializePlayer(&ply[3], 3, 200, 100);
	inc	sp
	ld	hl,#0x64C8
	ex	(sp),hl
	ld	a,#0x03
	push	af
	inc	sp
	ld	hl,#0xC030
	push	hl
	call	_InitializePlayer
	pop	af
	pop	af
	inc	sp
;carwar.c:255: for(x=0; x<48; x++)
	ld	-7 (ix),#0x00
	ld	-6 (ix),#0x00
00139$:
	ld	a,-7 (ix)
	sub	a,#0x30
	ld	a,-6 (ix)
	sbc	a,#0x00
	jr	NC,00142$
;carwar.c:257: RAMtoVRAM16((x * 8) % 256, 248 + (x / 32), 8, 1, (u16)&charTable[x * 8]);
	ld	e,-7 (ix)
	ld	d,-6 (ix)
	sla	e
	rl	d
	sla	e
	rl	d
	sla	e
	rl	d
	ld	hl,#_charTable
	add	hl,de
	ld	-13 (ix), l
	ld	-12 (ix), h
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	srl	h
	rr	l
	srl	h
	rr	l
	srl	h
	rr	l
	srl	h
	rr	l
	srl	h
	rr	l
	ld	bc, #0x00F8
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	d,#0x00
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	push	hl
	ld	hl,#0x0001
	push	hl
	ld	l, #0x08
	push	hl
	push	bc
	push	de
	call	_RAMtoVRAM16
	ld	hl,#0x000A
	add	hl,sp
	ld	sp,hl
;carwar.c:255: for(x=0; x<48; x++)
	inc	-7 (ix)
	jr	NZ,00139$
	inc	-6 (ix)
	jr	00139$
00142$:
;carwar.c:262: PrintSprite(64, 64, "INIT\nTRACK");
	ld	hl,#__str_0
	push	hl
	ld	hl,#0x4040
	push	hl
	call	_PrintSprite
	pop	af
	pop	af
;carwar.c:263: for(x=0; x<=255; x++)
	ld	-7 (ix),#0x00
	ld	-6 (ix),#0x00
00147$:
	ld	a,#0xFF
	sub	a,-7 (ix)
	ld	a,#0x00
	sbc	a,-6 (ix)
	jr	C,00150$
;carwar.c:264: for(y=0; y<=211; y++)
	ld	de,#0x0000
00143$:
	ld	a,#0xD3
	sub	a,e
	ld	a,#0x00
	sbc	a,d
	jr	C,00149$
;carwar.c:265: DrawPoint8(x, y, x + y);
	ld	a, -7 (ix)
	ld	c, e
	add	a,c
	ld	l,a
	ld	c,e
	ld	b,-7 (ix)
	push	de
	ld	a,l
	push	af
	inc	sp
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_DrawPoint8
	pop	af
	inc	sp
	pop	de
;carwar.c:264: for(y=0; y<=211; y++)
	inc	de
	jr	00143$
00149$:
;carwar.c:263: for(x=0; x<=255; x++)
	inc	-7 (ix)
	jr	NZ,00147$
	inc	-6 (ix)
	jr	00147$
00150$:
;carwar.c:266: VRAMtoVRAM(0,   0, 0, 1,   0, 0, 128, 212);
	ld	hl,#0xD480
	push	hl
	ld	hl,#0x0000
	push	hl
	ld	h, #0x01
	push	hl
	ld	h, #0x00
	push	hl
	call	_VRAMtoVRAM
	pop	af
	pop	af
	pop	af
	pop	af
;carwar.c:267: VRAMtoVRAM(0, 128, 0, 1, 128, 0, 128, 212);
	ld	hl,#0xD480
	push	hl
	ld	h, #0x00
	push	hl
	ld	hl,#0x0100
	push	hl
	ld	h, #0x80
	push	hl
	call	_VRAMtoVRAM
	pop	af
	pop	af
	pop	af
	pop	af
;carwar.c:268: ClearSprite();
	call	_ClearSprite
;carwar.c:272: PrintSprite(64, 64, "INIT\nCARS");
	ld	hl,#__str_1
	push	hl
	ld	hl,#0x4040
	push	hl
	call	_PrintSprite
	pop	af
	pop	af
;carwar.c:273: for(i=0; i<16; i++)
	ld	-1 (ix),#0x00
	ld	de,#0x0000
	ld	-13 (ix),#0x00
00151$:
	ld	a,-1 (ix)
	sub	a,#0x10
	jp	PO,00197$
	xor	a,#0x80
00197$:
	jp	P,00154$
;carwar.c:275: RAMtoVRAM(1, i * 13, 212 + 0,  13, 11, (u16)&car1[13 * 11 * i]);
	ld	hl,#_car1
	add	hl,de
	push	de
	push	hl
	ld	hl,#0x0B0D
	push	hl
	ld	a,#0xD4
	push	af
	inc	sp
	ld	d, -13 (ix)
	ld	e,#0x01
	push	de
	call	_RAMtoVRAM
	pop	af
	pop	af
	pop	af
	inc	sp
	pop	de
;carwar.c:276: RAMtoVRAM(1, i * 13, 212 + 11, 13, 11, (u16)&car2[13 * 11 * i]);
	ld	hl,#_car2
	add	hl,de
	push	de
	push	hl
	ld	hl,#0x0B0D
	push	hl
	ld	a,#0xDF
	push	af
	inc	sp
	ld	d, -13 (ix)
	ld	e,#0x01
	push	de
	call	_RAMtoVRAM
	pop	af
	pop	af
	pop	af
	inc	sp
	pop	de
;carwar.c:277: RAMtoVRAM(1, i * 13, 212 + 22, 13, 11, (u16)&car3[13 * 11 * i]);
	ld	hl,#_car3
	add	hl,de
	push	de
	push	hl
	ld	hl,#0x0B0D
	push	hl
	ld	a,#0xEA
	push	af
	inc	sp
	ld	d, -13 (ix)
	ld	e,#0x01
	push	de
	call	_RAMtoVRAM
	pop	af
	pop	af
	pop	af
	inc	sp
	pop	de
;carwar.c:278: RAMtoVRAM(1, i * 13, 212 + 33, 13, 11, (u16)&car4[13 * 11 * i]);
	ld	hl,#_car4
	add	hl,de
	push	de
	push	hl
	ld	hl,#0x0B0D
	push	hl
	ld	a,#0xF5
	push	af
	inc	sp
	ld	d, -13 (ix)
	ld	e,#0x01
	push	de
	call	_RAMtoVRAM
	pop	af
	pop	af
	pop	af
	inc	sp
	pop	de
;carwar.c:273: for(i=0; i<16; i++)
	ld	hl,#0x008F
	add	hl,de
	ex	de,hl
	ld	a,-13 (ix)
	add	a,#0x0D
	ld	-13 (ix),a
	inc	-1 (ix)
	jp	00151$
00154$:
;carwar.c:280: ClearSprite();
	call	_ClearSprite
;carwar.c:282: PrintSprite(64, 64, "LETS\nGO!");
	ld	hl,#__str_2
	push	hl
	ld	hl,#0x4040
	push	hl
	call	_PrintSprite
	pop	af
	pop	af
;carwar.c:283: while(bEnd == 0)
00136$:
;carwar.c:285: SetPage8(page);
	ld	a,-2 (ix)
	push	af
	inc	sp
	call	_SetPage8
	inc	sp
;carwar.c:286: page = 1 - page;
	ld	a,#0x01
	sub	a,-2 (ix)
	ld	-2 (ix),a
;carwar.c:290: Fill8(page, ScrPosX(ply[0].prevX), ScrPosY(ply[0].prevY), 13, 11, 0x92);
	ld	hl,#0xC007
	inc	hl
	ld	l, (hl)
	ld	a,l
	rlc	a
	sbc	a,a
	ld	a,l
	add	a,#0xFB
	ld	c,a
	ld	hl,#0xC005
	inc	hl
	ld	l, (hl)
	ld	a,l
	rlc	a
	sbc	a,a
	ld	a,l
	add	a,#0xFA
	ld	b,a
	ld	hl,#0x920B
	push	hl
	ld	a,#0x0D
	push	af
	inc	sp
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	a,-2 (ix)
	push	af
	inc	sp
	call	_Fill8
	pop	af
	pop	af
	pop	af
;carwar.c:291: Fill8(page, ScrPosX(ply[1].prevX), ScrPosY(ply[1].prevY), 13, 11, 0x92);
	ld	hl,#0xC017
	inc	hl
	ld	l, (hl)
	ld	a,l
	rlc	a
	sbc	a,a
	ld	a,l
	add	a,#0xFB
	ld	c,a
	ld	hl,#0xC015
	inc	hl
	ld	l, (hl)
	ld	a,l
	rlc	a
	sbc	a,a
	ld	a,l
	add	a,#0xFA
	ld	b,a
	ld	hl,#0x920B
	push	hl
	ld	a,#0x0D
	push	af
	inc	sp
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	a,-2 (ix)
	push	af
	inc	sp
	call	_Fill8
	pop	af
	pop	af
	pop	af
;carwar.c:292: Fill8(page, ScrPosX(ply[2].prevX), ScrPosY(ply[2].prevY), 13, 11, 0x92);
	ld	hl,#0xC027
	inc	hl
	ld	l, (hl)
	ld	a,l
	rlc	a
	sbc	a,a
	ld	a,l
	add	a,#0xFB
	ld	c,a
	ld	hl,#0xC025
	inc	hl
	ld	l, (hl)
	ld	a,l
	rlc	a
	sbc	a,a
	ld	a,l
	add	a,#0xFA
	ld	b,a
	ld	hl,#0x920B
	push	hl
	ld	a,#0x0D
	push	af
	inc	sp
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	a,-2 (ix)
	push	af
	inc	sp
	call	_Fill8
	pop	af
	pop	af
	pop	af
;carwar.c:293: Fill8(page, ScrPosX(ply[3].prevX), ScrPosY(ply[3].prevY), 13, 11, 0x92);
	ld	hl,#0xC037
	inc	hl
	ld	l, (hl)
	ld	a,l
	rlc	a
	sbc	a,a
	ld	a,l
	add	a,#0xFB
	ld	c,a
	ld	hl,#0xC035
	inc	hl
	ld	l, (hl)
	ld	a,l
	rlc	a
	sbc	a,a
	ld	a,l
	add	a,#0xFA
	ld	b,a
	ld	hl,#0x920B
	push	hl
	ld	a,#0x0D
	push	af
	inc	sp
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	a,-2 (ix)
	push	af
	inc	sp
	call	_Fill8
	pop	af
	pop	af
	pop	af
;carwar.c:301: curPly = &ply[0];
	ld	-5 (ix),#0x00
	ld	-4 (ix),#0xC0
;carwar.c:302: keyLine = GetKeyMatrixLine(8);
	ld	a,#0x08
	push	af
	inc	sp
	call	_GetKeyMatrixLine
	inc	sp
;carwar.c:303: if((keyLine & KEY_LEFT) == 0)
	ld	-3 (ix), l
	ld	a, l
	and	a,#0x10
	jr	NZ,00102$
;carwar.c:305: curPly->rot++; 
	ld	iy,#0xC009
	ld	hl,#0xC009
	ld	a,(hl)
	inc	hl
	ld	d, (hl)
	ld	e, a
	inc	de
	ld	0 (iy),e
	ld	1 (iy),d
;carwar.c:306: curPly->rot &= 0x0F;
	ld	a,e
	and	a,#0x0F
	ld	0 (iy), a
	ld	1 (iy), #0x00
00102$:
;carwar.c:308: if((keyLine & KEY_RIGHT) == 0)
	ld	a,-3 (ix)
	and	a,#0x80
	jr	NZ,00104$
;carwar.c:310: curPly->rot--; 
	ld	a,-5 (ix)
	add	a,#0x09
	ld	e,a
	ld	a,-4 (ix)
	adc	a,#0x00
	ld	d, a
	ld	l, e
	ld	h, a
	ld	a,(hl)
	inc	hl
	ld	b, (hl)
	ld	c, a
	dec	bc
	ld	l,e
	ld	h,d
	ld	(hl),c
	inc	hl
	ld	(hl),b
;carwar.c:311: curPly->rot &= 0x0F;
	ld	a,c
	and	a,#0x0F
	ld	c,a
	ld	b,#0x00
	ex	de,hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
00104$:
;carwar.c:313: if((keyLine & KEY_UP) == 0)
	ld	a,-3 (ix)
	and	a,#0x20
	jr	NZ,00106$
;carwar.c:315: curPly->dX = g_Cosinus[curPly->rot];
	ld	a,-5 (ix)
	add	a,#0x0B
	ld	-13 (ix),a
	ld	a,-4 (ix)
	adc	a,#0x00
	ld	-12 (ix),a
	ld	a,-5 (ix)
	add	a,#0x09
	ld	l, a
	ld	a, -4 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a,(hl)
	inc	hl
	ld	d, (hl)
	ld	e, a
	sla	e
	rl	d
	ld	hl,#_g_Cosinus
	add	hl,de
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
;carwar.c:316: curPly->dY = g_Sinus[curPly->rot];
	ld	a,-5 (ix)
	add	a,#0x0D
	ld	c,a
	ld	a,-4 (ix)
	adc	a,#0x00
	ld	b,a
	ld	hl,#_g_Sinus
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,c
	ld	h,b
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:317: curPly->speed += 2;
	ld	a,-5 (ix)
	add	a,#0x0F
	ld	c,a
	ld	a,-4 (ix)
	adc	a,#0x00
	ld	b,a
	ld	a,(bc)
	add	a,#0x02
	ld	(bc),a
00106$:
;carwar.c:322: curPly = &ply[1];
	ld	-5 (ix),#0x10
	ld	-4 (ix),#0xC0
;carwar.c:323: keyLine = GetKeyMatrixLine(5);
	ld	a,#0x05
	push	af
	inc	sp
	call	_GetKeyMatrixLine
	inc	sp
;carwar.c:324: if((keyLine & KEY_Z) == 0)
	ld	-3 (ix), l
	ld	a, l
	and	a,#0x80
	jr	NZ,00108$
;carwar.c:326: curPly->rot++; 
	ld	iy,#0xC019
	ld	hl,#0xC019
	ld	a,(hl)
	inc	hl
	ld	b, (hl)
	ld	c, a
	inc	bc
	ld	0 (iy),c
	ld	1 (iy),b
;carwar.c:327: curPly->rot &= 0x0F;
	ld	a,c
	and	a,#0x0F
	ld	0 (iy), a
	ld	1 (iy), #0x00
00108$:
;carwar.c:329: keyLine = GetKeyMatrixLine(3);
	ld	a,#0x03
	push	af
	inc	sp
	call	_GetKeyMatrixLine
	inc	sp
;carwar.c:330: if((keyLine & KEY_C) == 0)
	ld	-3 (ix), l
	ld	a, l
	and	a,#0x01
	jr	NZ,00110$
;carwar.c:332: curPly->rot--; 
	ld	a,-5 (ix)
	add	a,#0x09
	ld	c,a
	ld	a,-4 (ix)
	adc	a,#0x00
	ld	b, a
	ld	l, c
	ld	h, a
	ld	a,(hl)
	inc	hl
	ld	d, (hl)
	ld	e, a
	dec	de
	ld	l,c
	ld	h,b
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:333: curPly->rot &= 0x0F;
	ld	a,e
	and	a,#0x0F
	ld	e,a
	ld	d,#0x00
	ld	l,c
	ld	h,b
	ld	(hl),e
	inc	hl
	ld	(hl),d
00110$:
;carwar.c:335: keyLine = GetKeyMatrixLine(5);
	ld	a,#0x05
	push	af
	inc	sp
	call	_GetKeyMatrixLine
	inc	sp
;carwar.c:336: if((keyLine & KEY_X) == 0)
	ld	-3 (ix), l
	ld	a, l
	and	a,#0x20
	jr	NZ,00112$
;carwar.c:338: curPly->dX = g_Cosinus[curPly->rot];
	ld	a,-5 (ix)
	add	a,#0x0B
	ld	-13 (ix),a
	ld	a,-4 (ix)
	adc	a,#0x00
	ld	-12 (ix),a
	ld	a,-5 (ix)
	add	a,#0x09
	ld	l, a
	ld	a, -4 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a,(hl)
	inc	hl
	ld	d, (hl)
	ld	e, a
	sla	e
	rl	d
	ld	hl,#_g_Cosinus
	add	hl,de
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
;carwar.c:339: curPly->dY = g_Sinus[curPly->rot];
	ld	a,-5 (ix)
	add	a,#0x0D
	ld	c,a
	ld	a,-4 (ix)
	adc	a,#0x00
	ld	b,a
	ld	hl,#_g_Sinus
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,c
	ld	h,b
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:340: curPly->speed += 2;
	ld	a,-5 (ix)
	add	a,#0x0F
	ld	c,a
	ld	a,-4 (ix)
	adc	a,#0x00
	ld	b,a
	ld	a,(bc)
	add	a,#0x02
	ld	(bc),a
00112$:
;carwar.c:345: curPly = &ply[2];
	ld	-5 (ix),#0x20
	ld	-4 (ix),#0xC0
;carwar.c:346: switch (Joystick(1)) // Joy 1 direction
	ld	a,#0x01
	push	af
	inc	sp
	call	_Joystick
	inc	sp
	ld	a,l
	sub	a,#0x02
	jp	PO,00214$
	xor	a,#0x80
00214$:
	jp	M,00119$
	ld	a,#0x08
	sub	a,l
	jp	PO,00215$
	xor	a,#0x80
00215$:
	jp	M,00119$
	ld	a,l
	add	a,#0xFE
	ld	c,a
	push	de
	ld	e,c
	ld	d,#0x00
	ld	hl,#00216$
	add	hl,de
	add	hl,de
;carwar.c:348: case 2: // up-right
	pop	de
	jp	(hl)
00216$:
	jr	00113$
	jr	00114$
	jr	00115$
	jr	00119$
	jr	00116$
	jr	00117$
	jr	00118$
00113$:
;carwar.c:349: case 3: // right
00114$:
;carwar.c:350: case 4: // down-right
00115$:
;carwar.c:351: curPly->rot--; 
	ld	a,-5 (ix)
	add	a,#0x09
	ld	c,a
	ld	a,-4 (ix)
	adc	a,#0x00
	ld	b, a
	ld	l, c
	ld	h, a
	ld	a,(hl)
	inc	hl
	ld	d, (hl)
	ld	e, a
	dec	de
	ld	l,c
	ld	h,b
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:352: curPly->rot &= 0x0F;
	ld	a,e
	and	a,#0x0F
	ld	e,a
	ld	d,#0x00
	ld	l,c
	ld	h,b
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:353: break;
	jr	00119$
;carwar.c:354: case 6: // down-left
00116$:
;carwar.c:355: case 7: // left
00117$:
;carwar.c:356: case 8:// up-left
00118$:
;carwar.c:357: curPly->rot++; 
	ld	a,-5 (ix)
	add	a,#0x09
	ld	c,a
	ld	a,-4 (ix)
	adc	a,#0x00
	ld	b, a
	ld	l, c
	ld	h, a
	ld	a,(hl)
	inc	hl
	ld	d, (hl)
	ld	e, a
	inc	de
	ld	l,c
	ld	h,b
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:358: curPly->rot &= 0x0F;
	ld	a,e
	and	a,#0x0F
	ld	e,a
	ld	d,#0x00
	ld	l,c
	ld	h,b
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:360: }
00119$:
;carwar.c:361: if(Joytrig(1) != 0) // Joy 1 Button A
	ld	a,#0x01
	push	af
	inc	sp
	call	_Joytrig
	inc	sp
	xor	a,a
	or	a,l
	jr	Z,00121$
;carwar.c:363: curPly->dX = g_Cosinus[curPly->rot];
	ld	a,-5 (ix)
	add	a,#0x0B
	ld	-13 (ix),a
	ld	a,-4 (ix)
	adc	a,#0x00
	ld	-12 (ix),a
	ld	a,-5 (ix)
	add	a,#0x09
	ld	l, a
	ld	a, -4 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a,(hl)
	inc	hl
	ld	d, (hl)
	ld	e, a
	sla	e
	rl	d
	ld	hl,#_g_Cosinus
	add	hl,de
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
;carwar.c:364: curPly->dY = g_Sinus[curPly->rot];
	ld	a,-5 (ix)
	add	a,#0x0D
	ld	c,a
	ld	a,-4 (ix)
	adc	a,#0x00
	ld	b,a
	ld	hl,#_g_Sinus
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,c
	ld	h,b
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:365: curPly->speed += 2;
	ld	a,-5 (ix)
	add	a,#0x0F
	ld	c,a
	ld	a,-4 (ix)
	adc	a,#0x00
	ld	b,a
	ld	a,(bc)
	add	a,#0x02
	ld	(bc),a
00121$:
;carwar.c:371: switch (Joystick(2)) // Joy 2 direction
	ld	a,#0x02
	push	af
	inc	sp
	call	_Joystick
	inc	sp
	ld	a,l
	sub	a,#0x02
	jp	PO,00219$
	xor	a,#0x80
00219$:
	jp	M,00128$
	ld	a,#0x08
	sub	a,l
	jp	PO,00220$
	xor	a,#0x80
00220$:
	jp	M,00128$
	ld	a,l
	add	a,#0xFE
	ld	c,a
	push	de
	ld	e,c
	ld	d,#0x00
	ld	hl,#00221$
	add	hl,de
	add	hl,de
;carwar.c:373: case 2: // up-right
	pop	de
	jp	(hl)
00221$:
	jr	00122$
	jr	00123$
	jr	00124$
	jr	00128$
	jr	00125$
	jr	00126$
	jr	00127$
00122$:
;carwar.c:374: case 3: // right
00123$:
;carwar.c:375: case 4: // down-right
00124$:
;carwar.c:376: curPly->rot--; 
	ld	iy,#0xC039
	ld	hl,#0xC039
	ld	a,(hl)
	inc	hl
	ld	b, (hl)
	ld	c, a
	dec	bc
	ld	0 (iy),c
	ld	1 (iy),b
;carwar.c:377: curPly->rot &= 0x0F;
	ld	a,c
	and	a,#0x0F
	ld	0 (iy), a
	ld	1 (iy), #0x00
;carwar.c:378: break;
	jr	00128$
;carwar.c:379: case 6: // down-left
00125$:
;carwar.c:380: case 7: // left
00126$:
;carwar.c:381: case 8:// up-left
00127$:
;carwar.c:382: curPly->rot++; 
	ld	iy,#0xC039
	ld	hl,#0xC039
	ld	a,(hl)
	inc	hl
	ld	b, (hl)
	ld	c, a
	inc	bc
	ld	0 (iy),c
	ld	1 (iy),b
;carwar.c:383: curPly->rot &= 0x0F;
	ld	a,c
	and	a,#0x0F
	ld	0 (iy), a
	ld	1 (iy), #0x00
;carwar.c:385: }
00128$:
;carwar.c:386: if(Joytrig(2) != 0) // Joy 2 Button A
	ld	a,#0x02
	push	af
	inc	sp
	call	_Joytrig
	inc	sp
	xor	a,a
	or	a,l
	jr	Z,00185$
;carwar.c:388: curPly->dX = g_Cosinus[curPly->rot];
	ld	iy,#0xC03B
	ld	hl,#0xC039
	ld	a,(hl)
	inc	hl
	ld	b, (hl)
	ld	c, a
	sla	c
	rl	b
	ld	hl,#_g_Cosinus
	add	hl,bc
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	0 (iy),e
	ld	1 (iy),d
;carwar.c:389: curPly->dY = g_Sinus[curPly->rot];
	ld	iy,#0xC03D
	ld	hl,#_g_Sinus
	add	hl,bc
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	0 (iy),c
	ld	1 (iy),b
;carwar.c:390: curPly->speed += 2;
	ld	iy,#0xC03F
	ld	a,(#0xC03F)
	add	a,#0x02
	ld	(iy),a
;carwar.c:395: for(i=0; i<4; i++)
00185$:
	ld	-1 (ix),#0x00
00155$:
	ld	a,-1 (ix)
	sub	a,#0x04
	jp	PO,00224$
	xor	a,#0x80
00224$:
	jp	P,00158$
;carwar.c:397: curPly = &ply[i];
	ld	l,-1 (ix)
	ld	a,-1 (ix)
	rla	
	sbc	a,a
	ld	h,a
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	ld	a,l
	add	a,#0x00
	ld	-5 (ix),a
	ld	a,h
	adc	a,#0xC0
	ld	-4 (ix),a
;carwar.c:399: curPly->speed--;
	ld	a,-5 (ix)
	add	a,#0x0F
	ld	e,a
	ld	a,-4 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	dec	a
	ld	b,a
	ld	(de),a
;carwar.c:400: if(curPly->speed < 0)
	bit	7,b
	jr	Z,00134$
;carwar.c:401: curPly->speed = 0;
	ld	a,#0x00
	ld	(de),a
	jr	00135$
00134$:
;carwar.c:402: else if(curPly->speed > 7)
	ld	a,(de)
	ld	l,a
	ld	a,#0x07
	sub	a,l
	jp	PO,00225$
	xor	a,#0x80
00225$:
	jp	P,00135$
;carwar.c:403: curPly->speed = 7;
	ld	a,#0x07
	ld	(de),a
00135$:
;carwar.c:406: curPly->prevX = curPly->posX;
	ld	a,-5 (ix)
	add	a,#0x05
	ld	e,a
	ld	a,-4 (ix)
	adc	a,#0x00
	ld	d,a
	ld	c,-5 (ix)
	ld	b,-4 (ix)
	inc	bc
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	-15 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-14 (ix),a
	ex	de,hl
	ld	a,-15 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-14 (ix)
	ld	(hl),a
;carwar.c:407: curPly->prevY = curPly->posY;
	ld	a,-5 (ix)
	add	a,#0x07
	ld	e,a
	ld	a,-4 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,-5 (ix)
	add	a,#0x03
	ld	-17 (ix),a
	ld	a,-4 (ix)
	adc	a,#0x00
	ld	-16 (ix),a
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	a,(hl)
	ld	-19 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-18 (ix),a
	ex	de,hl
	ld	a,-19 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-18 (ix)
	ld	(hl),a
;carwar.c:408: curPly->posX += curPly->speed * curPly->dX;
	ld	a,-5 (ix)
	add	a,#0x0F
	ld	e,a
	ld	a,-4 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	ld	-13 (ix),a
	ld	a,-5 (ix)
	add	a,#0x0B
	ld	l, a
	ld	a, -4 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	ld	a,-13 (ix)
	ld	-13 (ix), a
	rla	
	sbc	a,a
	ld	-12 (ix),a
	push	bc
	push	hl
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	push	hl
	call	__mulint_rrx_s
	pop	af
	pop	af
	ex	de,hl
	pop	bc
	ld	a,-15 (ix)
	add	a,e
	ld	e,a
	ld	a,-14 (ix)
	adc	a,d
	ld	d,a
	ld	l,c
	ld	h,b
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:409: curPly->posY -= curPly->speed * curPly->dY;
	ld	a,-5 (ix)
	add	a,#0x0D
	ld	l, a
	ld	a, -4 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	push	hl
	call	__mulint_rrx_s
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	ld	a,-19 (ix)
	sub	a,c
	ld	c,a
	ld	a,-18 (ix)
	sbc	a,b
	ld	b,a
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
;carwar.c:395: for(i=0; i<4; i++)
	inc	-1 (ix)
	jp	00155$
00158$:
;carwar.c:430: VRAMtoVRAMTrans(1, ply[0].rot * 13, 212 + 0,  page, ScrPosX(ply[0].posX), ScrPosY(ply[0].posY), 13, 11);
	ld	hl,#0xC003
	inc	hl
	ld	l, (hl)
	ld	a,l
	rlc	a
	sbc	a,a
	ld	a,l
	add	a,#0xFB
	ld	c,a
	ld	hl,#0xC001
	inc	hl
	ld	l, (hl)
	ld	a,l
	rlc	a
	sbc	a,a
	ld	a,l
	add	a,#0xFA
	ld	b,a
	ld	hl,#0xC009
	ld	a,(hl)
	inc	hl
	ld	e,a
	add	a,a
	add	a,e
	add	a,a
	add	a,a
	add	a,e
	ld	e,a
	ld	hl,#0x0B0D
	push	hl
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	a,-2 (ix)
	push	af
	inc	sp
	ld	d,#0xD4
	push	de
	ld	a,#0x01
	push	af
	inc	sp
	call	_VRAMtoVRAMTrans
	pop	af
	pop	af
	pop	af
	pop	af
;carwar.c:431: VRAMtoVRAMTrans(1, ply[1].rot * 13, 212 + 11, page, ScrPosX(ply[1].posX), ScrPosY(ply[1].posY), 13, 11);
	ld	hl,#0xC013
	inc	hl
	ld	l, (hl)
	ld	a,l
	rlc	a
	sbc	a,a
	ld	a,l
	add	a,#0xFB
	ld	c,a
	ld	hl,#0xC011
	inc	hl
	ld	l, (hl)
	ld	a,l
	rlc	a
	sbc	a,a
	ld	a,l
	add	a,#0xFA
	ld	b,a
	ld	hl,#0xC019
	ld	a,(hl)
	inc	hl
	ld	e,a
	add	a,a
	add	a,e
	add	a,a
	add	a,a
	add	a,e
	ld	e,a
	ld	hl,#0x0B0D
	push	hl
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	a,-2 (ix)
	push	af
	inc	sp
	ld	d,#0xDF
	push	de
	ld	a,#0x01
	push	af
	inc	sp
	call	_VRAMtoVRAMTrans
	pop	af
	pop	af
	pop	af
	pop	af
;carwar.c:432: VRAMtoVRAMTrans(1, ply[2].rot * 13, 212 + 22, page, ScrPosX(ply[2].posX), ScrPosY(ply[2].posY), 13, 11);
	ld	hl,#0xC023
	inc	hl
	ld	l, (hl)
	ld	a,l
	rlc	a
	sbc	a,a
	ld	a,l
	add	a,#0xFB
	ld	c,a
	ld	hl,#0xC021
	inc	hl
	ld	l, (hl)
	ld	a,l
	rlc	a
	sbc	a,a
	ld	a,l
	add	a,#0xFA
	ld	b,a
	ld	hl,#0xC029
	ld	a,(hl)
	inc	hl
	ld	e,a
	add	a,a
	add	a,e
	add	a,a
	add	a,a
	add	a,e
	ld	e,a
	ld	hl,#0x0B0D
	push	hl
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	a,-2 (ix)
	push	af
	inc	sp
	ld	d,#0xEA
	push	de
	ld	a,#0x01
	push	af
	inc	sp
	call	_VRAMtoVRAMTrans
	pop	af
	pop	af
	pop	af
	pop	af
;carwar.c:433: VRAMtoVRAMTrans(1, ply[3].rot * 13, 212 + 33, page, ScrPosX(ply[3].posX), ScrPosY(ply[3].posY), 13, 11);
	ld	hl,#0xC033
	inc	hl
	ld	l, (hl)
	ld	a,l
	rlc	a
	sbc	a,a
	ld	a,l
	add	a,#0xFB
	ld	c,a
	ld	hl,#0xC031
	inc	hl
	ld	l, (hl)
	ld	a,l
	rlc	a
	sbc	a,a
	ld	a,l
	add	a,#0xFA
	ld	b,a
	ld	hl,#0xC039
	ld	a,(hl)
	inc	hl
	ld	e,a
	add	a,a
	add	a,e
	add	a,a
	add	a,a
	add	a,e
	ld	e,a
	ld	hl,#0x0B0D
	push	hl
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	a,-2 (ix)
	push	af
	inc	sp
	ld	d,#0xF5
	push	de
	ld	a,#0x01
	push	af
	inc	sp
	call	_VRAMtoVRAMTrans
	pop	af
	pop	af
	pop	af
	pop	af
;carwar.c:435: waitRetrace();
	call	_waitRetrace
	jp	00136$
_MainLoop_end::
__str_0:
	.ascii "INIT"
	.db 0x0A
	.ascii "TRACK"
	.db 0x00
__str_1:
	.ascii "INIT"
	.db 0x0A
	.ascii "CARS"
	.db 0x00
__str_2:
	.ascii "LETS"
	.db 0x0A
	.ascii "GO!"
	.db 0x00
;carwar.c:444: void InitializePlayer(Player* ply, u8 car, u8 posX, u8 posY)
;	---------------------------------
; Function InitializePlayer
; ---------------------------------
_InitializePlayer_start::
_InitializePlayer:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;carwar.c:446: ply->car = car; // car index
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	a,6 (ix)
	ld	(bc),a
;carwar.c:447: ply->posX = posX << 8; // position X
	ld	e,c
	ld	d,b
	inc	de
	ld	l,7 (ix)
	ld	-1 (ix),l
	ld	-2 (ix),#0x00
	ld	l,e
	ld	h,d
	ld	a,-2 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-1 (ix)
	ld	(hl),a
;carwar.c:448: ply->posY = posY << 8; // position Y
	ld	hl,#0x0003
	add	hl,bc
	ex	de,hl
	ld	l,8 (ix)
	ld	-3 (ix),l
	ld	-4 (ix),#0x00
	ex	de,hl
	ld	a,-4 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-3 (ix)
	ld	(hl),a
;carwar.c:449: ply->prevX = posX << 8; // previous position X
	ld	hl,#0x0005
	add	hl,bc
	ld	a,-2 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-1 (ix)
	ld	(hl),a
;carwar.c:450: ply->prevY = posY << 8; // previous position Y
	ld	hl,#0x0007
	add	hl,bc
	ld	a,-4 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-3 (ix)
	ld	(hl),a
;carwar.c:451: ply->rot = 0; // rotation
	ld	hl,#0x0009
	add	hl,bc
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;carwar.c:452: ply->dX = 0; // velocity X
	ld	hl,#0x000B
	add	hl,bc
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;carwar.c:453: ply->dY = 0; // velocity Y
	ld	hl,#0x000D
	add	hl,bc
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;carwar.c:454: ply->speed = 0;
	ld	hl,#0x000F
	add	hl,bc
	ld	(hl),#0x00
	ld	sp,ix
	pop	ix
	ret
_InitializePlayer_end::
;carwar.c:460: void SetScreen8(u8 lines)
;	---------------------------------
; Function SetScreen8
; ---------------------------------
_SetScreen8_start::
_SetScreen8:
	push	ix
	ld	ix,#0
	add	ix,sp
;carwar.c:511: __endasm;
	
	
	
		di
	
	
		 ld a,(#0xF3DF)
		 set #3,a
		 set #2,a
		 set #1,a
		 ld (#0xF3DF),a
		 out (#0x99),a
	
		 ld a,#(0x80+0)
		 out (#0x99),a
	
	
		 ld a,(#0xF3E0)
		 res #4,a
		 res #3,a
		 ld (#0xF3E0),a
		 out (#0x99),a
	
		 ld a,#(0x80+1)
		 out (#0x99),a
	
	
		 ld a,#0x1F
		 out (#0x99),a
	
		 ld a,#(0x80+2)
		 out (#0x99),a
	
	
		 ld a,(#0xF3E8)
		 res #7,a
	
		 or 4(ix) ;
		 ld (#0xF3E8),a
		 out (#0x99),a
	
		 ld a,#(0x80+9)
		 out (#0x99),a
	
		ei
	
	
		
	pop	ix
	ret
_SetScreen8_end::
;carwar.c:516: void SetSpriteMode(u8 activate, u8 flag, u16 tgs, u16 tas)
;	---------------------------------
; Function SetSpriteMode
; ---------------------------------
_SetSpriteMode_start::
_SetSpriteMode:
	push	ix
	ld	ix,#0
	add	ix,sp
;carwar.c:571: __endasm;
	
	
	
		di
	
	
		 ld a,(#0xF3E0)
		 and #0xFC ;
		 or 5(ix)
		 ld (#0xF3E0),a
		 out (#0x99),a
	
		 ld a,#(0x80+1)
		 out (#0x99),a
	
	
	
		 ld a,8(ix) ;
		 out (#0x99),a
	
		 ld a,#(0x80+5)
		 out (#0x99),a
	
	
	
		 ld a,6(ix) ;
		 out (#0x99),a
	
		 ld a,#(0x80+6)
		 out (#0x99),a
	
	
		 ld a,(#0xF3E7)
		 and #0xFD ;
		 or 4(ix)
		 ld (#0xF3E7),a
		 out (#0x99),a
	
		 ld a,#(0x80+8)
		 out (#0x99),a
	
	
	
		 ld a,9(ix) ;
		 out (#0x99),a
	
		 ld a,#(0x80+11)
		 out (#0x99),a
	
		ei
	
		
	pop	ix
	ret
_SetSpriteMode_end::
;carwar.c:576: void SetFreq(u8 freq)
;	---------------------------------
; Function SetFreq
; ---------------------------------
_SetFreq_start::
_SetFreq:
	push	ix
	ld	ix,#0
	add	ix,sp
;carwar.c:580: WaitForVDP();
	call	_WaitForVDP
;carwar.c:596: __endasm;
	
	
	
		 ld a,(#0xF3E8)
		 and #0xFD ;
		 or 4(ix)
		 ld (#0xF3E8),a
		di
		 out (#0x99),a
	
		 ld a,#(0x80+9)
		ei
		 out (#0x99),a
	
		
	pop	ix
	ret
_SetFreq_end::
;carwar.c:600: void SetPage8(i8 page)
;	---------------------------------
; Function SetPage8
; ---------------------------------
_SetPage8_start::
_SetPage8:
	push	ix
	ld	ix,#0
	add	ix,sp
;carwar.c:617: __endasm;
	
	
		 ld a,4(ix)
		 rrca
		 rrca
		 rrca
		 or #0x1F
		di
		 out (#0x99),a
		 ld a,#(0x80+2)
		ei
		 out (#0x99),a
	
		
	pop	ix
	ret
_SetPage8_end::
;carwar.c:623: void DrawPoint8(char posX, char posY, char color)
;	---------------------------------
; Function DrawPoint8
; ---------------------------------
_DrawPoint8_start::
_DrawPoint8:
	push	ix
	ld	ix,#0
	add	ix,sp
;carwar.c:627: WaitForVDP();
	call	_WaitForVDP
;carwar.c:674: __endasm;
	
	
	
	
		 ld a,4(ix)
		di
		 out (#0x99),a
		 ld a,#(0x80+36)
		 out (#0x99),a
	
		 xor a
		 out (#0x99),a
		 ld a,#(0x80+37)
		 out (#0x99),a
	
	
		 ld a,5(ix)
		 out (#0x99),a
		 ld a,#(0x80+38)
		 out (#0x99),a
	
		 xor a
		 out (#0x99),a
		 ld a,#(0x80+39)
		 out (#0x99),a
	
	
		 ld a,6(ix)
		 out (#0x99),a
		 ld a,#(0x80+44)
		 out (#0x99),a
	
	
		 xor a
		 out (#0x99),a
		 ld a,#(0x80+45)
		 out (#0x99),a
	
	
		 ld a,#0x50
		 out (#0x99),a
		 ld a,#(0x80+46)
		ei
		 out (#0x99),a
	
		
	pop	ix
	ret
_DrawPoint8_end::
;carwar.c:680: void DrawLine8(char posX1, char posY1, char posX2, char posY2, char color)
;	---------------------------------
; Function DrawLine8
; ---------------------------------
_DrawLine8_start::
_DrawLine8:
	push	ix
	ld	ix,#0
	add	ix,sp
;carwar.c:684: WaitForVDP();
	call	_WaitForVDP
	pop	ix
	ret
_DrawLine8_end::
;carwar.c:818: void waitRetrace()
;	---------------------------------
; Function waitRetrace
; ---------------------------------
_waitRetrace_start::
_waitRetrace:
;carwar.c:830: __endasm;
	
	
		 di
	 WAIT_RETRACE:
		 in a,(0x99)
		 and #0x80
		 cp #0
		 jr z, WAIT_RETRACE
		 ei
	
		
	ret
_waitRetrace_end::
;carwar.c:836: void WaitForVDP()
;	---------------------------------
; Function WaitForVDP
; ---------------------------------
_WaitForVDP_start::
_WaitForVDP:
;carwar.c:857: __endasm;
	
	
	
		 ld a,#2
		di
		 out (#0x99),a
		 ld a,#(0x80+15)
		 out (#0x99),a
	 WAIT_VDP:
		 nop
		 in a,(#0x99)
		 rra
		 jr c,WAIT_VDP
		 xor a
		 out (#0x99),a
		 ld a,#(0x80+15)
		ei
		 out (#0x99),a
	
		
	ret
_WaitForVDP_end::
;carwar.c:863: void WriteToVRAM8(u16 addr, u8 value)
;	---------------------------------
; Function WriteToVRAM8
; ---------------------------------
_WriteToVRAM8_start::
_WriteToVRAM8:
	push	ix
	ld	ix,#0
	add	ix,sp
;carwar.c:867: WaitForVDP();
	call	_WaitForVDP
;carwar.c:894: __endasm;
	
		 ;
		 ld a,5(ix) ;
		 and #0xC0 ;
		       rla
		       rla
		di
		 out (#0x99),a
		 ld a,#(0x80+14)
		 out (#0x99),a
	
		 ld a,4(ix) ;
		 out (#0x99),a
	
		 ld a,5(ix) ;
		 and #0x3F ;
		 or #0x40 ;
		 out (#0x99),a
	
		 ;
		 ld a,6(ix)
		ei
		 out (#0x98),a
	
		
	pop	ix
	ret
_WriteToVRAM8_end::
;carwar.c:900: void VPDCommandLoop(u16 address)
;	---------------------------------
; Function VPDCommandLoop
; ---------------------------------
_VPDCommandLoop_start::
_VPDCommandLoop:
	push	ix
	ld	ix,#0
	add	ix,sp
;carwar.c:955: __endasm;
	
	
		 ld l,4(ix)
		 ld h,5(ix)
	
		 di
	
	 SEND_NEXT_COLOR:
	
		 inc hl
	
		 ;
		 ;
		 ld a,(hl)
		 out (#0x99),a
		 ld a,#(0x80+44)
		 out (#0x99),a
	
	 WAIT_REG2:
	
		 ;
		 ;
		 ld a,#2
		 out (#0x99),a
		 ld a,#(0x80+15)
		 out (#0x99),a
	
		 ;
		 nop
		 in a,(#0x99)
		 ld b,a ;
		 rra ;
		 jr nc,COLOR_COPY_END
	
		 ;
		 ;
		 ld a,b ;
		 rla ;
		 jr nc,WAIT_REG2
		 jp SEND_NEXT_COLOR
	
	 COLOR_COPY_END:
	
		 ;
		 xor a
		 out (#0x99),a
		 ld a,#(0x80+15)
		 out (#0x99),a
	
		 ei
	
		
	pop	ix
	ret
_VPDCommandLoop_end::
;carwar.c:960: void RAMtoVRAM16(u16 dx, u16 dy, u16 nx, u16 ny, u16 ram)
;	---------------------------------
; Function RAMtoVRAM16
; ---------------------------------
_RAMtoVRAM16_start::
_RAMtoVRAM16:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-11
	add	hl,sp
	ld	sp,hl
;carwar.c:964: buffer.DX = dx;
	ld	hl,#0x0000
	add	hl,sp
	ld	a,4 (ix)
	ld	(hl),a
	inc	hl
	ld	a,5 (ix)
	ld	(hl),a
;carwar.c:965: buffer.DY = dy;
	ld	hl,#0x0000
	add	hl,sp
	ld	c,l
	ld	b,h
	inc	hl
	inc	hl
	ld	a,6 (ix)
	ld	(hl),a
	inc	hl
	ld	a,7 (ix)
	ld	(hl),a
;carwar.c:966: buffer.NX = nx;
	ld	hl,#0x0004
	add	hl,bc
	ld	a,8 (ix)
	ld	(hl),a
	inc	hl
	ld	a,9 (ix)
	ld	(hl),a
;carwar.c:967: buffer.NY = ny;
	ld	hl,#0x0006
	add	hl,bc
	ld	a,10 (ix)
	ld	(hl),a
	inc	hl
	ld	a,11 (ix)
	ld	(hl),a
;carwar.c:968: buffer.CLR = ((u8*)ram)[0];
	ld	hl,#0x0008
	add	hl,bc
	ex	de,hl
	ld	l,12 (ix)
	ld	h,13 (ix)
	ld	a,(hl)
	ld	(de),a
;carwar.c:969: buffer.ARG = 0;
	ld	hl,#0x0009
	add	hl,bc
	ex	de,hl
	ld	a,#0x00
	ld	(de),a
;carwar.c:970: buffer.CMD = 0xF0;
	ld	hl,#0x000A
	add	hl,bc
	ex	de,hl
	ld	a,#0xF0
	ld	(de),a
;carwar.c:971: VPDCommand36((u16)&buffer);
	push	bc
	call	_VPDCommand36
	pop	af
;carwar.c:972: VPDCommandLoop(ram);
	ld	l,12 (ix)
	ld	h,13 (ix)
	push	hl
	call	_VPDCommandLoop
	ld	sp,ix
	pop	ix
	ret
_RAMtoVRAM16_end::
;carwar.c:977: void RAMtoVRAM(u8 page, u8 dx, u8 dy, u8 nx, u8 ny, u16 ram)
;	---------------------------------
; Function RAMtoVRAM
; ---------------------------------
_RAMtoVRAM_start::
_RAMtoVRAM:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-13
	add	hl,sp
	ld	sp,hl
;carwar.c:981: buffer.DX = dx;
	ld	hl,#0x0002
	add	hl,sp
	ld	c,5 (ix)
	ld	b,#0x00
	ld	(hl),c
	inc	hl
	ld	(hl),b
;carwar.c:982: buffer.DY = dy + ((u16)page << 8);
	ld	hl,#0x0002
	add	hl,sp
	ld	c,l
	ld	b,h
	ld	hl,#0x0002
	add	hl,bc
	ld	-13 (ix),l
	ld	-12 (ix),h
	ld	l,6 (ix)
	ld	h,#0x00
	ld	d, 4 (ix)
	ld	e,#0x00
	add	hl,de
	ex	de,hl
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:983: buffer.NX = nx;
	ld	hl,#0x0004
	add	hl,bc
	ld	-13 (ix),l
	ld	-12 (ix),h
	ld	e,7 (ix)
	ld	d,#0x00
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:984: buffer.NY = ny;
	ld	hl,#0x0006
	add	hl,bc
	ld	-13 (ix),l
	ld	-12 (ix),h
	ld	e,8 (ix)
	ld	d,#0x00
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:985: buffer.CLR = ((u8*)ram)[0];
	ld	hl,#0x0008
	add	hl,bc
	ex	de,hl
	ld	l,9 (ix)
	ld	h,10 (ix)
	ld	a,(hl)
	ld	(de),a
;carwar.c:986: buffer.ARG = 0;
	ld	hl,#0x0009
	add	hl,bc
	ex	de,hl
	ld	a,#0x00
	ld	(de),a
;carwar.c:987: buffer.CMD = 0xF0;
	ld	hl,#0x000A
	add	hl,bc
	ex	de,hl
	ld	a,#0xF0
	ld	(de),a
;carwar.c:988: VPDCommand36((u16)&buffer);
	push	bc
	call	_VPDCommand36
	pop	af
;carwar.c:989: VPDCommandLoop(ram);
	ld	l,9 (ix)
	ld	h,10 (ix)
	push	hl
	call	_VPDCommandLoop
	ld	sp,ix
	pop	ix
	ret
_RAMtoVRAM_end::
;carwar.c:993: void RAMtoVRAMTrans(u8 page, u8 dx, u8 dy, u8 nx, u8 ny, u16 ram)
;	---------------------------------
; Function RAMtoVRAMTrans
; ---------------------------------
_RAMtoVRAMTrans_start::
_RAMtoVRAMTrans:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-13
	add	hl,sp
	ld	sp,hl
;carwar.c:997: buffer.DX = dx;
	ld	hl,#0x0002
	add	hl,sp
	ld	c,5 (ix)
	ld	b,#0x00
	ld	(hl),c
	inc	hl
	ld	(hl),b
;carwar.c:998: buffer.DY = dy + ((u16)page << 8);
	ld	hl,#0x0002
	add	hl,sp
	ld	c,l
	ld	b,h
	ld	hl,#0x0002
	add	hl,bc
	ld	-13 (ix),l
	ld	-12 (ix),h
	ld	l,6 (ix)
	ld	h,#0x00
	ld	d, 4 (ix)
	ld	e,#0x00
	add	hl,de
	ex	de,hl
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:999: buffer.NX = nx;
	ld	hl,#0x0004
	add	hl,bc
	ld	-13 (ix),l
	ld	-12 (ix),h
	ld	e,7 (ix)
	ld	d,#0x00
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:1000: buffer.NY = ny;
	ld	hl,#0x0006
	add	hl,bc
	ld	-13 (ix),l
	ld	-12 (ix),h
	ld	e,8 (ix)
	ld	d,#0x00
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:1001: buffer.CLR = ((u8*)ram)[0];
	ld	hl,#0x0008
	add	hl,bc
	ex	de,hl
	ld	l,9 (ix)
	ld	h,10 (ix)
	ld	a,(hl)
	ld	(de),a
;carwar.c:1002: buffer.ARG = 0;
	ld	hl,#0x0009
	add	hl,bc
	ex	de,hl
	ld	a,#0x00
	ld	(de),a
;carwar.c:1003: buffer.CMD = 0xB8;
	ld	hl,#0x000A
	add	hl,bc
	ex	de,hl
	ld	a,#0xB8
	ld	(de),a
;carwar.c:1004: VPDCommand36((u16)&buffer);
	push	bc
	call	_VPDCommand36
	pop	af
;carwar.c:1005: VPDCommandLoop(ram);
	ld	l,9 (ix)
	ld	h,10 (ix)
	push	hl
	call	_VPDCommandLoop
	ld	sp,ix
	pop	ix
	ret
_RAMtoVRAMTrans_end::
;carwar.c:1009: void Fill8(u8 page, u8 dx, u8 dy, u8 nx, u8 ny, u8 color)
;	---------------------------------
; Function Fill8
; ---------------------------------
_Fill8_start::
_Fill8:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-13
	add	hl,sp
	ld	sp,hl
;carwar.c:1013: buffer.DX = dx;
	ld	hl,#0x0002
	add	hl,sp
	ld	c,5 (ix)
	ld	b,#0x00
	ld	(hl),c
	inc	hl
	ld	(hl),b
;carwar.c:1014: buffer.DY = dy + ((u16)page << 8);
	ld	hl,#0x0002
	add	hl,sp
	ld	c,l
	ld	b,h
	ld	hl,#0x0002
	add	hl,bc
	ld	-13 (ix),l
	ld	-12 (ix),h
	ld	l,6 (ix)
	ld	h,#0x00
	ld	d, 4 (ix)
	ld	e,#0x00
	add	hl,de
	ex	de,hl
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:1015: buffer.NX = nx;
	ld	hl,#0x0004
	add	hl,bc
	ld	-13 (ix),l
	ld	-12 (ix),h
	ld	e,7 (ix)
	ld	d,#0x00
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:1016: buffer.NY = ny;
	ld	hl,#0x0006
	add	hl,bc
	ld	-13 (ix),l
	ld	-12 (ix),h
	ld	e,8 (ix)
	ld	d,#0x00
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:1017: buffer.CLR = color;
	ld	hl,#0x0008
	add	hl,bc
	ex	de,hl
	ld	a,9 (ix)
	ld	(de),a
;carwar.c:1018: buffer.ARG = 0;
	ld	hl,#0x0009
	add	hl,bc
	ex	de,hl
	ld	a,#0x00
	ld	(de),a
;carwar.c:1019: buffer.CMD = 0xC0;
	ld	hl,#0x000A
	add	hl,bc
	ex	de,hl
	ld	a,#0xC0
	ld	(de),a
;carwar.c:1020: VPDCommand36((u16)&buffer);
	push	bc
	call	_VPDCommand36
	ld	sp,ix
	pop	ix
	ret
_Fill8_end::
;carwar.c:1024: void VRAMtoVRAM(u8 sPage, u8 sx, u8 sy, u8 dPage, u8 dx, u8 dy, u8 nx, u8 ny)
;	---------------------------------
; Function VRAMtoVRAM
; ---------------------------------
_VRAMtoVRAM_start::
_VRAMtoVRAM:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-17
	add	hl,sp
	ld	sp,hl
;carwar.c:1028: buffer.SX = sx;
	ld	hl,#0x0002
	add	hl,sp
	ld	c,5 (ix)
	ld	b,#0x00
	ld	(hl),c
	inc	hl
	ld	(hl),b
;carwar.c:1029: buffer.SY = sy + ((u16)sPage << 8);
	ld	hl,#0x0002
	add	hl,sp
	ld	c,l
	ld	b,h
	ld	hl,#0x0002
	add	hl,bc
	ld	-17 (ix),l
	ld	-16 (ix),h
	ld	l,6 (ix)
	ld	h,#0x00
	ld	d, 4 (ix)
	ld	e,#0x00
	add	hl,de
	ex	de,hl
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:1030: buffer.DX = dx;
	ld	hl,#0x0004
	add	hl,bc
	ld	-17 (ix),l
	ld	-16 (ix),h
	ld	e,8 (ix)
	ld	d,#0x00
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:1031: buffer.DY = dy + ((u16)dPage << 8);
	ld	hl,#0x0006
	add	hl,bc
	ld	-17 (ix),l
	ld	-16 (ix),h
	ld	l,9 (ix)
	ld	h,#0x00
	ld	d, 7 (ix)
	ld	e,#0x00
	add	hl,de
	ex	de,hl
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:1032: buffer.NX = nx;
	ld	hl,#0x0008
	add	hl,bc
	ld	-17 (ix),l
	ld	-16 (ix),h
	ld	e,10 (ix)
	ld	d,#0x00
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:1033: buffer.NY = ny;
	ld	hl,#0x000A
	add	hl,bc
	ld	-17 (ix),l
	ld	-16 (ix),h
	ld	e,11 (ix)
	ld	d,#0x00
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:1034: buffer.CLR = 0;
	ld	hl,#0x000C
	add	hl,bc
	ex	de,hl
	ld	a,#0x00
	ld	(de),a
;carwar.c:1035: buffer.ARG = 0;
	ld	hl,#0x000D
	add	hl,bc
	ex	de,hl
	ld	a,#0x00
	ld	(de),a
;carwar.c:1036: buffer.CMD = 0xD0;
	ld	hl,#0x000E
	add	hl,bc
	ex	de,hl
	ld	a,#0xD0
	ld	(de),a
;carwar.c:1037: VPDCommand32((u16)&buffer);
	push	bc
	call	_VPDCommand32
	ld	sp,ix
	pop	ix
	ret
_VRAMtoVRAM_end::
;carwar.c:1041: void VRAMtoVRAMTrans(u8 sPage, u8 sx, u8 sy, u8 dPage, u8 dx, u8 dy, u8 nx, u8 ny)
;	---------------------------------
; Function VRAMtoVRAMTrans
; ---------------------------------
_VRAMtoVRAMTrans_start::
_VRAMtoVRAMTrans:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-17
	add	hl,sp
	ld	sp,hl
;carwar.c:1045: buffer.SX = sx;
	ld	hl,#0x0002
	add	hl,sp
	ld	c,5 (ix)
	ld	b,#0x00
	ld	(hl),c
	inc	hl
	ld	(hl),b
;carwar.c:1046: buffer.SY = sy + ((u16)sPage << 8);
	ld	hl,#0x0002
	add	hl,sp
	ld	c,l
	ld	b,h
	ld	hl,#0x0002
	add	hl,bc
	ld	-17 (ix),l
	ld	-16 (ix),h
	ld	l,6 (ix)
	ld	h,#0x00
	ld	d, 4 (ix)
	ld	e,#0x00
	add	hl,de
	ex	de,hl
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:1047: buffer.DX = dx;
	ld	hl,#0x0004
	add	hl,bc
	ld	-17 (ix),l
	ld	-16 (ix),h
	ld	e,8 (ix)
	ld	d,#0x00
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:1048: buffer.DY = dy + ((u16)dPage << 8);
	ld	hl,#0x0006
	add	hl,bc
	ld	-17 (ix),l
	ld	-16 (ix),h
	ld	l,9 (ix)
	ld	h,#0x00
	ld	d, 7 (ix)
	ld	e,#0x00
	add	hl,de
	ex	de,hl
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:1049: buffer.NX = nx;
	ld	hl,#0x0008
	add	hl,bc
	ld	-17 (ix),l
	ld	-16 (ix),h
	ld	e,10 (ix)
	ld	d,#0x00
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:1050: buffer.NY = ny;
	ld	hl,#0x000A
	add	hl,bc
	ld	-17 (ix),l
	ld	-16 (ix),h
	ld	e,11 (ix)
	ld	d,#0x00
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:1051: buffer.CLR = 0;
	ld	hl,#0x000C
	add	hl,bc
	ex	de,hl
	ld	a,#0x00
	ld	(de),a
;carwar.c:1052: buffer.ARG = 0;
	ld	hl,#0x000D
	add	hl,bc
	ex	de,hl
	ld	a,#0x00
	ld	(de),a
;carwar.c:1053: buffer.CMD = 0x98;
	ld	hl,#0x000E
	add	hl,bc
	ex	de,hl
	ld	a,#0x98
	ld	(de),a
;carwar.c:1054: VPDCommand32((u16)&buffer);
	push	bc
	call	_VPDCommand32
	ld	sp,ix
	pop	ix
	ret
_VRAMtoVRAMTrans_end::
;carwar.c:1067: void VPDCommand32(u16 address)
;	---------------------------------
; Function VPDCommand32
; ---------------------------------
_VPDCommand32_start::
_VPDCommand32:
	push	ix
	ld	ix,#0
	add	ix,sp
;carwar.c:1071: WaitForVDP();
	call	_WaitForVDP
;carwar.c:1101: __endasm;
	
	
		 ld l,4(ix)
		 ld h,5(ix)
	
		 ld a,#32
		di
		 out (#0x99),a
		 ld a,#(0x80+17)
		 out (#0x99),a
		 ld c,#0x99 +#2
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
		ei
		 outi
	
		
	pop	ix
	ret
_VPDCommand32_end::
;carwar.c:1107: void VPDCommand36(u16 address)
;	---------------------------------
; Function VPDCommand36
; ---------------------------------
_VPDCommand36_start::
_VPDCommand36:
	push	ix
	ld	ix,#0
	add	ix,sp
;carwar.c:1111: WaitForVDP();
	call	_WaitForVDP
;carwar.c:1137: __endasm;
	
	
		 ld l,4(ix)
		 ld h,5(ix)
		 ;
		 ld a,#36 ;
		di
		 out (#0x99),a
		 ld a,#(0x80+17)
		 out (#0x99),a ;
		 ld c,#0x99 +#2 ;
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
		ei ;
		 outi
	
		
	pop	ix
	ret
_VPDCommand36_end::
;carwar.c:1140: void PrintSprite(u8 X, u8 Y, const char* text)
;	---------------------------------
; Function PrintSprite
; ---------------------------------
_PrintSprite_start::
_PrintSprite:
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;carwar.c:1143: u8 curX = X;
	ld	a,4 (ix)
	ld	-1 (ix),a
;carwar.c:1144: u8 curY = Y;
;carwar.c:1145: while(text[sprtIdx] != 0)
	ld	b, 5 (ix)
	ld	e,#0x00
00104$:
	ld	a,6 (ix)
	add	a,e
	ld	d,a
	ld	a,7 (ix)
	adc	a,#0x00
	ld	c, a
	ld	l, d
	ld	h, a
	ld	l,(hl)
	xor	a,a
	or	a,l
	jr	Z,00106$
;carwar.c:1147: if(text[sprtIdx] == '\n')
	ld	a,l
	sub	a,#0x0A
	jr	NZ,00102$
;carwar.c:1149: curX = X;
	ld	a,4 (ix)
	ld	-1 (ix),a
;carwar.c:1150: curY += 9;
	ld	a,b
	add	a,#0x09
	ld	b,a
	jr	00103$
00102$:
;carwar.c:1154: SetSprite(sprtIdx, curX, curY, text[sprtIdx] - '0');
	ld	a,l
	add	a,#0xD0
	ld	l,a
	push	bc
	push	de
	ld	a,l
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	d, -1 (ix)
	push	de
	call	_SetSprite
	pop	af
	pop	af
	pop	de
	pop	bc
;carwar.c:1155: curX += 8;
	ld	a,-1 (ix)
	add	a,#0x08
	ld	-1 (ix),a
00103$:
;carwar.c:1157: sprtIdx++;
	inc	e
	jr	00104$
00106$:
;carwar.c:1159: SetSprite(sprtIdx, 0, 216, 0);
	ld	hl,#0x00D8
	push	hl
	ld	d,#0x00
	push	de
	call	_SetSprite
	ld	sp,ix
	pop	ix
	ret
_PrintSprite_end::
;carwar.c:1162: void ClearSprite()
;	---------------------------------
; Function ClearSprite
; ---------------------------------
_ClearSprite_start::
_ClearSprite:
;carwar.c:1164: SetSprite(0, 0, 216, 0);
	ld	hl,#0x00D8
	push	hl
	ld	l, #0x00
	push	hl
	call	_SetSprite
	pop	af
	pop	af
	ret
_ClearSprite_end::
;carwar.c:1167: void SetSprite(u8 index, u8 X, u8 Y, u8 shape)
;	---------------------------------
; Function SetSprite
; ---------------------------------
_SetSprite_start::
_SetSprite:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-8
	add	hl,sp
	ld	sp,hl
;carwar.c:1170: sprt.posX = X;
	ld	hl,#0x0004
	add	hl,sp
	ld	c,l
	ld	b,h
	ld	e,c
	ld	d,b
	inc	de
	ld	a,5 (ix)
	ld	(de),a
;carwar.c:1171: sprt.posY = Y;
	ld	a,6 (ix)
	ld	(bc),a
;carwar.c:1172: sprt.index = shape;
	inc	bc
	inc	bc
	ld	a,7 (ix)
	ld	(bc),a
;carwar.c:1175: RAMtoVRAM16((index * 16) % 256, 244 + (index / 16), 8, 1, (u16)&defaultColor);
	ld	-8 (ix),#<(_defaultColor)
	ld	-7 (ix),#>(_defaultColor)
	ld	a,4 (ix)
	srl	a
	srl	a
	srl	a
	srl	a
	ld	h, #0x00
	add	a,#0xF4
	ld	-6 (ix),a
	ld	a,h
	adc	a,#0x00
	ld	-5 (ix),a
	ld	e,4 (ix)
	ld	d,#0x00
	ld	c,e
	ld	b,d
	sla	c
	rl	b
	sla	c
	rl	b
	sla	c
	rl	b
	sla	c
	rl	b
	push	de
	ld	hl,#0x0100
	push	hl
	push	bc
	call	__modsint_rrx_s
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	hl
	ld	hl,#0x0001
	push	hl
	ld	l, #0x08
	push	hl
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	push	bc
	call	_RAMtoVRAM16
	ld	hl,#0x000A
	add	hl,sp
	ld	sp,hl
	pop	de
;carwar.c:1176: RAMtoVRAM16((index * 4) % 256, 246 + (index / 64), 4, 1, (u16)&sprt);
	ld	hl,#0x0004
	add	hl,sp
	ld	-8 (ix),l
	ld	-7 (ix),h
	ld	a,4 (ix)
	srl	a
	srl	a
	srl	a
	srl	a
	srl	a
	srl	a
	ld	h, #0x00
	add	a,#0xF6
	ld	c,a
	ld	a,h
	adc	a,#0x00
	ld	b,a
	sla	e
	rl	d
	sla	e
	rl	d
	push	bc
	ld	hl,#0x0100
	push	hl
	push	de
	call	__modsint_rrx_s
	pop	af
	pop	af
	ex	de,hl
	pop	bc
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	hl
	ld	hl,#0x0001
	push	hl
	ld	l, #0x04
	push	hl
	push	bc
	push	de
	call	_RAMtoVRAM16
	ld	hl,#0x000A
	add	hl,sp
	ld	sp,hl
	ld	sp,ix
	pop	ix
	ret
_SetSprite_end::
	.area _CODE
	.area _CABS
