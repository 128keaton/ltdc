;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.0.0 #6037 (Oct 31 2010) (MINGW32)
; This file was generated Thu Feb 17 13:53:40 2011
;--------------------------------------------------------
	.module carwar
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _game
	.globl _menus
	.globl _menuPlayer
	.globl _menuTrack
	.globl _menuMode
	.globl _menuMain
	.globl _track01
	.globl _trackTiles01
	.globl _cars
	.globl _defaultColor
	.globl _title
	.globl _trackTiles
	.globl _charTable
	.globl _shadow
	.globl _car4
	.globl _car3
	.globl _car2
	.globl _car1
	.globl _MainLoop
	.globl _StateInitialize
	.globl _InitializeMenu
	.globl _StateTitle
	.globl _StartGame
	.globl _StateMainMenu
	.globl _StateStartGame
	.globl _StateUpdateGame
	.globl _InitializePlayer
	.globl _AngleDifferent64
	.globl _VectorToAngle64
	.globl _GetVectorLenght
	.globl _CheckCollision
	.globl _StateBuildTrack
	.globl _StateShadeTrack
	.globl _DarkenColor
	.globl _GrayGradiant
	.globl _DrawCharacter
	.globl _DrawText
	.globl _DebugPrintInt
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
_g_slotPort	=	0x00a8
;--------------------------------------------------------
;  ram data
;--------------------------------------------------------
	.area _DATA
_game	=	0xc000
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
;carwar.c:359: void main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main_start::
_main:
;carwar.c:365: __endasm;
	
		 di
		 ld sp, (#0xFC4A)
		 ei
		
;carwar.c:367: g_slotPort = (g_slotPort & 0xCF) | ((g_slotPort & 0x0C) << 2);
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
;carwar.c:369: MainLoop();
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
	.db #0x7E	; 126
	.db #0xE7	; 231
	.db #0xDB	; 219
	.db #0xDB	; 219
	.db #0xE7	; 231
	.db #0x7E	; 126
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
_trackTiles:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3F	; 63
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x7F	; 127
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x01	; 1
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x03	; 3
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x07	; 7
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x1F	; 31
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x1F	; 31
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x1F	; 31
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x1F	; 31
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x3F	; 63
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x3F	; 63
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x3F	; 63
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x3F	; 63
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x3F	; 63
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x7F	; 127
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x7F	; 127
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x7F	; 127
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x7F	; 127
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x7F	; 127
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x7F	; 127
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0F	; 15
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1F	; 31
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3F	; 63
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7F	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1F	; 31
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3F	; 63
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7F	; 127
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x1F	; 31
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x3F	; 63
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x7F	; 127
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x01	; 1
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x03	; 3
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x07	; 7
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x1F	; 31
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x3F	; 63
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x7F	; 127
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x33	; 51
	.db #0x33	; 51
	.db #0x33	; 51
	.db #0x33	; 51
	.db #0x33	; 51
	.db #0x33	; 51
	.db #0x33	; 51
	.db #0x33	; 51
	.db #0xCC	; 204
	.db #0xCC	; 204
	.db #0xCC	; 204
	.db #0xCC	; 204
	.db #0xCC	; 204
	.db #0xCC	; 204
	.db #0xCC	; 204
	.db #0xCC	; 204
	.db #0x33	; 51
	.db #0x33	; 51
	.db #0x33	; 51
	.db #0x33	; 51
	.db #0x33	; 51
	.db #0x33	; 51
	.db #0x33	; 51
	.db #0x33	; 51
	.db #0xCC	; 204
	.db #0xCC	; 204
	.db #0xCC	; 204
	.db #0xCC	; 204
	.db #0xCC	; 204
	.db #0xCC	; 204
	.db #0xCC	; 204
	.db #0xCC	; 204
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x3F	; 63
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xF0	; 240
	.db #0x1F	; 31
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xE0	; 224
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xE0	; 224
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xE0	; 224
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xE0	; 224
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xE0	; 224
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xF0	; 240
	.db #0x1F	; 31
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x3F	; 63
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x1F	; 31
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x1F	; 31
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x1F	; 31
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x1F	; 31
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x1F	; 31
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x1F	; 31
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x1F	; 31
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x1F	; 31
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x3F	; 63
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x3F	; 63
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x3F	; 63
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x3F	; 63
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x3F	; 63
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x3F	; 63
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x3F	; 63
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x3F	; 63
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x7F	; 127
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x7F	; 127
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x7F	; 127
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x7F	; 127
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x7F	; 127
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x7F	; 127
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x7F	; 127
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x7F	; 127
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x3F	; 63
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x01	; 1
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x01	; 1
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x03	; 3
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x03	; 3
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x03	; 3
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x03	; 3
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x07	; 7
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x07	; 7
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x07	; 7
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x07	; 7
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x07	; 7
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x07	; 7
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1F	; 31
	.db #0xF8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0x07	; 7
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xE0	; 224
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xF0	; 240
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xF0	; 240
	.db #0x1F	; 31
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x1F	; 31
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x1F	; 31
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x1F	; 31
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x3F	; 63
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFC	; 252
	.db #0x3F	; 63
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFC	; 252
	.db #0x3F	; 63
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFC	; 252
	.db #0x3F	; 63
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFC	; 252
	.db #0x3F	; 63
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFC	; 252
	.db #0x7F	; 127
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFE	; 254
	.db #0x7F	; 127
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFE	; 254
	.db #0x7F	; 127
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFE	; 254
	.db #0x7F	; 127
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFE	; 254
	.db #0x7F	; 127
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFE	; 254
	.db #0x7F	; 127
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFE	; 254
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xBF	; 191
	.db #0x6E	; 110	n
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xBF	; 191
	.db #0x78	; 120	x
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFB	; 251
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xBC	; 188
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xC6	; 198
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xBD	; 189
	.db #0xB8	; 184
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xF4	; 244
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFE	; 254
	.db #0x3E	; 62
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x3E	; 62
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xE7	; 231
	.db #0xFE	; 254
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xC3	; 195
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x38	; 56
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x72	; 114	r
	.db #0x00	; 0
	.db #0xFE	; 254
	.db #0x1E	; 30
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xD7	; 215
	.db #0xF8	; 248
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFE	; 254
	.db #0x5C	; 92
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x79	; 121	y
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xF5	; 245
	.db #0xF2	; 242
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0xF8	; 248
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xEF	; 239
	.db #0x82	; 130
	.db #0x00	; 0
	.db #0xFD	; 253
	.db #0xE1	; 225
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFC	; 252
	.db #0x48	; 72	H
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xA4	; 164
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xEE	; 238
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFE	; 254
	.db #0x76	; 118	v
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xBF	; 191
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFC	; 252
	.db #0x70	; 112	p
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xC2	; 194
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xF0	; 240
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0x03	; 3
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFE	; 254
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7F	; 127
	.db #0xFE	; 254
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7F	; 127
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3F	; 63
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3F	; 63
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3F	; 63
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3F	; 63
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3F	; 63
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3F	; 63
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3F	; 63
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3F	; 63
	.db #0xFE	; 254
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7F	; 127
	.db #0xFE	; 254
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7F	; 127
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0x03	; 3
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xF0	; 240
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFE	; 254
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFE	; 254
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFE	; 254
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFC	; 252
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xF0	; 240
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xF0	; 240
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x8F	; 143
	.db #0xE3	; 227
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x8F	; 143
	.db #0xE3	; 227
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x8F	; 143
	.db #0xE3	; 227
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x8F	; 143
	.db #0xE3	; 227
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x8F	; 143
	.db #0xE3	; 227
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x8F	; 143
	.db #0xE3	; 227
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x8F	; 143
	.db #0xE3	; 227
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x8F	; 143
	.db #0xE3	; 227
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x80	; 128
	.db #0x03	; 3
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x80	; 128
	.db #0x03	; 3
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x80	; 128
	.db #0x03	; 3
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x8F	; 143
	.db #0xE3	; 227
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x8F	; 143
	.db #0xE3	; 227
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x8F	; 143
	.db #0xE3	; 227
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x8F	; 143
	.db #0xE3	; 227
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x8F	; 143
	.db #0xE3	; 227
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x8F	; 143
	.db #0xE3	; 227
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x8F	; 143
	.db #0xE3	; 227
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
_title:
	.db #0x00	; 0
	.db #0x1F	; 31
	.db #0x1E	; 30
	.db #0x0E	; 14
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0xFF	; 255
	.db #0x80	; 128
	.db #0x07	; 7
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0xFF	; 255
	.db #0x80	; 128
	.db #0x7F	; 127
	.db #0xFF	; 255
	.db #0xE0	; 224
	.db #0x7E	; 126
	.db #0x0F	; 15
	.db #0xFE	; 254
	.db #0x00	; 0
	.db #0x7F	; 127
	.db #0xF8	; 248
	.db #0x00	; 0
	.db #0x3F	; 63
	.db #0xFF	; 255
	.db #0xC7	; 199
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x1F	; 31
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0xFF	; 255
	.db #0x80	; 128
	.db #0x07	; 7
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0xFF	; 255
	.db #0xF0	; 240
	.db #0x7F	; 127
	.db #0xFF	; 255
	.db #0xE0	; 224
	.db #0xFF	; 255
	.db #0x07	; 7
	.db #0xFE	; 254
	.db #0x00	; 0
	.db #0x7F	; 127
	.db #0xF8	; 248
	.db #0x00	; 0
	.db #0x3F	; 63
	.db #0xFF	; 255
	.db #0xC7	; 199
	.db #0xFF	; 255
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0xF8	; 248
	.db #0x03	; 3
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0xFF	; 255
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x3F	; 63
	.db #0xFC	; 252
	.db #0x1F	; 31
	.db #0xFF	; 255
	.db #0x80	; 128
	.db #0xFF	; 255
	.db #0x01	; 1
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x7F	; 127
	.db #0xF8	; 248
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0xFF	; 255
	.db #0xC1	; 193
	.db #0xFF	; 255
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0x0F	; 15
	.db #0xF8	; 248
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x1F	; 31
	.db #0xFE	; 254
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0x80	; 128
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0x7F	; 127
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0xFF	; 255
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x1F	; 31
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x7F	; 127
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x1F	; 31
	.db #0xFE	; 254
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xC1	; 193
	.db #0xFF	; 255
	.db #0x81	; 129
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0x3F	; 63
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0xFF	; 255
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x3F	; 63
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x3F	; 63
	.db #0x00	; 0
	.db #0x13	; 19
	.db #0xFF	; 255
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x1F	; 31
	.db #0xFF	; 255
	.db #0x07	; 7
	.db #0xFF	; 255
	.db #0xC1	; 193
	.db #0xFF	; 255
	.db #0x81	; 129
	.db #0xC0	; 192
	.db #0x01	; 1
	.db #0x3F	; 63
	.db #0xFE	; 254
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x00	; 0
	.db #0x7F	; 127
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x1F	; 31
	.db #0x00	; 0
	.db #0x13	; 19
	.db #0xFF	; 255
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x1F	; 31
	.db #0xFF	; 255
	.db #0x07	; 7
	.db #0xFF	; 255
	.db #0xE3	; 227
	.db #0xFF	; 255
	.db #0xC1	; 193
	.db #0xC0	; 192
	.db #0x01	; 1
	.db #0x3F	; 63
	.db #0xFE	; 254
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x00	; 0
	.db #0x7F	; 127
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x1F	; 31
	.db #0x00	; 0
	.db #0x39	; 57
	.db #0xFF	; 255
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x1F	; 31
	.db #0xFF	; 255
	.db #0x07	; 7
	.db #0xFF	; 255
	.db #0xE3	; 227
	.db #0xFF	; 255
	.db #0xC3	; 195
	.db #0x80	; 128
	.db #0x03	; 3
	.db #0x9F	; 159
	.db #0xFE	; 254
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x0F	; 15
	.db #0x00	; 0
	.db #0x39	; 57
	.db #0xFF	; 255
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x1F	; 31
	.db #0xFE	; 254
	.db #0x03	; 3
	.db #0xFF	; 255
	.db #0xE3	; 227
	.db #0xFF	; 255
	.db #0xE3	; 227
	.db #0x80	; 128
	.db #0x03	; 3
	.db #0x9F	; 159
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0xFF	; 255
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x71	; 113	q
	.db #0xFF	; 255
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x1F	; 31
	.db #0xFC	; 252
	.db #0x03	; 3
	.db #0xFF	; 255
	.db #0xF3	; 243
	.db #0xFF	; 255
	.db #0xE7	; 231
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x1F	; 31
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0xFF	; 255
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x70	; 112	p
	.db #0xFF	; 255
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x1F	; 31
	.db #0xF8	; 248
	.db #0x01	; 1
	.db #0xFF	; 255
	.db #0xF1	; 241
	.db #0xFF	; 255
	.db #0xF3	; 243
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0x01	; 1
	.db #0xFF	; 255
	.db #0xF9	; 249
	.db #0xFF	; 255
	.db #0xF3	; 243
	.db #0x00	; 0
	.db #0x0F	; 15
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0x80	; 128
	.db #0x07	; 7
	.db #0xFF	; 255
	.db #0xC7	; 199
	.db #0xFE	; 254
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xE0	; 224
	.db #0x7F	; 127
	.db #0xF8	; 248
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xF9	; 249
	.db #0xFF	; 255
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x0E	; 14
	.db #0x07	; 7
	.db #0xFF	; 255
	.db #0x80	; 128
	.db #0x07	; 7
	.db #0xFF	; 255
	.db #0xC7	; 199
	.db #0xF8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xE0	; 224
	.db #0x7F	; 127
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFC	; 252
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x00	; 0
	.db #0x0E	; 14
	.db #0x07	; 7
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0x07	; 7
	.db #0xFF	; 255
	.db #0xC7	; 199
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0xC0	; 192
	.db #0x7F	; 127
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x3F	; 63
	.db #0xFE	; 254
	.db #0x00	; 0
	.db #0x7F	; 127
	.db #0xFC	; 252
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x00	; 0
	.db #0x1C	; 28
	.db #0x07	; 7
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0x07	; 7
	.db #0xFF	; 255
	.db #0xC1	; 193
	.db #0xFF	; 255
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0xC0	; 192
	.db #0x3F	; 63
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x1F	; 31
	.db #0xFE	; 254
	.db #0x00	; 0
	.db #0x7F	; 127
	.db #0xFC	; 252
	.db #0x7F	; 127
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0x1C	; 28
	.db #0x03	; 3
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0x07	; 7
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0xFF	; 255
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0xDF	; 223
	.db #0xFF	; 255
	.db #0xFE	; 254
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x1F	; 31
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x7F	; 127
	.db #0xFC	; 252
	.db #0x7F	; 127
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0x3D	; 61
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xE0	; 224
	.db #0x07	; 7
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x00	; 0
	.db #0x7F	; 127
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x0E	; 14
	.db #0x03	; 3
	.db #0x9F	; 159
	.db #0xFF	; 255
	.db #0xFE	; 254
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x1F	; 31
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x3F	; 63
	.db #0xFC	; 252
	.db #0x7F	; 127
	.db #0xF8	; 248
	.db #0x00	; 0
	.db #0x39	; 57
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xE0	; 224
	.db #0x07	; 7
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x00	; 0
	.db #0x3F	; 63
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x0E	; 14
	.db #0x07	; 7
	.db #0x80	; 128
	.db #0x1F	; 31
	.db #0xFE	; 254
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x1F	; 31
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x3F	; 63
	.db #0xF8	; 248
	.db #0x3F	; 63
	.db #0xF8	; 248
	.db #0x00	; 0
	.db #0x78	; 120	x
	.db #0x01	; 1
	.db #0xFF	; 255
	.db #0xE0	; 224
	.db #0x07	; 7
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x00	; 0
	.db #0x3F	; 63
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x1E	; 30
	.db #0x07	; 7
	.db #0x80	; 128
	.db #0x1F	; 31
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x1F	; 31
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x1F	; 31
	.db #0xF8	; 248
	.db #0x3F	; 63
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x78	; 120	x
	.db #0x01	; 1
	.db #0xFF	; 255
	.db #0xF0	; 240
	.db #0x07	; 7
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x00	; 0
	.db #0x0F	; 15
	.db #0xF8	; 248
	.db #0x00	; 0
	.db #0x7C	; 124
	.db #0x0F	; 15
	.db #0x00	; 0
	.db #0x1F	; 31
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x1F	; 31
	.db #0xFF	; 255
	.db #0x70	; 112	p
	.db #0x1F	; 31
	.db #0xF0	; 240
	.db #0x1F	; 31
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0x01	; 1
	.db #0xFF	; 255
	.db #0xF0	; 240
	.db #0x07	; 7
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0xFF	; 255
	.db #0xFB	; 251
	.db #0x80	; 128
	.db #0x07	; 7
	.db #0xFC	; 252
	.db #0x01	; 1
	.db #0xF0	; 240
	.db #0x1F	; 31
	.db #0x80	; 128
	.db #0x1F	; 31
	.db #0xFF	; 255
	.db #0x80	; 128
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xE0	; 224
	.db #0x0F	; 15
	.db #0xF0	; 240
	.db #0x1F	; 31
	.db #0xE0	; 224
	.db #0x01	; 1
	.db #0xF8	; 248
	.db #0x01	; 1
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x07	; 7
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0x7F	; 127
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0xFF	; 255
	.db #0x1F	; 31
	.db #0xC0	; 192
	.db #0x7F	; 127
	.db #0xE0	; 224
	.db #0x3F	; 63
	.db #0xFF	; 255
	.db #0xE7	; 231
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x07	; 7
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0x0F	; 15
	.db #0xF0	; 240
	.db #0x0F	; 15
	.db #0xE0	; 224
	.db #0x07	; 7
	.db #0xFE	; 254
	.db #0x03	; 3
	.db #0xFF	; 255
	.db #0xFE	; 254
	.db #0x3F	; 63
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x3F	; 63
	.db #0xFE	; 254
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1F	; 31
	.db #0x1E	; 30
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xE0	; 224
	.db #0x3F	; 63
	.db #0xFF	; 255
	.db #0xE7	; 231
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x01	; 1
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0xE0	; 224
	.db #0x0F	; 15
	.db #0xE0	; 224
	.db #0x0F	; 15
	.db #0xFE	; 254
	.db #0x03	; 3
	.db #0xFF	; 255
	.db #0xFE	; 254
	.db #0x3F	; 63
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x0F	; 15
	.db #0xF8	; 248
	.db #0x00	; 0
_g_Sinus64:
	.dw #0x0000
	.dw #0x0019
	.dw #0x0031
	.dw #0x004A
	.dw #0x0061
	.dw #0x0078
	.dw #0x008E
	.dw #0x00A2
	.dw #0x00B5
	.dw #0x00C5
	.dw #0x00D4
	.dw #0x00E1
	.dw #0x00EC
	.dw #0x00F4
	.dw #0x00FB
	.dw #0x00FE
	.dw #0x0100
	.dw #0x00FE
	.dw #0x00FB
	.dw #0x00F4
	.dw #0x00EC
	.dw #0x00E1
	.dw #0x00D4
	.dw #0x00C5
	.dw #0x00B5
	.dw #0x00A2
	.dw #0x008E
	.dw #0x0078
	.dw #0x0061
	.dw #0x004A
	.dw #0x0031
	.dw #0x0019
	.dw #0x0000
	.dw #0xFFE7
	.dw #0xFFCF
	.dw #0xFFB6
	.dw #0xFF9F
	.dw #0xFF88
	.dw #0xFF72
	.dw #0xFF5E
	.dw #0xFF4B
	.dw #0xFF3B
	.dw #0xFF2C
	.dw #0xFF1F
	.dw #0xFF14
	.dw #0xFF0C
	.dw #0xFF05
	.dw #0xFF02
	.dw #0xFF00
	.dw #0xFF02
	.dw #0xFF05
	.dw #0xFF0C
	.dw #0xFF14
	.dw #0xFF1F
	.dw #0xFF2C
	.dw #0xFF3B
	.dw #0xFF4B
	.dw #0xFF5E
	.dw #0xFF72
	.dw #0xFF88
	.dw #0xFF9F
	.dw #0xFFB6
	.dw #0xFFCF
	.dw #0xFFE7
_g_Cosinus64:
	.dw #0x0100
	.dw #0x00FE
	.dw #0x00FB
	.dw #0x00F4
	.dw #0x00EC
	.dw #0x00E1
	.dw #0x00D4
	.dw #0x00C5
	.dw #0x00B5
	.dw #0x00A2
	.dw #0x008E
	.dw #0x0078
	.dw #0x0061
	.dw #0x004A
	.dw #0x0031
	.dw #0x0019
	.dw #0x0000
	.dw #0xFFE7
	.dw #0xFFCF
	.dw #0xFFB6
	.dw #0xFF9F
	.dw #0xFF88
	.dw #0xFF72
	.dw #0xFF5E
	.dw #0xFF4B
	.dw #0xFF3B
	.dw #0xFF2C
	.dw #0xFF1F
	.dw #0xFF14
	.dw #0xFF0C
	.dw #0xFF05
	.dw #0xFF02
	.dw #0xFF00
	.dw #0xFF02
	.dw #0xFF05
	.dw #0xFF0C
	.dw #0xFF14
	.dw #0xFF1F
	.dw #0xFF2C
	.dw #0xFF3B
	.dw #0xFF4B
	.dw #0xFF5E
	.dw #0xFF72
	.dw #0xFF88
	.dw #0xFF9F
	.dw #0xFFB6
	.dw #0xFFCF
	.dw #0xFFE7
	.dw #0x0000
	.dw #0x0019
	.dw #0x0031
	.dw #0x004A
	.dw #0x0061
	.dw #0x0078
	.dw #0x008E
	.dw #0x00A2
	.dw #0x00B5
	.dw #0x00C5
	.dw #0x00D4
	.dw #0x00E1
	.dw #0x00EC
	.dw #0x00F4
	.dw #0x00FB
	.dw #0x00FE
_g_Rotation16:
	.db #0x28	;  40
	.db #0x28	;  40
	.db #0x27	;  39
	.db #0x27	;  39
	.db #0x26	;  38
	.db #0x26	;  38
	.db #0x26	;  38
	.db #0x25	;  37
	.db #0x24	;  36
	.db #0x24	;  36
	.db #0x23	;  35
	.db #0x23	;  35
	.db #0x22	;  34
	.db #0x21	;  33
	.db #0x21	;  33
	.db #0x20	;  32
	.db #0x1F	;  31
	.db #0x1F	;  31
	.db #0x1E	;  30
	.db #0x1D	;  29
	.db #0x1D	;  29
	.db #0x1C	;  28
	.db #0x1C	;  28
	.db #0x1B	;  27
	.db #0x1A	;  26
	.db #0x1A	;  26
	.db #0x1A	;  26
	.db #0x19	;  25
	.db #0x19	;  25
	.db #0x18	;  24
	.db #0x18	;  24
	.db #0x28	;  40
	.db #0x28	;  40
	.db #0x28	;  40
	.db #0x27	;  39
	.db #0x27	;  39
	.db #0x26	;  38
	.db #0x26	;  38
	.db #0x25	;  37
	.db #0x25	;  37
	.db #0x24	;  36
	.db #0x23	;  35
	.db #0x23	;  35
	.db #0x22	;  34
	.db #0x21	;  33
	.db #0x21	;  33
	.db #0x20	;  32
	.db #0x1F	;  31
	.db #0x1F	;  31
	.db #0x1E	;  30
	.db #0x1D	;  29
	.db #0x1D	;  29
	.db #0x1C	;  28
	.db #0x1B	;  27
	.db #0x1B	;  27
	.db #0x1A	;  26
	.db #0x1A	;  26
	.db #0x19	;  25
	.db #0x19	;  25
	.db #0x18	;  24
	.db #0x18	;  24
	.db #0x18	;  24
	.db #0x29	;  41
	.db #0x28	;  40
	.db #0x28	;  40
	.db #0x28	;  40
	.db #0x27	;  39
	.db #0x27	;  39
	.db #0x26	;  38
	.db #0x26	;  38
	.db #0x25	;  37
	.db #0x24	;  36
	.db #0x24	;  36
	.db #0x23	;  35
	.db #0x22	;  34
	.db #0x22	;  34
	.db #0x21	;  33
	.db #0x20	;  32
	.db #0x1F	;  31
	.db #0x1E	;  30
	.db #0x1E	;  30
	.db #0x1D	;  29
	.db #0x1C	;  28
	.db #0x1C	;  28
	.db #0x1B	;  27
	.db #0x1A	;  26
	.db #0x1A	;  26
	.db #0x19	;  25
	.db #0x19	;  25
	.db #0x18	;  24
	.db #0x18	;  24
	.db #0x18	;  24
	.db #0x17	;  23
	.db #0x29	;  41
	.db #0x29	;  41
	.db #0x28	;  40
	.db #0x28	;  40
	.db #0x28	;  40
	.db #0x27	;  39
	.db #0x27	;  39
	.db #0x26	;  38
	.db #0x25	;  37
	.db #0x25	;  37
	.db #0x24	;  36
	.db #0x23	;  35
	.db #0x22	;  34
	.db #0x22	;  34
	.db #0x21	;  33
	.db #0x20	;  32
	.db #0x1F	;  31
	.db #0x1E	;  30
	.db #0x1E	;  30
	.db #0x1D	;  29
	.db #0x1C	;  28
	.db #0x1B	;  27
	.db #0x1B	;  27
	.db #0x1A	;  26
	.db #0x19	;  25
	.db #0x19	;  25
	.db #0x18	;  24
	.db #0x18	;  24
	.db #0x18	;  24
	.db #0x17	;  23
	.db #0x17	;  23
	.db #0x2A	;  42
	.db #0x29	;  41
	.db #0x29	;  41
	.db #0x28	;  40
	.db #0x28	;  40
	.db #0x28	;  40
	.db #0x27	;  39
	.db #0x26	;  38
	.db #0x26	;  38
	.db #0x25	;  37
	.db #0x24	;  36
	.db #0x24	;  36
	.db #0x23	;  35
	.db #0x22	;  34
	.db #0x21	;  33
	.db #0x20	;  32
	.db #0x1F	;  31
	.db #0x1E	;  30
	.db #0x1D	;  29
	.db #0x1C	;  28
	.db #0x1C	;  28
	.db #0x1B	;  27
	.db #0x1A	;  26
	.db #0x1A	;  26
	.db #0x19	;  25
	.db #0x18	;  24
	.db #0x18	;  24
	.db #0x18	;  24
	.db #0x17	;  23
	.db #0x17	;  23
	.db #0x16	;  22
	.db #0x2A	;  42
	.db #0x2A	;  42
	.db #0x29	;  41
	.db #0x29	;  41
	.db #0x28	;  40
	.db #0x28	;  40
	.db #0x27	;  39
	.db #0x27	;  39
	.db #0x26	;  38
	.db #0x26	;  38
	.db #0x25	;  37
	.db #0x24	;  36
	.db #0x23	;  35
	.db #0x22	;  34
	.db #0x21	;  33
	.db #0x20	;  32
	.db #0x1F	;  31
	.db #0x1E	;  30
	.db #0x1D	;  29
	.db #0x1C	;  28
	.db #0x1B	;  27
	.db #0x1A	;  26
	.db #0x1A	;  26
	.db #0x19	;  25
	.db #0x19	;  25
	.db #0x18	;  24
	.db #0x18	;  24
	.db #0x17	;  23
	.db #0x17	;  23
	.db #0x16	;  22
	.db #0x16	;  22
	.db #0x2A	;  42
	.db #0x2A	;  42
	.db #0x2A	;  42
	.db #0x29	;  41
	.db #0x29	;  41
	.db #0x29	;  41
	.db #0x28	;  40
	.db #0x27	;  39
	.db #0x27	;  39
	.db #0x26	;  38
	.db #0x25	;  37
	.db #0x24	;  36
	.db #0x23	;  35
	.db #0x22	;  34
	.db #0x21	;  33
	.db #0x20	;  32
	.db #0x1F	;  31
	.db #0x1E	;  30
	.db #0x1D	;  29
	.db #0x1C	;  28
	.db #0x1B	;  27
	.db #0x1A	;  26
	.db #0x19	;  25
	.db #0x19	;  25
	.db #0x18	;  24
	.db #0x17	;  23
	.db #0x17	;  23
	.db #0x17	;  23
	.db #0x16	;  22
	.db #0x16	;  22
	.db #0x16	;  22
	.db #0x2B	;  43
	.db #0x2B	;  43
	.db #0x2A	;  42
	.db #0x2A	;  42
	.db #0x2A	;  42
	.db #0x29	;  41
	.db #0x29	;  41
	.db #0x28	;  40
	.db #0x27	;  39
	.db #0x27	;  39
	.db #0x26	;  38
	.db #0x25	;  37
	.db #0x24	;  36
	.db #0x22	;  34
	.db #0x21	;  33
	.db #0x20	;  32
	.db #0x1F	;  31
	.db #0x1E	;  30
	.db #0x1C	;  28
	.db #0x1B	;  27
	.db #0x1A	;  26
	.db #0x19	;  25
	.db #0x19	;  25
	.db #0x18	;  24
	.db #0x17	;  23
	.db #0x17	;  23
	.db #0x16	;  22
	.db #0x16	;  22
	.db #0x16	;  22
	.db #0x15	;  21
	.db #0x15	;  21
	.db #0x2C	;  44
	.db #0x2B	;  43
	.db #0x2B	;  43
	.db #0x2B	;  43
	.db #0x2A	;  42
	.db #0x2A	;  42
	.db #0x29	;  41
	.db #0x29	;  41
	.db #0x28	;  40
	.db #0x27	;  39
	.db #0x26	;  38
	.db #0x25	;  37
	.db #0x24	;  36
	.db #0x23	;  35
	.db #0x21	;  33
	.db #0x20	;  32
	.db #0x1F	;  31
	.db #0x1D	;  29
	.db #0x1C	;  28
	.db #0x1B	;  27
	.db #0x1A	;  26
	.db #0x19	;  25
	.db #0x18	;  24
	.db #0x17	;  23
	.db #0x17	;  23
	.db #0x16	;  22
	.db #0x16	;  22
	.db #0x15	;  21
	.db #0x15	;  21
	.db #0x15	;  21
	.db #0x14	;  20
	.db #0x2C	;  44
	.db #0x2C	;  44
	.db #0x2C	;  44
	.db #0x2B	;  43
	.db #0x2B	;  43
	.db #0x2A	;  42
	.db #0x2A	;  42
	.db #0x29	;  41
	.db #0x29	;  41
	.db #0x28	;  40
	.db #0x27	;  39
	.db #0x26	;  38
	.db #0x25	;  37
	.db #0x23	;  35
	.db #0x22	;  34
	.db #0x20	;  32
	.db #0x1E	;  30
	.db #0x1D	;  29
	.db #0x1B	;  27
	.db #0x1A	;  26
	.db #0x19	;  25
	.db #0x18	;  24
	.db #0x17	;  23
	.db #0x17	;  23
	.db #0x16	;  22
	.db #0x16	;  22
	.db #0x15	;  21
	.db #0x15	;  21
	.db #0x14	;  20
	.db #0x14	;  20
	.db #0x14	;  20
	.db #0x2D	;  45
	.db #0x2D	;  45
	.db #0x2C	;  44
	.db #0x2C	;  44
	.db #0x2C	;  44
	.db #0x2B	;  43
	.db #0x2B	;  43
	.db #0x2A	;  42
	.db #0x2A	;  42
	.db #0x29	;  41
	.db #0x28	;  40
	.db #0x27	;  39
	.db #0x26	;  38
	.db #0x24	;  36
	.db #0x22	;  34
	.db #0x20	;  32
	.db #0x1E	;  30
	.db #0x1C	;  28
	.db #0x1A	;  26
	.db #0x19	;  25
	.db #0x18	;  24
	.db #0x17	;  23
	.db #0x16	;  22
	.db #0x16	;  22
	.db #0x15	;  21
	.db #0x15	;  21
	.db #0x14	;  20
	.db #0x14	;  20
	.db #0x14	;  20
	.db #0x13	;  19
	.db #0x13	;  19
	.db #0x2D	;  45
	.db #0x2D	;  45
	.db #0x2D	;  45
	.db #0x2D	;  45
	.db #0x2C	;  44
	.db #0x2C	;  44
	.db #0x2C	;  44
	.db #0x2B	;  43
	.db #0x2B	;  43
	.db #0x2A	;  42
	.db #0x29	;  41
	.db #0x28	;  40
	.db #0x27	;  39
	.db #0x25	;  37
	.db #0x22	;  34
	.db #0x20	;  32
	.db #0x1E	;  30
	.db #0x1B	;  27
	.db #0x19	;  25
	.db #0x18	;  24
	.db #0x17	;  23
	.db #0x16	;  22
	.db #0x15	;  21
	.db #0x15	;  21
	.db #0x14	;  20
	.db #0x14	;  20
	.db #0x14	;  20
	.db #0x13	;  19
	.db #0x13	;  19
	.db #0x13	;  19
	.db #0x13	;  19
	.db #0x2E	;  46
	.db #0x2E	;  46
	.db #0x2E	;  46
	.db #0x2E	;  46
	.db #0x2D	;  45
	.db #0x2D	;  45
	.db #0x2D	;  45
	.db #0x2C	;  44
	.db #0x2C	;  44
	.db #0x2B	;  43
	.db #0x2A	;  42
	.db #0x29	;  41
	.db #0x28	;  40
	.db #0x26	;  38
	.db #0x23	;  35
	.db #0x20	;  32
	.db #0x1D	;  29
	.db #0x1A	;  26
	.db #0x18	;  24
	.db #0x17	;  23
	.db #0x16	;  22
	.db #0x15	;  21
	.db #0x14	;  20
	.db #0x14	;  20
	.db #0x13	;  19
	.db #0x13	;  19
	.db #0x13	;  19
	.db #0x12	;  18
	.db #0x12	;  18
	.db #0x12	;  18
	.db #0x12	;  18
	.db #0x2F	;  47
	.db #0x2F	;  47
	.db #0x2E	;  46
	.db #0x2E	;  46
	.db #0x2E	;  46
	.db #0x2E	;  46
	.db #0x2E	;  46
	.db #0x2E	;  46
	.db #0x2D	;  45
	.db #0x2D	;  45
	.db #0x2C	;  44
	.db #0x2B	;  43
	.db #0x2A	;  42
	.db #0x28	;  40
	.db #0x25	;  37
	.db #0x20	;  32
	.db #0x1B	;  27
	.db #0x18	;  24
	.db #0x16	;  22
	.db #0x15	;  21
	.db #0x14	;  20
	.db #0x13	;  19
	.db #0x13	;  19
	.db #0x12	;  18
	.db #0x12	;  18
	.db #0x12	;  18
	.db #0x12	;  18
	.db #0x12	;  18
	.db #0x12	;  18
	.db #0x11	;  17
	.db #0x11	;  17
	.db #0x2F	;  47
	.db #0x2F	;  47
	.db #0x2F	;  47
	.db #0x2F	;  47
	.db #0x2F	;  47
	.db #0x2F	;  47
	.db #0x2F	;  47
	.db #0x2F	;  47
	.db #0x2F	;  47
	.db #0x2E	;  46
	.db #0x2E	;  46
	.db #0x2E	;  46
	.db #0x2D	;  45
	.db #0x2B	;  43
	.db #0x28	;  40
	.db #0x20	;  32
	.db #0x18	;  24
	.db #0x15	;  21
	.db #0x13	;  19
	.db #0x12	;  18
	.db #0x12	;  18
	.db #0x12	;  18
	.db #0x11	;  17
	.db #0x11	;  17
	.db #0x11	;  17
	.db #0x11	;  17
	.db #0x11	;  17
	.db #0x11	;  17
	.db #0x11	;  17
	.db #0x11	;  17
	.db #0x11	;  17
	.db #0x30	;  48
	.db #0x30	;  48
	.db #0x30	;  48
	.db #0x30	;  48
	.db #0x30	;  48
	.db #0x30	;  48
	.db #0x30	;  48
	.db #0x30	;  48
	.db #0x30	;  48
	.db #0x30	;  48
	.db #0x30	;  48
	.db #0x30	;  48
	.db #0x30	;  48
	.db #0x30	;  48
	.db #0x30	;  48
	.db #0x10	;  16
	.db #0x10	;  16
	.db #0x10	;  16
	.db #0x10	;  16
	.db #0x10	;  16
	.db #0x10	;  16
	.db #0x10	;  16
	.db #0x10	;  16
	.db #0x10	;  16
	.db #0x10	;  16
	.db #0x10	;  16
	.db #0x10	;  16
	.db #0x10	;  16
	.db #0x10	;  16
	.db #0x10	;  16
	.db #0x10	;  16
	.db #0x31	;  49
	.db #0x31	;  49
	.db #0x31	;  49
	.db #0x31	;  49
	.db #0x31	;  49
	.db #0x31	;  49
	.db #0x31	;  49
	.db #0x31	;  49
	.db #0x31	;  49
	.db #0x32	;  50
	.db #0x32	;  50
	.db #0x32	;  50
	.db #0x33	;  51
	.db #0x35	;  53
	.db #0x38	;  56
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0x0B	;  11
	.db #0x0D	;  13
	.db #0x0E	;  14
	.db #0x0E	;  14
	.db #0x0E	;  14
	.db #0x0F	;  15
	.db #0x0F	;  15
	.db #0x0F	;  15
	.db #0x0F	;  15
	.db #0x0F	;  15
	.db #0x0F	;  15
	.db #0x0F	;  15
	.db #0x0F	;  15
	.db #0x0F	;  15
	.db #0x31	;  49
	.db #0x31	;  49
	.db #0x32	;  50
	.db #0x32	;  50
	.db #0x32	;  50
	.db #0x32	;  50
	.db #0x32	;  50
	.db #0x32	;  50
	.db #0x33	;  51
	.db #0x33	;  51
	.db #0x34	;  52
	.db #0x35	;  53
	.db #0x36	;  54
	.db #0x38	;  56
	.db #0x3B	;  59
	.db #0x00	;  0
	.db #0x05	;  5
	.db #0x08	;  8
	.db #0x0A	;  10
	.db #0x0B	;  11
	.db #0x0C	;  12
	.db #0x0D	;  13
	.db #0x0D	;  13
	.db #0x0E	;  14
	.db #0x0E	;  14
	.db #0x0E	;  14
	.db #0x0E	;  14
	.db #0x0E	;  14
	.db #0x0E	;  14
	.db #0x0F	;  15
	.db #0x0F	;  15
	.db #0x32	;  50
	.db #0x32	;  50
	.db #0x32	;  50
	.db #0x32	;  50
	.db #0x33	;  51
	.db #0x33	;  51
	.db #0x33	;  51
	.db #0x34	;  52
	.db #0x34	;  52
	.db #0x35	;  53
	.db #0x36	;  54
	.db #0x37	;  55
	.db #0x38	;  56
	.db #0x3A	;  58
	.db #0x3D	;  61
	.db #0x00	;  0
	.db #0x03	;  3
	.db #0x06	;  6
	.db #0x08	;  8
	.db #0x09	;  9
	.db #0x0A	;  10
	.db #0x0B	;  11
	.db #0x0C	;  12
	.db #0x0C	;  12
	.db #0x0D	;  13
	.db #0x0D	;  13
	.db #0x0D	;  13
	.db #0x0E	;  14
	.db #0x0E	;  14
	.db #0x0E	;  14
	.db #0x0E	;  14
	.db #0x33	;  51
	.db #0x33	;  51
	.db #0x33	;  51
	.db #0x33	;  51
	.db #0x34	;  52
	.db #0x34	;  52
	.db #0x34	;  52
	.db #0x35	;  53
	.db #0x35	;  53
	.db #0x36	;  54
	.db #0x37	;  55
	.db #0x38	;  56
	.db #0x39	;  57
	.db #0x3B	;  59
	.db #0x3E	;  62
	.db #0x00	;  0
	.db #0x02	;  2
	.db #0x05	;  5
	.db #0x07	;  7
	.db #0x08	;  8
	.db #0x09	;  9
	.db #0x0A	;  10
	.db #0x0B	;  11
	.db #0x0B	;  11
	.db #0x0C	;  12
	.db #0x0C	;  12
	.db #0x0C	;  12
	.db #0x0D	;  13
	.db #0x0D	;  13
	.db #0x0D	;  13
	.db #0x0D	;  13
	.db #0x33	;  51
	.db #0x33	;  51
	.db #0x34	;  52
	.db #0x34	;  52
	.db #0x34	;  52
	.db #0x35	;  53
	.db #0x35	;  53
	.db #0x36	;  54
	.db #0x36	;  54
	.db #0x37	;  55
	.db #0x38	;  56
	.db #0x39	;  57
	.db #0x3A	;  58
	.db #0x3C	;  60
	.db #0x3E	;  62
	.db #0x00	;  0
	.db #0x02	;  2
	.db #0x04	;  4
	.db #0x06	;  6
	.db #0x07	;  7
	.db #0x08	;  8
	.db #0x09	;  9
	.db #0x0A	;  10
	.db #0x0A	;  10
	.db #0x0B	;  11
	.db #0x0B	;  11
	.db #0x0C	;  12
	.db #0x0C	;  12
	.db #0x0C	;  12
	.db #0x0D	;  13
	.db #0x0D	;  13
	.db #0x34	;  52
	.db #0x34	;  52
	.db #0x34	;  52
	.db #0x35	;  53
	.db #0x35	;  53
	.db #0x36	;  54
	.db #0x36	;  54
	.db #0x37	;  55
	.db #0x37	;  55
	.db #0x38	;  56
	.db #0x39	;  57
	.db #0x3A	;  58
	.db #0x3B	;  59
	.db #0x3D	;  61
	.db #0x3E	;  62
	.db #0x00	;  0
	.db #0x02	;  2
	.db #0x03	;  3
	.db #0x05	;  5
	.db #0x06	;  6
	.db #0x07	;  7
	.db #0x08	;  8
	.db #0x09	;  9
	.db #0x09	;  9
	.db #0x0A	;  10
	.db #0x0A	;  10
	.db #0x0B	;  11
	.db #0x0B	;  11
	.db #0x0C	;  12
	.db #0x0C	;  12
	.db #0x0C	;  12
	.db #0x34	;  52
	.db #0x35	;  53
	.db #0x35	;  53
	.db #0x35	;  53
	.db #0x36	;  54
	.db #0x36	;  54
	.db #0x37	;  55
	.db #0x37	;  55
	.db #0x38	;  56
	.db #0x39	;  57
	.db #0x3A	;  58
	.db #0x3B	;  59
	.db #0x3C	;  60
	.db #0x3D	;  61
	.db #0x3F	;  63
	.db #0x00	;  0
	.db #0x01	;  1
	.db #0x03	;  3
	.db #0x04	;  4
	.db #0x05	;  5
	.db #0x06	;  6
	.db #0x07	;  7
	.db #0x08	;  8
	.db #0x09	;  9
	.db #0x09	;  9
	.db #0x0A	;  10
	.db #0x0A	;  10
	.db #0x0B	;  11
	.db #0x0B	;  11
	.db #0x0B	;  11
	.db #0x0C	;  12
	.db #0x35	;  53
	.db #0x35	;  53
	.db #0x36	;  54
	.db #0x36	;  54
	.db #0x36	;  54
	.db #0x37	;  55
	.db #0x37	;  55
	.db #0x38	;  56
	.db #0x39	;  57
	.db #0x39	;  57
	.db #0x3A	;  58
	.db #0x3B	;  59
	.db #0x3C	;  60
	.db #0x3E	;  62
	.db #0x3F	;  63
	.db #0x00	;  0
	.db #0x01	;  1
	.db #0x02	;  2
	.db #0x04	;  4
	.db #0x05	;  5
	.db #0x06	;  6
	.db #0x07	;  7
	.db #0x07	;  7
	.db #0x08	;  8
	.db #0x09	;  9
	.db #0x09	;  9
	.db #0x0A	;  10
	.db #0x0A	;  10
	.db #0x0A	;  10
	.db #0x0B	;  11
	.db #0x0B	;  11
	.db #0x36	;  54
	.db #0x36	;  54
	.db #0x36	;  54
	.db #0x37	;  55
	.db #0x37	;  55
	.db #0x37	;  55
	.db #0x38	;  56
	.db #0x39	;  57
	.db #0x39	;  57
	.db #0x3A	;  58
	.db #0x3B	;  59
	.db #0x3C	;  60
	.db #0x3D	;  61
	.db #0x3E	;  62
	.db #0x3F	;  63
	.db #0x00	;  0
	.db #0x01	;  1
	.db #0x02	;  2
	.db #0x03	;  3
	.db #0x04	;  4
	.db #0x05	;  5
	.db #0x06	;  6
	.db #0x07	;  7
	.db #0x07	;  7
	.db #0x08	;  8
	.db #0x09	;  9
	.db #0x09	;  9
	.db #0x09	;  9
	.db #0x0A	;  10
	.db #0x0A	;  10
	.db #0x0A	;  10
	.db #0x36	;  54
	.db #0x36	;  54
	.db #0x37	;  55
	.db #0x37	;  55
	.db #0x38	;  56
	.db #0x38	;  56
	.db #0x39	;  57
	.db #0x39	;  57
	.db #0x3A	;  58
	.db #0x3A	;  58
	.db #0x3B	;  59
	.db #0x3C	;  60
	.db #0x3D	;  61
	.db #0x3E	;  62
	.db #0x3F	;  63
	.db #0x00	;  0
	.db #0x01	;  1
	.db #0x02	;  2
	.db #0x03	;  3
	.db #0x04	;  4
	.db #0x05	;  5
	.db #0x06	;  6
	.db #0x06	;  6
	.db #0x07	;  7
	.db #0x07	;  7
	.db #0x08	;  8
	.db #0x08	;  8
	.db #0x09	;  9
	.db #0x09	;  9
	.db #0x0A	;  10
	.db #0x0A	;  10
	.db #0x36	;  54
	.db #0x37	;  55
	.db #0x37	;  55
	.db #0x38	;  56
	.db #0x38	;  56
	.db #0x38	;  56
	.db #0x39	;  57
	.db #0x3A	;  58
	.db #0x3A	;  58
	.db #0x3B	;  59
	.db #0x3C	;  60
	.db #0x3C	;  60
	.db #0x3D	;  61
	.db #0x3E	;  62
	.db #0x3F	;  63
	.db #0x00	;  0
	.db #0x01	;  1
	.db #0x02	;  2
	.db #0x03	;  3
	.db #0x04	;  4
	.db #0x04	;  4
	.db #0x05	;  5
	.db #0x06	;  6
	.db #0x06	;  6
	.db #0x07	;  7
	.db #0x08	;  8
	.db #0x08	;  8
	.db #0x08	;  8
	.db #0x09	;  9
	.db #0x09	;  9
	.db #0x0A	;  10
	.db #0x37	;  55
	.db #0x37	;  55
	.db #0x38	;  56
	.db #0x38	;  56
	.db #0x38	;  56
	.db #0x39	;  57
	.db #0x39	;  57
	.db #0x3A	;  58
	.db #0x3B	;  59
	.db #0x3B	;  59
	.db #0x3C	;  60
	.db #0x3D	;  61
	.db #0x3E	;  62
	.db #0x3E	;  62
	.db #0x3F	;  63
	.db #0x00	;  0
	.db #0x01	;  1
	.db #0x02	;  2
	.db #0x02	;  2
	.db #0x03	;  3
	.db #0x04	;  4
	.db #0x05	;  5
	.db #0x05	;  5
	.db #0x06	;  6
	.db #0x07	;  7
	.db #0x07	;  7
	.db #0x08	;  8
	.db #0x08	;  8
	.db #0x08	;  8
	.db #0x09	;  9
	.db #0x09	;  9
	.db #0x37	;  55
	.db #0x38	;  56
	.db #0x38	;  56
	.db #0x38	;  56
	.db #0x39	;  57
	.db #0x39	;  57
	.db #0x3A	;  58
	.db #0x3A	;  58
	.db #0x3B	;  59
	.db #0x3C	;  60
	.db #0x3C	;  60
	.db #0x3D	;  61
	.db #0x3E	;  62
	.db #0x3E	;  62
	.db #0x3F	;  63
	.db #0x00	;  0
	.db #0x01	;  1
	.db #0x02	;  2
	.db #0x02	;  2
	.db #0x03	;  3
	.db #0x04	;  4
	.db #0x04	;  4
	.db #0x05	;  5
	.db #0x06	;  6
	.db #0x06	;  6
	.db #0x07	;  7
	.db #0x07	;  7
	.db #0x08	;  8
	.db #0x08	;  8
	.db #0x08	;  8
	.db #0x09	;  9
	.db #0x38	;  56
	.db #0x38	;  56
	.db #0x38	;  56
	.db #0x39	;  57
	.db #0x39	;  57
	.db #0x3A	;  58
	.db #0x3A	;  58
	.db #0x3B	;  59
	.db #0x3B	;  59
	.db #0x3C	;  60
	.db #0x3D	;  61
	.db #0x3D	;  61
	.db #0x3E	;  62
	.db #0x3F	;  63
	.db #0x3F	;  63
	.db #0x00	;  0
	.db #0x01	;  1
	.db #0x01	;  1
	.db #0x02	;  2
	.db #0x03	;  3
	.db #0x03	;  3
	.db #0x04	;  4
	.db #0x05	;  5
	.db #0x05	;  5
	.db #0x06	;  6
	.db #0x06	;  6
	.db #0x07	;  7
	.db #0x07	;  7
	.db #0x08	;  8
	.db #0x08	;  8
	.db #0x08	;  8
	.db #0x38	;  56
	.db #0x38	;  56
	.db #0x39	;  57
	.db #0x39	;  57
	.db #0x3A	;  58
	.db #0x3A	;  58
	.db #0x3A	;  58
	.db #0x3B	;  59
	.db #0x3C	;  60
	.db #0x3C	;  60
	.db #0x3D	;  61
	.db #0x3D	;  61
	.db #0x3E	;  62
	.db #0x3F	;  63
	.db #0x3F	;  63
	.db #0x00	;  0
	.db #0x01	;  1
	.db #0x01	;  1
	.db #0x02	;  2
	.db #0x03	;  3
	.db #0x03	;  3
	.db #0x04	;  4
	.db #0x04	;  4
	.db #0x05	;  5
	.db #0x06	;  6
	.db #0x06	;  6
	.db #0x06	;  6
	.db #0x07	;  7
	.db #0x07	;  7
	.db #0x08	;  8
	.db #0x08	;  8
_g_SquareRoot1024:
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0x0B	;  11
	.db #0x0D	;  13
	.db #0x10	;  16
	.db #0x11	;  17
	.db #0x13	;  19
	.db #0x15	;  21
	.db #0x16	;  22
	.db #0x18	;  24
	.db #0x19	;  25
	.db #0x1A	;  26
	.db #0x1B	;  27
	.db #0x1C	;  28
	.db #0x1D	;  29
	.db #0x1E	;  30
	.db #0x20	;  32
	.db #0x20	;  32
	.db #0x21	;  33
	.db #0x22	;  34
	.db #0x23	;  35
	.db #0x24	;  36
	.db #0x25	;  37
	.db #0x26	;  38
	.db #0x27	;  39
	.db #0x28	;  40
	.db #0x28	;  40
	.db #0x29	;  41
	.db #0x2A	;  42
	.db #0x2B	;  43
	.db #0x2B	;  43
	.db #0x2C	;  44
	.db #0x2D	;  45
	.db #0x2D	;  45
	.db #0x2E	;  46
	.db #0x2F	;  47
	.db #0x30	;  48
	.db #0x30	;  48
	.db #0x31	;  49
	.db #0x31	;  49
	.db #0x32	;  50
	.db #0x33	;  51
	.db #0x33	;  51
	.db #0x34	;  52
	.db #0x35	;  53
	.db #0x35	;  53
	.db #0x36	;  54
	.db #0x36	;  54
	.db #0x37	;  55
	.db #0x38	;  56
	.db #0x38	;  56
	.db #0x39	;  57
	.db #0x39	;  57
	.db #0x3A	;  58
	.db #0x3A	;  58
	.db #0x3B	;  59
	.db #0x3B	;  59
	.db #0x3C	;  60
	.db #0x3C	;  60
	.db #0x3D	;  61
	.db #0x3D	;  61
	.db #0x3E	;  62
	.db #0x3E	;  62
	.db #0x3F	;  63
	.db #0x40	;  64
	.db #0x40	;  64
	.db #0x40	;  64
	.db #0x41	;  65	A
	.db #0x41	;  65	A
	.db #0x42	;  66	B
	.db #0x42	;  66	B
	.db #0x43	;  67	C
	.db #0x43	;  67	C
	.db #0x44	;  68	D
	.db #0x44	;  68	D
	.db #0x45	;  69	E
	.db #0x45	;  69	E
	.db #0x46	;  70	F
	.db #0x46	;  70	F
	.db #0x47	;  71	G
	.db #0x47	;  71	G
	.db #0x48	;  72	H
	.db #0x48	;  72	H
	.db #0x48	;  72	H
	.db #0x49	;  73	I
	.db #0x49	;  73	I
	.db #0x4A	;  74	J
	.db #0x4A	;  74	J
	.db #0x4B	;  75	K
	.db #0x4B	;  75	K
	.db #0x4B	;  75	K
	.db #0x4C	;  76	L
	.db #0x4C	;  76	L
	.db #0x4D	;  77	M
	.db #0x4D	;  77	M
	.db #0x4D	;  77	M
	.db #0x4E	;  78	N
	.db #0x4E	;  78	N
	.db #0x4F	;  79	O
	.db #0x4F	;  79	O
	.db #0x50	;  80	P
	.db #0x50	;  80	P
	.db #0x50	;  80	P
	.db #0x51	;  81	Q
	.db #0x51	;  81	Q
	.db #0x51	;  81	Q
	.db #0x52	;  82	R
	.db #0x52	;  82	R
	.db #0x53	;  83	S
	.db #0x53	;  83	S
	.db #0x53	;  83	S
	.db #0x54	;  84	T
	.db #0x54	;  84	T
	.db #0x55	;  85	U
	.db #0x55	;  85	U
	.db #0x55	;  85	U
	.db #0x56	;  86	V
	.db #0x56	;  86	V
	.db #0x56	;  86	V
	.db #0x57	;  87	W
	.db #0x57	;  87	W
	.db #0x58	;  88	X
	.db #0x58	;  88	X
	.db #0x58	;  88	X
	.db #0x59	;  89	Y
	.db #0x59	;  89	Y
	.db #0x59	;  89	Y
	.db #0x5A	;  90	Z
	.db #0x5A	;  90	Z
	.db #0x5A	;  90	Z
	.db #0x5B	;  91
	.db #0x5B	;  91
	.db #0x5B	;  91
	.db #0x5C	;  92
	.db #0x5C	;  92
	.db #0x5C	;  92
	.db #0x5D	;  93
	.db #0x5D	;  93
	.db #0x5D	;  93
	.db #0x5E	;  94
	.db #0x5E	;  94
	.db #0x5E	;  94
	.db #0x5F	;  95
	.db #0x5F	;  95
	.db #0x60	;  96
	.db #0x60	;  96
	.db #0x60	;  96
	.db #0x60	;  96
	.db #0x61	;  97	a
	.db #0x61	;  97	a
	.db #0x61	;  97	a
	.db #0x62	;  98	b
	.db #0x62	;  98	b
	.db #0x62	;  98	b
	.db #0x63	;  99	c
	.db #0x63	;  99	c
	.db #0x63	;  99	c
	.db #0x64	;  100	d
	.db #0x64	;  100	d
	.db #0x64	;  100	d
	.db #0x65	;  101	e
	.db #0x65	;  101	e
	.db #0x65	;  101	e
	.db #0x66	;  102	f
	.db #0x66	;  102	f
	.db #0x66	;  102	f
	.db #0x67	;  103	g
	.db #0x67	;  103	g
	.db #0x67	;  103	g
	.db #0x68	;  104	h
	.db #0x68	;  104	h
	.db #0x68	;  104	h
	.db #0x68	;  104	h
	.db #0x69	;  105	i
	.db #0x69	;  105	i
	.db #0x69	;  105	i
	.db #0x6A	;  106	j
	.db #0x6A	;  106	j
	.db #0x6A	;  106	j
	.db #0x6B	;  107	k
	.db #0x6B	;  107	k
	.db #0x6B	;  107	k
	.db #0x6B	;  107	k
	.db #0x6C	;  108	l
	.db #0x6C	;  108	l
	.db #0x6C	;  108	l
	.db #0x6D	;  109	m
	.db #0x6D	;  109	m
	.db #0x6D	;  109	m
	.db #0x6D	;  109	m
	.db #0x6E	;  110	n
	.db #0x6E	;  110	n
	.db #0x6E	;  110	n
	.db #0x6F	;  111	o
	.db #0x6F	;  111	o
	.db #0x6F	;  111	o
	.db #0x70	;  112	p
	.db #0x70	;  112	p
	.db #0x70	;  112	p
	.db #0x70	;  112	p
	.db #0x71	;  113	q
	.db #0x71	;  113	q
	.db #0x71	;  113	q
	.db #0x71	;  113	q
	.db #0x72	;  114	r
	.db #0x72	;  114	r
	.db #0x72	;  114	r
	.db #0x73	;  115	s
	.db #0x73	;  115	s
	.db #0x73	;  115	s
	.db #0x73	;  115	s
	.db #0x74	;  116	t
	.db #0x74	;  116	t
	.db #0x74	;  116	t
	.db #0x75	;  117	u
	.db #0x75	;  117	u
	.db #0x75	;  117	u
	.db #0x75	;  117	u
	.db #0x76	;  118	v
	.db #0x76	;  118	v
	.db #0x76	;  118	v
	.db #0x76	;  118	v
	.db #0x77	;  119	w
	.db #0x77	;  119	w
	.db #0x77	;  119	w
	.db #0x78	;  120	x
	.db #0x78	;  120	x
	.db #0x78	;  120	x
	.db #0x78	;  120	x
	.db #0x79	;  121	y
	.db #0x79	;  121	y
	.db #0x79	;  121	y
	.db #0x79	;  121	y
	.db #0x7A	;  122	z
	.db #0x7A	;  122	z
	.db #0x7A	;  122	z
	.db #0x7A	;  122	z
	.db #0x7B	;  123
	.db #0x7B	;  123
	.db #0x7B	;  123
	.db #0x7B	;  123
	.db #0x7C	;  124
	.db #0x7C	;  124
	.db #0x7C	;  124
	.db #0x7C	;  124
	.db #0x7D	;  125
	.db #0x7D	;  125
	.db #0x7D	;  125
	.db #0x7D	;  125
	.db #0x7E	;  126
	.db #0x7E	;  126
	.db #0x7E	;  126
	.db #0x7E	;  126
	.db #0x7F	;  127
	.db #0x7F	;  127
	.db #0x7F	;  127
	.db #0x80	; -128
	.db #0x80	; -128
	.db #0x80	; -128
	.db #0x80	; -128
	.db #0x80	; -128
	.db #0x81	; -127
	.db #0x81	; -127
	.db #0x81	; -127
	.db #0x81	; -127
	.db #0x82	; -126
	.db #0x82	; -126
	.db #0x82	; -126
	.db #0x82	; -126
	.db #0x83	; -125
	.db #0x83	; -125
	.db #0x83	; -125
	.db #0x83	; -125
	.db #0x84	; -124
	.db #0x84	; -124
	.db #0x84	; -124
	.db #0x84	; -124
	.db #0x85	; -123
	.db #0x85	; -123
	.db #0x85	; -123
	.db #0x85	; -123
	.db #0x86	; -122
	.db #0x86	; -122
	.db #0x86	; -122
	.db #0x86	; -122
	.db #0x87	; -121
	.db #0x87	; -121
	.db #0x87	; -121
	.db #0x87	; -121
	.db #0x88	; -120
	.db #0x88	; -120
	.db #0x88	; -120
	.db #0x88	; -120
	.db #0x88	; -120
	.db #0x89	; -119
	.db #0x89	; -119
	.db #0x89	; -119
	.db #0x89	; -119
	.db #0x8A	; -118
	.db #0x8A	; -118
	.db #0x8A	; -118
	.db #0x8A	; -118
	.db #0x8B	; -117
	.db #0x8B	; -117
	.db #0x8B	; -117
	.db #0x8B	; -117
	.db #0x8B	; -117
	.db #0x8C	; -116
	.db #0x8C	; -116
	.db #0x8C	; -116
	.db #0x8C	; -116
	.db #0x8D	; -115
	.db #0x8D	; -115
	.db #0x8D	; -115
	.db #0x8D	; -115
	.db #0x8D	; -115
	.db #0x8E	; -114
	.db #0x8E	; -114
	.db #0x8E	; -114
	.db #0x8E	; -114
	.db #0x8F	; -113
	.db #0x8F	; -113
	.db #0x8F	; -113
	.db #0x8F	; -113
	.db #0x90	; -112
	.db #0x90	; -112
	.db #0x90	; -112
	.db #0x90	; -112
	.db #0x90	; -112
	.db #0x91	; -111
	.db #0x91	; -111
	.db #0x91	; -111
	.db #0x91	; -111
	.db #0x91	; -111
	.db #0x92	; -110
	.db #0x92	; -110
	.db #0x92	; -110
	.db #0x92	; -110
	.db #0x93	; -109
	.db #0x93	; -109
	.db #0x93	; -109
	.db #0x93	; -109
	.db #0x93	; -109
	.db #0x94	; -108
	.db #0x94	; -108
	.db #0x94	; -108
	.db #0x94	; -108
	.db #0x95	; -107
	.db #0x95	; -107
	.db #0x95	; -107
	.db #0x95	; -107
	.db #0x95	; -107
	.db #0x96	; -106
	.db #0x96	; -106
	.db #0x96	; -106
	.db #0x96	; -106
	.db #0x96	; -106
	.db #0x97	; -105
	.db #0x97	; -105
	.db #0x97	; -105
	.db #0x97	; -105
	.db #0x98	; -104
	.db #0x98	; -104
	.db #0x98	; -104
	.db #0x98	; -104
	.db #0x98	; -104
	.db #0x99	; -103
	.db #0x99	; -103
	.db #0x99	; -103
	.db #0x99	; -103
	.db #0x99	; -103
	.db #0x9A	; -102
	.db #0x9A	; -102
	.db #0x9A	; -102
	.db #0x9A	; -102
	.db #0x9A	; -102
	.db #0x9B	; -101
	.db #0x9B	; -101
	.db #0x9B	; -101
	.db #0x9B	; -101
	.db #0x9B	; -101
	.db #0x9C	; -100
	.db #0x9C	; -100
	.db #0x9C	; -100
	.db #0x9C	; -100
	.db #0x9C	; -100
	.db #0x9D	; -99
	.db #0x9D	; -99
	.db #0x9D	; -99
	.db #0x9D	; -99
	.db #0x9D	; -99
	.db #0x9E	; -98
	.db #0x9E	; -98
	.db #0x9E	; -98
	.db #0x9E	; -98
	.db #0x9E	; -98
	.db #0x9F	; -97
	.db #0x9F	; -97
	.db #0x9F	; -97
	.db #0x9F	; -97
	.db #0xA0	; -96
	.db #0xA0	; -96
	.db #0xA0	; -96
	.db #0xA0	; -96
	.db #0xA0	; -96
	.db #0xA0	; -96
	.db #0xA1	; -95
	.db #0xA1	; -95
	.db #0xA1	; -95
	.db #0xA1	; -95
	.db #0xA1	; -95
	.db #0xA2	; -94
	.db #0xA2	; -94
	.db #0xA2	; -94
	.db #0xA2	; -94
	.db #0xA2	; -94
	.db #0xA3	; -93
	.db #0xA3	; -93
	.db #0xA3	; -93
	.db #0xA3	; -93
	.db #0xA3	; -93
	.db #0xA4	; -92
	.db #0xA4	; -92
	.db #0xA4	; -92
	.db #0xA4	; -92
	.db #0xA4	; -92
	.db #0xA5	; -91
	.db #0xA5	; -91
	.db #0xA5	; -91
	.db #0xA5	; -91
	.db #0xA5	; -91
	.db #0xA6	; -90
	.db #0xA6	; -90
	.db #0xA6	; -90
	.db #0xA6	; -90
	.db #0xA6	; -90
	.db #0xA7	; -89
	.db #0xA7	; -89
	.db #0xA7	; -89
	.db #0xA7	; -89
	.db #0xA7	; -89
	.db #0xA8	; -88
	.db #0xA8	; -88
	.db #0xA8	; -88
	.db #0xA8	; -88
	.db #0xA8	; -88
	.db #0xA8	; -88
	.db #0xA9	; -87
	.db #0xA9	; -87
	.db #0xA9	; -87
	.db #0xA9	; -87
	.db #0xA9	; -87
	.db #0xAA	; -86
	.db #0xAA	; -86
	.db #0xAA	; -86
	.db #0xAA	; -86
	.db #0xAA	; -86
	.db #0xAB	; -85
	.db #0xAB	; -85
	.db #0xAB	; -85
	.db #0xAB	; -85
	.db #0xAB	; -85
	.db #0xAB	; -85
	.db #0xAC	; -84
	.db #0xAC	; -84
	.db #0xAC	; -84
	.db #0xAC	; -84
	.db #0xAC	; -84
	.db #0xAD	; -83
	.db #0xAD	; -83
	.db #0xAD	; -83
	.db #0xAD	; -83
	.db #0xAD	; -83
	.db #0xAD	; -83
	.db #0xAE	; -82
	.db #0xAE	; -82
	.db #0xAE	; -82
	.db #0xAE	; -82
	.db #0xAE	; -82
	.db #0xAF	; -81
	.db #0xAF	; -81
	.db #0xAF	; -81
	.db #0xAF	; -81
	.db #0xAF	; -81
	.db #0xB0	; -80
	.db #0xB0	; -80
	.db #0xB0	; -80
	.db #0xB0	; -80
	.db #0xB0	; -80
	.db #0xB0	; -80
	.db #0xB1	; -79
	.db #0xB1	; -79
	.db #0xB1	; -79
	.db #0xB1	; -79
	.db #0xB1	; -79
	.db #0xB1	; -79
	.db #0xB2	; -78
	.db #0xB2	; -78
	.db #0xB2	; -78
	.db #0xB2	; -78
	.db #0xB2	; -78
	.db #0xB3	; -77
	.db #0xB3	; -77
	.db #0xB3	; -77
	.db #0xB3	; -77
	.db #0xB3	; -77
	.db #0xB3	; -77
	.db #0xB4	; -76
	.db #0xB4	; -76
	.db #0xB4	; -76
	.db #0xB4	; -76
	.db #0xB4	; -76
	.db #0xB5	; -75
	.db #0xB5	; -75
	.db #0xB5	; -75
	.db #0xB5	; -75
	.db #0xB5	; -75
	.db #0xB5	; -75
	.db #0xB6	; -74
	.db #0xB6	; -74
	.db #0xB6	; -74
	.db #0xB6	; -74
	.db #0xB6	; -74
	.db #0xB6	; -74
	.db #0xB7	; -73
	.db #0xB7	; -73
	.db #0xB7	; -73
	.db #0xB7	; -73
	.db #0xB7	; -73
	.db #0xB8	; -72
	.db #0xB8	; -72
	.db #0xB8	; -72
	.db #0xB8	; -72
	.db #0xB8	; -72
	.db #0xB8	; -72
	.db #0xB9	; -71
	.db #0xB9	; -71
	.db #0xB9	; -71
	.db #0xB9	; -71
	.db #0xB9	; -71
	.db #0xB9	; -71
	.db #0xBA	; -70
	.db #0xBA	; -70
	.db #0xBA	; -70
	.db #0xBA	; -70
	.db #0xBA	; -70
	.db #0xBA	; -70
	.db #0xBB	; -69
	.db #0xBB	; -69
	.db #0xBB	; -69
	.db #0xBB	; -69
	.db #0xBB	; -69
	.db #0xBB	; -69
	.db #0xBC	; -68
	.db #0xBC	; -68
	.db #0xBC	; -68
	.db #0xBC	; -68
	.db #0xBC	; -68
	.db #0xBC	; -68
	.db #0xBD	; -67
	.db #0xBD	; -67
	.db #0xBD	; -67
	.db #0xBD	; -67
	.db #0xBD	; -67
	.db #0xBD	; -67
	.db #0xBE	; -66
	.db #0xBE	; -66
	.db #0xBE	; -66
	.db #0xBE	; -66
	.db #0xBE	; -66
	.db #0xBE	; -66
	.db #0xBF	; -65
	.db #0xBF	; -65
	.db #0xBF	; -65
	.db #0xBF	; -65
	.db #0xBF	; -65
	.db #0xC0	; -64
	.db #0xC0	; -64
	.db #0xC0	; -64
	.db #0xC0	; -64
	.db #0xC0	; -64
	.db #0xC0	; -64
	.db #0xC0	; -64
	.db #0xC1	; -63
	.db #0xC1	; -63
	.db #0xC1	; -63
	.db #0xC1	; -63
	.db #0xC1	; -63
	.db #0xC1	; -63
	.db #0xC2	; -62
	.db #0xC2	; -62
	.db #0xC2	; -62
	.db #0xC2	; -62
	.db #0xC2	; -62
	.db #0xC2	; -62
	.db #0xC3	; -61
	.db #0xC3	; -61
	.db #0xC3	; -61
	.db #0xC3	; -61
	.db #0xC3	; -61
	.db #0xC3	; -61
	.db #0xC4	; -60
	.db #0xC4	; -60
	.db #0xC4	; -60
	.db #0xC4	; -60
	.db #0xC4	; -60
	.db #0xC4	; -60
	.db #0xC5	; -59
	.db #0xC5	; -59
	.db #0xC5	; -59
	.db #0xC5	; -59
	.db #0xC5	; -59
	.db #0xC5	; -59
	.db #0xC6	; -58
	.db #0xC6	; -58
	.db #0xC6	; -58
	.db #0xC6	; -58
	.db #0xC6	; -58
	.db #0xC6	; -58
	.db #0xC7	; -57
	.db #0xC7	; -57
	.db #0xC7	; -57
	.db #0xC7	; -57
	.db #0xC7	; -57
	.db #0xC7	; -57
	.db #0xC8	; -56
	.db #0xC8	; -56
	.db #0xC8	; -56
	.db #0xC8	; -56
	.db #0xC8	; -56
	.db #0xC8	; -56
	.db #0xC8	; -56
	.db #0xC9	; -55
	.db #0xC9	; -55
	.db #0xC9	; -55
	.db #0xC9	; -55
	.db #0xC9	; -55
	.db #0xC9	; -55
	.db #0xCA	; -54
	.db #0xCA	; -54
	.db #0xCA	; -54
	.db #0xCA	; -54
	.db #0xCA	; -54
	.db #0xCA	; -54
	.db #0xCB	; -53
	.db #0xCB	; -53
	.db #0xCB	; -53
	.db #0xCB	; -53
	.db #0xCB	; -53
	.db #0xCB	; -53
	.db #0xCB	; -53
	.db #0xCC	; -52
	.db #0xCC	; -52
	.db #0xCC	; -52
	.db #0xCC	; -52
	.db #0xCC	; -52
	.db #0xCC	; -52
	.db #0xCD	; -51
	.db #0xCD	; -51
	.db #0xCD	; -51
	.db #0xCD	; -51
	.db #0xCD	; -51
	.db #0xCD	; -51
	.db #0xCD	; -51
	.db #0xCE	; -50
	.db #0xCE	; -50
	.db #0xCE	; -50
	.db #0xCE	; -50
	.db #0xCE	; -50
	.db #0xCE	; -50
	.db #0xCF	; -49
	.db #0xCF	; -49
	.db #0xCF	; -49
	.db #0xCF	; -49
	.db #0xCF	; -49
	.db #0xCF	; -49
	.db #0xD0	; -48
	.db #0xD0	; -48
	.db #0xD0	; -48
	.db #0xD0	; -48
	.db #0xD0	; -48
	.db #0xD0	; -48
	.db #0xD0	; -48
	.db #0xD1	; -47
	.db #0xD1	; -47
	.db #0xD1	; -47
	.db #0xD1	; -47
	.db #0xD1	; -47
	.db #0xD1	; -47
	.db #0xD1	; -47
	.db #0xD2	; -46
	.db #0xD2	; -46
	.db #0xD2	; -46
	.db #0xD2	; -46
	.db #0xD2	; -46
	.db #0xD2	; -46
	.db #0xD3	; -45
	.db #0xD3	; -45
	.db #0xD3	; -45
	.db #0xD3	; -45
	.db #0xD3	; -45
	.db #0xD3	; -45
	.db #0xD3	; -45
	.db #0xD4	; -44
	.db #0xD4	; -44
	.db #0xD4	; -44
	.db #0xD4	; -44
	.db #0xD4	; -44
	.db #0xD4	; -44
	.db #0xD5	; -43
	.db #0xD5	; -43
	.db #0xD5	; -43
	.db #0xD5	; -43
	.db #0xD5	; -43
	.db #0xD5	; -43
	.db #0xD5	; -43
	.db #0xD6	; -42
	.db #0xD6	; -42
	.db #0xD6	; -42
	.db #0xD6	; -42
	.db #0xD6	; -42
	.db #0xD6	; -42
	.db #0xD6	; -42
	.db #0xD7	; -41
	.db #0xD7	; -41
	.db #0xD7	; -41
	.db #0xD7	; -41
	.db #0xD7	; -41
	.db #0xD7	; -41
	.db #0xD8	; -40
	.db #0xD8	; -40
	.db #0xD8	; -40
	.db #0xD8	; -40
	.db #0xD8	; -40
	.db #0xD8	; -40
	.db #0xD8	; -40
	.db #0xD9	; -39
	.db #0xD9	; -39
	.db #0xD9	; -39
	.db #0xD9	; -39
	.db #0xD9	; -39
	.db #0xD9	; -39
	.db #0xD9	; -39
	.db #0xDA	; -38
	.db #0xDA	; -38
	.db #0xDA	; -38
	.db #0xDA	; -38
	.db #0xDA	; -38
	.db #0xDA	; -38
	.db #0xDA	; -38
	.db #0xDB	; -37
	.db #0xDB	; -37
	.db #0xDB	; -37
	.db #0xDB	; -37
	.db #0xDB	; -37
	.db #0xDB	; -37
	.db #0xDB	; -37
	.db #0xDC	; -36
	.db #0xDC	; -36
	.db #0xDC	; -36
	.db #0xDC	; -36
	.db #0xDC	; -36
	.db #0xDC	; -36
	.db #0xDC	; -36
	.db #0xDD	; -35
	.db #0xDD	; -35
	.db #0xDD	; -35
	.db #0xDD	; -35
	.db #0xDD	; -35
	.db #0xDD	; -35
	.db #0xDD	; -35
	.db #0xDE	; -34
	.db #0xDE	; -34
	.db #0xDE	; -34
	.db #0xDE	; -34
	.db #0xDE	; -34
	.db #0xDE	; -34
	.db #0xDE	; -34
	.db #0xDF	; -33
	.db #0xDF	; -33
	.db #0xDF	; -33
	.db #0xDF	; -33
	.db #0xDF	; -33
	.db #0xDF	; -33
	.db #0xE0	; -32
	.db #0xE0	; -32
	.db #0xE0	; -32
	.db #0xE0	; -32
	.db #0xE0	; -32
	.db #0xE0	; -32
	.db #0xE0	; -32
	.db #0xE0	; -32
	.db #0xE1	; -31
	.db #0xE1	; -31
	.db #0xE1	; -31
	.db #0xE1	; -31
	.db #0xE1	; -31
	.db #0xE1	; -31
	.db #0xE1	; -31
	.db #0xE2	; -30
	.db #0xE2	; -30
	.db #0xE2	; -30
	.db #0xE2	; -30
	.db #0xE2	; -30
	.db #0xE2	; -30
	.db #0xE2	; -30
	.db #0xE3	; -29
	.db #0xE3	; -29
	.db #0xE3	; -29
	.db #0xE3	; -29
	.db #0xE3	; -29
	.db #0xE3	; -29
	.db #0xE3	; -29
	.db #0xE4	; -28
	.db #0xE4	; -28
	.db #0xE4	; -28
	.db #0xE4	; -28
	.db #0xE4	; -28
	.db #0xE4	; -28
	.db #0xE4	; -28
	.db #0xE5	; -27
	.db #0xE5	; -27
	.db #0xE5	; -27
	.db #0xE5	; -27
	.db #0xE5	; -27
	.db #0xE5	; -27
	.db #0xE5	; -27
	.db #0xE6	; -26
	.db #0xE6	; -26
	.db #0xE6	; -26
	.db #0xE6	; -26
	.db #0xE6	; -26
	.db #0xE6	; -26
	.db #0xE6	; -26
	.db #0xE7	; -25
	.db #0xE7	; -25
	.db #0xE7	; -25
	.db #0xE7	; -25
	.db #0xE7	; -25
	.db #0xE7	; -25
	.db #0xE7	; -25
	.db #0xE8	; -24
	.db #0xE8	; -24
	.db #0xE8	; -24
	.db #0xE8	; -24
	.db #0xE8	; -24
	.db #0xE8	; -24
	.db #0xE8	; -24
	.db #0xE8	; -24
	.db #0xE9	; -23
	.db #0xE9	; -23
	.db #0xE9	; -23
	.db #0xE9	; -23
	.db #0xE9	; -23
	.db #0xE9	; -23
	.db #0xE9	; -23
	.db #0xEA	; -22
	.db #0xEA	; -22
	.db #0xEA	; -22
	.db #0xEA	; -22
	.db #0xEA	; -22
	.db #0xEA	; -22
	.db #0xEA	; -22
	.db #0xEB	; -21
	.db #0xEB	; -21
	.db #0xEB	; -21
	.db #0xEB	; -21
	.db #0xEB	; -21
	.db #0xEB	; -21
	.db #0xEB	; -21
	.db #0xEB	; -21
	.db #0xEC	; -20
	.db #0xEC	; -20
	.db #0xEC	; -20
	.db #0xEC	; -20
	.db #0xEC	; -20
	.db #0xEC	; -20
	.db #0xEC	; -20
	.db #0xED	; -19
	.db #0xED	; -19
	.db #0xED	; -19
	.db #0xED	; -19
	.db #0xED	; -19
	.db #0xED	; -19
	.db #0xED	; -19
	.db #0xED	; -19
	.db #0xEE	; -18
	.db #0xEE	; -18
	.db #0xEE	; -18
	.db #0xEE	; -18
	.db #0xEE	; -18
	.db #0xEE	; -18
	.db #0xEE	; -18
	.db #0xEF	; -17
	.db #0xEF	; -17
	.db #0xEF	; -17
	.db #0xEF	; -17
	.db #0xEF	; -17
	.db #0xEF	; -17
	.db #0xEF	; -17
	.db #0xF0	; -16
	.db #0xF0	; -16
	.db #0xF0	; -16
	.db #0xF0	; -16
	.db #0xF0	; -16
	.db #0xF0	; -16
	.db #0xF0	; -16
	.db #0xF0	; -16
	.db #0xF1	; -15
	.db #0xF1	; -15
	.db #0xF1	; -15
	.db #0xF1	; -15
	.db #0xF1	; -15
	.db #0xF1	; -15
	.db #0xF1	; -15
	.db #0xF1	; -15
	.db #0xF2	; -14
	.db #0xF2	; -14
	.db #0xF2	; -14
	.db #0xF2	; -14
	.db #0xF2	; -14
	.db #0xF2	; -14
	.db #0xF2	; -14
	.db #0xF3	; -13
	.db #0xF3	; -13
	.db #0xF3	; -13
	.db #0xF3	; -13
	.db #0xF3	; -13
	.db #0xF3	; -13
	.db #0xF3	; -13
	.db #0xF3	; -13
	.db #0xF4	; -12
	.db #0xF4	; -12
	.db #0xF4	; -12
	.db #0xF4	; -12
	.db #0xF4	; -12
	.db #0xF4	; -12
	.db #0xF4	; -12
	.db #0xF5	; -11
	.db #0xF5	; -11
	.db #0xF5	; -11
	.db #0xF5	; -11
	.db #0xF5	; -11
	.db #0xF5	; -11
	.db #0xF5	; -11
	.db #0xF5	; -11
	.db #0xF6	; -10
	.db #0xF6	; -10
	.db #0xF6	; -10
	.db #0xF6	; -10
	.db #0xF6	; -10
	.db #0xF6	; -10
	.db #0xF6	; -10
	.db #0xF6	; -10
	.db #0xF7	; -9
	.db #0xF7	; -9
	.db #0xF7	; -9
	.db #0xF7	; -9
	.db #0xF7	; -9
	.db #0xF7	; -9
	.db #0xF7	; -9
	.db #0xF8	; -8
	.db #0xF8	; -8
	.db #0xF8	; -8
	.db #0xF8	; -8
	.db #0xF8	; -8
	.db #0xF8	; -8
	.db #0xF8	; -8
	.db #0xF8	; -8
	.db #0xF9	; -7
	.db #0xF9	; -7
	.db #0xF9	; -7
	.db #0xF9	; -7
	.db #0xF9	; -7
	.db #0xF9	; -7
	.db #0xF9	; -7
	.db #0xF9	; -7
	.db #0xFA	; -6
	.db #0xFA	; -6
	.db #0xFA	; -6
	.db #0xFA	; -6
	.db #0xFA	; -6
	.db #0xFA	; -6
	.db #0xFA	; -6
	.db #0xFA	; -6
	.db #0xFB	; -5
	.db #0xFB	; -5
	.db #0xFB	; -5
	.db #0xFB	; -5
	.db #0xFB	; -5
	.db #0xFB	; -5
	.db #0xFB	; -5
	.db #0xFB	; -5
	.db #0xFC	; -4
	.db #0xFC	; -4
	.db #0xFC	; -4
	.db #0xFC	; -4
	.db #0xFC	; -4
	.db #0xFC	; -4
	.db #0xFC	; -4
	.db #0xFC	; -4
	.db #0xFD	; -3
	.db #0xFD	; -3
	.db #0xFD	; -3
	.db #0xFD	; -3
	.db #0xFD	; -3
	.db #0xFD	; -3
	.db #0xFD	; -3
	.db #0xFD	; -3
	.db #0xFE	; -2
	.db #0xFE	; -2
	.db #0xFE	; -2
	.db #0xFE	; -2
	.db #0xFE	; -2
	.db #0xFE	; -2
	.db #0xFE	; -2
	.db #0xFE	; -2
	.db #0xFF	; -1
	.db #0xFF	; -1
	.db #0xFF	; -1
	.db #0xFF	; -1
	.db #0xFF	; -1
	.db #0xFF	; -1
	.db #0xFF	; -1
_defaultColor:
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x0D	; 13
	.db #0x0D	; 13
	.db #0x09	; 9
	.db #0x01	; 1
	.db #0x01	; 1
_cars:
	.db #0x05	; 5
	.db #0x14	; 20
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x1E	; 30
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x19	; 25
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x0F	; 15
	.db #0x04	; 4
_trackTiles01:
	.db #0x00	; 0
	.db #0x4B	; 75	K
	.db #0x92	; 146
	.db #0x02	; 2
	.db #0x4B	; 75	K
	.db #0x92	; 146
	.db #0x02	; 2
	.db #0x4B	; 75	K
	.db #0x92	; 146
	.db #0x10	; 16
	.db #0x4B	; 75	K
	.db #0x92	; 146
	.db #0x00	; 0
	.db #0x4B	; 75	K
	.db #0x92	; 146
	.db #0x02	; 2
	.db #0x4B	; 75	K
	.db #0x92	; 146
	.db #0x10	; 16
	.db #0x4B	; 75	K
	.db #0x92	; 146
	.db #0x02	; 2
	.db #0x4B	; 75	K
	.db #0x92	; 146
	.db #0x01	; 1
	.db #0x92	; 146
	.db #0x4B	; 75	K
	.db #0x02	; 2
	.db #0x92	; 146
	.db #0x4B	; 75	K
	.db #0x30	; 48
	.db #0x4B	; 75	K
	.db #0x92	; 146
	.db #0x20	; 32
	.db #0x4B	; 75	K
	.db #0x92	; 146
	.db #0x11	; 17
	.db #0x92	; 146
	.db #0x4B	; 75	K
	.db #0x02	; 2
	.db #0x4B	; 75	K
	.db #0x92	; 146
	.db #0x03	; 3
	.db #0xFF	; 255
	.db #0x92	; 146
	.db #0x02	; 2
	.db #0x92	; 146
	.db #0x4B	; 75	K
	.db #0x02	; 2
	.db #0x92	; 146
	.db #0x4B	; 75	K
	.db #0x02	; 2
	.db #0x92	; 146
	.db #0x4B	; 75	K
	.db #0x02	; 2
	.db #0x92	; 146
	.db #0x4B	; 75	K
	.db #0x02	; 2
	.db #0x92	; 146
	.db #0x4B	; 75	K
	.db #0x19	; 25
	.db #0x90	; 144
	.db #0x92	; 146
	.db #0x02	; 2
	.db #0x4B	; 75	K
	.db #0x92	; 146
	.db #0x02	; 2
	.db #0x92	; 146
	.db #0x4B	; 75	K
	.db #0x02	; 2
	.db #0x92	; 146
	.db #0x4B	; 75	K
	.db #0x02	; 2
	.db #0x92	; 146
	.db #0x4B	; 75	K
	.db #0x02	; 2
	.db #0x92	; 146
	.db #0x4B	; 75	K
	.db #0x01	; 1
	.db #0x4B	; 75	K
	.db #0x90	; 144
	.db #0x02	; 2
	.db #0x4B	; 75	K
	.db #0x90	; 144
	.db #0x02	; 2
	.db #0x4B	; 75	K
	.db #0x92	; 146
	.db #0x00	; 0
	.db #0x4B	; 75	K
	.db #0x92	; 146
	.db #0x02	; 2
	.db #0x4B	; 75	K
	.db #0x92	; 146
	.db #0x02	; 2
	.db #0x92	; 146
	.db #0x4B	; 75	K
	.db #0x3B	; 59
	.db #0x5D	; 93
	.db #0x90	; 144
	.db #0x04	; 4
	.db #0x4B	; 75	K
	.db #0x90	; 144
	.db #0x02	; 2
	.db #0x4B	; 75	K
	.db #0x90	; 144
	.db #0x30	; 48
	.db #0x4B	; 75	K
	.db #0x92	; 146
	.db #0x02	; 2
	.db #0x4B	; 75	K
	.db #0x92	; 146
	.db #0x01	; 1
	.db #0x92	; 146
	.db #0x4B	; 75	K
	.db #0x02	; 2
	.db #0x92	; 146
	.db #0x4B	; 75	K
	.db #0x11	; 17
	.db #0x90	; 144
	.db #0x4B	; 75	K
	.db #0x02	; 2
	.db #0x4B	; 75	K
	.db #0x90	; 144
	.db #0x20	; 32
	.db #0x4B	; 75	K
	.db #0x90	; 144
_track01:
	.db #0x07	; 7
	.db #0x06	; 6
	.dw _trackTiles01
	.db #0x19	; 25
	.db #0x64	; 100	d
	.db #0x28	; 40
	.db #0x64	; 100	d
	.db #0x19	; 25
	.db #0x78	; 120	x
	.db #0x28	; 40
	.db #0x78	; 120	x
_menuMain:
	.dw _str_0
	.db #0x03	; 3
	.dw #0x0000
	.dw _str_1
	.db #0x80	; 128
	.dw #0x0000
	.dw _str_2
	.db #0x80	; 128
	.dw #0x0000
	.dw _str_3
	.db #0x80	; 128
	.dw #0x0000
_menuMode:
	.dw _str_4
	.db #0x02	; 2
	.dw #0x0000
	.dw _str_5
	.db #0x02	; 2
	.dw #0x0000
	.dw _str_6
	.db #0x02	; 2
	.dw #0x0000
	.dw _str_7
	.db #0x02	; 2
	.dw #0x0000
	.dw _str_8
	.db #0x03	; 3
	.dw #0x0000
_menuTrack:
	.dw _str_9
	.db #0x81	; 129
	.dw _StartGame
	.dw _str_10
	.db #0x80	; 128
	.dw #0x0000
	.dw _str_8
	.db #0x01	; 1
	.dw #0x0000
_menuPlayer:
	.dw _str_11
	.db #0x01	; 1
	.dw #0x0000
	.dw _str_12
	.db #0x01	; 1
	.dw #0x0000
	.dw _str_13
	.db #0x01	; 1
	.dw #0x0000
	.dw _str_8
	.db #0x00	; 0
	.dw #0x0000
_menus:
	.dw _str_14
	.dw _str_15
	.dw _menuMain
	.db #0x04	; 4
	.dw _str_16
	.dw _str_17
	.dw _menuMode
	.db #0x05	; 5
	.dw _str_18
	.dw _str_19
	.dw _menuTrack
	.db #0x03	; 3
	.dw _str_20
	.dw _str_21
	.dw _menuPlayer
	.db #0x04	; 4
_str_0:
	.ascii "PLAY"
	.db 0x00
_str_1:
	.ascii "EDITOR"
	.db 0x00
_str_2:
	.ascii "OPTIONS"
	.db 0x00
_str_3:
	.ascii "CREDITS"
	.db 0x00
_str_4:
	.ascii "RACE"
	.db 0x00
_str_5:
	.ascii "SURVIVOR"
	.db 0x00
_str_6:
	.ascii "TAG"
	.db 0x00
_str_7:
	.ascii "SOCCER"
	.db 0x00
_str_8:
	.ascii "BACK"
	.db 0x00
_str_9:
	.ascii "FROM ROM"
	.db 0x00
_str_10:
	.ascii "FROM DISK"
	.db 0x00
_str_11:
	.ascii "2 PLAYERS"
	.db 0x00
_str_12:
	.ascii "3 PLAYERS"
	.db 0x00
_str_13:
	.ascii "4 PLAYERS"
	.db 0x00
_str_14:
	.db 0x00
_str_15:
	.ascii "PRESS SPACE"
	.db 0x00
_str_16:
	.ascii "GAME MODE"
	.db 0x00
_str_17:
	.ascii "PRESS SPACE"
	.db 0x00
_str_18:
	.ascii "TRACK SELECT"
	.db 0x00
_str_19:
	.ascii "PRESS SPACE"
	.db 0x00
_str_20:
	.ascii "PLAYER SELECT"
	.db 0x00
_str_21:
	.ascii "PRESS SPACE"
	.db 0x00
;carwar.c:374: void MainLoop()
;	---------------------------------
; Function MainLoop
; ---------------------------------
_MainLoop_start::
_MainLoop:
;carwar.c:377: game.state = StateInitialize;
	ld	hl,#0x0143 + _game
	ld	(hl),#<(_StateInitialize)
	inc	hl
	ld	(hl),#>(_StateInitialize)
;carwar.c:379: while(1)
00102$:
;carwar.c:382: game.state();
	ld	hl,#0x0143 + _game
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	push	bc
	ld	hl,#00107$
	push	hl
	ld	l,c
	ld	h,b
	jp	(hl)
00107$:
	pop	bc
	jr	00102$
_MainLoop_end::
;carwar.c:387: void StateInitialize()
;	---------------------------------
; Function StateInitialize
; ---------------------------------
_StateInitialize_start::
_StateInitialize:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-6
	add	hl,sp
	ld	sp,hl
;carwar.c:392: SetFreq(FREQ_60);
	ld	a,#0x00
	push	af
	inc	sp
	call	_SetFreq
	inc	sp
;carwar.c:393: SetScreen8(LINES_212);
	ld	a,#0x80
	push	af
	inc	sp
	call	_SetScreen8
	inc	sp
;carwar.c:394: SetSpriteMode(SPRITE_ON, SPRITE_NO_MAG + SPRITE_SIZE_8, 0xF800 >> 11, 0xF700 >> 7);
	ld	hl,#0x01EE
	push	hl
	ld	hl,#0x001F
	push	hl
	ld	l, #0x00
	push	hl
	call	_SetSpriteMode
	pop	af
	pop	af
;carwar.c:397: FillVRAM(0, 0,   256, 256, 0);
	ld	h,#0x00
	ex	(sp),hl
	inc	sp
	ld	hl,#0x0100
	push	hl
	ld	l, #0x00
	push	hl
	ld	h, #0x00
	push	hl
	ld	l, #0x00
	push	hl
	call	_FillVRAM
	ld	hl,#0x0009
	add	hl,sp
	ld	sp,hl
;carwar.c:398: FillVRAM(0, 256, 256, 256, 0);
	ld	a,#0x00
	push	af
	inc	sp
	ld	hl,#0x0100
	push	hl
	ld	l, #0x00
	push	hl
	ld	l, #0x00
	push	hl
	ld	h, #0x00
	push	hl
	call	_FillVRAM
	ld	hl,#0x0009
	add	hl,sp
	ld	sp,hl
;carwar.c:401: for(x=0; x<256; x++)
	ld	bc,#0x0000
00104$:
	ld	a,b
	sub	a,#0x01
	jr	NC,00107$
;carwar.c:402: game.colorCode[x] = OP_NONE;
	ld	hl,#0x0007 + _game
	add	hl,bc
	ex	de,hl
	ld	a,#0x00
	ld	(de),a
;carwar.c:401: for(x=0; x<256; x++)
	inc	bc
	jr	00104$
00107$:
;carwar.c:403: game.colorCode[COLOR_BLACK]     = OP_HOLE;
	ld	hl,#0x0007 + _game
	ld	(hl),#0x4A
;carwar.c:404: game.colorCode[COLOR_LIGHTBLUE] = OP_WALL;
	ld	hl,#0x004b + 0x0007 + _game
	ld	(hl),#0x01
;carwar.c:405: game.colorCode[COLOR_GRAY]      = OP_ROAD;
	ld	hl,#0x0092 + 0x0007 + _game
	ld	(hl),#0x40
;carwar.c:406: game.colorCode[COLOR_ORANGE]    = OP_JUMPER;
	ld	hl,#0x005d + 0x0007 + _game
	ld	(hl),#0x48
;carwar.c:407: game.colorCode[COLOR_YELLOW]    = OP_SAND;
	ld	hl,#0x0090 + 0x0007 + _game
	ld	(hl),#0x42
;carwar.c:408: game.colorCode[COLOR_WHITE]     = OP_ROAD;
	ld	hl,#0x00ff + 0x0007 + _game
	ld	(hl),#0x40
;carwar.c:409: game.colorCode[DarkenColor(COLOR_BLACK, SHADOW_POWER)]     = OP_HOLE;
	ld	hl,#0x0200
	push	hl
	call	_DarkenColor
	pop	af
	ld	h,#0x00
	ld	a,#<(0x0007 + _game)
	add	a,l
	ld	c,a
	ld	a,#>(0x0007 + _game)
	adc	a,h
	ld	b,a
	ld	a,#0x4A
	ld	(bc),a
;carwar.c:410: game.colorCode[DarkenColor(COLOR_LIGHTBLUE, SHADOW_POWER)] = OP_WALL;
	ld	hl,#0x024B
	push	hl
	call	_DarkenColor
	pop	af
	ld	h,#0x00
	ld	a,#<(0x0007 + _game)
	add	a,l
	ld	c,a
	ld	a,#>(0x0007 + _game)
	adc	a,h
	ld	b,a
	ld	a,#0x01
	ld	(bc),a
;carwar.c:411: game.colorCode[DarkenColor(COLOR_GRAY, SHADOW_POWER)]      = OP_ROAD;
	ld	hl,#0x0292
	push	hl
	call	_DarkenColor
	pop	af
	ld	h,#0x00
	ld	a,#<(0x0007 + _game)
	add	a,l
	ld	c,a
	ld	a,#>(0x0007 + _game)
	adc	a,h
	ld	b,a
	ld	a,#0x40
	ld	(bc),a
;carwar.c:412: game.colorCode[DarkenColor(COLOR_ORANGE, SHADOW_POWER)]    = OP_JUMPER;
	ld	hl,#0x025D
	push	hl
	call	_DarkenColor
	pop	af
	ld	h,#0x00
	ld	a,#<(0x0007 + _game)
	add	a,l
	ld	c,a
	ld	a,#>(0x0007 + _game)
	adc	a,h
	ld	b,a
	ld	a,#0x48
	ld	(bc),a
;carwar.c:413: game.colorCode[DarkenColor(COLOR_YELLOW, SHADOW_POWER)]    = OP_SAND;
	ld	hl,#0x0290
	push	hl
	call	_DarkenColor
	pop	af
	ld	h,#0x00
	ld	a,#<(0x0007 + _game)
	add	a,l
	ld	c,a
	ld	a,#>(0x0007 + _game)
	adc	a,h
	ld	b,a
	ld	a,#0x42
	ld	(bc),a
;carwar.c:414: game.colorCode[DarkenColor(COLOR_WHITE, SHADOW_POWER)]     = OP_ROAD;
	ld	hl,#0x02FF
	push	hl
	call	_DarkenColor
	pop	af
	ld	h,#0x00
	ld	a,#<(0x0007 + _game)
	add	a,l
	ld	c,a
	ld	a,#>(0x0007 + _game)
	adc	a,h
	ld	b,a
	ld	a,#0x40
	ld	(bc),a
;carwar.c:417: for(x=0; x<sizeof(charTable)/8; x++)
	ld	-2 (ix),#0x00
	ld	-1 (ix),#0x00
00108$:
	ld	a,-2 (ix)
	sub	a,#0x30
	ld	a,-1 (ix)
	sbc	a,#0x00
	jr	NC,00111$
;carwar.c:419: RAMtoVRAM((x * 8) % 256, 248 + (x / 32), 8, 1, (u16)&charTable[x * 8]);
	ld	e,-2 (ix)
	ld	d,-1 (ix)
	sla	e
	rl	d
	sla	e
	rl	d
	sla	e
	rl	d
	ld	hl,#_charTable
	add	hl,de
	ld	-6 (ix), l
	ld	-5 (ix), h
	ld	l,-2 (ix)
	ld	h,-1 (ix)
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
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	ld	hl,#0x0001
	push	hl
	ld	l, #0x08
	push	hl
	push	bc
	push	de
	call	_RAMtoVRAM
	ld	hl,#0x000A
	add	hl,sp
	ld	sp,hl
;carwar.c:417: for(x=0; x<sizeof(charTable)/8; x++)
	inc	-2 (ix)
	jr	NZ,00108$
	inc	-1 (ix)
	jr	00108$
00111$:
;carwar.c:423: for(x=0; x<256; x++)
	ld	-2 (ix),#0x00
	ld	-1 (ix),#0x00
00116$:
	ld	a,-1 (ix)
	sub	a,#0x01
	jp	NC,00119$
;carwar.c:425: for(i=0; i<8; i++)
	ld	e,-2 (ix)
	ld	d,-1 (ix)
	sla	e
	rl	d
	sla	e
	rl	d
	sla	e
	rl	d
	ld	-6 (ix),e
	ld	-5 (ix),d
	ld	-4 (ix),#0x00
	ld	-3 (ix),#0x00
00112$:
	ld	a,-4 (ix)
	sub	a,#0x08
	ld	a,-3 (ix)
	sbc	a,#0x00
	jr	NC,00118$
;carwar.c:427: if(x & (1 << (7 - (i & 0x07))))
	ld	a,-4 (ix)
	and	a,#0x07
	ld	l,a
	ld	h,#0x00
	ld	a,#0x07
	sub	a,l
	ld	c,a
	ld	a,#0x00
	sbc	a,h
	ld	a,c
	inc	a
	push	af
	ld	bc,#0x0001
	pop	af
	jr	00142$
00141$:
	sla	c
	rl	b
00142$:
	dec	a
	jr	NZ,00141$
	ld	a,-2 (ix)
	and	a,c
	ld	l,a
	ld	a,-1 (ix)
	and	a,b
	ld	h,a
	ld	a,l
	or	a,h
	jr	Z,00102$
;carwar.c:428: game.bitToByte[x * 8 + i] = 0xFF;
	ld	a,-6 (ix)
	add	a,-4 (ix)
	ld	c,a
	ld	a,-5 (ix)
	adc	a,-3 (ix)
	ld	b,a
	ld	hl,#0x0145 + _game
	add	hl,bc
	ld	(hl),#0xFF
	jr	00114$
00102$:
;carwar.c:430: game.bitToByte[x * 8 + i] = 0x00;
	ld	a,e
	add	a,-4 (ix)
	ld	c,a
	ld	a,d
	adc	a,-3 (ix)
	ld	b,a
	ld	hl,#0x0145 + _game
	add	hl,bc
	ld	(hl),#0x00
00114$:
;carwar.c:425: for(i=0; i<8; i++)
	inc	-4 (ix)
	jr	NZ,00112$
	inc	-3 (ix)
	jr	00112$
00118$:
;carwar.c:423: for(x=0; x<256; x++)
	inc	-2 (ix)
	jp	NZ,00116$
	inc	-1 (ix)
	jp	00116$
00119$:
;carwar.c:434: game.page = 0;
	ld	hl,#0x0004 + _game
	ld	(hl),#0x00
;carwar.c:436: game.state = StateStartGame;
	ld	hl,#0x0143 + _game
	ld	(hl),#<(_StateStartGame)
	inc	hl
	ld	(hl),#>(_StateStartGame)
	ld	sp,ix
	pop	ix
	ret
_StateInitialize_end::
;carwar.c:440: void InitializeMenu(u8 menu)
;	---------------------------------
; Function InitializeMenu
; ---------------------------------
_InitializeMenu_start::
_InitializeMenu:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-8
	add	hl,sp
	ld	sp,hl
;carwar.c:443: game.menu = menu;
	ld	hl,#_game
	ld	a,4 (ix)
	ld	(hl),a
;carwar.c:444: game.item = 0;
	ld	hl,#0x0001 + _game
	ld	(hl),#0x00
;carwar.c:446: game.page = 1;
	ld	hl,#0x0004 + _game
	ld	(hl),#0x01
;carwar.c:447: SetPage8(game.page);
	ld	a, (hl)
	push	af
	inc	sp
	call	_SetPage8
	inc	sp
;carwar.c:449: HMMV(MENU_X, MENU_Y, 256 - MENU_X, 212 - MENU_Y, COLOR_BLACK);
	ld	hl,#0x0954 + _game
	ld	(hl),#0x54
	inc	hl
	ld	(hl),#0x00
	ld	hl,#0x0002 + 0x0954 + _game
	ld	(hl),#0x64
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0xAC
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x70
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0xC0
	ld	l,#<(0x0954 + _game)
	ld	h,#>(0x0954 + _game)
	push	hl
	call	_VPDCommand36
	pop	af
;carwar.c:451: DrawText(MENU_X, MENU_Y, menus[game.menu].title, COLOR_WHITE);
	ld	a,(#_game)
	ld	e,a
	add	a,a
	add	a,e
	add	a,a
	add	a,e
	add	a,#<(_menus)
	ld	l, a
	ld	a, #>(_menus)
	adc	a, #0x00
	ld	h, a
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,#0xFF
	push	af
	inc	sp
	push	bc
	ld	hl,#0x0064
	push	hl
	ld	l, #0x54
	push	hl
	call	_DrawText
	pop	af
	pop	af
	pop	af
	inc	sp
;carwar.c:452: for(item = 0; item < menus[game.menu].itemNum; item++)
	ld	-1 (ix),#0x00
	ld	de,#0x0000
	ld	-3 (ix),#0x00
	ld	-2 (ix),#0x00
	ld	-5 (ix),#0x00
	ld	-4 (ix),#0x00
00101$:
	ld	hl,#_game
	ld	l,(hl)
	push	de
	ld	a,l
	ld	e,a
	add	a,a
	add	a,e
	add	a,a
	add	a,e
	pop	de
	add	a,#<(_menus)
	ld	c,a
	ld	a,#>(_menus)
	adc	a,#0x00
	ld	b,a
	ld	hl,#0x0006
	add	hl,bc
	ld	a,-1 (ix)
	sub	a,(hl)
	jp	NC,00104$
;carwar.c:454: DrawText(MENU_X + 12, MENU_Y + TITLE_SPACE + LINE_SPACE * item, menus[game.menu].items[item].text, menus[game.menu].items[item].nextIdx == ITEM_INVALID ? COLOR_GRAY : COLOR_WHITE);
	ld	hl,#_game
	ld	l,(hl)
	push	de
	ld	a,l
	ld	e,a
	add	a,a
	add	a,e
	add	a,a
	add	a,e
	pop	de
	add	a,#<(_menus)
	ld	l, a
	ld	a, #>(_menus)
	adc	a, #0x00
	ld	h, a
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	add	hl,de
	inc	hl
	inc	hl
	ld	a,(hl)
	sub	a,#0x80
	jr	NZ,00107$
	ld	-6 (ix),#0x92
	jr	00108$
00107$:
	ld	-6 (ix),#0xFF
00108$:
	ld	hl,#_game
	ld	l,(hl)
	push	de
	ld	a,l
	ld	e,a
	add	a,a
	add	a,e
	add	a,a
	add	a,e
	pop	de
	add	a,#<(_menus)
	ld	l, a
	ld	a, #>(_menus)
	adc	a, #0x00
	ld	h, a
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	add	a,-3 (ix)
	ld	c,a
	ld	a,h
	adc	a,-2 (ix)
	ld	h, a
	ld	l, c
	ld	a,(hl)
	ld	-8 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-7 (ix),a
	ld	a,-5 (ix)
	add	a,#0x74
	ld	c,a
	ld	a,-4 (ix)
	adc	a,#0x00
	ld	b,a
	push	de
	ld	a,-6 (ix)
	push	af
	inc	sp
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	hl
	push	bc
	ld	hl,#0x0060
	push	hl
	call	_DrawText
	pop	af
	pop	af
	pop	af
	inc	sp
	pop	de
;carwar.c:452: for(item = 0; item < menus[game.menu].itemNum; item++)
	inc	de
	inc	de
	inc	de
	inc	de
	inc	de
	ld	a,-3 (ix)
	add	a,#0x05
	ld	-3 (ix),a
	ld	a,-2 (ix)
	adc	a,#0x00
	ld	-2 (ix),a
	ld	a,-5 (ix)
	add	a,#0x0A
	ld	-5 (ix),a
	ld	a,-4 (ix)
	adc	a,#0x00
	ld	-4 (ix),a
	inc	-1 (ix)
	jp	00101$
00104$:
;carwar.c:457: HMMM(MENU_X, MENU_Y, MENU_X, MENU_Y + 256, 256 - MENU_X, 212 - MENU_Y);
	ld	hl,#0x0945 + _game
	ld	(hl),#0x54
	inc	hl
	ld	(hl),#0x00
	ld	hl,#0x0002 + 0x0945 + _game
	ld	(hl),#0x64
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x54
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x64
	inc	hl
	ld	(hl),#0x01
	inc	hl
	ld	(hl),#0xAC
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x70
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0xD0
	ld	l,#<(0x0945 + _game)
	ld	h,#>(0x0945 + _game)
	push	hl
	call	_VPDCommand32
	ld	sp,ix
	pop	ix
	ret
_InitializeMenu_end::
;carwar.c:461: void StateTitle()
;	---------------------------------
; Function StateTitle
; ---------------------------------
_StateTitle_start::
_StateTitle:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-8
	add	hl,sp
	ld	sp,hl
;carwar.c:465: game.page = 1;
	ld	hl,#0x0004 + _game
	ld	(hl),#0x01
;carwar.c:466: SetPage8(game.page);
	ld	a, (hl)
	push	af
	inc	sp
	call	_SetPage8
	inc	sp
;carwar.c:468: for(j=0; j<24; j++)
	ld	-2 (ix),#0x00
	ld	de,#0x0000
00107$:
	ld	a,-2 (ix)
	sub	a,#0x18
	jp	NC,00110$
;carwar.c:470: for(i=0; i<232; i++)
	push	de
	ld	hl,#0x0008
	push	hl
	push	de
	call	__divsint_rrx_s
	pop	af
	pop	af
	ld	-4 (ix),h
	ld	-5 (ix),l
	pop	de
	ld	-1 (ix),#0x00
00103$:
	ld	a,-1 (ix)
	sub	a,#0xE8
	jp	NC,00106$
;carwar.c:472: byte = title[(i / 8) + (j * 232 / 8)];
	ld	a,-1 (ix)
	srl	a
	srl	a
	srl	a
	ld	h, #0x00
	add	a,-5 (ix)
	ld	c,a
	ld	a,h
	adc	a,-4 (ix)
	ld	b,a
	ld	hl,#_title
	add	hl,bc
	ld	a,(hl)
	ld	-3 (ix),a
;carwar.c:473: if(byte & (1 << (7 - (i & 0x07))))
	ld	a,-1 (ix)
	and	a,#0x07
	ld	l,a
	ld	h,#0x00
	ld	a,#0x07
	sub	a,l
	ld	c,a
	ld	a,#0x00
	sbc	a,h
	ld	a,c
	inc	a
	push	af
	ld	bc,#0x0001
	pop	af
	jr	00121$
00120$:
	sla	c
	rl	b
00121$:
	dec	a
	jr	NZ,00120$
	ld	a, -3 (ix)
	ld	h, #0x00
	and	a,c
	ld	l,a
	ld	a,h
	and	a,b
	ld	h,a
	ld	a,l
	or	a,h
	jr	Z,00105$
;carwar.c:475: WriteVRAM(0, TITLE_X + i + 256 * (TITLE_Y + j), GrayGradiant(i + j));
	ld	a,-1 (ix)
	add	a,-2 (ix)
	ld	l,a
	push	de
	ld	a,l
	push	af
	inc	sp
	call	_GrayGradiant
	inc	sp
	ld	-6 (ix),l
	pop	de
	ld	a, -1 (ix)
	ld	h, #0x00
	add	a,#0x10
	ld	-8 (ix),a
	ld	a,h
	adc	a,#0x00
	ld	-7 (ix),a
	ld	a, -2 (ix)
	ld	h, #0x00
	add	a,#0x20
	ld	c,a
	ld	a,h
	adc	a,#0x00
	ld	h,c
	ld	l,#0x00
	ld	a,-8 (ix)
	add	a,l
	ld	c,a
	ld	a,-7 (ix)
	adc	a,h
	ld	b,a
	push	de
	ld	a,-6 (ix)
	push	af
	inc	sp
	push	bc
	ld	a,#0x00
	push	af
	inc	sp
	call	_WriteVRAM
	pop	af
	pop	af
	pop	de
00105$:
;carwar.c:470: for(i=0; i<232; i++)
	inc	-1 (ix)
	jp	00103$
00106$:
;carwar.c:479: VRAMtoVRAM(TITLE_X, TITLE_Y + j, TITLE_X, TITLE_Y + 256 + j, 232, 1);
	ld	l,-2 (ix)
	ld	h,#0x00
	ld	a,l
	add	a,#0x20
	ld	-8 (ix),a
	ld	a,h
	adc	a,#0x01
	ld	-7 (ix),a
	ld	bc, #0x0020
	add	hl,bc
	ld	c, l
	ld	b, h
	push	de
	ld	hl,#0x0001
	push	hl
	ld	l, #0xE8
	push	hl
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	hl
	ld	hl,#0x0010
	push	hl
	push	bc
	ld	l, #0x10
	push	hl
	call	_VRAMtoVRAM
	ld	hl,#0x000C
	add	hl,sp
	ld	sp,hl
	pop	de
;carwar.c:468: for(j=0; j<24; j++)
	ld	hl,#0x00E8
	add	hl,de
	ex	de,hl
	inc	-2 (ix)
	jp	00107$
00110$:
;carwar.c:482: InitializeMenu(0);
	ld	a,#0x00
	push	af
	inc	sp
	call	_InitializeMenu
	inc	sp
;carwar.c:483: game.pressed = 0;
	ld	hl,#0x0002 + _game
	ld	(hl),#0x00
;carwar.c:484: game.page = 0;
	inc	hl
	inc	hl
	ld	(hl),#0x00
;carwar.c:485: game.state = StateMainMenu;
	ld	hl,#0x0143 + _game
	ld	(hl),#<(_StateMainMenu)
	inc	hl
	ld	(hl),#>(_StateMainMenu)
	ld	sp,ix
	pop	ix
	ret
_StateTitle_end::
;carwar.c:489: void StartGame()
;	---------------------------------
; Function StartGame
; ---------------------------------
_StartGame_start::
_StartGame:
;carwar.c:491: game.state = StateStartGame;
	ld	hl,#0x0143 + _game
	ld	(hl),#<(_StateStartGame)
	inc	hl
	ld	(hl),#>(_StateStartGame)
	ret
_StartGame_end::
;carwar.c:495: void StateMainMenu()
;	---------------------------------
; Function StateMainMenu
; ---------------------------------
_StateMainMenu_start::
_StateMainMenu:
;carwar.c:499: SetPage8(game.page);
	ld	a,(#0x0004 + _game)
	push	af
	inc	sp
	call	_SetPage8
	inc	sp
;carwar.c:500: game.page = 1 - game.page;
	ld	hl,#0x0004 + _game
	ld	l,(hl)
	ld	a,#0x01
	sub	a,l
	ld	hl,#0x0004 + _game
	ld	(hl),a
;carwar.c:501: game.yOffset = 256 * game.page;
	ld	b, (hl)
	ld	c,#0x00
	ld	hl,#0x0005 + _game
	ld	(hl),c
	inc	hl
	ld	(hl),b
;carwar.c:504: keyLine = GetKeyMatrixLine(8);
	ld	a,#0x08
	push	af
	inc	sp
	call	_GetKeyMatrixLine
	inc	sp
	ld	c,l
;carwar.c:505: if((keyLine & KEY_SPACE) == 0
	ld	a,c
	and	a,#0x01
	jr	Z,00105$
;carwar.c:506: || Joytrig(1) != 0
	push	bc
	ld	a,#0x01
	push	af
	inc	sp
	call	_Joytrig
	inc	sp
	pop	bc
	xor	a,a
	or	a,l
	jr	NZ,00105$
;carwar.c:507: || Joytrig(2) != 0)
	push	bc
	ld	a,#0x02
	push	af
	inc	sp
	call	_Joytrig
	inc	sp
	pop	bc
	xor	a,a
	or	a,l
	jp	Z,00106$
00105$:
;carwar.c:509: if(menus[game.menu].items[game.item].action != 0)
	ld	a,(#_game)
	ld	e,a
	add	a,a
	add	a,e
	add	a,a
	add	a,e
	add	a,#<(_menus)
	ld	b,a
	ld	a,#>(_menus)
	adc	a,#0x00
	ld	e,a
	ld	a,b
	add	a,#0x04
	ld	b,a
	ld	a,e
	adc	a,#0x00
	ld	h, a
	ld	l, b
	ld	c,(hl)
	inc	hl
	ld	e,(hl)
	ld	hl,#0x0001 + _game
	ld	l,(hl)
	push	de
	ld	e,l
	ld	d,#0x00
	ld	l,e
	ld	h,d
	add	hl,hl
	add	hl,hl
	add	hl,de
	pop	de
	ld	d,l
	ld	b,h
	ld	a,c
	add	a,d
	ld	d,a
	ld	a,e
	adc	a,b
	ld	b,a
	ld	a,d
	add	a,#0x03
	ld	d,a
	ld	a,b
	adc	a,#0x00
	ld	h, a
	ld	l, d
	ld	a,(hl)
	inc	hl
	or	a,(hl)
	jr	Z,00102$
;carwar.c:510: menus[game.menu].items[game.item].action();
	ld	a,(#_game)
	ld	e,a
	add	a,a
	add	a,e
	add	a,a
	add	a,e
	add	a,#<(_menus)
	ld	b,a
	ld	a,#>(_menus)
	adc	a,#0x00
	ld	e,a
	ld	a,b
	add	a,#0x04
	ld	b,a
	ld	a,e
	adc	a,#0x00
	ld	h, a
	ld	l, b
	ld	c,(hl)
	inc	hl
	ld	e,(hl)
	ld	hl,#0x0001 + _game
	ld	l,(hl)
	push	de
	ld	e,l
	ld	d,#0x00
	ld	l,e
	ld	h,d
	add	hl,hl
	add	hl,hl
	add	hl,de
	pop	de
	ld	d,l
	ld	b,h
	ld	a,c
	add	a,d
	ld	d,a
	ld	a,e
	adc	a,b
	ld	b,a
	ld	a,d
	add	a,#0x03
	ld	d,a
	ld	a,b
	adc	a,#0x00
	ld	h, a
	ld	l, d
	ld	d,(hl)
	inc	hl
	ld	b,(hl)
	push	bc
	push	de
	ld	hl,#00137$
	push	hl
	ld	l,d
	ld	h,b
	jp	(hl)
00137$:
	pop	de
	pop	bc
00102$:
;carwar.c:511: if((menus[game.menu].items[game.item].nextIdx & 0x80) == 0)
	ld	a,(#_game)
	ld	e,a
	add	a,a
	add	a,e
	add	a,a
	add	a,e
	add	a,#<(_menus)
	ld	b,a
	ld	a,#>(_menus)
	adc	a,#0x00
	ld	e,a
	ld	a,b
	add	a,#0x04
	ld	b,a
	ld	a,e
	adc	a,#0x00
	ld	h, a
	ld	l, b
	ld	c,(hl)
	inc	hl
	ld	e,(hl)
	ld	hl,#0x0001 + _game
	ld	l,(hl)
	push	de
	ld	e,l
	ld	d,#0x00
	ld	l,e
	ld	h,d
	add	hl,hl
	add	hl,hl
	add	hl,de
	pop	de
	ld	d,l
	ld	b,h
	ld	a,c
	add	a,d
	ld	d,a
	ld	a,e
	adc	a,b
	ld	b,a
	ld	a,d
	add	a,#0x02
	ld	d,a
	ld	a,b
	adc	a,#0x00
	ld	h, a
	ld	l, d
	ld	a,(hl)
	and	a,#0x80
	jr	Z,00139$
	ret
00139$:
;carwar.c:512: InitializeMenu(menus[game.menu].items[game.item].nextIdx);
	ld	a,(#_game)
	ld	e,a
	add	a,a
	add	a,e
	add	a,a
	add	a,e
	add	a,#<(_menus)
	ld	b,a
	ld	a,#>(_menus)
	adc	a,#0x00
	ld	e,a
	ld	a,b
	add	a,#0x04
	ld	b,a
	ld	a,e
	adc	a,#0x00
	ld	h, a
	ld	l, b
	ld	c,(hl)
	inc	hl
	ld	e,(hl)
	ld	hl,#0x0001 + _game
	ld	l,(hl)
	push	de
	ld	e,l
	ld	d,#0x00
	ld	l,e
	ld	h,d
	add	hl,hl
	add	hl,hl
	add	hl,de
	pop	de
	ld	d,l
	ld	b,h
	ld	a,c
	add	a,d
	ld	d,a
	ld	a,e
	adc	a,b
	ld	b,a
	ld	a,d
	add	a,#0x02
	ld	d,a
	ld	a,b
	adc	a,#0x00
	ld	h, a
	ld	l, d
	ld	a, (hl)
	push	af
	inc	sp
	call	_InitializeMenu
	inc	sp
;carwar.c:513: return;
	ret
00106$:
;carwar.c:517: if(game.pressed > 16)
	ld	hl,#0x0002 + _game
	ld	l,(hl)
	ld	a,#0x10
	sub	a,l
	jr	NC,00110$
;carwar.c:518: game.pressed = 0;
	ld	hl,#0x0002 + _game
	ld	(hl),#0x00
00110$:
;carwar.c:519: if(((keyLine & KEY_UP) == 0) && (game.item > 0))
	ld	a,c
	and	a,#0x20
	jr	NZ,00120$
	ld	hl,#0x0001 + _game
	ld	a,(hl)
	or	a,a
	jr	Z,00120$
;carwar.c:521: if(game.pressed == 0)
	inc	hl
	ld	a,(hl)
	or	a,a
	jr	NZ,00112$
;carwar.c:522: game.item--;
	dec	hl
	ld	a, (hl)
	dec	a
	ld	(#0x0001 + _game),a
00112$:
;carwar.c:523: game.pressed++;
	ld	a,(#0x0002 + _game)
	inc	a
	ld	(#0x0002 + _game),a
	jr	00121$
00120$:
;carwar.c:525: else if(((keyLine & KEY_DOWN) == 0) && (game.item < menus[game.menu].itemNum - 1))
	ld	a,c
	and	a,#0x40
	jr	NZ,00116$
	ld	hl,#0x0001 + _game
	ld	c,(hl)
	ld	a,(#_game)
	ld	e,a
	add	a,a
	add	a,e
	add	a,a
	add	a,e
	add	a,#<(_menus)
	ld	b,a
	ld	a,#>(_menus)
	adc	a,#0x00
	ld	e,a
	ld	a,b
	add	a,#0x06
	ld	b,a
	ld	a,e
	adc	a,#0x00
	ld	h, a
	ld	l, b
	ld	l,(hl)
	ld	h,#0x00
	dec	hl
	ld	b,#0x00
	ld	a,c
	sub	a,l
	ld	a,b
	sbc	a,h
	jp	PO,00144$
	xor	a,#0x80
00144$:
	jp	P,00116$
;carwar.c:527: if(game.pressed == 0)
	ld	hl,#0x0002 + _game
	ld	a,(hl)
	or	a,a
	jr	NZ,00114$
;carwar.c:528: game.item++;
	dec	hl
	ld	a, (hl)
	inc	a
	ld	(#0x0001 + _game),a
00114$:
;carwar.c:529: game.pressed++;
	ld	a,(#0x0002 + _game)
	inc	a
	ld	(#0x0002 + _game),a
	jr	00121$
00116$:
;carwar.c:532: game.pressed = 0;
	ld	hl,#0x0002 + _game
	ld	(hl),#0x00
00121$:
;carwar.c:535: HMMV(MENU_X, MENU_Y + TITLE_SPACE + game.yOffset, 8, LINE_SPACE * menus[game.menu].itemNum, COLOR_BLACK);
	ld	hl,#0x0954 + _game
	ld	(hl),#0x54
	inc	hl
	ld	(hl),#0x00
	ld	hl,#0x0005 + _game
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	add	a,#0x74
	ld	c,a
	ld	a,h
	adc	a,#0x00
	ld	b,a
	ld	hl,#0x0002 + 0x0954 + _game
	ld	(hl),c
	inc	hl
	ld	(hl),b
	inc	hl
	ld	(hl),#0x08
	inc	hl
	ld	(hl),#0x00
	ld	a,(#_game)
	ld	e,a
	add	a,a
	add	a,e
	add	a,a
	add	a,e
	add	a,#<(_menus)
	ld	c,a
	ld	a,#>(_menus)
	adc	a,#0x00
	ld	b,a
	ld	hl,#0x0006
	add	hl,bc
	ld	a,(hl)
	ld	e, a
	ld	d, #0x00
	ld	l, a
	ld	h,d
	add	hl,hl
	add	hl,hl
	add	hl,de
	add	hl,hl
	ld	c,l
	ld	b,h
	ld	hl,#0x0006 + 0x0954 + _game
	ld	(hl),c
	inc	hl
	ld	(hl),b
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0xC0
	ld	l,#<(0x0954 + _game)
	ld	h,#>(0x0954 + _game)
	push	hl
	call	_VPDCommand36
	pop	af
;carwar.c:536: DrawText(MENU_X, MENU_Y + TITLE_SPACE + game.yOffset + (LINE_SPACE * game.item), "@", COLOR_WHITE);
	ld	hl,#0x0005 + _game
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	add	a,#0x74
	ld	c,a
	ld	a,h
	adc	a,#0x00
	ld	b,a
	ld	hl,#0x0001 + _game
	ld	e, (hl)
	ld	d,#0x00
	ld	l,e
	ld	h,d
	add	hl,hl
	add	hl,hl
	add	hl,de
	add	hl,hl
	ex	de,hl
	ld	a,c
	add	a,e
	ld	c,a
	ld	a,b
	adc	a,d
	ld	b,a
	ld	a,#0xFF
	push	af
	inc	sp
	ld	hl,#__str_22
	push	hl
	push	bc
	ld	hl,#0x0054
	push	hl
	call	_DrawText
	pop	af
	pop	af
	pop	af
	inc	sp
;carwar.c:537: waitRetrace();
	call	_waitRetrace
	ret
_StateMainMenu_end::
__str_22:
	.ascii "@"
	.db 0x00
;carwar.c:541: void StateStartGame()
;	---------------------------------
; Function StateStartGame
; ---------------------------------
_StateStartGame_start::
_StateStartGame:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-7
	add	hl,sp
	ld	sp,hl
;carwar.c:545: game.page = 0;
	ld	hl,#0x0004 + _game
	ld	(hl),#0x00
;carwar.c:546: SetPage8(game.page);
	ld	a, (hl)
	push	af
	inc	sp
	call	_SetPage8
	inc	sp
;carwar.c:552: VRAMtoVRAM(0, 0, 0, 256, 256, 212);
	ld	hl,#0x00D4
	push	hl
	ld	hl,#0x0100
	push	hl
	ld	l, #0x00
	push	hl
	ld	h, #0x00
	push	hl
	ld	l, #0x00
	push	hl
	ld	l, #0x00
	push	hl
	call	_VRAMtoVRAM
	ld	hl,#0x000C
	add	hl,sp
	ld	sp,hl
;carwar.c:556: PrintSprite(64, 64, "INIT\nCARS", (u16)&defaultColor);
	ld	c,#<(_defaultColor)
	ld	b,#>(_defaultColor)
	push	bc
	ld	hl,#__str_23
	push	hl
	ld	hl,#0x4040
	push	hl
	call	_PrintSprite
	pop	af
	pop	af
	pop	af
;carwar.c:557: for(i=0; i<16; i++)
	ld	-1 (ix),#0x00
	ld	de,#0x0000
	ld	-3 (ix),#0x00
	ld	-2 (ix),#0x00
00101$:
	ld	a,-1 (ix)
	sub	a,#0x10
	jp	NC,00104$
;carwar.c:559: RAMtoVRAM(i * 13, 256 + 212 + 0,  13, 11, (u16)&car1[13 * 11 * i]);
	ld	hl,#_car1
	add	hl,de
	push	de
	push	hl
	ld	hl,#0x000B
	push	hl
	ld	l, #0x0D
	push	hl
	ld	hl,#0x01D4
	push	hl
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	push	hl
	call	_RAMtoVRAM
	ld	hl,#0x000A
	add	hl,sp
	ld	sp,hl
	pop	de
;carwar.c:560: RAMtoVRAM(i * 13, 256 + 212 + 11, 13, 11, (u16)&car2[13 * 11 * i]);
	ld	hl,#_car2
	add	hl,de
	push	de
	push	hl
	ld	hl,#0x000B
	push	hl
	ld	l, #0x0D
	push	hl
	ld	hl,#0x01DF
	push	hl
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	push	hl
	call	_RAMtoVRAM
	ld	hl,#0x000A
	add	hl,sp
	ld	sp,hl
	pop	de
;carwar.c:561: RAMtoVRAM(i * 13, 256 + 212 + 22, 13, 11, (u16)&car3[13 * 11 * i]);
	ld	hl,#_car3
	add	hl,de
	push	de
	push	hl
	ld	hl,#0x000B
	push	hl
	ld	l, #0x0D
	push	hl
	ld	hl,#0x01EA
	push	hl
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	push	hl
	call	_RAMtoVRAM
	ld	hl,#0x000A
	add	hl,sp
	ld	sp,hl
	pop	de
;carwar.c:562: RAMtoVRAM(i * 13, 256 + 212 + 33, 13, 11, (u16)&car4[13 * 11 * i]);
	ld	hl,#_car4
	add	hl,de
	push	de
	push	hl
	ld	hl,#0x000B
	push	hl
	ld	l, #0x0D
	push	hl
	ld	hl,#0x01F5
	push	hl
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	push	hl
	call	_RAMtoVRAM
	ld	hl,#0x000A
	add	hl,sp
	ld	sp,hl
	pop	de
;carwar.c:557: for(i=0; i<16; i++)
	ld	hl,#0x008F
	add	hl,de
	ex	de,hl
	ld	a,-3 (ix)
	add	a,#0x0D
	ld	-3 (ix),a
	ld	a,-2 (ix)
	adc	a,#0x00
	ld	-2 (ix),a
	inc	-1 (ix)
	jp	00101$
00104$:
;carwar.c:567: PrintSprite(64, 64, "INIT\nTRACK\nBACKUP", (u16)&defaultColor);
	ld	c,#<(_defaultColor)
	ld	b,#>(_defaultColor)
	push	bc
	ld	hl,#__str_24
	push	hl
	ld	hl,#0x4040
	push	hl
	call	_PrintSprite
	pop	af
	pop	af
	pop	af
;carwar.c:568: for(i=0; i<CAR_NUM; i++)
	ld	-1 (ix),#0x00
	ld	b,#0x00
	ld	-3 (ix),#0x00
	ld	-2 (ix),#0x00
00105$:
	ld	a,-1 (ix)
	sub	a,#0x04
	jp	NC,00108$
;carwar.c:570: InitializePlayer(&game.players[i], i, track01.startPos[i].x, track01.startPos[i].y);
	ld	a,-1 (ix)
	add	a,a
	add	a,#<(0x0004 + _track01)
	ld	-5 (ix),a
	ld	a,#>(0x0004 + _track01)
	adc	a,#0x00
	ld	-4 (ix),a
	ld	a,-5 (ix)
	add	a,#0x01
	ld	l, a
	ld	a, -4 (ix)
	adc	a, #0x00
	ld	h, a
	ld	d,(hl)
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	a,(hl)
	ld	-5 (ix),a
	ld	a,#<(0x0107 + _game)
	add	a,b
	ld	e,a
	ld	a,#>(0x0107 + _game)
	adc	a,#0x00
	ld	c,a
	push	bc
	push	de
	inc	sp
	ld	h,-5 (ix)
	ld	l,-1 (ix)
	push	hl
	ld	l,e
	ld	h,c
	push	hl
	call	_InitializePlayer
	pop	af
	pop	af
	inc	sp
	pop	bc
;carwar.c:571: VRAMtoVRAM(PosXToSprt(game.players[i].posX), (256 * 0) + PosYToSprt(game.players[i].posY), (13 * i) + (52 * 0), 212, 13, 11);
	ld	a,#<(0x0107 + _game)
	add	a,b
	ld	l, a
	ld	a, #>(0x0107 + _game)
	adc	a, #0x00
	ld	h, a
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	h, #0x00
	add	a,#0xFB
	ld	-5 (ix),a
	ld	a,h
	adc	a,#0xFF
	ld	-4 (ix),a
	ld	a,#<(0x0107 + _game)
	add	a,b
	ld	c,a
	ld	a,#>(0x0107 + _game)
	adc	a,#0x00
	ld	h, a
	ld	l, c
	inc	hl
	ld	a, (hl)
	ld	h, #0x00
	add	a,#0xFA
	ld	e,a
	ld	a,h
	adc	a,#0xFF
	ld	d,a
	push	bc
	ld	hl,#0x000B
	push	hl
	ld	l, #0x0D
	push	hl
	ld	l, #0xD4
	push	hl
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	push	hl
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	push	hl
	push	de
	call	_VRAMtoVRAM
	ld	hl,#0x000C
	add	hl,sp
	ld	sp,hl
	pop	bc
;carwar.c:572: VRAMtoVRAM(PosXToSprt(game.players[i].posX), (256 * 1) + PosYToSprt(game.players[i].posY), (13 * i) + (52 * 1), 212, 13, 11);
	ld	a,-3 (ix)
	add	a,#0x34
	ld	-5 (ix),a
	ld	a,-2 (ix)
	adc	a,#0x00
	ld	-4 (ix),a
	ld	a,#<(0x0107 + _game)
	add	a,b
	ld	c,a
	ld	a,#>(0x0107 + _game)
	adc	a,#0x00
	ld	e,a
	ld	a,c
	add	a,#0x02
	ld	c,a
	ld	a,e
	adc	a,#0x00
	ld	h, a
	ld	l, c
	inc	hl
	ld	a, (hl)
	ld	h, #0x00
	add	a,#0xFB
	ld	-7 (ix),a
	ld	a,h
	adc	a,#0x00
	ld	-6 (ix),a
	ld	a,#<(0x0107 + _game)
	add	a,b
	ld	c,a
	ld	a,#>(0x0107 + _game)
	adc	a,#0x00
	ld	h, a
	ld	l, c
	inc	hl
	ld	a, (hl)
	ld	h, #0x00
	add	a,#0xFA
	ld	e,a
	ld	a,h
	adc	a,#0xFF
	ld	d,a
	push	bc
	ld	hl,#0x000B
	push	hl
	ld	l, #0x0D
	push	hl
	ld	l, #0xD4
	push	hl
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	push	hl
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	push	hl
	push	de
	call	_VRAMtoVRAM
	ld	hl,#0x000C
	add	hl,sp
	ld	sp,hl
	pop	bc
;carwar.c:568: for(i=0; i<CAR_NUM; i++)
	ld	a,b
	add	a,#0x0F
	ld	b,a
	ld	a,-3 (ix)
	add	a,#0x0D
	ld	-3 (ix),a
	ld	a,-2 (ix)
	adc	a,#0x00
	ld	-2 (ix),a
	inc	-1 (ix)
	jp	00105$
00108$:
;carwar.c:575: ClearSprite();
	call	_ClearSprite
;carwar.c:577: game.state = StateUpdateGame;
	ld	hl,#0x0143 + _game
	ld	(hl),#<(_StateUpdateGame)
	inc	hl
	ld	(hl),#>(_StateUpdateGame)
	ld	sp,ix
	pop	ix
	ret
_StateStartGame_end::
__str_23:
	.ascii "INIT"
	.db 0x0A
	.ascii "CARS"
	.db 0x00
__str_24:
	.ascii "INIT"
	.db 0x0A
	.ascii "TRACK"
	.db 0x0A
	.ascii "BACKUP"
	.db 0x00
;carwar.c:581: void StateUpdateGame()
;	---------------------------------
; Function StateUpdateGame
; ---------------------------------
_StateUpdateGame_start::
_StateUpdateGame:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-21
	add	hl,sp
	ld	sp,hl
;carwar.c:588: SetPage8(game.page);
	ld	a,(#0x0004 + _game)
	push	af
	inc	sp
	call	_SetPage8
	inc	sp
;carwar.c:589: game.page = 1 - game.page;
	ld	hl,#0x0004 + _game
	ld	l,(hl)
	ld	a,#0x01
	sub	a,l
	ld	hl,#0x0004 + _game
	ld	(hl),a
;carwar.c:590: game.yOffset = 256 * game.page;
	ld	b, (hl)
	ld	c,#0x00
	ld	hl,#0x0005 + _game
	ld	(hl),c
	inc	hl
	ld	(hl),b
;carwar.c:592: for(i=0; i<CAR_NUM; i++)
	ld	bc,#0x0000
00147$:
	ld	a,c
	sub	a,#0x04
	jr	NC,00150$
;carwar.c:593: game.players[i].flag = 0;
	ld	a,#<(0x0107 + _game)
	add	a,b
	ld	e,a
	ld	a,#>(0x0107 + _game)
	adc	a,#0x00
	ld	d,a
	ld	hl,#0x000D
	add	hl,de
	ex	de,hl
	ld	a,#0x00
	ld	(de),a
;carwar.c:592: for(i=0; i<CAR_NUM; i++)
	ld	a,b
	add	a,#0x0F
	ld	b,a
	inc	c
	jr	00147$
00150$:
;carwar.c:597: curPly = &game.players[0];
	ld	hl,#_game + 263
	ld	-4 (ix),l
	ld	-3 (ix),h
;carwar.c:598: keyLine = GetKeyMatrixLine(8);
	ld	a,#0x08
	push	af
	inc	sp
	call	_GetKeyMatrixLine
	inc	sp
	ld	c,l
;carwar.c:599: if((keyLine & KEY_LEFT) == 0)
	ld	a,c
	and	a,#0x10
	jr	NZ,00102$
;carwar.c:600: curPly->flag |= CAR_TURN_LEFT;
	ld	a,-4 (ix)
	add	a,#0x0D
	ld	e,a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	or	a,#0x02
	ld	(de),a
00102$:
;carwar.c:601: if((keyLine & KEY_RIGHT) == 0)
	ld	a,c
	and	a,#0x80
	jr	NZ,00104$
;carwar.c:602: curPly->flag |= CAR_TURN_RIGHT;
	ld	a,-4 (ix)
	add	a,#0x0D
	ld	e,a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	or	a,#0x01
	ld	(de),a
00104$:
;carwar.c:603: if((keyLine & KEY_UP) == 0)
	ld	a,c
	and	a,#0x20
	jr	NZ,00106$
;carwar.c:604: curPly->flag |= CAR_MOVE;
	ld	a,-4 (ix)
	add	a,#0x0D
	ld	e,a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	or	a,#0x04
	ld	(de),a
00106$:
;carwar.c:608: curPly = &game.players[1];
	ld	hl,#0x0107 + _game + 15
	ld	-4 (ix),l
	ld	-3 (ix),h
;carwar.c:609: keyLine = GetKeyMatrixLine(5);
	ld	a,#0x05
	push	af
	inc	sp
	call	_GetKeyMatrixLine
	inc	sp
;carwar.c:610: if((keyLine & KEY_Z) == 0)
	ld	a, l
	and	a,#0x80
	jr	NZ,00108$
;carwar.c:611: curPly->flag |= CAR_TURN_LEFT;
	ld	a,-4 (ix)
	add	a,#0x0D
	ld	e,a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	or	a,#0x02
	ld	(de),a
00108$:
;carwar.c:612: keyLine = GetKeyMatrixLine(3);
	ld	a,#0x03
	push	af
	inc	sp
	call	_GetKeyMatrixLine
	inc	sp
;carwar.c:613: if((keyLine & KEY_C) == 0)
	ld	a, l
	and	a,#0x01
	jr	NZ,00110$
;carwar.c:614: curPly->flag |= CAR_TURN_RIGHT;
	ld	a,-4 (ix)
	add	a,#0x0D
	ld	e,a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	or	a,#0x01
	ld	(de),a
00110$:
;carwar.c:615: keyLine = GetKeyMatrixLine(5);
	ld	a,#0x05
	push	af
	inc	sp
	call	_GetKeyMatrixLine
	inc	sp
;carwar.c:616: if((keyLine & KEY_X) == 0)
	ld	a, l
	and	a,#0x20
	jr	NZ,00112$
;carwar.c:617: curPly->flag |= CAR_MOVE;
	ld	a,-4 (ix)
	add	a,#0x0D
	ld	e,a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	or	a,#0x04
	ld	(de),a
00112$:
;carwar.c:621: curPly = &game.players[2];
	ld	hl,#0x0107 + _game + 30
	ld	-4 (ix),l
	ld	-3 (ix),h
;carwar.c:622: switch (Joystick(1)) // Joy 1 direction
	ld	a,#0x01
	push	af
	inc	sp
	call	_Joystick
	inc	sp
	ld	a,l
	sub	a,#0x02
	jp	PO,00227$
	xor	a,#0x80
00227$:
	jp	M,00119$
	ld	a,#0x08
	sub	a,l
	jp	PO,00228$
	xor	a,#0x80
00228$:
	jp	M,00119$
	ld	a,l
	add	a,#0xFE
	ld	e,a
	push	de
	ld	d,#0x00
	ld	hl,#00229$
	add	hl,de
	add	hl,de
;carwar.c:624: case 2: // up-right
	pop	de
	jp	(hl)
00229$:
	jr	00113$
	jr	00114$
	jr	00115$
	jr	00119$
	jr	00116$
	jr	00117$
	jr	00118$
00113$:
;carwar.c:625: case 3: // right
00114$:
;carwar.c:626: case 4: // down-right
00115$:
;carwar.c:627: curPly->flag |= CAR_TURN_RIGHT;
	ld	a,-4 (ix)
	add	a,#0x0D
	ld	e,a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	or	a,#0x01
	ld	(de),a
;carwar.c:628: break;
	jr	00119$
;carwar.c:629: case 6: // down-left
00116$:
;carwar.c:630: case 7: // left
00117$:
;carwar.c:631: case 8:// up-left
00118$:
;carwar.c:632: curPly->flag |= CAR_TURN_LEFT;
	ld	a,-4 (ix)
	add	a,#0x0D
	ld	e,a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	or	a,#0x02
	ld	(de),a
;carwar.c:634: }
00119$:
;carwar.c:635: if(Joytrig(1) != 0) // Joy 1 Button A
	ld	a,#0x01
	push	af
	inc	sp
	call	_Joytrig
	inc	sp
	xor	a,a
	or	a,l
	jr	Z,00121$
;carwar.c:636: curPly->flag |= CAR_MOVE;
	ld	a,-4 (ix)
	add	a,#0x0D
	ld	e,a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	or	a,#0x04
	ld	(de),a
00121$:
;carwar.c:640: curPly = &game.players[3];
	ld	hl,#0x0107 + _game + 45
	ld	-4 (ix),l
	ld	-3 (ix),h
;carwar.c:641: switch (Joystick(2)) // Joy 2 direction
	ld	a,#0x02
	push	af
	inc	sp
	call	_Joystick
	inc	sp
	ld	a,l
	sub	a,#0x02
	jp	PO,00230$
	xor	a,#0x80
00230$:
	jp	M,00128$
	ld	a,#0x08
	sub	a,l
	jp	PO,00231$
	xor	a,#0x80
00231$:
	jp	M,00128$
	ld	a,l
	add	a,#0xFE
	ld	e,a
	push	de
	ld	d,#0x00
	ld	hl,#00232$
	add	hl,de
	add	hl,de
;carwar.c:643: case 2: // up-right
	pop	de
	jp	(hl)
00232$:
	jr	00122$
	jr	00123$
	jr	00124$
	jr	00128$
	jr	00125$
	jr	00126$
	jr	00127$
00122$:
;carwar.c:644: case 3: // right
00123$:
;carwar.c:645: case 4: // down-right
00124$:
;carwar.c:646: curPly->flag |= CAR_TURN_RIGHT;
	ld	a,-4 (ix)
	add	a,#0x0D
	ld	e,a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	or	a,#0x01
	ld	(de),a
;carwar.c:647: break;
	jr	00128$
;carwar.c:648: case 6: // down-left
00125$:
;carwar.c:649: case 7: // left
00126$:
;carwar.c:650: case 8:// up-left
00127$:
;carwar.c:651: curPly->flag |= CAR_TURN_LEFT;
	ld	a,-4 (ix)
	add	a,#0x0D
	ld	e,a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	or	a,#0x02
	ld	(de),a
;carwar.c:653: }
00128$:
;carwar.c:654: if(Joytrig(2) != 0) // Joy 2 Button A
	ld	a,#0x02
	push	af
	inc	sp
	call	_Joytrig
	inc	sp
	xor	a,a
	or	a,l
	jr	Z,00192$
;carwar.c:655: curPly->flag |= CAR_MOVE;
	ld	a,-4 (ix)
	add	a,#0x0D
	ld	e,a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	or	a,#0x04
	ld	(de),a
;carwar.c:659: for(i=0; i<CAR_NUM; i++)
00192$:
	ld	-1 (ix),#0x00
	ld	-11 (ix),#0x00
	ld	-10 (ix),#0x00
	ld	-9 (ix),#0x00
00151$:
	ld	a,-1 (ix)
	sub	a,#0x04
	jp	NC,00154$
;carwar.c:661: VRAMtoVRAM((13 * i) + (52 * game.page), 212, PosXToSprt(game.players[i].prevX), game.yOffset + PosYToSprt(game.players[i].prevY), 13, 11);
	ld	hl,#0x0005 + _game
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,#<(0x0107 + _game)
	add	a,-11 (ix)
	ld	e,a
	ld	a,#>(0x0107 + _game)
	adc	a,#0x00
	ld	d,a
	ld	hl,#0x0006+1
	add	hl,de
	ld	a, (hl)
	ld	h, #0x00
	add	a,#0xFB
	ld	l,a
	ld	a,h
	adc	a,#0xFF
	ld	h,a
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,#<(0x0107 + _game)
	add	a,-11 (ix)
	ld	l, a
	ld	a, #>(0x0107 + _game)
	adc	a, #0x00
	ld	h, a
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	h, #0x00
	add	a,#0xFA
	ld	-15 (ix),a
	ld	a,h
	adc	a,#0xFF
	ld	-14 (ix),a
	ld	hl,#0x0004 + _game
	ld	e, (hl)
	ld	d,#0x00
	ld	l,e
	ld	h,d
	add	hl,hl
	add	hl,de
	add	hl,hl
	add	hl,hl
	add	hl,de
	add	hl,hl
	add	hl,hl
	ex	de,hl
	ld	a,-10 (ix)
	add	a,e
	ld	e,a
	ld	a,-9 (ix)
	adc	a,d
	ld	d,a
	ld	hl,#0x000B
	push	hl
	ld	l, #0x0D
	push	hl
	push	bc
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	push	hl
	ld	hl,#0x00D4
	push	hl
	push	de
	call	_VRAMtoVRAM
	ld	iy,#0x000C
	add	iy,sp
	ld	sp,iy
;carwar.c:659: for(i=0; i<CAR_NUM; i++)
	ld	a,-11 (ix)
	add	a,#0x0F
	ld	-11 (ix),a
	ld	a,-10 (ix)
	add	a,#0x0D
	ld	-10 (ix),a
	ld	a,-9 (ix)
	adc	a,#0x00
	ld	-9 (ix),a
	inc	-1 (ix)
	jp	00151$
00154$:
;carwar.c:666: for(i=0; i<CAR_NUM; i++)
	ld	-1 (ix),#0x00
	ld	-15 (ix),#0x00
00155$:
	ld	a,-1 (ix)
	sub	a,#0x04
	jp	NC,00158$
;carwar.c:668: curPly = &game.players[i];
	ld	a,#<(0x0107 + _game)
	add	a,-15 (ix)
	ld	e,a
	ld	a,#>(0x0107 + _game)
	adc	a,#0x00
	ld	-4 (ix), e
	ld	-3 (ix), a
;carwar.c:672: x = Abs16(curPly->velX);
	ld	a,-4 (ix)
	add	a,#0x08
	ld	l, a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	h, a
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,d
	and	a,#0x80
	jr	Z,00169$
	ld	c,e
	ld	b,d
	dec	bc
	ld	a,c
	cpl
	ld	c,a
	ld	a,b
	cpl
	ld	b,a
	jr	00170$
00169$:
	ld	c,e
	ld	b,d
00170$:
	ld	-6 (ix),c
;carwar.c:673: x >>= 8;
	ld	-5 (ix), b
	ld	-6 (ix), b
	ld	-5 (ix),#0x00
;carwar.c:674: y = Abs16(curPly->velY);
	ld	a,-4 (ix)
	add	a,#0x0A
	ld	-10 (ix),a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	-9 (ix),a
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,d
	and	a,#0x80
	jr	Z,00171$
	ld	c,e
	ld	b,d
	dec	bc
	ld	a,c
	cpl
	ld	c,a
	ld	a,b
	cpl
	ld	b,a
	jr	00172$
00171$:
	ld	b,d
00172$:
;carwar.c:675: y >>= 8;
	ld	c,b
	ld	b,#0x00
;carwar.c:676: speedSq = (x * x) + (y * y);
	push	bc
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	call	__mulint_rrx_s
	pop	af
	pop	af
	ex	de,hl
	pop	bc
	push	de
	push	bc
	push	bc
	call	__mulint_rrx_s
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	pop	de
	ld	a,e
	add	a,c
	ld	c,a
	ld	a,d
	adc	a,b
	ld	-8 (ix), c
	ld	-7 (ix), a
;carwar.c:677: if(speedSq <= (FRICTION * FRICTION))
	ld	a,#0x04
	sub	a,-8 (ix)
	ld	a,#0x00
	sbc	a,-7 (ix)
	jr	C,00132$
;carwar.c:679: curPly->velX = 0;
	ld	a,-4 (ix)
	add	a,#0x08
	ld	l, a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	h, a
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;carwar.c:680: curPly->velY = 0;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	jp	00133$
00132$:
;carwar.c:684: dir = VectorToAngle64(curPly->velX, curPly->velY);
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,-4 (ix)
	add	a,#0x08
	ld	-17 (ix),a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	-16 (ix),a
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	bc
	push	de
	call	_VectorToAngle64
	pop	af
	pop	af
;carwar.c:685: dir &= 0x3F; // %64
	ld	-2 (ix), l
	ld	a, l
	and	a,#0x3F
	ld	-2 (ix),a
;carwar.c:686: curPly->velX -= FRICTION * g_Cosinus64[dir];
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,-2 (ix)
	add	a,a
	ld	-11 (ix),a
	add	a,#<(_g_Cosinus64)
	ld	l, a
	ld	a, #>(_g_Cosinus64)
	adc	a, #0x00
	ld	h, a
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	add	hl,hl
	ld	a,c
	sub	a,l
	ld	e,a
	ld	a,b
	sbc	a,h
	ld	d,a
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:687: curPly->velY -= FRICTION * g_Sinus64[dir];
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,#<(_g_Sinus64)
	add	a,-11 (ix)
	ld	l, a
	ld	a, #>(_g_Sinus64)
	adc	a, #0x00
	ld	h, a
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	add	hl,hl
	ld	a,c
	sub	a,l
	ld	e,a
	ld	a,b
	sbc	a,h
	ld	d,a
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
00133$:
;carwar.c:695: if(curPly->flag & CAR_TURN_LEFT)
	ld	a,-4 (ix)
	add	a,#0x0D
	ld	c,a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	b,a
	ld	a,(bc)
	and	a,#0x02
	jr	Z,00135$
;carwar.c:697: curPly->rot += cars[curPly->car].rotSpeed; 
	ld	a,-4 (ix)
	add	a,#0x0E
	ld	-13 (ix),a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	-12 (ix),a
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a,(hl)
	ld	-11 (ix),a
	ld	a,-4 (ix)
	add	a,#0x0C
	ld	e,a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	ld	e,a
	add	a,a
	add	a,e
	add	a,#<(_cars)
	ld	e,a
	ld	a,#>(_cars)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	ld	l,a
	ld	a,-11 (ix)
	add	a,l
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	(hl),a
00135$:
;carwar.c:699: if(curPly->flag & CAR_TURN_RIGHT)
	ld	a,(bc)
	and	a,#0x01
	jr	Z,00137$
;carwar.c:701: curPly->rot -= cars[curPly->car].rotSpeed; 
	ld	a,-4 (ix)
	add	a,#0x0E
	ld	-13 (ix),a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	-12 (ix),a
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a,(hl)
	ld	-11 (ix),a
	ld	a,-4 (ix)
	add	a,#0x0C
	ld	e,a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	ld	e,a
	add	a,a
	add	a,e
	add	a,#<(_cars)
	ld	e,a
	ld	a,#>(_cars)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	ld	l,a
	ld	a,-11 (ix)
	sub	a,l
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	(hl),a
00137$:
;carwar.c:703: if(curPly->flag & CAR_MOVE)
	ld	a,(bc)
	and	a,#0x04
	jp	Z,00139$
;carwar.c:705: angle = curPly->rot / 4;
	ld	a,-4 (ix)
	add	a,#0x0E
	ld	e,a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	ld	c,a
	srl	c
	srl	c
;carwar.c:706: curPly->velX += cars[curPly->car].accel * g_Cosinus64[angle];
	ld	a,-4 (ix)
	add	a,#0x08
	ld	-17 (ix),a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	-16 (ix),a
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	a,(hl)
	ld	-13 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-12 (ix),a
	ld	a,-4 (ix)
	add	a,#0x0C
	ld	e,a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	ld	e,a
	add	a,a
	add	a,e
	add	a,#<(_cars)
	ld	e,a
	ld	a,#>(_cars)
	adc	a,#0x00
	ld	d,a
	inc	de
	inc	de
	ld	a,(de)
	ld	b,a
	sla	c
	ld	a,#<(_g_Cosinus64)
	add	a,c
	ld	l, a
	ld	a, #>(_g_Cosinus64)
	adc	a, #0x00
	ld	h, a
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	ld	-19 (ix),b
	ld	-18 (ix),#0x00
	push	bc
	push	hl
	ld	l,-19 (ix)
	ld	h,-18 (ix)
	push	hl
	call	__mulint_rrx_s
	pop	af
	pop	af
	ex	de,hl
	pop	bc
	ld	a,-13 (ix)
	add	a,e
	ld	e,a
	ld	a,-12 (ix)
	adc	a,d
	ld	d,a
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:707: curPly->velY += cars[curPly->car].accel * g_Sinus64[angle];
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a,(hl)
	ld	-17 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-16 (ix),a
	ld	a,#<(_g_Sinus64)
	add	a,c
	ld	l, a
	ld	a, #>(_g_Sinus64)
	adc	a, #0x00
	ld	h, a
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	l,-19 (ix)
	ld	h,-18 (ix)
	push	hl
	call	__mulint_rrx_s
	pop	af
	pop	af
	ex	de,hl
	ld	a,-17 (ix)
	add	a,e
	ld	e,a
	ld	a,-16 (ix)
	adc	a,d
	ld	d,a
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
00139$:
;carwar.c:711: x = Abs16(curPly->velX);
	ld	a,-4 (ix)
	add	a,#0x08
	ld	-17 (ix),a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	-16 (ix),a
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,b
	and	a,#0x80
	jr	Z,00173$
	ld	e,c
	ld	d,b
	dec	de
	ld	a,e
	cpl
	ld	e,a
	ld	a,d
	cpl
	ld	d,a
	jr	00174$
00173$:
	ld	e,c
	ld	d,b
00174$:
	ld	-6 (ix),e
;carwar.c:712: x >>= 8;
	ld	-5 (ix), d
	ld	-6 (ix), d
	ld	-5 (ix),#0x00
;carwar.c:713: y = Abs16(curPly->velY);
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,b
	and	a,#0x80
	jr	Z,00175$
	ld	e,c
	ld	d,b
	dec	de
	ld	a,e
	cpl
	ld	e,a
	ld	a,d
	cpl
	ld	d,a
	jr	00176$
00175$:
	ld	d,b
00176$:
;carwar.c:714: y >>= 8;
	ld	c, d
	ld	b,#0x00
;carwar.c:715: speedSq = (x * x) + (y * y);
	push	bc
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	call	__mulint_rrx_s
	pop	af
	pop	af
	ld	-18 (ix),h
	ld	-19 (ix),l
	pop	bc
	push	bc
	push	bc
	call	__mulint_rrx_s
	pop	af
	pop	af
	ex	de,hl
	ld	a,-19 (ix)
	add	a,e
	ld	e,a
	ld	a,-18 (ix)
	adc	a,d
	ld	-8 (ix), e
	ld	-7 (ix), a
;carwar.c:716: if(speedSq > cars[curPly->car].maxSpeed * cars[curPly->car].maxSpeed)
	ld	a,-4 (ix)
	add	a,#0x0C
	ld	e,a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	ld	l,a
	push	de
	ld	a,l
	ld	e,a
	add	a,a
	add	a,e
	pop	de
	add	a,#<(_cars)
	ld	c,a
	ld	a,#>(_cars)
	adc	a,#0x00
	ld	b,a
	inc	bc
	ld	a,(bc)
	ld	l,a
	push	de
	ld	e,l
	ld	h,l
	ld	l,#0x00
	ld	d,l
	ld	b,#0x08
00240$:
	add	hl,hl
	jr	NC,00241$
	add	hl,de
00241$:
	djnz	00240$
	pop	de
	ld	a, l
	ld	b, h
	sub	a,-8 (ix)
	ld	a,b
	sbc	a,-7 (ix)
	jp	NC,00141$
;carwar.c:718: dir = VectorToAngle64(curPly->velX, curPly->velY);
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a,(hl)
	ld	-19 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-18 (ix),a
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	push	de
	ld	l,-19 (ix)
	ld	h,-18 (ix)
	push	hl
	push	bc
	call	_VectorToAngle64
	pop	af
	pop	af
	pop	de
;carwar.c:719: dir &= 0x3F; // %64
	ld	-2 (ix), l
	ld	a, l
	and	a,#0x3F
	ld	-2 (ix),a
;carwar.c:720: curPly->velX = cars[curPly->car].maxSpeed * g_Cosinus64[dir];
	ld	a,(de)
	ld	e,a
	add	a,a
	add	a,e
	add	a,#<(_cars)
	ld	c,a
	ld	a,#>(_cars)
	adc	a,#0x00
	ld	b,a
	inc	bc
	ld	a,(bc)
	ld	c,a
	ld	a,-2 (ix)
	add	a,a
	ld	-19 (ix),a
	add	a,#<(_g_Cosinus64)
	ld	l, a
	ld	a, #>(_g_Cosinus64)
	adc	a, #0x00
	ld	d, a
	ld	h, a
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	ld	e,#0x00
	push	bc
	push	de
	push	hl
	ld	l,c
	ld	h,e
	push	hl
	call	__mulint_rrx_s
	pop	af
	pop	af
	ld	b,h
	ld	a, l
	pop	de
	ld	d,a
	ld	a,b
	pop	bc
	ld	b,a
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	(hl),d
	inc	hl
	ld	(hl),b
;carwar.c:721: curPly->velY = cars[curPly->car].maxSpeed * g_Sinus64[dir];
	ld	a,#<(_g_Sinus64)
	add	a,-19 (ix)
	ld	l, a
	ld	a, #>(_g_Sinus64)
	adc	a, #0x00
	ld	h, a
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	l,c
	ld	h,e
	push	hl
	call	__mulint_rrx_s
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
00141$:
;carwar.c:725: curPly->prevX = curPly->posX;
	ld	a,-4 (ix)
	add	a,#0x04
	ld	c,a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	b,a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,c
	ld	h,b
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:726: curPly->prevY = curPly->posY;
	ld	a,-4 (ix)
	add	a,#0x06
	ld	c,a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	b,a
	ld	a,-4 (ix)
	add	a,#0x02
	ld	-13 (ix),a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	-12 (ix),a
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a,(hl)
	ld	-21 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-20 (ix),a
	ld	l,c
	ld	h,b
	ld	a,-21 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-20 (ix)
	ld	(hl),a
;carwar.c:727: curPly->posX += curPly->velX / 8;
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	push	de
	ld	hl,#0x0008
	push	hl
	push	bc
	call	__divsint_rrx_s
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	pop	de
	ld	a,e
	add	a,c
	ld	c,a
	ld	a,d
	adc	a,b
	ld	b,a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
;carwar.c:728: curPly->posY -= curPly->velY / 8;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x0008
	push	hl
	push	bc
	call	__divsint_rrx_s
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	ld	a,-21 (ix)
	sub	a,c
	ld	c,a
	ld	a,-20 (ix)
	sbc	a,b
	ld	b,a
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
;carwar.c:666: for(i=0; i<CAR_NUM; i++)
	ld	a,-15 (ix)
	add	a,#0x0F
	ld	-15 (ix),a
	inc	-1 (ix)
	jp	00155$
00158$:
;carwar.c:733: CheckCollision(0, 1);
	ld	hl,#0x0100
	push	hl
	call	_CheckCollision
;carwar.c:735: CheckCollision(0, 2);
	ld	hl,#0x0200
	ex	(sp),hl
	call	_CheckCollision
;carwar.c:736: CheckCollision(1, 2);
	ld	hl,#0x0201
	ex	(sp),hl
	call	_CheckCollision
;carwar.c:738: CheckCollision(0, 3);
	ld	hl,#0x0300
	ex	(sp),hl
	call	_CheckCollision
;carwar.c:739: CheckCollision(1, 3);
	ld	hl,#0x0301
	ex	(sp),hl
	call	_CheckCollision
;carwar.c:740: CheckCollision(2, 3);
	ld	hl,#0x0302
	ex	(sp),hl
	call	_CheckCollision
	pop	af
;carwar.c:743: for(i=0; i<CAR_NUM; i++)
	ld	-1 (ix),#0x00
	ld	-21 (ix),#0x00
	ld	de,#0x0000
00159$:
	ld	a,-1 (ix)
	sub	a,#0x04
	jp	NC,00162$
;carwar.c:745: curPly = &game.players[i];
	ld	a,#<(0x0107 + _game)
	add	a,-21 (ix)
	ld	c,a
	ld	a,#>(0x0107 + _game)
	adc	a,#0x00
	ld	-4 (ix), c
	ld	-3 (ix), a
;carwar.c:746: if(curPly->posY < (5 << 8))
	ld	c,-4 (ix)
	ld	b,-3 (ix)
	inc	bc
	inc	bc
	ld	l,c
	ld	h,b
	inc	hl
	ld	a, (hl)
	sub	a,#0x05
	jr	NC,00145$
;carwar.c:747: curPly->posY = (5 << 8);
	ld	l,c
	ld	h,b
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x05
	jr	00146$
00145$:
;carwar.c:748: else if(curPly->posY > (206 << 8))
	ld	l,c
	ld	h,b
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	ld	a,#0x00
	sub	a,l
	ld	a,#0xCE
	sbc	a,h
	jr	NC,00146$
;carwar.c:749: curPly->posY = (206 << 8);
	ld	l,c
	ld	h,b
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0xCE
00146$:
;carwar.c:752: VRAMtoVRAM(PosXToSprt(curPly->posX), game.yOffset + PosYToSprt(curPly->posY), (13 * i) + (52 * game.page), 212, 13, 11);
	ld	hl,#0x0004 + _game
	ld	l,(hl)
	push	de
	ld	e,l
	ld	d,#0x00
	ld	l,e
	ld	h,d
	add	hl,hl
	add	hl,de
	add	hl,hl
	add	hl,hl
	add	hl,de
	add	hl,hl
	add	hl,hl
	pop	de
	ld	c,l
	ld	b,h
	ld	a,e
	add	a,c
	ld	-19 (ix),a
	ld	a,d
	adc	a,b
	ld	-18 (ix),a
	ld	hl,#0x0005 + _game
	ld	a,(hl)
	ld	-17 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-16 (ix),a
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	h, #0x00
	add	a,#0xFB
	ld	l,a
	ld	a,h
	adc	a,#0xFF
	ld	h,a
	ld	a,-17 (ix)
	add	a,l
	ld	-17 (ix),a
	ld	a,-16 (ix)
	adc	a,h
	ld	-16 (ix),a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	inc	hl
	ld	a, (hl)
	ld	h, #0x00
	add	a,#0xFA
	ld	c,a
	ld	a,h
	adc	a,#0xFF
	ld	b,a
	push	de
	ld	hl,#0x000B
	push	hl
	ld	l, #0x0D
	push	hl
	ld	l, #0xD4
	push	hl
	ld	l,-19 (ix)
	ld	h,-18 (ix)
	push	hl
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	push	hl
	push	bc
	call	_VRAMtoVRAM
	ld	hl,#0x000C
	add	hl,sp
	ld	sp,hl
	pop	de
;carwar.c:743: for(i=0; i<CAR_NUM; i++)
	ld	a,-21 (ix)
	add	a,#0x0F
	ld	-21 (ix),a
	ld	hl,#0x000D
	add	hl,de
	ex	de,hl
	inc	-1 (ix)
	jp	00159$
00162$:
;carwar.c:757: for(i=0; i<CAR_NUM; i++)
	ld	-1 (ix),#0x00
	ld	b,#0x00
	ld	-21 (ix),#0x00
	ld	-20 (ix),#0x00
00163$:
	ld	a,-1 (ix)
	sub	a,#0x04
	jp	NC,00166$
;carwar.c:759: VRAMtoVRAMTrans(13 * (game.players[i].rot / 16), 256 + 212 + (11 * i), PosXToSprt(game.players[i].posX), game.yOffset + PosYToSprt(game.players[i].posY), 13, 11);
	ld	hl,#0x0005 + _game
	ld	a,(hl)
	ld	-19 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-18 (ix),a
	ld	a,#<(0x0107 + _game)
	add	a,b
	ld	d,a
	ld	a,#>(0x0107 + _game)
	adc	a,#0x00
	ld	c,a
	ld	a,d
	add	a,#0x02
	ld	d,a
	ld	a,c
	adc	a,#0x00
	ld	h, a
	ld	l, d
	inc	hl
	ld	a, (hl)
	ld	h, #0x00
	add	a,#0xFB
	ld	l,a
	ld	a,h
	adc	a,#0xFF
	ld	h,a
	ld	a,-19 (ix)
	add	a,l
	ld	-19 (ix),a
	ld	a,-18 (ix)
	adc	a,h
	ld	-18 (ix),a
	ld	a,#<(0x0107 + _game)
	add	a,b
	ld	l, a
	ld	a, #>(0x0107 + _game)
	adc	a, #0x00
	ld	h, a
	inc	hl
	ld	a, (hl)
	ld	h, #0x00
	add	a,#0xFA
	ld	-17 (ix),a
	ld	a,h
	adc	a,#0xFF
	ld	-16 (ix),a
	ld	a,-21 (ix)
	add	a,#0xD4
	ld	-15 (ix),a
	ld	a,-20 (ix)
	adc	a,#0x01
	ld	-14 (ix),a
	ld	a,#<(0x0107 + _game)
	add	a,b
	ld	d,a
	ld	a,#>(0x0107 + _game)
	adc	a,#0x00
	ld	c,a
	ld	a,d
	add	a,#0x0E
	ld	d,a
	ld	a,c
	adc	a,#0x00
	ld	c, a
	ld	l, d
	ld	h, a
	ld	a,(hl)
	srl	a
	srl	a
	srl	a
	srl	a
	ld	e, a
	ld	d, #0x00
	ld	l, a
	ld	h,d
	add	hl,hl
	add	hl,de
	add	hl,hl
	add	hl,hl
	add	hl,de
	ex	de,hl
	push	bc
	ld	hl,#0x000B
	push	hl
	ld	l, #0x0D
	push	hl
	ld	l,-19 (ix)
	ld	h,-18 (ix)
	push	hl
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	push	hl
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	push	hl
	push	de
	call	_VRAMtoVRAMTrans
	ld	hl,#0x000C
	add	hl,sp
	ld	sp,hl
	pop	bc
;carwar.c:757: for(i=0; i<CAR_NUM; i++)
	ld	a,b
	add	a,#0x0F
	ld	b,a
	ld	a,-21 (ix)
	add	a,#0x0B
	ld	-21 (ix),a
	ld	a,-20 (ix)
	adc	a,#0x00
	ld	-20 (ix),a
	inc	-1 (ix)
	jp	00163$
00166$:
;carwar.c:762: waitRetrace();
	call	_waitRetrace
	ld	sp,ix
	pop	ix
	ret
_StateUpdateGame_end::
;carwar.c:766: void InitializePlayer(Player* ply, u8 car, u8 posX, u8 posY)
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
;carwar.c:768: ply->car = car; // car index
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	hl,#0x000C
	add	hl,bc
	ex	de,hl
	ld	a,6 (ix)
	ld	(de),a
;carwar.c:769: ply->posX = posX << 8; // position X
	ld	d, 7 (ix)
	ld	e,#0x00
	ld	l,c
	ld	h,b
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:770: ply->posY = posY << 8; // position Y
	ld	hl,#0x0002
	add	hl,bc
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	d, 8 (ix)
	ld	e,#0x00
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:771: ply->prevX = ply->posX; // previous position X
	ld	hl,#0x0004
	add	hl,bc
	ld	-4 (ix),l
	ld	-3 (ix),h
	ld	l,c
	ld	h,b
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:772: ply->prevY = ply->posY; // previous position Y
	ld	hl,#0x0006
	add	hl,bc
	ld	-4 (ix),l
	ld	-3 (ix),h
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:773: ply->rot = 64; // rotation
	ld	hl,#0x000E
	add	hl,bc
	ex	de,hl
	ld	a,#0x40
	ld	(de),a
;carwar.c:774: ply->velX = 0; // velocity X
	ld	hl,#0x0008
	add	hl,bc
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;carwar.c:775: ply->velY = 0; // velocity Y
	ld	hl,#0x000A
	add	hl,bc
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	ld	sp,ix
	pop	ix
	ret
_InitializePlayer_end::
;carwar.c:779: i8 AngleDifferent64(i8 angleA, i8 angleB)
;	---------------------------------
; Function AngleDifferent64
; ---------------------------------
_AngleDifferent64_start::
_AngleDifferent64:
	push	ix
	ld	ix,#0
	add	ix,sp
;carwar.c:782: diff = angleB - angleA;
	ld	a,5 (ix)
	sub	a,4 (ix)
;carwar.c:783: if(diff < -32)
	ld	c,a
	sub	a,#0xE0
	jp	PO,00109$
	xor	a,#0x80
00109$:
	jp	P,00102$
;carwar.c:784: diff += 64;
	ld	a,c
	add	a,#0x40
	ld	c,a
00102$:
;carwar.c:785: if(diff > 32)
	ld	a,#0x20
	sub	a,c
	jp	PO,00110$
	xor	a,#0x80
00110$:
	jp	P,00104$
;carwar.c:786: diff -= 64;
	ld	a,c
	add	a,#0xC0
	ld	c,a
00104$:
;carwar.c:787: return diff;
	ld	l,c
	pop	ix
	ret
_AngleDifferent64_end::
;carwar.c:791: u8 VectorToAngle64(i16 x, i16 y)
;	---------------------------------
; Function VectorToAngle64
; ---------------------------------
_VectorToAngle64_start::
_VectorToAngle64:
	push	ix
	ld	ix,#0
	add	ix,sp
;carwar.c:793: while(Abs16(x) > 15 || Abs16(y) > 15)
00102$:
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	a,b
	and	a,#0x80
	jr	Z,00107$
	ld	l,c
	ld	h,b
	ld	e,l
	ld	d,h
	dec	de
	ld	a,e
	cpl
	ld	e,a
	ld	a,d
	cpl
	ld	d,a
	jr	00108$
00107$:
	ld	e,c
	ld	d,b
00108$:
	ld	a,#0x0F
	sub	a,e
	ld	a,#0x00
	sbc	a,d
	jr	C,00103$
	ld	c,6 (ix)
	ld	b,7 (ix)
	ld	a,b
	and	a,#0x80
	jr	Z,00109$
	ld	l,c
	ld	h,b
	ld	e,l
	ld	d,h
	dec	de
	ld	a,e
	cpl
	ld	e,a
	ld	a,d
	cpl
	ld	d,a
	jr	00110$
00109$:
	ld	e,c
	ld	d,b
00110$:
	ld	a,#0x0F
	sub	a,e
	ld	a,#0x00
	sbc	a,d
	jr	NC,00104$
00103$:
;carwar.c:795: x /= 2;
	ld	hl,#0x0002
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	__divsint_rrx_s
	pop	af
	pop	af
	ld	4 (ix), l
	ld	5 (ix), h
;carwar.c:796: y /= 2;
	ld	hl,#0x0002
	push	hl
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	__divsint_rrx_s
	pop	af
	pop	af
	ld	6 (ix), l
	ld	7 (ix), h
	jr	00102$
00104$:
;carwar.c:798: x += 15; // x E [0;30]
	ld	a,4 (ix)
	add	a,#0x0F
	ld	4 (ix),a
	ld	a,5 (ix)
	adc	a,#0x00
	ld	5 (ix),a
;carwar.c:799: y += 15; // x E [0;30]
	ld	a,6 (ix)
	add	a,#0x0F
	ld	6 (ix),a
	ld	a,7 (ix)
	adc	a,#0x00
	ld	7 (ix),a
;carwar.c:800: return g_Rotation16[(x * 31) + y];
	ld	e,4 (ix)
	ld	d,5 (ix)
	ld	l,e
	ld	h,d
	add	hl,hl
	add	hl,de
	add	hl,hl
	add	hl,de
	add	hl,hl
	add	hl,de
	add	hl,hl
	add	hl,de
	ld	a, l
	ld	b, h
	add	a,6 (ix)
	ld	c,a
	ld	a,b
	adc	a,7 (ix)
	ld	b,a
	ld	hl,#_g_Rotation16
	add	hl,bc
	ld	l, (hl)
	pop	ix
	ret
_VectorToAngle64_end::
;carwar.c:804: u16 GetVectorLenght(i16 x, i16 y)
;	---------------------------------
; Function GetVectorLenght
; ---------------------------------
_GetVectorLenght_start::
_GetVectorLenght:
	push	ix
	ld	ix,#0
	add	ix,sp
;carwar.c:810: lenSq = x*x + y*y; // get squared length
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	__mulint_rrx_s
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	push	bc
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	__mulint_rrx_s
	pop	af
	pop	af
	ex	de,hl
	pop	bc
	ld	a,c
	add	a,e
	ld	c,a
	ld	a,b
	adc	a,d
	ld	b,a
;carwar.c:811: while(lenSq >= 1024)
	ld	e,#0x01
00101$:
	ld	a,b
	sub	a,#0x04
	jr	C,00103$
;carwar.c:813: lenSq /= 2;
	srl	b
	rr	c
;carwar.c:814: div++;
	inc	e
	jr	00101$
00103$:
;carwar.c:816: div *= div; // squared the div factor
	ld	a, b
	push	de
	ld	h,e
	ld	l,#0x00
	ld	d,l
	ld	b,#0x08
00110$:
	add	hl,hl
	jr	NC,00111$
	add	hl,de
00111$:
	djnz	00110$
	pop	de
	ld	b, a
	ld	e,l
;carwar.c:817: ret = g_SquareRoot1024[lenSq]; // get square root (.2^3)
	ld	hl,#_g_SquareRoot1024
	add	hl,bc
	ld	a, (hl)
	ld	c,a
	rla	
	sbc	a,a
	ld	b,a
;carwar.c:818: ret *= div; // re-inject diviser
	ld	l,e
	ld	h,#0x00
	push	hl
	push	bc
	call	__mulint_rrx_s
	pop	af
	pop	af
;carwar.c:819: return ret >> 3; // get length
	srl	h
	rr	l
	srl	h
	rr	l
	srl	h
	rr	l
	pop	ix
	ret
_GetVectorLenght_end::
;carwar.c:823: void CheckCollision(u8 car1, u8 car2)
;	---------------------------------
; Function CheckCollision
; ---------------------------------
_CheckCollision_start::
_CheckCollision:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-8
	add	hl,sp
	ld	sp,hl
;carwar.c:826: dist = game.players[car2].posX - game.players[car1].posX;
	ld	a,5 (ix)
	ld	e,a
	add	a,a
	add	a,e
	add	a,a
	add	a,e
	add	a,a
	add	a,e
	ld	c, a
	add	a,#<(0x0107 + _game)
	ld	l, a
	ld	a, #>(0x0107 + _game)
	adc	a, #0x00
	ld	h, a
	ld	a,(hl)
	ld	-8 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-7 (ix),a
	ld	a,4 (ix)
	ld	e,a
	add	a,a
	add	a,e
	add	a,a
	add	a,e
	add	a,a
	add	a,e
	ld	b, a
	add	a,#<(0x0107 + _game)
	ld	l, a
	ld	a, #>(0x0107 + _game)
	adc	a, #0x00
	ld	h, a
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	ld	a,-8 (ix)
	sub	a,l
	ld	l,a
	ld	a,-7 (ix)
	sbc	a,h
	ld	-6 (ix), l
;carwar.c:827: x = dist >> 8;
	ld	-5 (ix), a
	ld	-2 (ix), a
	rlc	a
	sbc	a,a
	ld	-1 (ix),a
;carwar.c:828: dist = game.players[car2].posY - game.players[car1].posY;
	ld	a,#<(0x0107 + _game)
	add	a,c
	ld	l, a
	ld	a, #>(0x0107 + _game)
	adc	a, #0x00
	ld	h, a
	inc	hl
	inc	hl
	ld	a,(hl)
	ld	-8 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-7 (ix),a
	ld	a,#<(0x0107 + _game)
	add	a,b
	ld	l, a
	ld	a, #>(0x0107 + _game)
	adc	a, #0x00
	ld	h, a
	inc	hl
	inc	hl
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	ld	a,-8 (ix)
	sub	a,l
	ld	l,a
	ld	a,-7 (ix)
	sbc	a,h
	ld	-6 (ix), l
;carwar.c:829: y = dist >> 8;
	ld	-5 (ix), a
	ld	-4 (ix), a
	rlc	a
	sbc	a,a
	ld	-3 (ix),a
;carwar.c:830: dist = (x * x) + (y * y);
	push	bc
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	call	__mulint_rrx_s
	pop	af
	pop	af
	ld	-7 (ix),h
	ld	-8 (ix),l
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	call	__mulint_rrx_s
	pop	af
	pop	af
	ex	de,hl
	pop	bc
	ld	a,-8 (ix)
	add	a,e
	ld	e,a
	ld	a,-7 (ix)
	adc	a,d
	ld	-6 (ix), e
	ld	-5 (ix), a
;carwar.c:831: if(dist < 11 * 11) // Collision occured
	ld	a,-6 (ix)
	sub	a,#0x79
	ld	a,-5 (ix)
	sbc	a,#0x00
	jp	PO,00106$
	xor	a,#0x80
00106$:
	jp	P,00103$
;carwar.c:835: (game.players[car1].posY >> 8) + (y >> 1) - 4, 
	ld	a,#<(0x0107 + _game)
	add	a,b
	ld	l, a
	ld	a, #>(0x0107 + _game)
	adc	a, #0x00
	ld	h, a
	inc	hl
	inc	hl
	inc	hl
	ld	l, (hl)
	ld	e,-4 (ix)
	ld	d,-3 (ix)
	sra	d
	rr	e
	ld	a,l
	add	a,e
	add	a,#0xFC
	ld	-8 (ix),a
;carwar.c:834: (game.players[car1].posX >> 8) + (x >> 1) - 4, 
	ld	a,#<(0x0107 + _game)
	add	a,b
	ld	l, a
	ld	a, #>(0x0107 + _game)
	adc	a, #0x00
	ld	h, a
	inc	hl
	ld	l, (hl)
	ld	e,-2 (ix)
	ld	d,-1 (ix)
	sra	d
	rr	e
	ld	a,l
	add	a,e
	add	a,#0xFC
	ld	e,a
;carwar.c:833: SetSpriteUniColor(0, 
	push	bc
	ld	hl,#0x0F28
	push	hl
	ld	d, -8 (ix)
	push	de
	ld	a,#0x00
	push	af
	inc	sp
	call	_SetSpriteUniColor
	pop	af
	pop	af
	inc	sp
	ld	hl,#0x0000
	push	hl
	ld	h, #0xD8
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SetSpriteUniColor
	pop	af
	pop	af
	inc	sp
	pop	bc
;carwar.c:839: game.players[car1].velX = 0;
	ld	a,#<(0x0107 + _game)
	add	a,b
	ld	e,a
	ld	a,#>(0x0107 + _game)
	adc	a,#0x00
	ld	d,a
	ld	hl,#0x0008
	add	hl,de
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;carwar.c:840: game.players[car1].velY = 0;
	ld	a,#<(0x0107 + _game)
	add	a,b
	ld	e,a
	ld	a,#>(0x0107 + _game)
	adc	a,#0x00
	ld	d,a
	ld	hl,#0x000A
	add	hl,de
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;carwar.c:841: game.players[car2].velX = 0;
	ld	a,#<(0x0107 + _game)
	add	a,c
	ld	e,a
	ld	a,#>(0x0107 + _game)
	adc	a,#0x00
	ld	d,a
	ld	hl,#0x0008
	add	hl,de
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;carwar.c:842: game.players[car2].velY = 0;
	ld	a,#<(0x0107 + _game)
	add	a,c
	ld	e,a
	ld	a,#>(0x0107 + _game)
	adc	a,#0x00
	ld	d,a
	ld	hl,#0x000A
	add	hl,de
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;carwar.c:843: game.players[car1].posX = game.players[car1].prevX;
	ld	a,#<(0x0107 + _game)
	add	a,b
	ld	-8 (ix),a
	ld	a,#>(0x0107 + _game)
	adc	a,#0x00
	ld	-7 (ix),a
	ld	a,#<(0x0107 + _game)
	add	a,b
	ld	b,a
	ld	a,#>(0x0107 + _game)
	adc	a,#0x00
	ld	e,a
	ld	a,b
	add	a,#0x04
	ld	b,a
	ld	a,e
	adc	a,#0x00
	ld	h, a
	ld	l, b
	ld	b,(hl)
	inc	hl
	ld	e,(hl)
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),b
	inc	hl
	ld	(hl),e
;carwar.c:844: game.players[car2].posY = game.players[car2].prevY;
	ld	a,#<(0x0107 + _game)
	add	a,c
	ld	e,a
	ld	a,#>(0x0107 + _game)
	adc	a,#0x00
	ld	d,a
	inc	de
	inc	de
	ld	a,#<(0x0107 + _game)
	add	a,c
	ld	c,a
	ld	a,#>(0x0107 + _game)
	adc	a,#0x00
	ld	b,a
	ld	hl,#0x0006
	add	hl,bc
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ex	de,hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
00103$:
	ld	sp,ix
	pop	ix
	ret
_CheckCollision_end::
;carwar.c:849: void StateBuildTrack()
;	---------------------------------
; Function StateBuildTrack
; ---------------------------------
_StateBuildTrack_start::
_StateBuildTrack:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-29
	add	hl,sp
	ld	sp,hl
;carwar.c:855: PrintSprite(64, 64, "BUILD\nTRACK", (u16)&defaultColor);
	ld	c,#<(_defaultColor)
	ld	b,#>(_defaultColor)
	push	bc
	ld	hl,#__str_25
	push	hl
	ld	hl,#0x4040
	push	hl
	call	_PrintSprite
	pop	af
	pop	af
;carwar.c:857: FillVRAM(0, 0, 128, 212, COLOR_LIGHTBLUE);
	ld	h,#0x4B
	ex	(sp),hl
	inc	sp
	ld	hl,#0x00D4
	push	hl
	ld	l, #0x80
	push	hl
	ld	l, #0x00
	push	hl
	ld	l, #0x00
	push	hl
	call	_FillVRAM
	ld	hl,#0x0009
	add	hl,sp
	ld	sp,hl
;carwar.c:858: FillVRAM(128, 0, 128, 212, COLOR_LIGHTBLUE);
	ld	a,#0x4B
	push	af
	inc	sp
	ld	hl,#0x00D4
	push	hl
	ld	l, #0x80
	push	hl
	ld	l, #0x00
	push	hl
	ld	l, #0x80
	push	hl
	call	_FillVRAM
	ld	hl,#0x0009
	add	hl,sp
	ld	sp,hl
;carwar.c:859: for(i=0; i<7; i++)
	ld	-1 (ix),#0x00
00134$:
	ld	a,-1 (ix)
	sub	a,#0x07
	jp	NC,00137$
;carwar.c:861: for(j=0; j<6; j++)
	ld	-2 (ix),#0x00
	ld	-17 (ix),#0x00
	ld	-16 (ix),#0x00
00130$:
	ld	a,-2 (ix)
	sub	a,#0x06
	jp	NC,00136$
;carwar.c:863: block = &track01.tiles[i + j * 7];
	ld	hl,#0x0002 + _track01
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,-1 (ix)
	ld	-11 (ix),a
	ld	-10 (ix),#0x00
	ld	a,-11 (ix)
	add	a,-17 (ix)
	ld	c,a
	ld	a,-10 (ix)
	adc	a,-16 (ix)
	ld	b,a
	push	de
	ld	e,c
	ld	d,b
	ld	l,e
	ld	h,d
	add	hl,hl
	add	hl,de
	pop	de
	ld	c,l
	ld	b,h
	ld	a,e
	add	a,c
	ld	c,a
	ld	a,d
	adc	a,b
	ld	-9 (ix), c
	ld	-8 (ix), a
;carwar.c:864: if((block->tile & 0x0F) == 2) // Plein block
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	a,(hl)
	and	a,#0x0F
	sub	a,#0x02
	jr	NZ,00152$
;carwar.c:866: FillVRAM(16 + (32 * i), 8 + (32 * j), 32, 32, block->color1);
	ld	c,-9 (ix)
	ld	b,-8 (ix)
	inc	bc
	inc	bc
	ld	a,(bc)
	ld	e,a
	ld	l,-2 (ix)
	ld	h,#0x00
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	ld	a,l
	add	a,#0x08
	ld	-15 (ix),a
	ld	a,h
	adc	a,#0x00
	ld	-14 (ix),a
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	ld	bc, #0x0010
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	a,e
	push	af
	inc	sp
	ld	hl,#0x0020
	push	hl
	ld	l, #0x20
	push	hl
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	push	hl
	push	bc
	call	_FillVRAM
	ld	hl,#0x0009
	add	hl,sp
	ld	sp,hl
	jp	00132$
;carwar.c:870: for(x=0; x<32; x++)
00152$:
	ld	c,-9 (ix)
	ld	b,-8 (ix)
	inc	bc
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	ld	a,l
	add	a,#0x10
	ld	-15 (ix),a
	ld	a,h
	adc	a,#0x00
	ld	-14 (ix),a
	ld	a,-9 (ix)
	add	a,#0x02
	ld	-13 (ix),a
	ld	a,-8 (ix)
	adc	a,#0x00
	ld	-12 (ix),a
	ld	-5 (ix),#0x00
	ld	-4 (ix),#0x00
00126$:
	ld	a,-5 (ix)
	sub	a,#0x20
	ld	a,-4 (ix)
	sbc	a,#0x00
	jp	NC,00132$
;carwar.c:872: for(y=0; y<32; y++)
	ld	a,#0x1F
	sub	a,-5 (ix)
	ld	-11 (ix),a
	ld	a,#0x00
	sbc	a,-4 (ix)
	ld	-10 (ix),a
	ld	a,-11 (ix)
	ld	-19 (ix),a
	ld	a,-10 (ix)
	ld	-18 (ix),a
	ld	a,-11 (ix)
	ld	-21 (ix),a
	ld	a,-10 (ix)
	ld	-20 (ix),a
	ld	a,-15 (ix)
	add	a,-5 (ix)
	ld	-23 (ix),a
	ld	a,-14 (ix)
	adc	a,-4 (ix)
	ld	-22 (ix),a
	ld	a,-23 (ix)
	ld	-25 (ix),a
	ld	a,-22 (ix)
	ld	-24 (ix),a
	ld	-7 (ix),#0x00
	ld	-6 (ix),#0x00
00122$:
	ld	a,-7 (ix)
	sub	a,#0x20
	ld	a,-6 (ix)
	sbc	a,#0x00
	jp	NC,00128$
;carwar.c:874: if((block->tile & 0xF0) == ROT_0)        { lx = x;      ly = y; }
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	a,(hl)
	and	a,#0xF0
	ld	l,a
	or	a,a
	jr	NZ,00114$
	ld	a,-5 (ix)
	ld	-27 (ix),a
	ld	a,-4 (ix)
	ld	-26 (ix),a
	ld	a,-7 (ix)
	ld	-29 (ix),a
	ld	a,-6 (ix)
	ld	-28 (ix),a
	jp	00115$
00114$:
;carwar.c:875: else if((block->tile & 0xF0) == ROT_90)  { lx = y;      ly = 31 - x; }
	ld	a,l
	sub	a,#0x10
	jr	NZ,00111$
	ld	a,-7 (ix)
	ld	-27 (ix),a
	ld	a,-6 (ix)
	ld	-26 (ix),a
	ld	a,-21 (ix)
	ld	-29 (ix),a
	ld	a,-20 (ix)
	ld	-28 (ix),a
	jp	00115$
00111$:
;carwar.c:876: else if((block->tile & 0xF0) == ROT_180) { lx = 31 - x; ly = 31 - y; }
	ld	a,l
	sub	a,#0x20
	jr	NZ,00108$
	ld	a,-19 (ix)
	ld	-27 (ix),a
	ld	a,-18 (ix)
	ld	-26 (ix),a
	ld	a,#0x1F
	sub	a,-7 (ix)
	ld	-29 (ix),a
	ld	a,#0x00
	sbc	a,-6 (ix)
	ld	-28 (ix),a
	jr	00115$
00108$:
;carwar.c:877: else if((block->tile & 0xF0) == ROT_270) { lx = 31 - y; ly = x; }
	ld	a,l
	sub	a,#0x30
	jr	NZ,00105$
	ld	a,#0x1F
	sub	a,-7 (ix)
	ld	-27 (ix),a
	ld	a,#0x00
	sbc	a,-6 (ix)
	ld	-26 (ix),a
	ld	a,-5 (ix)
	ld	-29 (ix),a
	ld	a,-4 (ix)
	ld	-28 (ix),a
	jr	00115$
00105$:
;carwar.c:878: else if((block->tile & 0xF0) == SYM_H)   { lx = x;      ly = 31 - y; }
	ld	a,l
	sub	a,#0x40
	jr	NZ,00102$
	ld	a,-5 (ix)
	ld	-27 (ix),a
	ld	a,-4 (ix)
	ld	-26 (ix),a
	ld	a,#0x1F
	sub	a,-7 (ix)
	ld	-29 (ix),a
	ld	a,#0x00
	sbc	a,-6 (ix)
	ld	-28 (ix),a
	jr	00115$
00102$:
;carwar.c:879: else /* SYM_V */                         { lx = 31 - x; ly = y; }
	ld	a,-11 (ix)
	ld	-27 (ix),a
	ld	a,-10 (ix)
	ld	-26 (ix),a
	ld	a,-7 (ix)
	ld	-29 (ix),a
	ld	a,-6 (ix)
	ld	-28 (ix),a
00115$:
;carwar.c:880: byte = trackTiles[32 * 4 * (block->tile & 0x0F) + (lx / 8) + (ly * 32 / 8)];
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	a,(hl)
	and	a,#0x0F
	ld	l,a
	ld	h,#0x00
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	ld	e,-27 (ix)
	ld	d,-26 (ix)
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
	add	hl,de
	ex	de,hl
	ld	l,-29 (ix)
	ld	h,-28 (ix)
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	srl	h
	rr	l
	srl	h
	rr	l
	srl	h
	rr	l
	add	hl,de
	ld	de, #_trackTiles
	add	hl, de
	ld	a,(hl)
	ld	-3 (ix),a
;carwar.c:881: if(byte & (1 << (7 - (lx & 0x07))))
	ld	a,-27 (ix)
	and	a,#0x07
	ld	l,a
	ld	h,#0x00
	ld	a,#0x07
	sub	a,l
	ld	e,a
	ld	a,#0x00
	sbc	a,h
	ld	a,e
	inc	a
	push	af
	ld	de,#0x0001
	pop	af
	jr	00172$
00171$:
	sla	e
	rl	d
00172$:
	dec	a
	jr	NZ,00171$
	ld	a, -3 (ix)
	ld	h, #0x00
	and	a,e
	ld	l,a
	ld	a,h
	and	a,d
	ld	h,a
	ld	a,l
	or	a,h
	jr	Z,00117$
;carwar.c:882: WriteVRAM(0, (16 + 32 * i + x) + 256 * (8 + 32 * j + y), block->color1);
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a,(hl)
	ld	-29 (ix),a
	ld	l,-2 (ix)
	ld	h,#0x00
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	ld	de, #0x0008
	add	hl, de
	ld	a, l
	ld	d, h
	add	a,-7 (ix)
	ld	e,a
	ld	a,d
	adc	a,-6 (ix)
	ld	h,e
	ld	l,#0x00
	ld	a,-25 (ix)
	add	a,l
	ld	e,a
	ld	a,-24 (ix)
	adc	a,h
	ld	d,a
	push	bc
	ld	a,-29 (ix)
	push	af
	inc	sp
	push	de
	ld	a,#0x00
	push	af
	inc	sp
	call	_WriteVRAM
	pop	af
	pop	af
	pop	bc
	jr	00124$
00117$:
;carwar.c:884: WriteVRAM(0, (16 + 32 * i + x) + 256 * (8 + 32 * j + y), block->color0);
	ld	a,(bc)
	ld	-29 (ix),a
	ld	l,-2 (ix)
	ld	h,#0x00
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	ld	de, #0x0008
	add	hl, de
	ld	a, l
	ld	d, h
	add	a,-7 (ix)
	ld	e,a
	ld	a,d
	adc	a,-6 (ix)
	ld	h,e
	ld	l,#0x00
	ld	a,-23 (ix)
	add	a,l
	ld	e,a
	ld	a,-22 (ix)
	adc	a,h
	ld	d,a
	push	bc
	ld	a,-29 (ix)
	push	af
	inc	sp
	push	de
	ld	a,#0x00
	push	af
	inc	sp
	call	_WriteVRAM
	pop	af
	pop	af
	pop	bc
00124$:
;carwar.c:872: for(y=0; y<32; y++)
	inc	-7 (ix)
	jp	NZ,00122$
	inc	-6 (ix)
	jp	00122$
00128$:
;carwar.c:870: for(x=0; x<32; x++)
	inc	-5 (ix)
	jp	NZ,00126$
	inc	-4 (ix)
	jp	00126$
00132$:
;carwar.c:861: for(j=0; j<6; j++)
	ld	a,-17 (ix)
	add	a,#0x07
	ld	-17 (ix),a
	ld	a,-16 (ix)
	adc	a,#0x00
	ld	-16 (ix),a
	inc	-2 (ix)
	jp	00130$
00136$:
;carwar.c:859: for(i=0; i<7; i++)
	inc	-1 (ix)
	jp	00134$
00137$:
;carwar.c:890: ClearSprite();
	call	_ClearSprite
	ld	sp,ix
	pop	ix
	ret
_StateBuildTrack_end::
__str_25:
	.ascii "BUILD"
	.db 0x0A
	.ascii "TRACK"
	.db 0x00
;carwar.c:894: void StateShadeTrack()
;	---------------------------------
; Function StateShadeTrack
; ---------------------------------
_StateShadeTrack_start::
_StateShadeTrack:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-8
	add	hl,sp
	ld	sp,hl
;carwar.c:899: PrintSprite(64, 64, "SHADE\nTRACK", (u16)&defaultColor);
	ld	c,#<(_defaultColor)
	ld	b,#>(_defaultColor)
	push	bc
	ld	hl,#__str_26
	push	hl
	ld	hl,#0x4040
	push	hl
	call	_PrintSprite
	pop	af
	pop	af
;carwar.c:901: cur = ReadVRAM(0);
	ld	hl,#0x0000
	ex	(sp),hl
	call	_ReadVRAM
	pop	af
;carwar.c:902: for(x=0; x<256; x++)
	ld	-2 (ix),#0x00
	ld	-1 (ix),#0x00
00124$:
	ld	a,-1 (ix)
	sub	a,#0x01
	jp	NC,00127$
;carwar.c:904: for(y=0; y<211; y++)
	ld	-4 (ix),#0x00
	ld	-3 (ix),#0x00
00120$:
	ld	a,-4 (ix)
	sub	a,#0xD3
	ld	a,-3 (ix)
	sbc	a,#0x00
	jp	NC,00126$
;carwar.c:906: cur = ReadVRAM(x + 256 * y);
	ld	h,-4 (ix)
	ld	l,#0x00
	ld	a,-2 (ix)
	add	a,l
	ld	c,a
	ld	a,-1 (ix)
	adc	a,h
	ld	b,a
	push	bc
	call	_ReadVRAM
	pop	af
	ld	c,l
;carwar.c:907: next = ReadVRAM(x + 256 * (y + 1));
	ld	a,-4 (ix)
	add	a,#0x01
	ld	b,a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	h,b
	ld	l,#0x00
	ld	a,-2 (ix)
	add	a,l
	ld	e,a
	ld	a,-1 (ix)
	adc	a,h
	ld	d,a
	push	bc
	push	de
	call	_ReadVRAM
	pop	af
	pop	bc
	ld	b,l
;carwar.c:908: if(game.colorCode[cur] < OP_ROAD && game.colorCode[next] >= OP_ROAD)
	ld	l,c
	ld	h,#0x00
	ld	a,#<(0x0007 + _game)
	add	a,l
	ld	e,a
	ld	a,#>(0x0007 + _game)
	adc	a,h
	ld	d,a
	ld	a,(de)
	sub	a,#0x40
	jp	NC,00122$
	ld	l,b
	ld	h,#0x00
	ld	a,#<(0x0007 + _game)
	add	a,l
	ld	e,a
	ld	a,#>(0x0007 + _game)
	adc	a,h
	ld	d,a
	ld	a,(de)
	sub	a,#0x40
	jp	C,00122$
;carwar.c:910: for(i=0; i<BLOCK_SHADOW; i++)
	ld	-6 (ix),#0x00
	ld	-5 (ix),#0x00
00105$:
	ld	a,-6 (ix)
	sub	a,#0x03
	ld	a,-5 (ix)
	sbc	a,#0x00
	jr	NC,00108$
;carwar.c:912: cur = ReadVRAM(x + 256 * (y - i));
	ld	a,-4 (ix)
	sub	a,-6 (ix)
	ld	b,a
	ld	a,-3 (ix)
	sbc	a,-5 (ix)
	ld	e,a
	ld	h,b
	ld	l,#0x00
	ld	a,-2 (ix)
	add	a,l
	ld	-8 (ix),a
	ld	a,-1 (ix)
	adc	a,h
	ld	-7 (ix),a
	push	bc
	push	de
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	hl
	call	_ReadVRAM
	pop	af
	pop	de
	pop	bc
	ld	c,l
;carwar.c:913: if((y - i < 212) && (game.colorCode[cur] < OP_ROAD))
	ld	a,b
	sub	a,#0xD4
	ld	a,e
	sbc	a,#0x00
	jr	NC,00108$
	ld	l,c
	ld	h,#0x00
	ld	a,#<(0x0007 + _game)
	add	a,l
	ld	e,a
	ld	a,#>(0x0007 + _game)
	adc	a,h
	ld	d,a
	ld	a,(de)
	sub	a,#0x40
	jr	NC,00108$
;carwar.c:914: WriteVRAM(0, x + 256 * (y - i), DarkenColor(cur, SHADOW_POWER));
	ld	b, #0x02
	push	bc
	call	_DarkenColor
	pop	af
	ld	a,l
	push	af
	inc	sp
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	hl
	ld	a,#0x00
	push	af
	inc	sp
	call	_WriteVRAM
	pop	af
	pop	af
;carwar.c:910: for(i=0; i<BLOCK_SHADOW; i++)
	inc	-6 (ix)
	jr	NZ,00105$
	inc	-5 (ix)
	jr	00105$
00108$:
;carwar.c:918: for(i=1; i<=ROAD_SHADOW; i++)
	ld	-6 (ix),#0x01
	ld	-5 (ix),#0x00
00113$:
	ld	a,#0x04
	sub	a,-6 (ix)
	ld	a,#0x00
	sbc	a,-5 (ix)
	jr	C,00116$
;carwar.c:920: cur = ReadVRAM(x + 256 * (y + i));
	ld	a,-4 (ix)
	add	a,-6 (ix)
	ld	b,a
	ld	a,-3 (ix)
	adc	a,-5 (ix)
	ld	e,a
	ld	h,b
	ld	l,#0x00
	ld	a,-2 (ix)
	add	a,l
	ld	-8 (ix),a
	ld	a,-1 (ix)
	adc	a,h
	ld	-7 (ix),a
	push	bc
	push	de
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	hl
	call	_ReadVRAM
	pop	af
	pop	de
	pop	bc
	ld	c,l
;carwar.c:921: if((y + i < 212) && (game.colorCode[cur] >= OP_ROAD))
	ld	a,b
	sub	a,#0xD4
	ld	a,e
	sbc	a,#0x00
	jr	NC,00116$
	ld	l,c
	ld	h,#0x00
	ld	a,#<(0x0007 + _game)
	add	a,l
	ld	e,a
	ld	a,#>(0x0007 + _game)
	adc	a,h
	ld	d,a
	ld	a,(de)
	sub	a,#0x40
	jr	C,00116$
;carwar.c:922: WriteVRAM(0, x + 256 * (y + i), DarkenColor(cur, SHADOW_POWER));
	ld	b, #0x02
	push	bc
	call	_DarkenColor
	pop	af
	ld	a,l
	push	af
	inc	sp
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	hl
	ld	a,#0x00
	push	af
	inc	sp
	call	_WriteVRAM
	pop	af
	pop	af
;carwar.c:918: for(i=1; i<=ROAD_SHADOW; i++)
	inc	-6 (ix)
	jr	NZ,00113$
	inc	-5 (ix)
	jr	00113$
00116$:
;carwar.c:926: y += i;
	ld	a,-4 (ix)
	add	a,-6 (ix)
	ld	-4 (ix),a
	ld	a,-3 (ix)
	adc	a,-5 (ix)
	ld	-3 (ix),a
00122$:
;carwar.c:904: for(y=0; y<211; y++)
	inc	-4 (ix)
	jp	NZ,00120$
	inc	-3 (ix)
	jp	00120$
00126$:
;carwar.c:902: for(x=0; x<256; x++)
	inc	-2 (ix)
	jp	NZ,00124$
	inc	-1 (ix)
	jp	00124$
00127$:
;carwar.c:930: ClearSprite();
	call	_ClearSprite
	ld	sp,ix
	pop	ix
	ret
_StateShadeTrack_end::
__str_26:
	.ascii "SHADE"
	.db 0x0A
	.ascii "TRACK"
	.db 0x00
;carwar.c:936: u8 DarkenColor(u8 color, u8 power)
;	---------------------------------
; Function DarkenColor
; ---------------------------------
_DarkenColor_start::
_DarkenColor:
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;carwar.c:939: g = ((color & 0xE0) >> 5);
	ld	a,4 (ix)
	and	a,#0xE0
	ld	c,a
	srl	c
	srl	c
	srl	c
	srl	c
	srl	c
;carwar.c:940: r = ((color & 0x1C) >> 2);
	ld	a,4 (ix)
	and	a,#0x1C
	ld	b,a
	srl	b
	srl	b
;carwar.c:941: b = (color & 0x03);
	ld	a,4 (ix)
	and	a,#0x03
	ld	-1 (ix),a
;carwar.c:942: switch(power)
	ld	a,#0x07
	sub	a,5 (ix)
	jp	C,00109$
	push	de
	ld	e,5 (ix)
	ld	d,#0x00
	ld	hl,#00114$
	add	hl,de
	add	hl,de
	add	hl,de
	pop	de
	jp	(hl)
00114$:
	jp	00110$
	jp	00102$
	jp	00103$
	jp	00104$
	jp	00105$
	jp	00106$
	jp	00107$
	jp	00108$
;carwar.c:944: case 0: break;                       // x1
	jp	00110$
;carwar.c:945: case 1: TransformColor(7, 3); break; // x0.875
00102$:
	ld	e,c
	ld	d,#0x00
	ld	l,e
	ld	h,d
	add	hl,hl
	add	hl,de
	add	hl,hl
	add	hl,de
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	c,l
	ld	e,b
	ld	d,#0x00
	ld	l,e
	ld	h,d
	add	hl,hl
	add	hl,de
	add	hl,hl
	add	hl,de
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	b,l
	ld	e,-1 (ix)
	ld	d,#0x00
	ld	l,e
	ld	h,d
	add	hl,hl
	add	hl,de
	add	hl,hl
	add	hl,de
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	-1 (ix),l
	jp	00110$
;carwar.c:946: case 2: TransformColor(3, 2); break; // x0.75
00103$:
	ld	e,c
	ld	d,#0x00
	ld	l,e
	ld	h,d
	add	hl,hl
	add	hl,de
	sra	h
	rr	l
	sra	h
	rr	l
	ld	c,l
	ld	e,b
	ld	d,#0x00
	ld	l,e
	ld	h,d
	add	hl,hl
	add	hl,de
	sra	h
	rr	l
	sra	h
	rr	l
	ld	b,l
	ld	e,-1 (ix)
	ld	d,#0x00
	ld	l,e
	ld	h,d
	add	hl,hl
	add	hl,de
	sra	h
	rr	l
	sra	h
	rr	l
	ld	-1 (ix),l
	jp	00110$
;carwar.c:947: case 3: TransformColor(5, 3); break; // x0.625
00104$:
	ld	e,c
	ld	d,#0x00
	ld	l,e
	ld	h,d
	add	hl,hl
	add	hl,hl
	add	hl,de
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	c,l
	ld	e,b
	ld	d,#0x00
	ld	l,e
	ld	h,d
	add	hl,hl
	add	hl,hl
	add	hl,de
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	b,l
	ld	e,-1 (ix)
	ld	d,#0x00
	ld	l,e
	ld	h,d
	add	hl,hl
	add	hl,hl
	add	hl,de
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	-1 (ix),l
	jp	00110$
;carwar.c:948: case 4: TransformColor(1, 1); break; // x0.5
00105$:
	ld	l,c
	ld	h,#0x00
	sra	h
	rr	l
	ld	c,l
	ld	l,b
	ld	h,#0x00
	sra	h
	rr	l
	ld	b,l
	ld	l,-1 (ix)
	ld	h,#0x00
	sra	h
	rr	l
	ld	-1 (ix),l
	jp	00110$
;carwar.c:949: case 5: TransformColor(3, 3); break; // x0.375
00106$:
	ld	e,c
	ld	d,#0x00
	ld	l,e
	ld	h,d
	add	hl,hl
	add	hl,de
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	c,l
	ld	e,b
	ld	d,#0x00
	ld	l,e
	ld	h,d
	add	hl,hl
	add	hl,de
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	b,l
	ld	e,-1 (ix)
	ld	d,#0x00
	ld	l,e
	ld	h,d
	add	hl,hl
	add	hl,de
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	-1 (ix),l
	jr	00110$
;carwar.c:950: case 6: TransformColor(1, 2); break; // x0.25
00107$:
	ld	l,c
	ld	h,#0x00
	sra	h
	rr	l
	sra	h
	rr	l
	ld	c,l
	ld	l,b
	ld	h,#0x00
	sra	h
	rr	l
	sra	h
	rr	l
	ld	b,l
	ld	l,-1 (ix)
	ld	h,#0x00
	sra	h
	rr	l
	sra	h
	rr	l
	ld	-1 (ix),l
	jr	00110$
;carwar.c:951: case 7:                              // x0.125
00108$:
;carwar.c:952: default: TransformColor(1, 3); break;
00109$:
	ld	l,c
	ld	h,#0x00
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	c,l
	ld	l,b
	ld	h,#0x00
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	b,l
	ld	l,-1 (ix)
	ld	h,#0x00
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	-1 (ix),l
;carwar.c:953: }
00110$:
;carwar.c:954: return (g << 5) + (r << 2) + b;
	ld	a,c
	rrca
	rrca
	rrca
	and	a,#0xE0
	ld	l,a
	sla	b
	sla	b
	ld	a,l
	add	a,b
	add	a,-1 (ix)
	ld	l,a
	ld	sp,ix
	pop	ix
	ret
_DarkenColor_end::
;carwar.c:957: u8 GrayGradiant(u8 index)
;	---------------------------------
; Function GrayGradiant
; ---------------------------------
_GrayGradiant_start::
_GrayGradiant:
	push	ix
	ld	ix,#0
	add	ix,sp
;carwar.c:960: col = index & 0xF; // 0:16
	ld	a,4 (ix)
	and	a,#0x0F
	ld	c,a
;carwar.c:961: col /= 2; // 0:8
	srl	c
;carwar.c:962: col += 2; // 2:10
	inc	c
	inc	c
;carwar.c:963: if(col > 5)
	ld	a,#0x05
	sub	a,c
	jr	NC,00102$
;carwar.c:964: col = 12 - col; // 2:5 & 6:3
	ld	a,#0x0C
	sub	a,c
	ld	c,a
00102$:
;carwar.c:965: return (col << 5) + (col << 2) + (col >> 1);
	ld	a,c
	rrca
	rrca
	rrca
	and	a,#0xE0
	ld	l,a
	ld	a,c
	add	a,a
	add	a,a
	add	a,l
	ld	l,a
	srl	c
	ld	a,l
	add	a,c
	ld	l,a
	pop	ix
	ret
_GrayGradiant_end::
;carwar.c:968: void DrawCharacter(u16 x, u16 y, u8 chr, u8 color)
;	---------------------------------
; Function DrawCharacter
; ---------------------------------
_DrawCharacter_start::
_DrawCharacter:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;carwar.c:972: HMMV(x, y, 8, 8, color);
	ld	hl,#0x0954 + _game
	ld	a,4 (ix)
	ld	(hl),a
	inc	hl
	ld	a,5 (ix)
	ld	(hl),a
	ld	hl,#0x0002 + 0x0954 + _game
	ld	a,6 (ix)
	ld	(hl),a
	inc	hl
	ld	a,7 (ix)
	ld	(hl),a
	inc	hl
	ld	(hl),#0x08
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x08
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	a,9 (ix)
	ld	(hl),a
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0xC0
	ld	l,#<(0x0954 + _game)
	ld	h,#>(0x0954 + _game)
	push	hl
	call	_VPDCommand36
	pop	af
;carwar.c:973: for(j=0; j<8; j++)
	ld	-2 (ix),#0x00
	ld	-1 (ix),#0x00
00101$:
	ld	a,-2 (ix)
	sub	a,#0x08
	ld	a,-1 (ix)
	sbc	a,#0x00
	jp	NC,00105$
;carwar.c:975: LMMC(x, y + j, 8, 1, (u16)&game.bitToByte[charTable[chr * 8 + j] * 8], VDP_OP_AND);
	ld	hl,#0x0954 + _game
	ld	a,4 (ix)
	ld	(hl),a
	inc	hl
	ld	a,5 (ix)
	ld	(hl),a
	ld	a,6 (ix)
	add	a,-2 (ix)
	ld	e,a
	ld	a,7 (ix)
	adc	a,-1 (ix)
	ld	d,a
	ld	hl,#0x0002 + 0x0954 + _game
	ld	(hl),e
	inc	hl
	ld	(hl),d
	inc	hl
	ld	(hl),#0x08
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x01
	inc	hl
	ld	(hl),#0x00
	ld	l,8 (ix)
	ld	h,#0x00
	add	hl,hl
	add	hl,hl
	add	hl,hl
	ld	a,l
	add	a,-2 (ix)
	ld	e,a
	ld	a,h
	adc	a,-1 (ix)
	ld	d,a
	ld	hl,#_charTable
	add	hl,de
	ld	l, (hl)
	ld	h,#0x00
	add	hl,hl
	add	hl,hl
	add	hl,hl
	ld	a,#<(0x0145 + _game)
	add	a,l
	ld	c,a
	ld	a,#>(0x0145 + _game)
	adc	a,h
	ld	h, a
	ld	l, c
	ld	a,(hl)
	ld	hl,#0x0008 + 0x0954 + _game
	ld	(hl),a
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0xB1
	ld	l,#<(0x0954 + _game)
	ld	h,#>(0x0954 + _game)
	push	de
	push	hl
	call	_VPDCommand36
	pop	af
	pop	de
	ld	hl,#_charTable
	add	hl,de
	ld	l, (hl)
	ld	h,#0x00
	add	hl,hl
	add	hl,hl
	add	hl,hl
	ld	a,#<(0x0145 + _game)
	add	a,l
	ld	c,a
	ld	a,#>(0x0145 + _game)
	adc	a,h
	ld	h, a
	ld	l, c
	push	hl
	call	_VPDCommandLoop
	pop	af
;carwar.c:973: for(j=0; j<8; j++)
	inc	-2 (ix)
	jp	NZ,00101$
	inc	-1 (ix)
	jp	00101$
00105$:
	ld	sp,ix
	pop	ix
	ret
_DrawCharacter_end::
;carwar.c:979: void DrawText(u16 x, u16 y, const char* text, u8 color)
;	---------------------------------
; Function DrawText
; ---------------------------------
_DrawText_start::
_DrawText:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;carwar.c:982: u16 curX = x;
	ld	a,4 (ix)
	ld	-4 (ix),a
	ld	a,5 (ix)
	ld	-3 (ix),a
;carwar.c:983: u16 curY = y;
	ld	l,6 (ix)
	ld	h,7 (ix)
;carwar.c:984: while(text[textIdx] != 0)
	ld	-2 (ix),#0x00
	ex	de,hl
	ld	-1 (ix),#0x00
00106$:
	ld	a,8 (ix)
	add	a,-1 (ix)
	ld	c,a
	ld	a,9 (ix)
	adc	a,#0x00
	ld	b,a
	ld	a,(bc)
;carwar.c:986: if(text[textIdx] == '\n')
	ld	c,a
	or	a,a
	jr	Z,00109$
	sub	a,#0x0A
	jr	NZ,00104$
;carwar.c:988: curX = x;
	ld	a,4 (ix)
	ld	-4 (ix),a
	ld	a,5 (ix)
	ld	-3 (ix),a
;carwar.c:989: curY += LINE_SPACE;
	ld	hl,#0x000A
	add	hl,de
	ex	de,hl
	jr	00105$
00104$:
;carwar.c:993: if(text[textIdx] != ' ')
;carwar.c:995: DrawCharacter(curX, curY, text[textIdx] - '0', color);
	ld	a,c
	cp	a,#0x20
	jr	Z,00102$
	add	a,#0xD0
	ld	c,a
	push	de
	ld	b, 10 (ix)
	push	bc
	push	de
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	call	_DrawCharacter
	pop	af
	pop	af
	pop	af
	pop	de
;carwar.c:996: sprtIdx++;
	inc	-2 (ix)
00102$:
;carwar.c:998: curX += 8;
	ld	a,-4 (ix)
	add	a,#0x08
	ld	-4 (ix),a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	-3 (ix),a
00105$:
;carwar.c:1000: textIdx++;
	inc	-1 (ix)
	jr	00106$
00109$:
	ld	sp,ix
	pop	ix
	ret
_DrawText_end::
;carwar.c:1004: void DebugPrintInt(i16 i, u8 x, u8 y)
;	---------------------------------
; Function DebugPrintInt
; ---------------------------------
_DebugPrintInt_start::
_DebugPrintInt:
	push	ix
	ld	ix,#0
	add	ix,sp
;carwar.c:1006: SetSpriteUniColor(0, x + 0 * 8, y, (i / 100000) % 10, 0x0F);
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	a,5 (ix)
	rla	
	sbc	a,a
	ld	e,a
	ld	d,a
	ld	hl,#0x0001
	push	hl
	ld	hl,#0x186A0
	push	hl
	push	de
	push	bc
	call	__divslong_rrx_s
	pop	af
	pop	af
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x000A
	push	hl
	push	de
	push	bc
	call	__modslong_rrx_s
	pop	af
	pop	af
	pop	af
	pop	af
	ld	c,l
	ld	b, #0x0F
	push	bc
	ld	a,7 (ix)
	push	af
	inc	sp
	ld	d, 6 (ix)
	ld	e,#0x00
	push	de
	call	_SetSpriteUniColor
	pop	af
;carwar.c:1007: SetSpriteUniColor(1, x + 1 * 8, y, (i / 10000) % 10, 0x0F);
	inc	sp
	ld	hl,#0x2710
	ex	(sp),hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	__divsint_rrx_s
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	ld	hl,#0x000A
	push	hl
	push	bc
	call	__modsint_rrx_s
	pop	af
	pop	af
	ld	c,l
	ld	a,6 (ix)
	add	a,#0x08
	ld	b,a
	ld	a,#0x0F
	push	af
	inc	sp
	ld	a,c
	push	af
	inc	sp
	ld	a,7 (ix)
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	a,#0x01
	push	af
	inc	sp
	call	_SetSpriteUniColor
	pop	af
;carwar.c:1008: SetSpriteUniColor(2, x + 2 * 8, y, (i / 1000) % 10, 0x0F);
	inc	sp
	ld	hl,#0x03E8
	ex	(sp),hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	__divsint_rrx_s
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	ld	hl,#0x000A
	push	hl
	push	bc
	call	__modsint_rrx_s
	pop	af
	pop	af
	ld	c,l
	ld	a,6 (ix)
	add	a,#0x10
	ld	b,a
	ld	a,#0x0F
	push	af
	inc	sp
	ld	a,c
	push	af
	inc	sp
	ld	a,7 (ix)
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	a,#0x02
	push	af
	inc	sp
	call	_SetSpriteUniColor
	pop	af
;carwar.c:1009: SetSpriteUniColor(3, x + 3 * 8, y, (i / 100) % 10, 0x0F);
	inc	sp
	ld	hl,#0x0064
	ex	(sp),hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	__divsint_rrx_s
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	ld	hl,#0x000A
	push	hl
	push	bc
	call	__modsint_rrx_s
	pop	af
	pop	af
	ld	c,l
	ld	a,6 (ix)
	add	a,#0x18
	ld	b,a
	ld	a,#0x0F
	push	af
	inc	sp
	ld	a,c
	push	af
	inc	sp
	ld	a,7 (ix)
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	a,#0x03
	push	af
	inc	sp
	call	_SetSpriteUniColor
	pop	af
;carwar.c:1010: SetSpriteUniColor(4, x + 4 * 8, y, (i / 10) % 10, 0x0F);
	inc	sp
	ld	hl,#0x000A
	ex	(sp),hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	__divsint_rrx_s
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	ld	hl,#0x000A
	push	hl
	push	bc
	call	__modsint_rrx_s
	pop	af
	pop	af
	ld	c,l
	ld	a,6 (ix)
	add	a,#0x20
	ld	b,a
	ld	a,#0x0F
	push	af
	inc	sp
	ld	a,c
	push	af
	inc	sp
	ld	a,7 (ix)
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	a,#0x04
	push	af
	inc	sp
	call	_SetSpriteUniColor
	pop	af
;carwar.c:1011: SetSpriteUniColor(5, x + 5 * 8, y, i % 10, 0x0F);
	inc	sp
	ld	hl,#0x000A
	ex	(sp),hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	__modsint_rrx_s
	pop	af
	pop	af
	ld	c,l
	ld	a,6 (ix)
	add	a,#0x28
	ld	b,a
	ld	a,#0x0F
	push	af
	inc	sp
	ld	a,c
	push	af
	inc	sp
	ld	a,7 (ix)
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	a,#0x05
	push	af
	inc	sp
	call	_SetSpriteUniColor
	pop	af
	pop	af
	inc	sp
;carwar.c:1012: SetSpriteUniColor(6, 0, 216, 0, 0);
	ld	hl,#0x0000
	push	hl
	ld	h, #0xD8
	push	hl
	ld	a,#0x06
	push	af
	inc	sp
	call	_SetSpriteUniColor
	pop	af
	pop	af
	inc	sp
	pop	ix
	ret
_DebugPrintInt_end::
	.area _CODE
	.area _CABS