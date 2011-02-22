;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.0.0 #6037 (Oct 31 2010) (MINGW32)
; This file was generated Tue Feb 22 14:00:11 2011
;--------------------------------------------------------
	.module carwar
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _game
	.globl _height
	.globl _menus
	.globl _menuPlayer
	.globl _menuTrack
	.globl _menuMode
	.globl _menuMain
	.globl _track01
	.globl _trackTiles01
	.globl _bg
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
	.globl _VectorToAngle256
	.globl _GetVectorLenght
	.globl _CarToCarCollision
	.globl _CarToWallCollision
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
;carwar.c:445: void main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main_start::
_main:
;carwar.c:451: __endasm;
	
		 di
		 ld sp, (#0xFC4A)
		 ei
		
;carwar.c:453: g_slotPort = (g_slotPort & 0xCF) | ((g_slotPort & 0x0C) << 2);
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
;carwar.c:455: MainLoop();
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
	.db #0x91	; 145
	.db #0x91	; 145
	.db #0x91	; 145
	.db #0x91	; 145
	.db #0x91	; 145
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x91	; 145
	.db #0x91	; 145
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0x91	; 145
	.db #0x91	; 145
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x91	; 145
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0x91	; 145
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x91	; 145
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0x91	; 145
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x91	; 145
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0x91	; 145
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x91	; 145
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0x91	; 145
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x91	; 145
	.db #0x91	; 145
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0x91	; 145
	.db #0x91	; 145
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x91	; 145
	.db #0x91	; 145
	.db #0x91	; 145
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
_g_Sinus256:
	.dw #0x0000
	.dw #0x0006
	.dw #0x000C
	.dw #0x0012
	.dw #0x0019
	.dw #0x001F
	.dw #0x0025
	.dw #0x002B
	.dw #0x0031
	.dw #0x0038
	.dw #0x003E
	.dw #0x0044
	.dw #0x004A
	.dw #0x0050
	.dw #0x0056
	.dw #0x005C
	.dw #0x0061
	.dw #0x0067
	.dw #0x006D
	.dw #0x0073
	.dw #0x0078
	.dw #0x007E
	.dw #0x0083
	.dw #0x0088
	.dw #0x008E
	.dw #0x0093
	.dw #0x0098
	.dw #0x009D
	.dw #0x00A2
	.dw #0x00A7
	.dw #0x00AB
	.dw #0x00B0
	.dw #0x00B5
	.dw #0x00B9
	.dw #0x00BD
	.dw #0x00C1
	.dw #0x00C5
	.dw #0x00C9
	.dw #0x00CD
	.dw #0x00D1
	.dw #0x00D4
	.dw #0x00D8
	.dw #0x00DB
	.dw #0x00DE
	.dw #0x00E1
	.dw #0x00E4
	.dw #0x00E7
	.dw #0x00EA
	.dw #0x00EC
	.dw #0x00EE
	.dw #0x00F1
	.dw #0x00F3
	.dw #0x00F4
	.dw #0x00F6
	.dw #0x00F8
	.dw #0x00F9
	.dw #0x00FB
	.dw #0x00FC
	.dw #0x00FD
	.dw #0x00FE
	.dw #0x00FE
	.dw #0x00FF
	.dw #0x00FF
	.dw #0x00FF
	.dw #0x0100
	.dw #0x00FF
	.dw #0x00FF
	.dw #0x00FF
	.dw #0x00FE
	.dw #0x00FE
	.dw #0x00FD
	.dw #0x00FC
	.dw #0x00FB
	.dw #0x00F9
	.dw #0x00F8
	.dw #0x00F6
	.dw #0x00F4
	.dw #0x00F3
	.dw #0x00F1
	.dw #0x00EE
	.dw #0x00EC
	.dw #0x00EA
	.dw #0x00E7
	.dw #0x00E4
	.dw #0x00E1
	.dw #0x00DE
	.dw #0x00DB
	.dw #0x00D8
	.dw #0x00D4
	.dw #0x00D1
	.dw #0x00CD
	.dw #0x00C9
	.dw #0x00C5
	.dw #0x00C1
	.dw #0x00BD
	.dw #0x00B9
	.dw #0x00B5
	.dw #0x00B0
	.dw #0x00AB
	.dw #0x00A7
	.dw #0x00A2
	.dw #0x009D
	.dw #0x0098
	.dw #0x0093
	.dw #0x008E
	.dw #0x0088
	.dw #0x0083
	.dw #0x007E
	.dw #0x0078
	.dw #0x0073
	.dw #0x006D
	.dw #0x0067
	.dw #0x0061
	.dw #0x005C
	.dw #0x0056
	.dw #0x0050
	.dw #0x004A
	.dw #0x0044
	.dw #0x003E
	.dw #0x0038
	.dw #0x0031
	.dw #0x002B
	.dw #0x0025
	.dw #0x001F
	.dw #0x0019
	.dw #0x0012
	.dw #0x000C
	.dw #0x0006
	.dw #0x0000
	.dw #0xFFFA
	.dw #0xFFF4
	.dw #0xFFEE
	.dw #0xFFE7
	.dw #0xFFE1
	.dw #0xFFDB
	.dw #0xFFD5
	.dw #0xFFCF
	.dw #0xFFC8
	.dw #0xFFC2
	.dw #0xFFBC
	.dw #0xFFB6
	.dw #0xFFB0
	.dw #0xFFAA
	.dw #0xFFA4
	.dw #0xFF9F
	.dw #0xFF99
	.dw #0xFF93
	.dw #0xFF8D
	.dw #0xFF88
	.dw #0xFF82
	.dw #0xFF7D
	.dw #0xFF78
	.dw #0xFF72
	.dw #0xFF6D
	.dw #0xFF68
	.dw #0xFF63
	.dw #0xFF5E
	.dw #0xFF59
	.dw #0xFF55
	.dw #0xFF50
	.dw #0xFF4B
	.dw #0xFF47
	.dw #0xFF43
	.dw #0xFF3F
	.dw #0xFF3B
	.dw #0xFF37
	.dw #0xFF33
	.dw #0xFF2F
	.dw #0xFF2C
	.dw #0xFF28
	.dw #0xFF25
	.dw #0xFF22
	.dw #0xFF1F
	.dw #0xFF1C
	.dw #0xFF19
	.dw #0xFF16
	.dw #0xFF14
	.dw #0xFF12
	.dw #0xFF0F
	.dw #0xFF0D
	.dw #0xFF0C
	.dw #0xFF0A
	.dw #0xFF08
	.dw #0xFF07
	.dw #0xFF05
	.dw #0xFF04
	.dw #0xFF03
	.dw #0xFF02
	.dw #0xFF02
	.dw #0xFF01
	.dw #0xFF01
	.dw #0xFF01
	.dw #0xFF00
	.dw #0xFF01
	.dw #0xFF01
	.dw #0xFF01
	.dw #0xFF02
	.dw #0xFF02
	.dw #0xFF03
	.dw #0xFF04
	.dw #0xFF05
	.dw #0xFF07
	.dw #0xFF08
	.dw #0xFF0A
	.dw #0xFF0C
	.dw #0xFF0D
	.dw #0xFF0F
	.dw #0xFF12
	.dw #0xFF14
	.dw #0xFF16
	.dw #0xFF19
	.dw #0xFF1C
	.dw #0xFF1F
	.dw #0xFF22
	.dw #0xFF25
	.dw #0xFF28
	.dw #0xFF2C
	.dw #0xFF2F
	.dw #0xFF33
	.dw #0xFF37
	.dw #0xFF3B
	.dw #0xFF3F
	.dw #0xFF43
	.dw #0xFF47
	.dw #0xFF4B
	.dw #0xFF50
	.dw #0xFF55
	.dw #0xFF59
	.dw #0xFF5E
	.dw #0xFF63
	.dw #0xFF68
	.dw #0xFF6D
	.dw #0xFF72
	.dw #0xFF78
	.dw #0xFF7D
	.dw #0xFF82
	.dw #0xFF88
	.dw #0xFF8D
	.dw #0xFF93
	.dw #0xFF99
	.dw #0xFF9F
	.dw #0xFFA4
	.dw #0xFFAA
	.dw #0xFFB0
	.dw #0xFFB6
	.dw #0xFFBC
	.dw #0xFFC2
	.dw #0xFFC8
	.dw #0xFFCF
	.dw #0xFFD5
	.dw #0xFFDB
	.dw #0xFFE1
	.dw #0xFFE7
	.dw #0xFFEE
	.dw #0xFFF4
	.dw #0xFFFA
_g_Cosinus256:
	.dw #0x0100
	.dw #0x00FF
	.dw #0x00FF
	.dw #0x00FF
	.dw #0x00FE
	.dw #0x00FE
	.dw #0x00FD
	.dw #0x00FC
	.dw #0x00FB
	.dw #0x00F9
	.dw #0x00F8
	.dw #0x00F6
	.dw #0x00F4
	.dw #0x00F3
	.dw #0x00F1
	.dw #0x00EE
	.dw #0x00EC
	.dw #0x00EA
	.dw #0x00E7
	.dw #0x00E4
	.dw #0x00E1
	.dw #0x00DE
	.dw #0x00DB
	.dw #0x00D8
	.dw #0x00D4
	.dw #0x00D1
	.dw #0x00CD
	.dw #0x00C9
	.dw #0x00C5
	.dw #0x00C1
	.dw #0x00BD
	.dw #0x00B9
	.dw #0x00B5
	.dw #0x00B0
	.dw #0x00AB
	.dw #0x00A7
	.dw #0x00A2
	.dw #0x009D
	.dw #0x0098
	.dw #0x0093
	.dw #0x008E
	.dw #0x0088
	.dw #0x0083
	.dw #0x007E
	.dw #0x0078
	.dw #0x0073
	.dw #0x006D
	.dw #0x0067
	.dw #0x0061
	.dw #0x005C
	.dw #0x0056
	.dw #0x0050
	.dw #0x004A
	.dw #0x0044
	.dw #0x003E
	.dw #0x0038
	.dw #0x0031
	.dw #0x002B
	.dw #0x0025
	.dw #0x001F
	.dw #0x0019
	.dw #0x0012
	.dw #0x000C
	.dw #0x0006
	.dw #0x0000
	.dw #0xFFFA
	.dw #0xFFF4
	.dw #0xFFEE
	.dw #0xFFE7
	.dw #0xFFE1
	.dw #0xFFDB
	.dw #0xFFD5
	.dw #0xFFCF
	.dw #0xFFC8
	.dw #0xFFC2
	.dw #0xFFBC
	.dw #0xFFB6
	.dw #0xFFB0
	.dw #0xFFAA
	.dw #0xFFA4
	.dw #0xFF9F
	.dw #0xFF99
	.dw #0xFF93
	.dw #0xFF8D
	.dw #0xFF88
	.dw #0xFF82
	.dw #0xFF7D
	.dw #0xFF78
	.dw #0xFF72
	.dw #0xFF6D
	.dw #0xFF68
	.dw #0xFF63
	.dw #0xFF5E
	.dw #0xFF59
	.dw #0xFF55
	.dw #0xFF50
	.dw #0xFF4B
	.dw #0xFF47
	.dw #0xFF43
	.dw #0xFF3F
	.dw #0xFF3B
	.dw #0xFF37
	.dw #0xFF33
	.dw #0xFF2F
	.dw #0xFF2C
	.dw #0xFF28
	.dw #0xFF25
	.dw #0xFF22
	.dw #0xFF1F
	.dw #0xFF1C
	.dw #0xFF19
	.dw #0xFF16
	.dw #0xFF14
	.dw #0xFF12
	.dw #0xFF0F
	.dw #0xFF0D
	.dw #0xFF0C
	.dw #0xFF0A
	.dw #0xFF08
	.dw #0xFF07
	.dw #0xFF05
	.dw #0xFF04
	.dw #0xFF03
	.dw #0xFF02
	.dw #0xFF02
	.dw #0xFF01
	.dw #0xFF01
	.dw #0xFF01
	.dw #0xFF00
	.dw #0xFF01
	.dw #0xFF01
	.dw #0xFF01
	.dw #0xFF02
	.dw #0xFF02
	.dw #0xFF03
	.dw #0xFF04
	.dw #0xFF05
	.dw #0xFF07
	.dw #0xFF08
	.dw #0xFF0A
	.dw #0xFF0C
	.dw #0xFF0D
	.dw #0xFF0F
	.dw #0xFF12
	.dw #0xFF14
	.dw #0xFF16
	.dw #0xFF19
	.dw #0xFF1C
	.dw #0xFF1F
	.dw #0xFF22
	.dw #0xFF25
	.dw #0xFF28
	.dw #0xFF2C
	.dw #0xFF2F
	.dw #0xFF33
	.dw #0xFF37
	.dw #0xFF3B
	.dw #0xFF3F
	.dw #0xFF43
	.dw #0xFF47
	.dw #0xFF4B
	.dw #0xFF50
	.dw #0xFF55
	.dw #0xFF59
	.dw #0xFF5E
	.dw #0xFF63
	.dw #0xFF68
	.dw #0xFF6D
	.dw #0xFF72
	.dw #0xFF78
	.dw #0xFF7D
	.dw #0xFF82
	.dw #0xFF88
	.dw #0xFF8D
	.dw #0xFF93
	.dw #0xFF99
	.dw #0xFF9F
	.dw #0xFFA4
	.dw #0xFFAA
	.dw #0xFFB0
	.dw #0xFFB6
	.dw #0xFFBC
	.dw #0xFFC2
	.dw #0xFFC8
	.dw #0xFFCF
	.dw #0xFFD5
	.dw #0xFFDB
	.dw #0xFFE1
	.dw #0xFFE7
	.dw #0xFFEE
	.dw #0xFFF4
	.dw #0xFFFA
	.dw #0x0000
	.dw #0x0006
	.dw #0x000C
	.dw #0x0012
	.dw #0x0019
	.dw #0x001F
	.dw #0x0025
	.dw #0x002B
	.dw #0x0031
	.dw #0x0038
	.dw #0x003E
	.dw #0x0044
	.dw #0x004A
	.dw #0x0050
	.dw #0x0056
	.dw #0x005C
	.dw #0x0061
	.dw #0x0067
	.dw #0x006D
	.dw #0x0073
	.dw #0x0078
	.dw #0x007E
	.dw #0x0083
	.dw #0x0088
	.dw #0x008E
	.dw #0x0093
	.dw #0x0098
	.dw #0x009D
	.dw #0x00A2
	.dw #0x00A7
	.dw #0x00AB
	.dw #0x00B0
	.dw #0x00B5
	.dw #0x00B9
	.dw #0x00BD
	.dw #0x00C1
	.dw #0x00C5
	.dw #0x00C9
	.dw #0x00CD
	.dw #0x00D1
	.dw #0x00D4
	.dw #0x00D8
	.dw #0x00DB
	.dw #0x00DE
	.dw #0x00E1
	.dw #0x00E4
	.dw #0x00E7
	.dw #0x00EA
	.dw #0x00EC
	.dw #0x00EE
	.dw #0x00F1
	.dw #0x00F3
	.dw #0x00F4
	.dw #0x00F6
	.dw #0x00F8
	.dw #0x00F9
	.dw #0x00FB
	.dw #0x00FC
	.dw #0x00FD
	.dw #0x00FE
	.dw #0x00FE
	.dw #0x00FF
	.dw #0x00FF
	.dw #0x00FF
_g_Rotation16:
	.db #0xA0	; -96
	.db #0x9F	; -97
	.db #0x9D	; -99
	.db #0x9B	; -101
	.db #0x9A	; -102
	.db #0x98	; -104
	.db #0x96	; -106
	.db #0x94	; -108
	.db #0x92	; -110
	.db #0x90	; -112
	.db #0x8D	; -115
	.db #0x8B	; -117
	.db #0x88	; -120
	.db #0x85	; -123
	.db #0x83	; -125
	.db #0x80	; -128
	.db #0x7D	;  125
	.db #0x7B	;  123
	.db #0x78	;  120	x
	.db #0x75	;  117	u
	.db #0x73	;  115	s
	.db #0x70	;  112	p
	.db #0x6E	;  110	n
	.db #0x6C	;  108	l
	.db #0x6A	;  106	j
	.db #0x68	;  104	h
	.db #0x66	;  102	f
	.db #0x65	;  101	e
	.db #0x63	;  99	c
	.db #0x61	;  97	a
	.db #0x60	;  96
	.db #0xA1	; -95
	.db #0xA0	; -96
	.db #0x9E	; -98
	.db #0x9D	; -99
	.db #0x9B	; -101
	.db #0x99	; -103
	.db #0x97	; -105
	.db #0x95	; -107
	.db #0x93	; -109
	.db #0x90	; -112
	.db #0x8E	; -114
	.db #0x8B	; -117
	.db #0x89	; -119
	.db #0x86	; -122
	.db #0x83	; -125
	.db #0x80	; -128
	.db #0x7D	;  125
	.db #0x7A	;  122	z
	.db #0x77	;  119	w
	.db #0x75	;  117	u
	.db #0x72	;  114	r
	.db #0x70	;  112	p
	.db #0x6D	;  109	m
	.db #0x6B	;  107	k
	.db #0x69	;  105	i
	.db #0x67	;  103	g
	.db #0x65	;  101	e
	.db #0x63	;  99	c
	.db #0x62	;  98	b
	.db #0x60	;  96
	.db #0x5F	;  95
	.db #0xA3	; -93
	.db #0xA2	; -94
	.db #0xA0	; -96
	.db #0x9E	; -98
	.db #0x9D	; -99
	.db #0x9B	; -101
	.db #0x99	; -103
	.db #0x96	; -106
	.db #0x94	; -108
	.db #0x92	; -110
	.db #0x8F	; -113
	.db #0x8C	; -116
	.db #0x89	; -119
	.db #0x86	; -122
	.db #0x83	; -125
	.db #0x80	; -128
	.db #0x7D	;  125
	.db #0x7A	;  122	z
	.db #0x77	;  119	w
	.db #0x74	;  116	t
	.db #0x71	;  113	q
	.db #0x6E	;  110	n
	.db #0x6C	;  108	l
	.db #0x6A	;  106	j
	.db #0x67	;  103	g
	.db #0x65	;  101	e
	.db #0x63	;  99	c
	.db #0x62	;  98	b
	.db #0x60	;  96
	.db #0x5E	;  94
	.db #0x5D	;  93
	.db #0xA5	; -91
	.db #0xA3	; -93
	.db #0xA2	; -94
	.db #0xA0	; -96
	.db #0x9E	; -98
	.db #0x9C	; -100
	.db #0x9A	; -102
	.db #0x98	; -104
	.db #0x96	; -106
	.db #0x93	; -109
	.db #0x90	; -112
	.db #0x8D	; -115
	.db #0x8A	; -118
	.db #0x87	; -121
	.db #0x83	; -125
	.db #0x80	; -128
	.db #0x7D	;  125
	.db #0x79	;  121	y
	.db #0x76	;  118	v
	.db #0x73	;  115	s
	.db #0x70	;  112	p
	.db #0x6D	;  109	m
	.db #0x6A	;  106	j
	.db #0x68	;  104	h
	.db #0x66	;  102	f
	.db #0x64	;  100	d
	.db #0x62	;  98	b
	.db #0x60	;  96
	.db #0x5E	;  94
	.db #0x5D	;  93
	.db #0x5B	;  91
	.db #0xA6	; -90
	.db #0xA5	; -91
	.db #0xA3	; -93
	.db #0xA2	; -94
	.db #0xA0	; -96
	.db #0x9E	; -98
	.db #0x9C	; -100
	.db #0x9A	; -102
	.db #0x97	; -105
	.db #0x94	; -108
	.db #0x91	; -111
	.db #0x8E	; -114
	.db #0x8B	; -117
	.db #0x87	; -121
	.db #0x84	; -124
	.db #0x80	; -128
	.db #0x7C	;  124
	.db #0x79	;  121	y
	.db #0x75	;  117	u
	.db #0x72	;  114	r
	.db #0x6F	;  111	o
	.db #0x6C	;  108	l
	.db #0x69	;  105	i
	.db #0x66	;  102	f
	.db #0x64	;  100	d
	.db #0x62	;  98	b
	.db #0x60	;  96
	.db #0x5E	;  94
	.db #0x5D	;  93
	.db #0x5B	;  91
	.db #0x5A	;  90	Z
	.db #0xA8	; -88
	.db #0xA7	; -89
	.db #0xA5	; -91
	.db #0xA4	; -92
	.db #0xA2	; -94
	.db #0xA0	; -96
	.db #0x9E	; -98
	.db #0x9B	; -101
	.db #0x99	; -103
	.db #0x96	; -106
	.db #0x93	; -109
	.db #0x90	; -112
	.db #0x8C	; -116
	.db #0x88	; -120
	.db #0x84	; -124
	.db #0x80	; -128
	.db #0x7C	;  124
	.db #0x78	;  120	x
	.db #0x74	;  116	t
	.db #0x70	;  112	p
	.db #0x6D	;  109	m
	.db #0x6A	;  106	j
	.db #0x67	;  103	g
	.db #0x65	;  101	e
	.db #0x62	;  98	b
	.db #0x60	;  96
	.db #0x5E	;  94
	.db #0x5C	;  92
	.db #0x5B	;  91
	.db #0x59	;  89	Y
	.db #0x58	;  88	X
	.db #0xAA	; -86
	.db #0xA9	; -87
	.db #0xA7	; -89
	.db #0xA6	; -90
	.db #0xA4	; -92
	.db #0xA2	; -94
	.db #0xA0	; -96
	.db #0x9E	; -98
	.db #0x9B	; -101
	.db #0x98	; -104
	.db #0x95	; -107
	.db #0x91	; -111
	.db #0x8D	; -115
	.db #0x89	; -119
	.db #0x85	; -123
	.db #0x80	; -128
	.db #0x7B	;  123
	.db #0x77	;  119	w
	.db #0x73	;  115	s
	.db #0x6F	;  111	o
	.db #0x6B	;  107	k
	.db #0x68	;  104	h
	.db #0x65	;  101	e
	.db #0x62	;  98	b
	.db #0x60	;  96
	.db #0x5E	;  94
	.db #0x5C	;  92
	.db #0x5A	;  90	Z
	.db #0x59	;  89	Y
	.db #0x57	;  87	W
	.db #0x56	;  86	V
	.db #0xAC	; -84
	.db #0xAB	; -85
	.db #0xAA	; -86
	.db #0xA8	; -88
	.db #0xA6	; -90
	.db #0xA5	; -91
	.db #0xA2	; -94
	.db #0xA0	; -96
	.db #0x9D	; -99
	.db #0x9A	; -102
	.db #0x97	; -105
	.db #0x93	; -109
	.db #0x8F	; -113
	.db #0x8A	; -118
	.db #0x85	; -123
	.db #0x80	; -128
	.db #0x7B	;  123
	.db #0x76	;  118	v
	.db #0x71	;  113	q
	.db #0x6D	;  109	m
	.db #0x69	;  105	i
	.db #0x66	;  102	f
	.db #0x63	;  99	c
	.db #0x60	;  96
	.db #0x5E	;  94
	.db #0x5B	;  91
	.db #0x5A	;  90	Z
	.db #0x58	;  88	X
	.db #0x56	;  86	V
	.db #0x55	;  85	U
	.db #0x54	;  84	T
	.db #0xAE	; -82
	.db #0xAD	; -83
	.db #0xAC	; -84
	.db #0xAA	; -86
	.db #0xA9	; -87
	.db #0xA7	; -89
	.db #0xA5	; -91
	.db #0xA3	; -93
	.db #0xA0	; -96
	.db #0x9D	; -99
	.db #0x99	; -103
	.db #0x95	; -107
	.db #0x90	; -112
	.db #0x8B	; -117
	.db #0x86	; -122
	.db #0x80	; -128
	.db #0x7A	;  122	z
	.db #0x75	;  117	u
	.db #0x70	;  112	p
	.db #0x6B	;  107	k
	.db #0x67	;  103	g
	.db #0x63	;  99	c
	.db #0x60	;  96
	.db #0x5D	;  93
	.db #0x5B	;  91
	.db #0x59	;  89	Y
	.db #0x57	;  87	W
	.db #0x56	;  86	V
	.db #0x54	;  84	T
	.db #0x53	;  83	S
	.db #0x52	;  82	R
	.db #0xB0	; -80
	.db #0xB0	; -80
	.db #0xAE	; -82
	.db #0xAD	; -83
	.db #0xAC	; -84
	.db #0xAA	; -86
	.db #0xA8	; -88
	.db #0xA6	; -90
	.db #0xA3	; -93
	.db #0xA0	; -96
	.db #0x9C	; -100
	.db #0x98	; -104
	.db #0x93	; -109
	.db #0x8D	; -115
	.db #0x87	; -121
	.db #0x80	; -128
	.db #0x79	;  121	y
	.db #0x73	;  115	s
	.db #0x6D	;  109	m
	.db #0x68	;  104	h
	.db #0x64	;  100	d
	.db #0x60	;  96
	.db #0x5D	;  93
	.db #0x5A	;  90	Z
	.db #0x58	;  88	X
	.db #0x56	;  86	V
	.db #0x54	;  84	T
	.db #0x53	;  83	S
	.db #0x52	;  82	R
	.db #0x50	;  80	P
	.db #0x50	;  80	P
	.db #0xB3	; -77
	.db #0xB2	; -78
	.db #0xB1	; -79
	.db #0xB0	; -80
	.db #0xAF	; -81
	.db #0xAD	; -83
	.db #0xAB	; -85
	.db #0xA9	; -87
	.db #0xA7	; -89
	.db #0xA4	; -92
	.db #0xA0	; -96
	.db #0x9B	; -101
	.db #0x96	; -106
	.db #0x90	; -112
	.db #0x88	; -120
	.db #0x80	; -128
	.db #0x78	;  120	x
	.db #0x70	;  112	p
	.db #0x6A	;  106	j
	.db #0x65	;  101	e
	.db #0x60	;  96
	.db #0x5C	;  92
	.db #0x59	;  89	Y
	.db #0x57	;  87	W
	.db #0x55	;  85	U
	.db #0x53	;  83	S
	.db #0x51	;  81	Q
	.db #0x50	;  80	P
	.db #0x4F	;  79	O
	.db #0x4E	;  78	N
	.db #0x4D	;  77	M
	.db #0xB5	; -75
	.db #0xB5	; -75
	.db #0xB4	; -76
	.db #0xB3	; -77
	.db #0xB2	; -78
	.db #0xB0	; -80
	.db #0xAF	; -81
	.db #0xAD	; -83
	.db #0xAB	; -85
	.db #0xA8	; -88
	.db #0xA5	; -91
	.db #0xA0	; -96
	.db #0x9A	; -102
	.db #0x93	; -109
	.db #0x8A	; -118
	.db #0x80	; -128
	.db #0x76	;  118	v
	.db #0x6D	;  109	m
	.db #0x66	;  102	f
	.db #0x60	;  96
	.db #0x5B	;  91
	.db #0x58	;  88	X
	.db #0x55	;  85	U
	.db #0x53	;  83	S
	.db #0x51	;  81	Q
	.db #0x50	;  80	P
	.db #0x4E	;  78	N
	.db #0x4D	;  77	M
	.db #0x4C	;  76	L
	.db #0x4B	;  75	K
	.db #0x4B	;  75	K
	.db #0xB8	; -72
	.db #0xB7	; -73
	.db #0xB7	; -73
	.db #0xB6	; -74
	.db #0xB5	; -75
	.db #0xB4	; -76
	.db #0xB3	; -77
	.db #0xB1	; -79
	.db #0xB0	; -80
	.db #0xAD	; -83
	.db #0xAA	; -86
	.db #0xA6	; -90
	.db #0xA0	; -96
	.db #0x98	; -104
	.db #0x8D	; -115
	.db #0x80	; -128
	.db #0x73	;  115	s
	.db #0x68	;  104	h
	.db #0x60	;  96
	.db #0x5A	;  90	Z
	.db #0x56	;  86	V
	.db #0x53	;  83	S
	.db #0x50	;  80	P
	.db #0x4F	;  79	O
	.db #0x4D	;  77	M
	.db #0x4C	;  76	L
	.db #0x4B	;  75	K
	.db #0x4A	;  74	J
	.db #0x49	;  73	I
	.db #0x49	;  73	I
	.db #0x48	;  72	H
	.db #0xBB	; -69
	.db #0xBA	; -70
	.db #0xBA	; -70
	.db #0xB9	; -71
	.db #0xB9	; -71
	.db #0xB8	; -72
	.db #0xB7	; -73
	.db #0xB6	; -74
	.db #0xB5	; -75
	.db #0xB3	; -77
	.db #0xB0	; -80
	.db #0xAD	; -83
	.db #0xA8	; -88
	.db #0xA0	; -96
	.db #0x93	; -109
	.db #0x80	; -128
	.db #0x6D	;  109	m
	.db #0x60	;  96
	.db #0x58	;  88	X
	.db #0x53	;  83	S
	.db #0x50	;  80	P
	.db #0x4D	;  77	M
	.db #0x4B	;  75	K
	.db #0x4A	;  74	J
	.db #0x49	;  73	I
	.db #0x48	;  72	H
	.db #0x47	;  71	G
	.db #0x47	;  71	G
	.db #0x46	;  70	F
	.db #0x46	;  70	F
	.db #0x45	;  69	E
	.db #0xBD	; -67
	.db #0xBD	; -67
	.db #0xBD	; -67
	.db #0xBD	; -67
	.db #0xBC	; -68
	.db #0xBC	; -68
	.db #0xBB	; -69
	.db #0xBB	; -69
	.db #0xBA	; -70
	.db #0xB9	; -71
	.db #0xB8	; -72
	.db #0xB6	; -74
	.db #0xB3	; -77
	.db #0xAD	; -83
	.db #0xA0	; -96
	.db #0x80	; -128
	.db #0x60	;  96
	.db #0x53	;  83	S
	.db #0x4D	;  77	M
	.db #0x4A	;  74	J
	.db #0x48	;  72	H
	.db #0x47	;  71	G
	.db #0x46	;  70	F
	.db #0x45	;  69	E
	.db #0x45	;  69	E
	.db #0x44	;  68	D
	.db #0x44	;  68	D
	.db #0x43	;  67	C
	.db #0x43	;  67	C
	.db #0x43	;  67	C
	.db #0x43	;  67	C
	.db #0xC0	; -64
	.db #0xC0	; -64
	.db #0xC0	; -64
	.db #0xC0	; -64
	.db #0xC0	; -64
	.db #0xC0	; -64
	.db #0xC0	; -64
	.db #0xC0	; -64
	.db #0xC0	; -64
	.db #0xC0	; -64
	.db #0xC0	; -64
	.db #0xC0	; -64
	.db #0xC0	; -64
	.db #0xC0	; -64
	.db #0xC0	; -64
	.db #0x40	;  64
	.db #0x40	;  64
	.db #0x40	;  64
	.db #0x40	;  64
	.db #0x40	;  64
	.db #0x40	;  64
	.db #0x40	;  64
	.db #0x40	;  64
	.db #0x40	;  64
	.db #0x40	;  64
	.db #0x40	;  64
	.db #0x40	;  64
	.db #0x40	;  64
	.db #0x40	;  64
	.db #0x40	;  64
	.db #0x40	;  64
	.db #0xC3	; -61
	.db #0xC3	; -61
	.db #0xC3	; -61
	.db #0xC3	; -61
	.db #0xC4	; -60
	.db #0xC4	; -60
	.db #0xC5	; -59
	.db #0xC5	; -59
	.db #0xC6	; -58
	.db #0xC7	; -57
	.db #0xC8	; -56
	.db #0xCA	; -54
	.db #0xCD	; -51
	.db #0xD3	; -45
	.db #0xE0	; -32
	.db #0x00	;  0
	.db #0x20	;  32
	.db #0x2D	;  45
	.db #0x33	;  51
	.db #0x36	;  54
	.db #0x38	;  56
	.db #0x39	;  57
	.db #0x3A	;  58
	.db #0x3B	;  59
	.db #0x3B	;  59
	.db #0x3C	;  60
	.db #0x3C	;  60
	.db #0x3D	;  61
	.db #0x3D	;  61
	.db #0x3D	;  61
	.db #0x3D	;  61
	.db #0xC5	; -59
	.db #0xC6	; -58
	.db #0xC6	; -58
	.db #0xC7	; -57
	.db #0xC7	; -57
	.db #0xC8	; -56
	.db #0xC9	; -55
	.db #0xCA	; -54
	.db #0xCB	; -53
	.db #0xCD	; -51
	.db #0xD0	; -48
	.db #0xD3	; -45
	.db #0xD8	; -40
	.db #0xE0	; -32
	.db #0xED	; -19
	.db #0x00	;  0
	.db #0x13	;  19
	.db #0x20	;  32
	.db #0x28	;  40
	.db #0x2D	;  45
	.db #0x30	;  48
	.db #0x33	;  51
	.db #0x35	;  53
	.db #0x36	;  54
	.db #0x37	;  55
	.db #0x38	;  56
	.db #0x39	;  57
	.db #0x39	;  57
	.db #0x3A	;  58
	.db #0x3A	;  58
	.db #0x3B	;  59
	.db #0xC8	; -56
	.db #0xC9	; -55
	.db #0xC9	; -55
	.db #0xCA	; -54
	.db #0xCB	; -53
	.db #0xCC	; -52
	.db #0xCD	; -51
	.db #0xCF	; -49
	.db #0xD0	; -48
	.db #0xD3	; -45
	.db #0xD6	; -42
	.db #0xDA	; -38
	.db #0xE0	; -32
	.db #0xE8	; -24
	.db #0xF3	; -13
	.db #0x00	;  0
	.db #0x0D	;  13
	.db #0x18	;  24
	.db #0x20	;  32
	.db #0x26	;  38
	.db #0x2A	;  42
	.db #0x2D	;  45
	.db #0x30	;  48
	.db #0x31	;  49
	.db #0x33	;  51
	.db #0x34	;  52
	.db #0x35	;  53
	.db #0x36	;  54
	.db #0x37	;  55
	.db #0x37	;  55
	.db #0x38	;  56
	.db #0xCB	; -53
	.db #0xCB	; -53
	.db #0xCC	; -52
	.db #0xCD	; -51
	.db #0xCE	; -50
	.db #0xD0	; -48
	.db #0xD1	; -47
	.db #0xD3	; -45
	.db #0xD5	; -43
	.db #0xD8	; -40
	.db #0xDB	; -37
	.db #0xE0	; -32
	.db #0xE6	; -26
	.db #0xED	; -19
	.db #0xF6	; -10
	.db #0x00	;  0
	.db #0x0A	;  10
	.db #0x13	;  19
	.db #0x1A	;  26
	.db #0x20	;  32
	.db #0x25	;  37
	.db #0x28	;  40
	.db #0x2B	;  43
	.db #0x2D	;  45
	.db #0x2F	;  47
	.db #0x30	;  48
	.db #0x32	;  50
	.db #0x33	;  51
	.db #0x34	;  52
	.db #0x35	;  53
	.db #0x35	;  53
	.db #0xCD	; -51
	.db #0xCE	; -50
	.db #0xCF	; -49
	.db #0xD0	; -48
	.db #0xD1	; -47
	.db #0xD3	; -45
	.db #0xD5	; -43
	.db #0xD7	; -41
	.db #0xD9	; -39
	.db #0xDC	; -36
	.db #0xE0	; -32
	.db #0xE5	; -27
	.db #0xEA	; -22
	.db #0xF0	; -16
	.db #0xF8	; -8
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0x10	;  16
	.db #0x16	;  22
	.db #0x1B	;  27
	.db #0x20	;  32
	.db #0x24	;  36
	.db #0x27	;  39
	.db #0x29	;  41
	.db #0x2B	;  43
	.db #0x2D	;  45
	.db #0x2F	;  47
	.db #0x30	;  48
	.db #0x31	;  49
	.db #0x32	;  50
	.db #0x33	;  51
	.db #0xD0	; -48
	.db #0xD0	; -48
	.db #0xD2	; -46
	.db #0xD3	; -45
	.db #0xD4	; -44
	.db #0xD6	; -42
	.db #0xD8	; -40
	.db #0xDA	; -38
	.db #0xDD	; -35
	.db #0xE0	; -32
	.db #0xE4	; -28
	.db #0xE8	; -24
	.db #0xED	; -19
	.db #0xF3	; -13
	.db #0xF9	; -7
	.db #0x00	;  0
	.db #0x07	;  7
	.db #0x0D	;  13
	.db #0x13	;  19
	.db #0x18	;  24
	.db #0x1C	;  28
	.db #0x20	;  32
	.db #0x23	;  35
	.db #0x26	;  38
	.db #0x28	;  40
	.db #0x2A	;  42
	.db #0x2C	;  44
	.db #0x2D	;  45
	.db #0x2E	;  46
	.db #0x30	;  48
	.db #0x30	;  48
	.db #0xD2	; -46
	.db #0xD3	; -45
	.db #0xD4	; -44
	.db #0xD6	; -42
	.db #0xD7	; -41
	.db #0xD9	; -39
	.db #0xDB	; -37
	.db #0xDD	; -35
	.db #0xE0	; -32
	.db #0xE3	; -29
	.db #0xE7	; -25
	.db #0xEB	; -21
	.db #0xF0	; -16
	.db #0xF5	; -11
	.db #0xFA	; -6
	.db #0x00	;  0
	.db #0x06	;  6
	.db #0x0B	;  11
	.db #0x10	;  16
	.db #0x15	;  21
	.db #0x19	;  25
	.db #0x1D	;  29
	.db #0x20	;  32
	.db #0x23	;  35
	.db #0x25	;  37
	.db #0x27	;  39
	.db #0x29	;  41
	.db #0x2A	;  42
	.db #0x2C	;  44
	.db #0x2D	;  45
	.db #0x2E	;  46
	.db #0xD4	; -44
	.db #0xD5	; -43
	.db #0xD6	; -42
	.db #0xD8	; -40
	.db #0xDA	; -38
	.db #0xDB	; -37
	.db #0xDE	; -34
	.db #0xE0	; -32
	.db #0xE3	; -29
	.db #0xE6	; -26
	.db #0xE9	; -23
	.db #0xED	; -19
	.db #0xF1	; -15
	.db #0xF6	; -10
	.db #0xFB	; -5
	.db #0x00	;  0
	.db #0x05	;  5
	.db #0x0A	;  10
	.db #0x0F	;  15
	.db #0x13	;  19
	.db #0x17	;  23
	.db #0x1A	;  26
	.db #0x1D	;  29
	.db #0x20	;  32
	.db #0x22	;  34
	.db #0x25	;  37
	.db #0x26	;  38
	.db #0x28	;  40
	.db #0x2A	;  42
	.db #0x2B	;  43
	.db #0x2C	;  44
	.db #0xD6	; -42
	.db #0xD7	; -41
	.db #0xD9	; -39
	.db #0xDA	; -38
	.db #0xDC	; -36
	.db #0xDE	; -34
	.db #0xE0	; -32
	.db #0xE2	; -30
	.db #0xE5	; -27
	.db #0xE8	; -24
	.db #0xEB	; -21
	.db #0xEF	; -17
	.db #0xF3	; -13
	.db #0xF7	; -9
	.db #0xFB	; -5
	.db #0x00	;  0
	.db #0x05	;  5
	.db #0x09	;  9
	.db #0x0D	;  13
	.db #0x11	;  17
	.db #0x15	;  21
	.db #0x18	;  24
	.db #0x1B	;  27
	.db #0x1E	;  30
	.db #0x20	;  32
	.db #0x22	;  34
	.db #0x24	;  36
	.db #0x26	;  38
	.db #0x27	;  39
	.db #0x29	;  41
	.db #0x2A	;  42
	.db #0xD8	; -40
	.db #0xD9	; -39
	.db #0xDB	; -37
	.db #0xDC	; -36
	.db #0xDE	; -34
	.db #0xE0	; -32
	.db #0xE2	; -30
	.db #0xE5	; -27
	.db #0xE7	; -25
	.db #0xEA	; -22
	.db #0xED	; -19
	.db #0xF0	; -16
	.db #0xF4	; -12
	.db #0xF8	; -8
	.db #0xFC	; -4
	.db #0x00	;  0
	.db #0x04	;  4
	.db #0x08	;  8
	.db #0x0C	;  12
	.db #0x10	;  16
	.db #0x13	;  19
	.db #0x16	;  22
	.db #0x19	;  25
	.db #0x1B	;  27
	.db #0x1E	;  30
	.db #0x20	;  32
	.db #0x22	;  34
	.db #0x24	;  36
	.db #0x25	;  37
	.db #0x27	;  39
	.db #0x28	;  40
	.db #0xDA	; -38
	.db #0xDB	; -37
	.db #0xDD	; -35
	.db #0xDE	; -34
	.db #0xE0	; -32
	.db #0xE2	; -30
	.db #0xE4	; -28
	.db #0xE6	; -26
	.db #0xE9	; -23
	.db #0xEC	; -20
	.db #0xEF	; -17
	.db #0xF2	; -14
	.db #0xF5	; -11
	.db #0xF9	; -7
	.db #0xFC	; -4
	.db #0x00	;  0
	.db #0x04	;  4
	.db #0x07	;  7
	.db #0x0B	;  11
	.db #0x0E	;  14
	.db #0x11	;  17
	.db #0x14	;  20
	.db #0x17	;  23
	.db #0x1A	;  26
	.db #0x1C	;  28
	.db #0x1E	;  30
	.db #0x20	;  32
	.db #0x22	;  34
	.db #0x23	;  35
	.db #0x25	;  37
	.db #0x26	;  38
	.db #0xDB	; -37
	.db #0xDD	; -35
	.db #0xDE	; -34
	.db #0xE0	; -32
	.db #0xE2	; -30
	.db #0xE4	; -28
	.db #0xE6	; -26
	.db #0xE8	; -24
	.db #0xEA	; -22
	.db #0xED	; -19
	.db #0xF0	; -16
	.db #0xF3	; -13
	.db #0xF6	; -10
	.db #0xF9	; -7
	.db #0xFD	; -3
	.db #0x00	;  0
	.db #0x03	;  3
	.db #0x07	;  7
	.db #0x0A	;  10
	.db #0x0D	;  13
	.db #0x10	;  16
	.db #0x13	;  19
	.db #0x16	;  22
	.db #0x18	;  24
	.db #0x1A	;  26
	.db #0x1C	;  28
	.db #0x1E	;  30
	.db #0x20	;  32
	.db #0x22	;  34
	.db #0x23	;  35
	.db #0x25	;  37
	.db #0xDD	; -35
	.db #0xDE	; -34
	.db #0xE0	; -32
	.db #0xE2	; -30
	.db #0xE3	; -29
	.db #0xE5	; -27
	.db #0xE7	; -25
	.db #0xEA	; -22
	.db #0xEC	; -20
	.db #0xEE	; -18
	.db #0xF1	; -15
	.db #0xF4	; -12
	.db #0xF7	; -9
	.db #0xFA	; -6
	.db #0xFD	; -3
	.db #0x00	;  0
	.db #0x03	;  3
	.db #0x06	;  6
	.db #0x09	;  9
	.db #0x0C	;  12
	.db #0x0F	;  15
	.db #0x12	;  18
	.db #0x14	;  20
	.db #0x16	;  22
	.db #0x19	;  25
	.db #0x1B	;  27
	.db #0x1D	;  29
	.db #0x1E	;  30
	.db #0x20	;  32
	.db #0x22	;  34
	.db #0x23	;  35
	.db #0xDF	; -33
	.db #0xE0	; -32
	.db #0xE2	; -30
	.db #0xE3	; -29
	.db #0xE5	; -27
	.db #0xE7	; -25
	.db #0xE9	; -23
	.db #0xEB	; -21
	.db #0xED	; -19
	.db #0xF0	; -16
	.db #0xF2	; -14
	.db #0xF5	; -11
	.db #0xF7	; -9
	.db #0xFA	; -6
	.db #0xFD	; -3
	.db #0x00	;  0
	.db #0x03	;  3
	.db #0x06	;  6
	.db #0x09	;  9
	.db #0x0B	;  11
	.db #0x0E	;  14
	.db #0x10	;  16
	.db #0x13	;  19
	.db #0x15	;  21
	.db #0x17	;  23
	.db #0x19	;  25
	.db #0x1B	;  27
	.db #0x1D	;  29
	.db #0x1E	;  30
	.db #0x20	;  32
	.db #0x21	;  33
	.db #0xE0	; -32
	.db #0xE1	; -31
	.db #0xE3	; -29
	.db #0xE5	; -27
	.db #0xE6	; -26
	.db #0xE8	; -24
	.db #0xEA	; -22
	.db #0xEC	; -20
	.db #0xEE	; -18
	.db #0xF0	; -16
	.db #0xF3	; -13
	.db #0xF5	; -11
	.db #0xF8	; -8
	.db #0xFB	; -5
	.db #0xFD	; -3
	.db #0x00	;  0
	.db #0x03	;  3
	.db #0x05	;  5
	.db #0x08	;  8
	.db #0x0B	;  11
	.db #0x0D	;  13
	.db #0x10	;  16
	.db #0x12	;  18
	.db #0x14	;  20
	.db #0x16	;  22
	.db #0x18	;  24
	.db #0x1A	;  26
	.db #0x1B	;  27
	.db #0x1D	;  29
	.db #0x1F	;  31
	.db #0x20	;  32
_g_SquareRoot1024:
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x0B	; 11
	.db #0x0D	; 13
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x13	; 19
	.db #0x15	; 21
	.db #0x16	; 22
	.db #0x18	; 24
	.db #0x19	; 25
	.db #0x1A	; 26
	.db #0x1B	; 27
	.db #0x1C	; 28
	.db #0x1D	; 29
	.db #0x1E	; 30
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x21	; 33
	.db #0x22	; 34
	.db #0x23	; 35
	.db #0x24	; 36
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x29	; 41
	.db #0x2A	; 42
	.db #0x2B	; 43
	.db #0x2B	; 43
	.db #0x2C	; 44
	.db #0x2D	; 45
	.db #0x2D	; 45
	.db #0x2E	; 46
	.db #0x2F	; 47
	.db #0x30	; 48
	.db #0x30	; 48
	.db #0x31	; 49
	.db #0x31	; 49
	.db #0x32	; 50
	.db #0x33	; 51
	.db #0x33	; 51
	.db #0x34	; 52
	.db #0x35	; 53
	.db #0x35	; 53
	.db #0x36	; 54
	.db #0x36	; 54
	.db #0x37	; 55
	.db #0x38	; 56
	.db #0x38	; 56
	.db #0x39	; 57
	.db #0x39	; 57
	.db #0x3A	; 58
	.db #0x3A	; 58
	.db #0x3B	; 59
	.db #0x3B	; 59
	.db #0x3C	; 60
	.db #0x3C	; 60
	.db #0x3D	; 61
	.db #0x3D	; 61
	.db #0x3E	; 62
	.db #0x3E	; 62
	.db #0x3F	; 63
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x41	; 65	A
	.db #0x41	; 65	A
	.db #0x42	; 66	B
	.db #0x42	; 66	B
	.db #0x43	; 67	C
	.db #0x43	; 67	C
	.db #0x44	; 68	D
	.db #0x44	; 68	D
	.db #0x45	; 69	E
	.db #0x45	; 69	E
	.db #0x46	; 70	F
	.db #0x46	; 70	F
	.db #0x47	; 71	G
	.db #0x47	; 71	G
	.db #0x48	; 72	H
	.db #0x48	; 72	H
	.db #0x48	; 72	H
	.db #0x49	; 73	I
	.db #0x49	; 73	I
	.db #0x4A	; 74	J
	.db #0x4A	; 74	J
	.db #0x4B	; 75	K
	.db #0x4B	; 75	K
	.db #0x4B	; 75	K
	.db #0x4C	; 76	L
	.db #0x4C	; 76	L
	.db #0x4D	; 77	M
	.db #0x4D	; 77	M
	.db #0x4D	; 77	M
	.db #0x4E	; 78	N
	.db #0x4E	; 78	N
	.db #0x4F	; 79	O
	.db #0x4F	; 79	O
	.db #0x50	; 80	P
	.db #0x50	; 80	P
	.db #0x50	; 80	P
	.db #0x51	; 81	Q
	.db #0x51	; 81	Q
	.db #0x51	; 81	Q
	.db #0x52	; 82	R
	.db #0x52	; 82	R
	.db #0x53	; 83	S
	.db #0x53	; 83	S
	.db #0x53	; 83	S
	.db #0x54	; 84	T
	.db #0x54	; 84	T
	.db #0x55	; 85	U
	.db #0x55	; 85	U
	.db #0x55	; 85	U
	.db #0x56	; 86	V
	.db #0x56	; 86	V
	.db #0x56	; 86	V
	.db #0x57	; 87	W
	.db #0x57	; 87	W
	.db #0x58	; 88	X
	.db #0x58	; 88	X
	.db #0x58	; 88	X
	.db #0x59	; 89	Y
	.db #0x59	; 89	Y
	.db #0x59	; 89	Y
	.db #0x5A	; 90	Z
	.db #0x5A	; 90	Z
	.db #0x5A	; 90	Z
	.db #0x5B	; 91
	.db #0x5B	; 91
	.db #0x5B	; 91
	.db #0x5C	; 92
	.db #0x5C	; 92
	.db #0x5C	; 92
	.db #0x5D	; 93
	.db #0x5D	; 93
	.db #0x5D	; 93
	.db #0x5E	; 94
	.db #0x5E	; 94
	.db #0x5E	; 94
	.db #0x5F	; 95
	.db #0x5F	; 95
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x61	; 97	a
	.db #0x61	; 97	a
	.db #0x61	; 97	a
	.db #0x62	; 98	b
	.db #0x62	; 98	b
	.db #0x62	; 98	b
	.db #0x63	; 99	c
	.db #0x63	; 99	c
	.db #0x63	; 99	c
	.db #0x64	; 100	d
	.db #0x64	; 100	d
	.db #0x64	; 100	d
	.db #0x65	; 101	e
	.db #0x65	; 101	e
	.db #0x65	; 101	e
	.db #0x66	; 102	f
	.db #0x66	; 102	f
	.db #0x66	; 102	f
	.db #0x67	; 103	g
	.db #0x67	; 103	g
	.db #0x67	; 103	g
	.db #0x68	; 104	h
	.db #0x68	; 104	h
	.db #0x68	; 104	h
	.db #0x68	; 104	h
	.db #0x69	; 105	i
	.db #0x69	; 105	i
	.db #0x69	; 105	i
	.db #0x6A	; 106	j
	.db #0x6A	; 106	j
	.db #0x6A	; 106	j
	.db #0x6B	; 107	k
	.db #0x6B	; 107	k
	.db #0x6B	; 107	k
	.db #0x6B	; 107	k
	.db #0x6C	; 108	l
	.db #0x6C	; 108	l
	.db #0x6C	; 108	l
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0x6E	; 110	n
	.db #0x6E	; 110	n
	.db #0x6E	; 110	n
	.db #0x6F	; 111	o
	.db #0x6F	; 111	o
	.db #0x6F	; 111	o
	.db #0x70	; 112	p
	.db #0x70	; 112	p
	.db #0x70	; 112	p
	.db #0x70	; 112	p
	.db #0x71	; 113	q
	.db #0x71	; 113	q
	.db #0x71	; 113	q
	.db #0x71	; 113	q
	.db #0x72	; 114	r
	.db #0x72	; 114	r
	.db #0x72	; 114	r
	.db #0x73	; 115	s
	.db #0x73	; 115	s
	.db #0x73	; 115	s
	.db #0x73	; 115	s
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0x75	; 117	u
	.db #0x75	; 117	u
	.db #0x75	; 117	u
	.db #0x75	; 117	u
	.db #0x76	; 118	v
	.db #0x76	; 118	v
	.db #0x76	; 118	v
	.db #0x76	; 118	v
	.db #0x77	; 119	w
	.db #0x77	; 119	w
	.db #0x77	; 119	w
	.db #0x78	; 120	x
	.db #0x78	; 120	x
	.db #0x78	; 120	x
	.db #0x78	; 120	x
	.db #0x79	; 121	y
	.db #0x79	; 121	y
	.db #0x79	; 121	y
	.db #0x79	; 121	y
	.db #0x7A	; 122	z
	.db #0x7A	; 122	z
	.db #0x7A	; 122	z
	.db #0x7A	; 122	z
	.db #0x7B	; 123
	.db #0x7B	; 123
	.db #0x7B	; 123
	.db #0x7B	; 123
	.db #0x7C	; 124
	.db #0x7C	; 124
	.db #0x7C	; 124
	.db #0x7C	; 124
	.db #0x7D	; 125
	.db #0x7D	; 125
	.db #0x7D	; 125
	.db #0x7D	; 125
	.db #0x7E	; 126
	.db #0x7E	; 126
	.db #0x7E	; 126
	.db #0x7E	; 126
	.db #0x7F	; 127
	.db #0x7F	; 127
	.db #0x7F	; 127
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x82	; 130
	.db #0x82	; 130
	.db #0x82	; 130
	.db #0x82	; 130
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0x84	; 132
	.db #0x84	; 132
	.db #0x84	; 132
	.db #0x84	; 132
	.db #0x85	; 133
	.db #0x85	; 133
	.db #0x85	; 133
	.db #0x85	; 133
	.db #0x86	; 134
	.db #0x86	; 134
	.db #0x86	; 134
	.db #0x86	; 134
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x89	; 137
	.db #0x89	; 137
	.db #0x89	; 137
	.db #0x89	; 137
	.db #0x8A	; 138
	.db #0x8A	; 138
	.db #0x8A	; 138
	.db #0x8A	; 138
	.db #0x8B	; 139
	.db #0x8B	; 139
	.db #0x8B	; 139
	.db #0x8B	; 139
	.db #0x8B	; 139
	.db #0x8C	; 140
	.db #0x8C	; 140
	.db #0x8C	; 140
	.db #0x8C	; 140
	.db #0x8D	; 141
	.db #0x8D	; 141
	.db #0x8D	; 141
	.db #0x8D	; 141
	.db #0x8D	; 141
	.db #0x8E	; 142
	.db #0x8E	; 142
	.db #0x8E	; 142
	.db #0x8E	; 142
	.db #0x8F	; 143
	.db #0x8F	; 143
	.db #0x8F	; 143
	.db #0x8F	; 143
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0x91	; 145
	.db #0x91	; 145
	.db #0x91	; 145
	.db #0x91	; 145
	.db #0x91	; 145
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x93	; 147
	.db #0x93	; 147
	.db #0x93	; 147
	.db #0x93	; 147
	.db #0x93	; 147
	.db #0x94	; 148
	.db #0x94	; 148
	.db #0x94	; 148
	.db #0x94	; 148
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x96	; 150
	.db #0x96	; 150
	.db #0x96	; 150
	.db #0x96	; 150
	.db #0x96	; 150
	.db #0x97	; 151
	.db #0x97	; 151
	.db #0x97	; 151
	.db #0x97	; 151
	.db #0x98	; 152
	.db #0x98	; 152
	.db #0x98	; 152
	.db #0x98	; 152
	.db #0x98	; 152
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x9A	; 154
	.db #0x9A	; 154
	.db #0x9A	; 154
	.db #0x9A	; 154
	.db #0x9A	; 154
	.db #0x9B	; 155
	.db #0x9B	; 155
	.db #0x9B	; 155
	.db #0x9B	; 155
	.db #0x9B	; 155
	.db #0x9C	; 156
	.db #0x9C	; 156
	.db #0x9C	; 156
	.db #0x9C	; 156
	.db #0x9C	; 156
	.db #0x9D	; 157
	.db #0x9D	; 157
	.db #0x9D	; 157
	.db #0x9D	; 157
	.db #0x9D	; 157
	.db #0x9E	; 158
	.db #0x9E	; 158
	.db #0x9E	; 158
	.db #0x9E	; 158
	.db #0x9E	; 158
	.db #0x9F	; 159
	.db #0x9F	; 159
	.db #0x9F	; 159
	.db #0x9F	; 159
	.db #0xA0	; 160
	.db #0xA0	; 160
	.db #0xA0	; 160
	.db #0xA0	; 160
	.db #0xA0	; 160
	.db #0xA0	; 160
	.db #0xA1	; 161
	.db #0xA1	; 161
	.db #0xA1	; 161
	.db #0xA1	; 161
	.db #0xA1	; 161
	.db #0xA2	; 162
	.db #0xA2	; 162
	.db #0xA2	; 162
	.db #0xA2	; 162
	.db #0xA2	; 162
	.db #0xA3	; 163
	.db #0xA3	; 163
	.db #0xA3	; 163
	.db #0xA3	; 163
	.db #0xA3	; 163
	.db #0xA4	; 164
	.db #0xA4	; 164
	.db #0xA4	; 164
	.db #0xA4	; 164
	.db #0xA4	; 164
	.db #0xA5	; 165
	.db #0xA5	; 165
	.db #0xA5	; 165
	.db #0xA5	; 165
	.db #0xA5	; 165
	.db #0xA6	; 166
	.db #0xA6	; 166
	.db #0xA6	; 166
	.db #0xA6	; 166
	.db #0xA6	; 166
	.db #0xA7	; 167
	.db #0xA7	; 167
	.db #0xA7	; 167
	.db #0xA7	; 167
	.db #0xA7	; 167
	.db #0xA8	; 168
	.db #0xA8	; 168
	.db #0xA8	; 168
	.db #0xA8	; 168
	.db #0xA8	; 168
	.db #0xA8	; 168
	.db #0xA9	; 169
	.db #0xA9	; 169
	.db #0xA9	; 169
	.db #0xA9	; 169
	.db #0xA9	; 169
	.db #0xAA	; 170
	.db #0xAA	; 170
	.db #0xAA	; 170
	.db #0xAA	; 170
	.db #0xAA	; 170
	.db #0xAB	; 171
	.db #0xAB	; 171
	.db #0xAB	; 171
	.db #0xAB	; 171
	.db #0xAB	; 171
	.db #0xAB	; 171
	.db #0xAC	; 172
	.db #0xAC	; 172
	.db #0xAC	; 172
	.db #0xAC	; 172
	.db #0xAC	; 172
	.db #0xAD	; 173
	.db #0xAD	; 173
	.db #0xAD	; 173
	.db #0xAD	; 173
	.db #0xAD	; 173
	.db #0xAD	; 173
	.db #0xAE	; 174
	.db #0xAE	; 174
	.db #0xAE	; 174
	.db #0xAE	; 174
	.db #0xAE	; 174
	.db #0xAF	; 175
	.db #0xAF	; 175
	.db #0xAF	; 175
	.db #0xAF	; 175
	.db #0xAF	; 175
	.db #0xB0	; 176
	.db #0xB0	; 176
	.db #0xB0	; 176
	.db #0xB0	; 176
	.db #0xB0	; 176
	.db #0xB0	; 176
	.db #0xB1	; 177
	.db #0xB1	; 177
	.db #0xB1	; 177
	.db #0xB1	; 177
	.db #0xB1	; 177
	.db #0xB1	; 177
	.db #0xB2	; 178
	.db #0xB2	; 178
	.db #0xB2	; 178
	.db #0xB2	; 178
	.db #0xB2	; 178
	.db #0xB3	; 179
	.db #0xB3	; 179
	.db #0xB3	; 179
	.db #0xB3	; 179
	.db #0xB3	; 179
	.db #0xB3	; 179
	.db #0xB4	; 180
	.db #0xB4	; 180
	.db #0xB4	; 180
	.db #0xB4	; 180
	.db #0xB4	; 180
	.db #0xB5	; 181
	.db #0xB5	; 181
	.db #0xB5	; 181
	.db #0xB5	; 181
	.db #0xB5	; 181
	.db #0xB5	; 181
	.db #0xB6	; 182
	.db #0xB6	; 182
	.db #0xB6	; 182
	.db #0xB6	; 182
	.db #0xB6	; 182
	.db #0xB6	; 182
	.db #0xB7	; 183
	.db #0xB7	; 183
	.db #0xB7	; 183
	.db #0xB7	; 183
	.db #0xB7	; 183
	.db #0xB8	; 184
	.db #0xB8	; 184
	.db #0xB8	; 184
	.db #0xB8	; 184
	.db #0xB8	; 184
	.db #0xB8	; 184
	.db #0xB9	; 185
	.db #0xB9	; 185
	.db #0xB9	; 185
	.db #0xB9	; 185
	.db #0xB9	; 185
	.db #0xB9	; 185
	.db #0xBA	; 186
	.db #0xBA	; 186
	.db #0xBA	; 186
	.db #0xBA	; 186
	.db #0xBA	; 186
	.db #0xBA	; 186
	.db #0xBB	; 187
	.db #0xBB	; 187
	.db #0xBB	; 187
	.db #0xBB	; 187
	.db #0xBB	; 187
	.db #0xBB	; 187
	.db #0xBC	; 188
	.db #0xBC	; 188
	.db #0xBC	; 188
	.db #0xBC	; 188
	.db #0xBC	; 188
	.db #0xBC	; 188
	.db #0xBD	; 189
	.db #0xBD	; 189
	.db #0xBD	; 189
	.db #0xBD	; 189
	.db #0xBD	; 189
	.db #0xBD	; 189
	.db #0xBE	; 190
	.db #0xBE	; 190
	.db #0xBE	; 190
	.db #0xBE	; 190
	.db #0xBE	; 190
	.db #0xBE	; 190
	.db #0xBF	; 191
	.db #0xBF	; 191
	.db #0xBF	; 191
	.db #0xBF	; 191
	.db #0xBF	; 191
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC1	; 193
	.db #0xC1	; 193
	.db #0xC1	; 193
	.db #0xC1	; 193
	.db #0xC1	; 193
	.db #0xC1	; 193
	.db #0xC2	; 194
	.db #0xC2	; 194
	.db #0xC2	; 194
	.db #0xC2	; 194
	.db #0xC2	; 194
	.db #0xC2	; 194
	.db #0xC3	; 195
	.db #0xC3	; 195
	.db #0xC3	; 195
	.db #0xC3	; 195
	.db #0xC3	; 195
	.db #0xC3	; 195
	.db #0xC4	; 196
	.db #0xC4	; 196
	.db #0xC4	; 196
	.db #0xC4	; 196
	.db #0xC4	; 196
	.db #0xC4	; 196
	.db #0xC5	; 197
	.db #0xC5	; 197
	.db #0xC5	; 197
	.db #0xC5	; 197
	.db #0xC5	; 197
	.db #0xC5	; 197
	.db #0xC6	; 198
	.db #0xC6	; 198
	.db #0xC6	; 198
	.db #0xC6	; 198
	.db #0xC6	; 198
	.db #0xC6	; 198
	.db #0xC7	; 199
	.db #0xC7	; 199
	.db #0xC7	; 199
	.db #0xC7	; 199
	.db #0xC7	; 199
	.db #0xC7	; 199
	.db #0xC8	; 200
	.db #0xC8	; 200
	.db #0xC8	; 200
	.db #0xC8	; 200
	.db #0xC8	; 200
	.db #0xC8	; 200
	.db #0xC8	; 200
	.db #0xC9	; 201
	.db #0xC9	; 201
	.db #0xC9	; 201
	.db #0xC9	; 201
	.db #0xC9	; 201
	.db #0xC9	; 201
	.db #0xCA	; 202
	.db #0xCA	; 202
	.db #0xCA	; 202
	.db #0xCA	; 202
	.db #0xCA	; 202
	.db #0xCA	; 202
	.db #0xCB	; 203
	.db #0xCB	; 203
	.db #0xCB	; 203
	.db #0xCB	; 203
	.db #0xCB	; 203
	.db #0xCB	; 203
	.db #0xCB	; 203
	.db #0xCC	; 204
	.db #0xCC	; 204
	.db #0xCC	; 204
	.db #0xCC	; 204
	.db #0xCC	; 204
	.db #0xCC	; 204
	.db #0xCD	; 205
	.db #0xCD	; 205
	.db #0xCD	; 205
	.db #0xCD	; 205
	.db #0xCD	; 205
	.db #0xCD	; 205
	.db #0xCD	; 205
	.db #0xCE	; 206
	.db #0xCE	; 206
	.db #0xCE	; 206
	.db #0xCE	; 206
	.db #0xCE	; 206
	.db #0xCE	; 206
	.db #0xCF	; 207
	.db #0xCF	; 207
	.db #0xCF	; 207
	.db #0xCF	; 207
	.db #0xCF	; 207
	.db #0xCF	; 207
	.db #0xD0	; 208
	.db #0xD0	; 208
	.db #0xD0	; 208
	.db #0xD0	; 208
	.db #0xD0	; 208
	.db #0xD0	; 208
	.db #0xD0	; 208
	.db #0xD1	; 209
	.db #0xD1	; 209
	.db #0xD1	; 209
	.db #0xD1	; 209
	.db #0xD1	; 209
	.db #0xD1	; 209
	.db #0xD1	; 209
	.db #0xD2	; 210
	.db #0xD2	; 210
	.db #0xD2	; 210
	.db #0xD2	; 210
	.db #0xD2	; 210
	.db #0xD2	; 210
	.db #0xD3	; 211
	.db #0xD3	; 211
	.db #0xD3	; 211
	.db #0xD3	; 211
	.db #0xD3	; 211
	.db #0xD3	; 211
	.db #0xD3	; 211
	.db #0xD4	; 212
	.db #0xD4	; 212
	.db #0xD4	; 212
	.db #0xD4	; 212
	.db #0xD4	; 212
	.db #0xD4	; 212
	.db #0xD5	; 213
	.db #0xD5	; 213
	.db #0xD5	; 213
	.db #0xD5	; 213
	.db #0xD5	; 213
	.db #0xD5	; 213
	.db #0xD5	; 213
	.db #0xD6	; 214
	.db #0xD6	; 214
	.db #0xD6	; 214
	.db #0xD6	; 214
	.db #0xD6	; 214
	.db #0xD6	; 214
	.db #0xD6	; 214
	.db #0xD7	; 215
	.db #0xD7	; 215
	.db #0xD7	; 215
	.db #0xD7	; 215
	.db #0xD7	; 215
	.db #0xD7	; 215
	.db #0xD8	; 216
	.db #0xD8	; 216
	.db #0xD8	; 216
	.db #0xD8	; 216
	.db #0xD8	; 216
	.db #0xD8	; 216
	.db #0xD8	; 216
	.db #0xD9	; 217
	.db #0xD9	; 217
	.db #0xD9	; 217
	.db #0xD9	; 217
	.db #0xD9	; 217
	.db #0xD9	; 217
	.db #0xD9	; 217
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0xDB	; 219
	.db #0xDB	; 219
	.db #0xDB	; 219
	.db #0xDB	; 219
	.db #0xDB	; 219
	.db #0xDB	; 219
	.db #0xDB	; 219
	.db #0xDC	; 220
	.db #0xDC	; 220
	.db #0xDC	; 220
	.db #0xDC	; 220
	.db #0xDC	; 220
	.db #0xDC	; 220
	.db #0xDC	; 220
	.db #0xDD	; 221
	.db #0xDD	; 221
	.db #0xDD	; 221
	.db #0xDD	; 221
	.db #0xDD	; 221
	.db #0xDD	; 221
	.db #0xDD	; 221
	.db #0xDE	; 222
	.db #0xDE	; 222
	.db #0xDE	; 222
	.db #0xDE	; 222
	.db #0xDE	; 222
	.db #0xDE	; 222
	.db #0xDE	; 222
	.db #0xDF	; 223
	.db #0xDF	; 223
	.db #0xDF	; 223
	.db #0xDF	; 223
	.db #0xDF	; 223
	.db #0xDF	; 223
	.db #0xE0	; 224
	.db #0xE0	; 224
	.db #0xE0	; 224
	.db #0xE0	; 224
	.db #0xE0	; 224
	.db #0xE0	; 224
	.db #0xE0	; 224
	.db #0xE0	; 224
	.db #0xE1	; 225
	.db #0xE1	; 225
	.db #0xE1	; 225
	.db #0xE1	; 225
	.db #0xE1	; 225
	.db #0xE1	; 225
	.db #0xE1	; 225
	.db #0xE2	; 226
	.db #0xE2	; 226
	.db #0xE2	; 226
	.db #0xE2	; 226
	.db #0xE2	; 226
	.db #0xE2	; 226
	.db #0xE2	; 226
	.db #0xE3	; 227
	.db #0xE3	; 227
	.db #0xE3	; 227
	.db #0xE3	; 227
	.db #0xE3	; 227
	.db #0xE3	; 227
	.db #0xE3	; 227
	.db #0xE4	; 228
	.db #0xE4	; 228
	.db #0xE4	; 228
	.db #0xE4	; 228
	.db #0xE4	; 228
	.db #0xE4	; 228
	.db #0xE4	; 228
	.db #0xE5	; 229
	.db #0xE5	; 229
	.db #0xE5	; 229
	.db #0xE5	; 229
	.db #0xE5	; 229
	.db #0xE5	; 229
	.db #0xE5	; 229
	.db #0xE6	; 230
	.db #0xE6	; 230
	.db #0xE6	; 230
	.db #0xE6	; 230
	.db #0xE6	; 230
	.db #0xE6	; 230
	.db #0xE6	; 230
	.db #0xE7	; 231
	.db #0xE7	; 231
	.db #0xE7	; 231
	.db #0xE7	; 231
	.db #0xE7	; 231
	.db #0xE7	; 231
	.db #0xE7	; 231
	.db #0xE8	; 232
	.db #0xE8	; 232
	.db #0xE8	; 232
	.db #0xE8	; 232
	.db #0xE8	; 232
	.db #0xE8	; 232
	.db #0xE8	; 232
	.db #0xE8	; 232
	.db #0xE9	; 233
	.db #0xE9	; 233
	.db #0xE9	; 233
	.db #0xE9	; 233
	.db #0xE9	; 233
	.db #0xE9	; 233
	.db #0xE9	; 233
	.db #0xEA	; 234
	.db #0xEA	; 234
	.db #0xEA	; 234
	.db #0xEA	; 234
	.db #0xEA	; 234
	.db #0xEA	; 234
	.db #0xEA	; 234
	.db #0xEB	; 235
	.db #0xEB	; 235
	.db #0xEB	; 235
	.db #0xEB	; 235
	.db #0xEB	; 235
	.db #0xEB	; 235
	.db #0xEB	; 235
	.db #0xEB	; 235
	.db #0xEC	; 236
	.db #0xEC	; 236
	.db #0xEC	; 236
	.db #0xEC	; 236
	.db #0xEC	; 236
	.db #0xEC	; 236
	.db #0xEC	; 236
	.db #0xED	; 237
	.db #0xED	; 237
	.db #0xED	; 237
	.db #0xED	; 237
	.db #0xED	; 237
	.db #0xED	; 237
	.db #0xED	; 237
	.db #0xED	; 237
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xEF	; 239
	.db #0xEF	; 239
	.db #0xEF	; 239
	.db #0xEF	; 239
	.db #0xEF	; 239
	.db #0xEF	; 239
	.db #0xEF	; 239
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xF1	; 241
	.db #0xF1	; 241
	.db #0xF1	; 241
	.db #0xF1	; 241
	.db #0xF1	; 241
	.db #0xF1	; 241
	.db #0xF1	; 241
	.db #0xF1	; 241
	.db #0xF2	; 242
	.db #0xF2	; 242
	.db #0xF2	; 242
	.db #0xF2	; 242
	.db #0xF2	; 242
	.db #0xF2	; 242
	.db #0xF2	; 242
	.db #0xF3	; 243
	.db #0xF3	; 243
	.db #0xF3	; 243
	.db #0xF3	; 243
	.db #0xF3	; 243
	.db #0xF3	; 243
	.db #0xF3	; 243
	.db #0xF3	; 243
	.db #0xF4	; 244
	.db #0xF4	; 244
	.db #0xF4	; 244
	.db #0xF4	; 244
	.db #0xF4	; 244
	.db #0xF4	; 244
	.db #0xF4	; 244
	.db #0xF5	; 245
	.db #0xF5	; 245
	.db #0xF5	; 245
	.db #0xF5	; 245
	.db #0xF5	; 245
	.db #0xF5	; 245
	.db #0xF5	; 245
	.db #0xF5	; 245
	.db #0xF6	; 246
	.db #0xF6	; 246
	.db #0xF6	; 246
	.db #0xF6	; 246
	.db #0xF6	; 246
	.db #0xF6	; 246
	.db #0xF6	; 246
	.db #0xF6	; 246
	.db #0xF7	; 247
	.db #0xF7	; 247
	.db #0xF7	; 247
	.db #0xF7	; 247
	.db #0xF7	; 247
	.db #0xF7	; 247
	.db #0xF7	; 247
	.db #0xF8	; 248
	.db #0xF8	; 248
	.db #0xF8	; 248
	.db #0xF8	; 248
	.db #0xF8	; 248
	.db #0xF8	; 248
	.db #0xF8	; 248
	.db #0xF8	; 248
	.db #0xF9	; 249
	.db #0xF9	; 249
	.db #0xF9	; 249
	.db #0xF9	; 249
	.db #0xF9	; 249
	.db #0xF9	; 249
	.db #0xF9	; 249
	.db #0xF9	; 249
	.db #0xFA	; 250
	.db #0xFA	; 250
	.db #0xFA	; 250
	.db #0xFA	; 250
	.db #0xFA	; 250
	.db #0xFA	; 250
	.db #0xFA	; 250
	.db #0xFA	; 250
	.db #0xFB	; 251
	.db #0xFB	; 251
	.db #0xFB	; 251
	.db #0xFB	; 251
	.db #0xFB	; 251
	.db #0xFB	; 251
	.db #0xFB	; 251
	.db #0xFB	; 251
	.db #0xFC	; 252
	.db #0xFC	; 252
	.db #0xFC	; 252
	.db #0xFC	; 252
	.db #0xFC	; 252
	.db #0xFC	; 252
	.db #0xFC	; 252
	.db #0xFC	; 252
	.db #0xFD	; 253
	.db #0xFD	; 253
	.db #0xFD	; 253
	.db #0xFD	; 253
	.db #0xFD	; 253
	.db #0xFD	; 253
	.db #0xFD	; 253
	.db #0xFD	; 253
	.db #0xFE	; 254
	.db #0xFE	; 254
	.db #0xFE	; 254
	.db #0xFE	; 254
	.db #0xFE	; 254
	.db #0xFE	; 254
	.db #0xFE	; 254
	.db #0xFE	; 254
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
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
	.db #0x19	; 25
	.db #0x23	; 35
	.db #0x28	; 40
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0x14	; 20
	.db #0x23	; 35
	.db #0x3C	; 60
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x14	; 20
	.db #0x28	; 40
	.db #0x37	; 55
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x1E	; 30
	.db #0x1E	; 30
	.db #0x1E	; 30
	.db #0x05	; 5
_bg:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xD4	; 212
	.db #0x8C	; 140
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xBA	; 186
	.db #0x71	; 113	q
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1E	; 30
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x9B	; 155
	.db #0x72	; 114	r
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x9C	; 156
	.db #0x58	; 88	X
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x3C	; 60
	.db #0x34	; 52
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0xB6	; 182
	.db #0x6D	; 109	m
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x50	; 80	P
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0xD9	; 217
	.db #0x90	; 144
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0xA0	; 160
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0xFF	; 255
	.db #0xDB	; 219
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0xFB	; 251
	.db #0xD7	; 215
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x8B	; 139
	.db #0x47	; 71	G
_trackTiles01:
	.db #0x00	; 0
	.db #0xD4	; 212
	.db #0xB6	; 182
	.db #0x02	; 2
	.db #0xD4	; 212
	.db #0xB6	; 182
	.db #0x02	; 2
	.db #0xD4	; 212
	.db #0xB6	; 182
	.db #0x10	; 16
	.db #0xD4	; 212
	.db #0xB6	; 182
	.db #0x00	; 0
	.db #0xD4	; 212
	.db #0xB6	; 182
	.db #0x02	; 2
	.db #0xD4	; 212
	.db #0xB6	; 182
	.db #0x10	; 16
	.db #0xD4	; 212
	.db #0xB6	; 182
	.db #0x02	; 2
	.db #0xD4	; 212
	.db #0xB6	; 182
	.db #0x01	; 1
	.db #0xB6	; 182
	.db #0xD4	; 212
	.db #0x02	; 2
	.db #0xB6	; 182
	.db #0xD4	; 212
	.db #0x30	; 48
	.db #0xD4	; 212
	.db #0xB6	; 182
	.db #0x20	; 32
	.db #0xD4	; 212
	.db #0xB6	; 182
	.db #0x11	; 17
	.db #0xB6	; 182
	.db #0xD4	; 212
	.db #0x02	; 2
	.db #0xD4	; 212
	.db #0xB6	; 182
	.db #0x03	; 3
	.db #0xFF	; 255
	.db #0xB6	; 182
	.db #0x02	; 2
	.db #0xB6	; 182
	.db #0xD4	; 212
	.db #0x02	; 2
	.db #0xB6	; 182
	.db #0xD4	; 212
	.db #0x02	; 2
	.db #0xB6	; 182
	.db #0xD4	; 212
	.db #0x02	; 2
	.db #0xB6	; 182
	.db #0xD4	; 212
	.db #0x02	; 2
	.db #0xB6	; 182
	.db #0xD4	; 212
	.db #0x02	; 2
	.db #0xB6	; 182
	.db #0xB6	; 182
	.db #0x02	; 2
	.db #0xD4	; 212
	.db #0xB6	; 182
	.db #0x02	; 2
	.db #0xB6	; 182
	.db #0xD4	; 212
	.db #0x02	; 2
	.db #0xB6	; 182
	.db #0xD4	; 212
	.db #0x02	; 2
	.db #0xB6	; 182
	.db #0xD4	; 212
	.db #0x02	; 2
	.db #0xB6	; 182
	.db #0xD4	; 212
	.db #0x01	; 1
	.db #0xD4	; 212
	.db #0xB6	; 182
	.db #0x02	; 2
	.db #0xD4	; 212
	.db #0xB6	; 182
	.db #0x19	; 25
	.db #0xD9	; 217
	.db #0xB6	; 182
	.db #0x00	; 0
	.db #0xD4	; 212
	.db #0xD9	; 217
	.db #0x02	; 2
	.db #0xD4	; 212
	.db #0xD9	; 217
	.db #0x02	; 2
	.db #0xB6	; 182
	.db #0xD4	; 212
	.db #0x3B	; 59
	.db #0x9C	; 156
	.db #0xB6	; 182
	.db #0x04	; 4
	.db #0xD4	; 212
	.db #0xB6	; 182
	.db #0x02	; 2
	.db #0xD4	; 212
	.db #0xB6	; 182
	.db #0x30	; 48
	.db #0xD4	; 212
	.db #0xD9	; 217
	.db #0x02	; 2
	.db #0xD4	; 212
	.db #0xD9	; 217
	.db #0x01	; 1
	.db #0xD9	; 217
	.db #0xD4	; 212
	.db #0x02	; 2
	.db #0xB6	; 182
	.db #0xD4	; 212
	.db #0x11	; 17
	.db #0xB6	; 182
	.db #0xD4	; 212
	.db #0x02	; 2
	.db #0xD4	; 212
	.db #0xB6	; 182
	.db #0x20	; 32
	.db #0xD4	; 212
	.db #0xB6	; 182
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
_height:
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x00	; 0
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
;carwar.c:460: void MainLoop()
;	---------------------------------
; Function MainLoop
; ---------------------------------
_MainLoop_start::
_MainLoop:
;carwar.c:463: game.state = StateInitialize;
	ld	hl,#0x016f + _game
	ld	(hl),#<(_StateInitialize)
	inc	hl
	ld	(hl),#>(_StateInitialize)
;carwar.c:465: while(1)
00102$:
;carwar.c:468: game.state();
	ld	hl,#0x016f + _game
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
;carwar.c:473: void StateInitialize()
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
;carwar.c:478: SetFreq(FREQ_60);
	ld	a,#0x00
	push	af
	inc	sp
	call	_SetFreq
	inc	sp
;carwar.c:479: SetScreen8(LINES_212);
	ld	a,#0x80
	push	af
	inc	sp
	call	_SetScreen8
	inc	sp
;carwar.c:480: SetSpriteMode(SPRITE_ON, SPRITE_NO_MAG + SPRITE_SIZE_8, 0xF800 >> 11, 0xF700 >> 7);
	ld	hl,#0x01EE
	push	hl
	ld	hl,#0x001F
	push	hl
	ld	l, #0x00
	push	hl
	call	_SetSpriteMode
	pop	af
	pop	af
;carwar.c:483: FillVRAM(0, 0,   256, 256, 0);
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
;carwar.c:484: FillVRAM(0, 256, 256, 256, 0);
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
;carwar.c:487: for(x=0; x<256; x++)
	ld	bc,#0x0000
00104$:
	ld	a,b
	sub	a,#0x01
	jr	NC,00107$
;carwar.c:488: game.colorCode[x] = OP_NONE;
	ld	hl,#0x0007 + _game
	add	hl,bc
	ex	de,hl
	ld	a,#0x00
	ld	(de),a
;carwar.c:487: for(x=0; x<256; x++)
	inc	bc
	jr	00104$
00107$:
;carwar.c:490: game.colorCode[COLOR_KHAKI]        = OP_WALL;
	ld	hl,#0x00d4 + 0x0007 + _game
	ld	(hl),#0x00
;carwar.c:491: game.colorCode[COLOR_DARKKAKHI]    = OP_WALL;
	ld	hl,#0x008c + 0x0007 + _game
	ld	(hl),#0x00
;carwar.c:492: game.colorCode[COLOR_SKIN]         = OP_BLADE;
	ld	hl,#0x00ba + 0x0007 + _game
	ld	(hl),#0x01
;carwar.c:493: game.colorCode[COLOR_DARKSKIN]     = OP_BLADE;
	ld	hl,#0x0071 + 0x0007 + _game
	ld	(hl),#0x01
;carwar.c:494: game.colorCode[COLOR_PINK]         = OP_BUMPER;
	ld	hl,#0x001e + 0x0007 + _game
	ld	(hl),#0x02
;carwar.c:495: game.colorCode[COLOR_DARKPINK]     = OP_BUMPER;
	ld	hl,#0x0015 + 0x0007 + _game
	ld	(hl),#0x02
;carwar.c:496: game.colorCode[COLOR_SAND]         = OP_ASPHALT;
	ld	hl,#0x00da + 0x0007 + _game
	ld	(hl),#0x0A
;carwar.c:497: game.colorCode[COLOR_LIGHTMAUVE]   = OP_ASPHALT;
	ld	hl,#0x00b7 + 0x0007 + _game
	ld	(hl),#0x0A
;carwar.c:498: game.colorCode[COLOR_GRAY]         = OP_ASPHALT;
	dec	hl
	ld	(hl),#0x0A
;carwar.c:499: game.colorCode[COLOR_DARKGRAY]     = OP_ASPHALT;
	ld	hl,#0x006d + 0x0007 + _game
	ld	(hl),#0x0A
;carwar.c:500: game.colorCode[COLOR_BROWN]        = OP_MUD;
	ld	hl,#0x0050 + 0x0007 + _game
	ld	(hl),#0x0B
;carwar.c:501: game.colorCode[COLOR_DARKBROWN]    = OP_MUD;
	ld	hl,#0x0028 + 0x0007 + _game
	ld	(hl),#0x0B
;carwar.c:502: game.colorCode[COLOR_YELLOW]       = OP_SAND;
	ld	hl,#0x00d9 + 0x0007 + _game
	ld	(hl),#0x0C
;carwar.c:503: game.colorCode[COLOR_DARKYELLOW]   = OP_SAND;
	ld	hl,#0x0090 + 0x0007 + _game
	ld	(hl),#0x0C
;carwar.c:504: game.colorCode[COLOR_GREEN]        = OP_GRASS;
	ld	hl,#0x00a0 + 0x0007 + _game
	ld	(hl),#0x0D
;carwar.c:505: game.colorCode[COLOR_DARKGREEN]    = OP_GRASS;
	ld	hl,#0x0060 + 0x0007 + _game
	ld	(hl),#0x0D
;carwar.c:506: game.colorCode[COLOR_WHITE]        = OP_SNOW;
	ld	hl,#0x00ff + 0x0007 + _game
	ld	(hl),#0x0E
;carwar.c:507: game.colorCode[COLOR_LIGHTGRAY]    = OP_SNOW;
	ld	hl,#0x00db + 0x0007 + _game
	ld	(hl),#0x0E
;carwar.c:508: game.colorCode[COLOR_CYAN]         = OP_ICE;
	ld	hl,#0x00fb + 0x0007 + _game
	ld	(hl),#0x0F
;carwar.c:509: game.colorCode[COLOR_LIGHTBLUE]    = OP_ICE;
	ld	hl,#0x00d7 + 0x0007 + _game
	ld	(hl),#0x0F
;carwar.c:510: game.colorCode[COLOR_BLUE]         = OP_WATER;
	ld	hl,#0x008b + 0x0007 + _game
	ld	(hl),#0x10
;carwar.c:511: game.colorCode[COLOR_DARKBLUE]     = OP_WATER;
	ld	hl,#0x0047 + 0x0007 + _game
	ld	(hl),#0x10
;carwar.c:512: game.colorCode[COLOR_NAVYBLUE]     = OP_SEA;
	ld	hl,#0x0002 + 0x0007 + _game
	ld	(hl),#0x07
;carwar.c:513: game.colorCode[COLOR_DARKNAVYBLUE] = OP_SEA;
	dec	hl
	ld	(hl),#0x07
;carwar.c:514: game.colorCode[COLOR_MAUVE]        = OP_SPEEDER;
	ld	hl,#0x009b + 0x0007 + _game
	ld	(hl),#0x04
;carwar.c:515: game.colorCode[COLOR_DARKMAUVE]    = OP_SPEEDER;
	ld	hl,#0x0072 + 0x0007 + _game
	ld	(hl),#0x04
;carwar.c:516: game.colorCode[COLOR_ORANGE]       = OP_JUMPER;
	ld	hl,#0x009c + 0x0007 + _game
	ld	(hl),#0x05
;carwar.c:517: game.colorCode[COLOR_DARKORANGE]   = OP_JUMPER;
	ld	hl,#0x0058 + 0x0007 + _game
	ld	(hl),#0x05
;carwar.c:518: game.colorCode[COLOR_RED]          = OP_MAGMA;
	ld	hl,#0x003c + 0x0007 + _game
	ld	(hl),#0x06
;carwar.c:519: game.colorCode[COLOR_DARKRED]      = OP_MAGMA;
	ld	hl,#0x0034 + 0x0007 + _game
	ld	(hl),#0x06
;carwar.c:520: game.colorCode[COLOR_BLACK]        = OP_HOLE;
	ld	hl,#0x0007 + _game
	ld	(hl),#0x08
;carwar.c:523: for(x=0; x<sizeof(charTable) / 8; x++)
	ld	-2 (ix),#0x00
	ld	-1 (ix),#0x00
00108$:
	ld	a,-2 (ix)
	sub	a,#0x30
	ld	a,-1 (ix)
	sbc	a,#0x00
	jr	NC,00111$
;carwar.c:525: RAMtoVRAM((x * 8) % 256, 248 + (x / 32), 8, 1, (u16)&charTable[x * 8]);
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
;carwar.c:523: for(x=0; x<sizeof(charTable) / 8; x++)
	inc	-2 (ix)
	jr	NZ,00108$
	inc	-1 (ix)
	jr	00108$
00111$:
;carwar.c:529: for(x=0; x<256; x++)
	ld	-2 (ix),#0x00
	ld	-1 (ix),#0x00
00116$:
	ld	a,-1 (ix)
	sub	a,#0x01
	jp	NC,00119$
;carwar.c:531: for(i=0; i<8; i++)
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
;carwar.c:533: if(x & (1 << (7 - (i & 0x07))))
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
;carwar.c:534: game.bitToByte[x * 8 + i] = 0xFF;
	ld	a,-6 (ix)
	add	a,-4 (ix)
	ld	c,a
	ld	a,-5 (ix)
	adc	a,-3 (ix)
	ld	b,a
	ld	hl,#0x0171 + _game
	add	hl,bc
	ld	(hl),#0xFF
	jr	00114$
00102$:
;carwar.c:536: game.bitToByte[x * 8 + i] = 0x00;
	ld	a,e
	add	a,-4 (ix)
	ld	c,a
	ld	a,d
	adc	a,-3 (ix)
	ld	b,a
	ld	hl,#0x0171 + _game
	add	hl,bc
	ld	(hl),#0x00
00114$:
;carwar.c:531: for(i=0; i<8; i++)
	inc	-4 (ix)
	jr	NZ,00112$
	inc	-3 (ix)
	jr	00112$
00118$:
;carwar.c:529: for(x=0; x<256; x++)
	inc	-2 (ix)
	jp	NZ,00116$
	inc	-1 (ix)
	jp	00116$
00119$:
;carwar.c:540: game.page = 0;
	ld	hl,#0x0004 + _game
	ld	(hl),#0x00
;carwar.c:542: game.state = StateStartGame;
	ld	hl,#0x016f + _game
	ld	(hl),#<(_StateStartGame)
	inc	hl
	ld	(hl),#>(_StateStartGame)
	ld	sp,ix
	pop	ix
	ret
_StateInitialize_end::
;carwar.c:546: void InitializeMenu(u8 menu)
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
;carwar.c:549: game.menu = menu;
	ld	hl,#_game
	ld	a,4 (ix)
	ld	(hl),a
;carwar.c:550: game.item = 0;
	ld	hl,#0x0001 + _game
	ld	(hl),#0x00
;carwar.c:552: game.page = 1;
	ld	hl,#0x0004 + _game
	ld	(hl),#0x01
;carwar.c:553: SetPage8(game.page);
	ld	a, (hl)
	push	af
	inc	sp
	call	_SetPage8
	inc	sp
;carwar.c:555: HMMV(MENU_X, MENU_Y, 256 - MENU_X, 212 - MENU_Y, COLOR_BLACK);
	ld	hl,#0x0980 + _game
	ld	(hl),#0x54
	inc	hl
	ld	(hl),#0x00
	ld	hl,#0x0002 + 0x0980 + _game
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
	ld	l,#<(0x0980 + _game)
	ld	h,#>(0x0980 + _game)
	push	hl
	call	_VPDCommand36
	pop	af
;carwar.c:557: DrawText(MENU_X, MENU_Y, menus[game.menu].title, COLOR_WHITE);
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
;carwar.c:558: for(item = 0; item < menus[game.menu].itemNum; item++)
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
;carwar.c:560: DrawText(MENU_X + 12, MENU_Y + TITLE_SPACE + LINE_SPACE * item, menus[game.menu].items[item].text, menus[game.menu].items[item].nextIdx == ITEM_INVALID ? COLOR_GRAY : COLOR_WHITE);
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
	ld	-6 (ix),#0xB6
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
;carwar.c:558: for(item = 0; item < menus[game.menu].itemNum; item++)
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
;carwar.c:563: HMMM(MENU_X, MENU_Y, MENU_X, MENU_Y + 256, 256 - MENU_X, 212 - MENU_Y);
	ld	hl,#0x0971 + _game
	ld	(hl),#0x54
	inc	hl
	ld	(hl),#0x00
	ld	hl,#0x0002 + 0x0971 + _game
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
	ld	l,#<(0x0971 + _game)
	ld	h,#>(0x0971 + _game)
	push	hl
	call	_VPDCommand32
	ld	sp,ix
	pop	ix
	ret
_InitializeMenu_end::
;carwar.c:567: void StateTitle()
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
;carwar.c:571: game.page = 1;
	ld	hl,#0x0004 + _game
	ld	(hl),#0x01
;carwar.c:572: SetPage8(game.page);
	ld	a, (hl)
	push	af
	inc	sp
	call	_SetPage8
	inc	sp
;carwar.c:574: for(j=0; j<24; j++)
	ld	-2 (ix),#0x00
	ld	de,#0x0000
00107$:
	ld	a,-2 (ix)
	sub	a,#0x18
	jp	NC,00110$
;carwar.c:576: for(i=0; i<232; i++)
	ld	-5 (ix),e
	ld	-4 (ix),d
	sra	-4 (ix)
	rr	-5 (ix)
	sra	-4 (ix)
	rr	-5 (ix)
	sra	-4 (ix)
	rr	-5 (ix)
	ld	-1 (ix),#0x00
00103$:
	ld	a,-1 (ix)
	sub	a,#0xE8
	jp	NC,00106$
;carwar.c:578: byte = title[(i >> 3) + (j * 232 >> 3)];
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
;carwar.c:579: if(byte & (1 << (7 - (i & 0x07))))
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
	jr	00122$
00121$:
	sla	c
	rl	b
00122$:
	dec	a
	jr	NZ,00121$
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
;carwar.c:581: WriteVRAM(0, TITLE_X + i + 256 * (TITLE_Y + j), GrayGradiant(i + j));
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
;carwar.c:576: for(i=0; i<232; i++)
	inc	-1 (ix)
	jp	00103$
00106$:
;carwar.c:585: VRAMtoVRAM(TITLE_X, TITLE_Y + j, TITLE_X, TITLE_Y + 256 + j, 232, 1);
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
;carwar.c:574: for(j=0; j<24; j++)
	ld	hl,#0x00E8
	add	hl,de
	ex	de,hl
	inc	-2 (ix)
	jp	00107$
00110$:
;carwar.c:588: InitializeMenu(0);
	ld	a,#0x00
	push	af
	inc	sp
	call	_InitializeMenu
	inc	sp
;carwar.c:589: game.pressed = 0;
	ld	hl,#0x0002 + _game
	ld	(hl),#0x00
;carwar.c:590: game.page = 0;
	inc	hl
	inc	hl
	ld	(hl),#0x00
;carwar.c:591: game.state = StateMainMenu;
	ld	hl,#0x016f + _game
	ld	(hl),#<(_StateMainMenu)
	inc	hl
	ld	(hl),#>(_StateMainMenu)
	ld	sp,ix
	pop	ix
	ret
_StateTitle_end::
;carwar.c:595: void StartGame()
;	---------------------------------
; Function StartGame
; ---------------------------------
_StartGame_start::
_StartGame:
;carwar.c:597: game.state = StateStartGame;
	ld	hl,#0x016f + _game
	ld	(hl),#<(_StateStartGame)
	inc	hl
	ld	(hl),#>(_StateStartGame)
	ret
_StartGame_end::
;carwar.c:601: void StateMainMenu()
;	---------------------------------
; Function StateMainMenu
; ---------------------------------
_StateMainMenu_start::
_StateMainMenu:
;carwar.c:605: SetPage8(game.page);
	ld	a,(#0x0004 + _game)
	push	af
	inc	sp
	call	_SetPage8
	inc	sp
;carwar.c:606: game.page = 1 - game.page;
	ld	hl,#0x0004 + _game
	ld	l,(hl)
	ld	a,#0x01
	sub	a,l
	ld	hl,#0x0004 + _game
	ld	(hl),a
;carwar.c:607: game.yOffset = 256 * game.page;
	ld	b, (hl)
	ld	c,#0x00
	ld	hl,#0x0005 + _game
	ld	(hl),c
	inc	hl
	ld	(hl),b
;carwar.c:610: keyLine = GetKeyMatrixLine(8);
	ld	a,#0x08
	push	af
	inc	sp
	call	_GetKeyMatrixLine
	inc	sp
	ld	c,l
;carwar.c:611: if((keyLine & KEY_SPACE) == 0
	ld	a,c
	and	a,#0x01
	jr	Z,00105$
;carwar.c:612: || Joytrig(1) != 0
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
;carwar.c:613: || Joytrig(2) != 0)
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
;carwar.c:615: if(menus[game.menu].items[game.item].action != 0)
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
;carwar.c:616: menus[game.menu].items[game.item].action();
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
;carwar.c:617: if((menus[game.menu].items[game.item].nextIdx & 0x80) == 0)
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
;carwar.c:618: InitializeMenu(menus[game.menu].items[game.item].nextIdx);
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
;carwar.c:619: return;
	ret
00106$:
;carwar.c:623: if(game.pressed > 16)
	ld	hl,#0x0002 + _game
	ld	l,(hl)
	ld	a,#0x10
	sub	a,l
	jr	NC,00110$
;carwar.c:624: game.pressed = 0;
	ld	hl,#0x0002 + _game
	ld	(hl),#0x00
00110$:
;carwar.c:625: if(((keyLine & KEY_UP) == 0) && (game.item > 0))
	ld	a,c
	and	a,#0x20
	jr	NZ,00120$
	ld	hl,#0x0001 + _game
	ld	a,(hl)
	or	a,a
	jr	Z,00120$
;carwar.c:627: if(game.pressed == 0)
	inc	hl
	ld	a,(hl)
	or	a,a
	jr	NZ,00112$
;carwar.c:628: game.item--;
	dec	hl
	ld	a, (hl)
	dec	a
	ld	(#0x0001 + _game),a
00112$:
;carwar.c:629: game.pressed++;
	ld	a,(#0x0002 + _game)
	inc	a
	ld	(#0x0002 + _game),a
	jr	00121$
00120$:
;carwar.c:631: else if(((keyLine & KEY_DOWN) == 0) && (game.item < menus[game.menu].itemNum - 1))
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
;carwar.c:633: if(game.pressed == 0)
	ld	hl,#0x0002 + _game
	ld	a,(hl)
	or	a,a
	jr	NZ,00114$
;carwar.c:634: game.item++;
	dec	hl
	ld	a, (hl)
	inc	a
	ld	(#0x0001 + _game),a
00114$:
;carwar.c:635: game.pressed++;
	ld	a,(#0x0002 + _game)
	inc	a
	ld	(#0x0002 + _game),a
	jr	00121$
00116$:
;carwar.c:638: game.pressed = 0;
	ld	hl,#0x0002 + _game
	ld	(hl),#0x00
00121$:
;carwar.c:641: HMMV(MENU_X, MENU_Y + TITLE_SPACE + game.yOffset, 8, LINE_SPACE * menus[game.menu].itemNum, COLOR_BLACK);
	ld	hl,#0x0980 + _game
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
	ld	hl,#0x0002 + 0x0980 + _game
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
	ld	hl,#0x0006 + 0x0980 + _game
	ld	(hl),c
	inc	hl
	ld	(hl),b
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0xC0
	ld	l,#<(0x0980 + _game)
	ld	h,#>(0x0980 + _game)
	push	hl
	call	_VPDCommand36
	pop	af
;carwar.c:642: DrawText(MENU_X, MENU_Y + TITLE_SPACE + game.yOffset + (LINE_SPACE * game.item), "@", COLOR_WHITE);
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
;carwar.c:643: waitRetrace();
	call	_waitRetrace
	ret
_StateMainMenu_end::
__str_22:
	.ascii "@"
	.db 0x00
;carwar.c:647: void StateStartGame()
;	---------------------------------
; Function StateStartGame
; ---------------------------------
_StateStartGame_start::
_StateStartGame:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-23
	add	hl,sp
	ld	sp,hl
;carwar.c:650: const u8 colors[] = { 
	ld	hl,#0x0006
	add	hl,sp
	ld	c,l
	ld	b,h
	ld	(hl),#0xB6
	ld	e,c
	ld	d,b
	inc	de
	ld	a,#0xB6
	ld	(de),a
	ld	e,c
	ld	d,b
	inc	de
	inc	de
	ld	a,#0xB6
	ld	(de),a
	ld	hl,#0x0003
	add	hl,bc
	ex	de,hl
	ld	a,#0xB6
	ld	(de),a
	ld	hl,#0x0004
	add	hl,bc
	ex	de,hl
	ld	a,#0xB6
	ld	(de),a
	ld	hl,#0x0005
	add	hl,bc
	ex	de,hl
	ld	a,#0x50
	ld	(de),a
	ld	hl,#0x0006
	add	hl,bc
	ex	de,hl
	ld	a,#0xD9
	ld	(de),a
	ld	hl,#0x0007
	add	hl,bc
	ex	de,hl
	ld	a,#0xA0
	ld	(de),a
	ld	hl,#0x0008
	add	hl,bc
	ex	de,hl
	ld	a,#0xFF
	ld	(de),a
	ld	hl,#0x0009
	add	hl,bc
	ex	de,hl
	ld	a,#0xFB
	ld	(de),a
	ld	hl,#0x000A
	add	hl,bc
	ex	de,hl
	ld	a,#0x8B
	ld	(de),a
	ld	hl,#0x000B
	add	hl,bc
	ex	de,hl
	ld	a,#0x02
	ld	(de),a
	ld	hl,#0x000C
	add	hl,bc
	ex	de,hl
	ld	a,#0x9B
	ld	(de),a
	ld	hl,#0x000D
	add	hl,bc
	ex	de,hl
	ld	a,#0x9C
	ld	(de),a
	ld	hl,#0x000E
	add	hl,bc
	ex	de,hl
	ld	a,#0x3C
	ld	(de),a
	ld	hl,#0x000F
	add	hl,bc
	ld	(hl),#0x00
;carwar.c:660: game.page = 0;
	ld	hl,#0x0004 + _game
	ld	(hl),#0x00
;carwar.c:661: SetPage8(game.page);
	ld	a, (hl)
	push	af
	inc	sp
	call	_SetPage8
	inc	sp
;carwar.c:665: StateBuildTrack();
	call	_StateBuildTrack
;carwar.c:670: VRAMtoVRAM(0, 0, 0, 256, 256, 212);
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
;carwar.c:674: PrintSprite(64, 64, "INIT\nCARS", (u16)&defaultColor);
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
;carwar.c:675: for(i=0; i<16; i++)
	ld	-1 (ix),#0x00
	ld	de,#0x0000
	ld	-19 (ix),#0x00
	ld	-18 (ix),#0x00
00101$:
	ld	a,-1 (ix)
	sub	a,#0x10
	jp	NC,00104$
;carwar.c:677: RAMtoVRAM(i * 13, 256 + 212 + 0,  13, 11, (u16)&car1[13 * 11 * i]);
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
	ld	l,-19 (ix)
	ld	h,-18 (ix)
	push	hl
	call	_RAMtoVRAM
	ld	hl,#0x000A
	add	hl,sp
	ld	sp,hl
	pop	de
;carwar.c:678: RAMtoVRAM(i * 13, 256 + 212 + 11, 13, 11, (u16)&car2[13 * 11 * i]);
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
	ld	l,-19 (ix)
	ld	h,-18 (ix)
	push	hl
	call	_RAMtoVRAM
	ld	hl,#0x000A
	add	hl,sp
	ld	sp,hl
	pop	de
;carwar.c:679: RAMtoVRAM(i * 13, 256 + 212 + 22, 13, 11, (u16)&car3[13 * 11 * i]);
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
	ld	l,-19 (ix)
	ld	h,-18 (ix)
	push	hl
	call	_RAMtoVRAM
	ld	hl,#0x000A
	add	hl,sp
	ld	sp,hl
	pop	de
;carwar.c:680: RAMtoVRAM(i * 13, 256 + 212 + 33, 13, 11, (u16)&car4[13 * 11 * i]);
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
	ld	l,-19 (ix)
	ld	h,-18 (ix)
	push	hl
	call	_RAMtoVRAM
	ld	hl,#0x000A
	add	hl,sp
	ld	sp,hl
	pop	de
;carwar.c:675: for(i=0; i<16; i++)
	ld	hl,#0x008F
	add	hl,de
	ex	de,hl
	ld	a,-19 (ix)
	add	a,#0x0D
	ld	-19 (ix),a
	ld	a,-18 (ix)
	adc	a,#0x00
	ld	-18 (ix),a
	inc	-1 (ix)
	jp	00101$
00104$:
;carwar.c:682: RAMtoVRAM(16 * 13, 256 + 212, 13, 11, (u16)&shadow);
	ld	l,#<(_shadow)
	ld	h,#>(_shadow)
	push	hl
	ld	hl,#0x000B
	push	hl
	ld	l, #0x0D
	push	hl
	ld	hl,#0x01D4
	push	hl
	ld	hl,#0x00D0
	push	hl
	call	_RAMtoVRAM
	ld	hl,#0x000A
	add	hl,sp
	ld	sp,hl
;carwar.c:686: PrintSprite(64, 64, "INIT\nTRACK\nBACKUP", (u16)&defaultColor);
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
;carwar.c:687: for(i=0; i<CAR_NUM; i++)
	ld	-1 (ix),#0x00
	ld	b,#0x00
	ld	-19 (ix),#0x00
	ld	-18 (ix),#0x00
00105$:
	ld	a,-1 (ix)
	sub	a,#0x04
	jp	NC,00108$
;carwar.c:689: InitializePlayer(&game.players[i], i, track01.startPos[i].x, track01.startPos[i].y);
	ld	a,-1 (ix)
	add	a,a
	add	a,#<(0x0004 + _track01)
	ld	-21 (ix),a
	ld	a,#>(0x0004 + _track01)
	adc	a,#0x00
	ld	-20 (ix),a
	ld	a,-21 (ix)
	add	a,#0x01
	ld	l, a
	ld	a, -20 (ix)
	adc	a, #0x00
	ld	h, a
	ld	d,(hl)
	ld	l,-21 (ix)
	ld	h,-20 (ix)
	ld	a,(hl)
	ld	-21 (ix),a
	ld	a,#<(0x0107 + _game)
	add	a,b
	ld	e,a
	ld	a,#>(0x0107 + _game)
	adc	a,#0x00
	ld	c,a
	push	bc
	push	de
	inc	sp
	ld	h,-21 (ix)
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
;carwar.c:690: VRAMtoVRAM(PosXToSprt(game.players[i].posX), (256 * 0) + PosYToSprt(game.players[i].posY), (13 * i) + (52 * 0), 212, 13, 11 + 1);
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
	ld	-21 (ix),a
	ld	a,h
	adc	a,#0xFF
	ld	-20 (ix),a
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
	ld	hl,#0x000C
	push	hl
	ld	l, #0x0D
	push	hl
	ld	l, #0xD4
	push	hl
	ld	l,-19 (ix)
	ld	h,-18 (ix)
	push	hl
	ld	l,-21 (ix)
	ld	h,-20 (ix)
	push	hl
	push	de
	call	_VRAMtoVRAM
	ld	hl,#0x000C
	add	hl,sp
	ld	sp,hl
	pop	bc
;carwar.c:691: VRAMtoVRAM(PosXToSprt(game.players[i].posX), (256 * 1) + PosYToSprt(game.players[i].posY), (13 * i) + (52 * 1), 212, 13, 11 + 1);
	ld	a,-19 (ix)
	add	a,#0x34
	ld	-21 (ix),a
	ld	a,-18 (ix)
	adc	a,#0x00
	ld	-20 (ix),a
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
	ld	-23 (ix),a
	ld	a,h
	adc	a,#0x00
	ld	-22 (ix),a
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
	ld	hl,#0x000C
	push	hl
	ld	l, #0x0D
	push	hl
	ld	l, #0xD4
	push	hl
	ld	l,-21 (ix)
	ld	h,-20 (ix)
	push	hl
	ld	l,-23 (ix)
	ld	h,-22 (ix)
	push	hl
	push	de
	call	_VRAMtoVRAM
	ld	hl,#0x000C
	add	hl,sp
	ld	sp,hl
	pop	bc
;carwar.c:687: for(i=0; i<CAR_NUM; i++)
	ld	a,b
	add	a,#0x1A
	ld	b,a
	ld	a,-19 (ix)
	add	a,#0x0D
	ld	-19 (ix),a
	ld	a,-18 (ix)
	adc	a,#0x00
	ld	-18 (ix),a
	inc	-1 (ix)
	jp	00105$
00108$:
;carwar.c:694: ClearSprite();
	call	_ClearSprite
;carwar.c:695: for(i=0; i<32; i++)
	ld	c,#0x00
00109$:
	ld	a,c
	sub	a,#0x20
	jr	NC,00112$
;carwar.c:696: SetSpriteUniColor(i, 0, 248, 0, 0);
	push	bc
	ld	hl,#0x0000
	push	hl
	ld	h, #0xF8
	push	hl
	ld	a,c
	push	af
	inc	sp
	call	_SetSpriteUniColor
	pop	af
	pop	af
	inc	sp
	pop	bc
;carwar.c:695: for(i=0; i<32; i++)
	inc	c
	jr	00109$
00112$:
;carwar.c:698: game.state = StateUpdateGame;
	ld	hl,#0x016f + _game
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
;carwar.c:702: void StateUpdateGame()
;	---------------------------------
; Function StateUpdateGame
; ---------------------------------
_StateUpdateGame_start::
_StateUpdateGame:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-34
	add	hl,sp
	ld	sp,hl
;carwar.c:708: SetPage8(game.page);
	ld	a,(#0x0004 + _game)
	push	af
	inc	sp
	call	_SetPage8
	inc	sp
;carwar.c:709: game.page = 1 - game.page;
	ld	hl,#0x0004 + _game
	ld	l,(hl)
	ld	a,#0x01
	sub	a,l
	ld	hl,#0x0004 + _game
	ld	(hl),a
;carwar.c:710: game.yOffset = 256 * game.page;
	ld	b, (hl)
	ld	c,#0x00
	ld	hl,#0x0005 + _game
	ld	(hl),c
	inc	hl
	ld	(hl),b
;carwar.c:712: for(i=0; i<CAR_NUM; i++)
	ld	bc,#0x0000
00170$:
	ld	a,c
	sub	a,#0x04
	jr	NC,00173$
;carwar.c:713: game.players[i].flag = 0;
	ld	a,#<(0x0107 + _game)
	add	a,b
	ld	e,a
	ld	a,#>(0x0107 + _game)
	adc	a,#0x00
	ld	d,a
	ld	hl,#0x000F
	add	hl,de
	ex	de,hl
	ld	a,#0x00
	ld	(de),a
;carwar.c:712: for(i=0; i<CAR_NUM; i++)
	ld	a,b
	add	a,#0x1A
	ld	b,a
	inc	c
	jr	00170$
00173$:
;carwar.c:717: curPly = &game.players[0];
	ld	hl,#_game + 263
	ld	-4 (ix),l
	ld	-3 (ix),h
;carwar.c:718: keyLine = GetKeyMatrixLine(8);
	ld	a,#0x08
	push	af
	inc	sp
	call	_GetKeyMatrixLine
	inc	sp
	ld	c,l
;carwar.c:719: if((keyLine & KEY_LEFT) == 0)
	ld	a,c
	and	a,#0x10
	jr	NZ,00102$
;carwar.c:720: curPly->flag |= CAR_TURN_LEFT;
	ld	a,-4 (ix)
	add	a,#0x0F
	ld	e,a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	or	a,#0x02
	ld	(de),a
00102$:
;carwar.c:721: if((keyLine & KEY_RIGHT) == 0)
	ld	a,c
	and	a,#0x80
	jr	NZ,00104$
;carwar.c:722: curPly->flag |= CAR_TURN_RIGHT;
	ld	a,-4 (ix)
	add	a,#0x0F
	ld	e,a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	or	a,#0x01
	ld	(de),a
00104$:
;carwar.c:723: if((keyLine & KEY_UP) == 0)
	ld	a,c
	and	a,#0x20
	jr	NZ,00106$
;carwar.c:724: curPly->flag |= CAR_MOVE;
	ld	a,-4 (ix)
	add	a,#0x0F
	ld	e,a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	or	a,#0x04
	ld	(de),a
00106$:
;carwar.c:728: curPly = &game.players[1];
	ld	hl,#0x0107 + _game + 26
	ld	-4 (ix),l
	ld	-3 (ix),h
;carwar.c:729: keyLine = GetKeyMatrixLine(5);
	ld	a,#0x05
	push	af
	inc	sp
	call	_GetKeyMatrixLine
	inc	sp
;carwar.c:730: if((keyLine & KEY_Z) == 0)
	ld	a, l
	and	a,#0x80
	jr	NZ,00108$
;carwar.c:731: curPly->flag |= CAR_TURN_LEFT;
	ld	a,-4 (ix)
	add	a,#0x0F
	ld	e,a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	or	a,#0x02
	ld	(de),a
00108$:
;carwar.c:732: keyLine = GetKeyMatrixLine(3);
	ld	a,#0x03
	push	af
	inc	sp
	call	_GetKeyMatrixLine
	inc	sp
;carwar.c:733: if((keyLine & KEY_C) == 0)
	ld	a, l
	and	a,#0x01
	jr	NZ,00110$
;carwar.c:734: curPly->flag |= CAR_TURN_RIGHT;
	ld	a,-4 (ix)
	add	a,#0x0F
	ld	e,a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	or	a,#0x01
	ld	(de),a
00110$:
;carwar.c:735: keyLine = GetKeyMatrixLine(5);
	ld	a,#0x05
	push	af
	inc	sp
	call	_GetKeyMatrixLine
	inc	sp
;carwar.c:736: if((keyLine & KEY_X) == 0)
	ld	a, l
	and	a,#0x20
	jr	NZ,00112$
;carwar.c:737: curPly->flag |= CAR_MOVE;
	ld	a,-4 (ix)
	add	a,#0x0F
	ld	e,a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	or	a,#0x04
	ld	(de),a
00112$:
;carwar.c:741: curPly = &game.players[2];
	ld	hl,#0x0107 + _game + 52
	ld	-4 (ix),l
	ld	-3 (ix),h
;carwar.c:742: switch (Joystick(1)) // Joy 1 direction
	ld	a,#0x01
	push	af
	inc	sp
	call	_Joystick
	inc	sp
	ld	a,l
	sub	a,#0x02
	jp	PO,00258$
	xor	a,#0x80
00258$:
	jp	M,00119$
	ld	a,#0x08
	sub	a,l
	jp	PO,00259$
	xor	a,#0x80
00259$:
	jp	M,00119$
	ld	a,l
	add	a,#0xFE
	ld	e,a
	push	de
	ld	d,#0x00
	ld	hl,#00260$
	add	hl,de
	add	hl,de
;carwar.c:744: case 2: // up-right
	pop	de
	jp	(hl)
00260$:
	jr	00113$
	jr	00114$
	jr	00115$
	jr	00119$
	jr	00116$
	jr	00117$
	jr	00118$
00113$:
;carwar.c:745: case 3: // right
00114$:
;carwar.c:746: case 4: // down-right
00115$:
;carwar.c:747: curPly->flag |= CAR_TURN_RIGHT;
	ld	a,-4 (ix)
	add	a,#0x0F
	ld	e,a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	or	a,#0x01
	ld	(de),a
;carwar.c:748: break;
	jr	00119$
;carwar.c:749: case 6: // down-left
00116$:
;carwar.c:750: case 7: // left
00117$:
;carwar.c:751: case 8:// up-left
00118$:
;carwar.c:752: curPly->flag |= CAR_TURN_LEFT;
	ld	a,-4 (ix)
	add	a,#0x0F
	ld	e,a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	or	a,#0x02
	ld	(de),a
;carwar.c:754: }
00119$:
;carwar.c:755: if(Joytrig(1) != 0) // Joy 1 Button A
	ld	a,#0x01
	push	af
	inc	sp
	call	_Joytrig
	inc	sp
	xor	a,a
	or	a,l
	jr	Z,00121$
;carwar.c:756: curPly->flag |= CAR_MOVE;
	ld	a,-4 (ix)
	add	a,#0x0F
	ld	e,a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	or	a,#0x04
	ld	(de),a
00121$:
;carwar.c:760: curPly = &game.players[3];
	ld	hl,#0x0107 + _game + 78
	ld	-4 (ix),l
	ld	-3 (ix),h
;carwar.c:761: switch (Joystick(2)) // Joy 2 direction
	ld	a,#0x02
	push	af
	inc	sp
	call	_Joystick
	inc	sp
	ld	a,l
	sub	a,#0x02
	jp	PO,00261$
	xor	a,#0x80
00261$:
	jp	M,00128$
	ld	a,#0x08
	sub	a,l
	jp	PO,00262$
	xor	a,#0x80
00262$:
	jp	M,00128$
	ld	a,l
	add	a,#0xFE
	ld	e,a
	push	de
	ld	d,#0x00
	ld	hl,#00263$
	add	hl,de
	add	hl,de
;carwar.c:763: case 2: // up-right
	pop	de
	jp	(hl)
00263$:
	jr	00122$
	jr	00123$
	jr	00124$
	jr	00128$
	jr	00125$
	jr	00126$
	jr	00127$
00122$:
;carwar.c:764: case 3: // right
00123$:
;carwar.c:765: case 4: // down-right
00124$:
;carwar.c:766: curPly->flag |= CAR_TURN_RIGHT;
	ld	a,-4 (ix)
	add	a,#0x0F
	ld	e,a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	or	a,#0x01
	ld	(de),a
;carwar.c:767: break;
	jr	00128$
;carwar.c:768: case 6: // down-left
00125$:
;carwar.c:769: case 7: // left
00126$:
;carwar.c:770: case 8:// up-left
00127$:
;carwar.c:771: curPly->flag |= CAR_TURN_LEFT;
	ld	a,-4 (ix)
	add	a,#0x0F
	ld	e,a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	or	a,#0x02
	ld	(de),a
;carwar.c:773: }
00128$:
;carwar.c:774: if(Joytrig(2) != 0) // Joy 2 Button A
	ld	a,#0x02
	push	af
	inc	sp
	call	_Joytrig
	inc	sp
	xor	a,a
	or	a,l
	jr	Z,00215$
;carwar.c:775: curPly->flag |= CAR_MOVE;
	ld	a,-4 (ix)
	add	a,#0x0F
	ld	e,a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	or	a,#0x04
	ld	(de),a
;carwar.c:779: for(i=0; i<CAR_NUM; i++)
00215$:
	ld	b,#0x00
	ld	c,#0x00
	ld	-16 (ix),#0x00
	ld	-15 (ix),#0x00
00174$:
	ld	a,b
	sub	a,#0x04
	jp	NC,00177$
;carwar.c:781: VRAMtoVRAM((13 * i) + (52 * game.page), 212, PosXToSprt(game.players[i].prevX), game.yOffset + PosYToSprt(game.players[i].prevY) - game.players[i].prevZ, 13, 11 + 1 + game.players[i].prevZ);
	ld	a,#<(0x0107 + _game)
	add	a,c
	ld	e,a
	ld	a,#>(0x0107 + _game)
	adc	a,#0x00
	ld	d,a
	ld	hl,#0x0009
	add	hl,de
	ld	a,(hl)
	ld	h, #0x00
	add	a,#0x0C
	ld	-18 (ix),a
	ld	a,h
	adc	a,#0x00
	ld	-17 (ix),a
	ld	hl,#0x0005 + _game
	ld	a,(hl)
	ld	-20 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-19 (ix),a
	ld	a,#<(0x0107 + _game)
	add	a,c
	ld	e,a
	ld	a,#>(0x0107 + _game)
	adc	a,#0x00
	ld	d,a
	ld	hl,#0x0007+1
	add	hl,de
	ld	a, (hl)
	ld	h, #0x00
	add	a,#0xFB
	ld	l,a
	ld	a,h
	adc	a,#0xFF
	ld	h,a
	ld	a,-20 (ix)
	add	a,l
	ld	-20 (ix),a
	ld	a,-19 (ix)
	adc	a,h
	ld	-19 (ix),a
	ld	a,#<(0x0107 + _game)
	add	a,c
	ld	e,a
	ld	a,#>(0x0107 + _game)
	adc	a,#0x00
	ld	d,a
	ld	hl,#0x0009
	add	hl,de
	ld	l, (hl)
	ld	h,#0x00
	ld	a,-20 (ix)
	sub	a,l
	ld	-20 (ix),a
	ld	a,-19 (ix)
	sbc	a,h
	ld	-19 (ix),a
	ld	a,#<(0x0107 + _game)
	add	a,c
	ld	l, a
	ld	a, #>(0x0107 + _game)
	adc	a, #0x00
	ld	h, a
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	h, #0x00
	add	a,#0xFA
	ld	-22 (ix),a
	ld	a,h
	adc	a,#0xFF
	ld	-21 (ix),a
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
	ld	a,-16 (ix)
	add	a,e
	ld	e,a
	ld	a,-15 (ix)
	adc	a,d
	ld	d,a
	push	bc
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	push	hl
	ld	hl,#0x000D
	push	hl
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	push	hl
	ld	l,-22 (ix)
	ld	h,-21 (ix)
	push	hl
	ld	hl,#0x00D4
	push	hl
	push	de
	call	_VRAMtoVRAM
	ld	hl,#0x000C
	add	hl,sp
	ld	sp,hl
	pop	bc
;carwar.c:779: for(i=0; i<CAR_NUM; i++)
	ld	a,c
	add	a,#0x1A
	ld	c,a
	ld	a,-16 (ix)
	add	a,#0x0D
	ld	-16 (ix),a
	ld	a,-15 (ix)
	adc	a,#0x00
	ld	-15 (ix),a
	inc	b
	jp	00174$
00177$:
;carwar.c:786: for(i=0; i<CAR_NUM; i++)
	ld	-1 (ix),#0x00
	ld	-22 (ix),#0x00
00166$:
	ld	a,-1 (ix)
	sub	a,#0x04
	jp	NC,00169$
;carwar.c:788: curPly = &game.players[i];
	ld	a,#<(0x0107 + _game)
	add	a,-22 (ix)
	ld	e,a
	ld	a,#>(0x0107 + _game)
	adc	a,#0x00
	ld	-4 (ix), e
	ld	-3 (ix), a
;carwar.c:790: if(curPly->jump == 0)
	ld	a,-4 (ix)
	add	a,#0x11
	ld	e,a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	ld	c,a
	or	a,a
	jp	NZ,00159$
;carwar.c:792: ground = ReadVRAM(game.page, PosToPxl(curPly->posX) + 256 * PosToPxl(curPly->posY));
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	inc	hl
	ld	c, (hl)
	ld	b,#0x00
	ld	e,-4 (ix)
	ld	d,-3 (ix)
	inc	de
	inc	de
	ld	l,e
	ld	h,d
	inc	hl
	ld	h, (hl)
	ld	l,#0x00
	add	hl,bc
	ld	-16 (ix),l
	ld	-15 (ix),h
	ld	hl,#0x0004 + _game
	ld	c,(hl)
	push	de
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	push	hl
	ld	a,c
	push	af
	inc	sp
	call	_ReadVRAM
	pop	af
	inc	sp
	pop	de
;carwar.c:793: op = game.colorCode[ground];
	ld	h,#0x00
	ld	a,#<(0x0007 + _game)
	add	a,l
	ld	c,a
	ld	a,#>(0x0007 + _game)
	adc	a,h
	ld	b,a
	ld	a,(bc)
;carwar.c:795: if(op >= OP_ROAD) // Backup last valid position
	ld	-2 (ix), a
	sub	a,#0x0A
	jr	C,00134$
;carwar.c:797: curPly->validX = curPly->posX;
	ld	a,-4 (ix)
	add	a,#0x12
	ld	-16 (ix),a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	-15 (ix),a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
;carwar.c:798: curPly->validY = curPly->posY;
	ld	a,-4 (ix)
	add	a,#0x14
	ld	-16 (ix),a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	-15 (ix),a
	ex	de,hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
	jp	00135$
00134$:
;carwar.c:800: else if(op < OP_SPECIAL)
	ld	a,-2 (ix)
	sub	a,#0x04
	jp	NC,00135$
;carwar.c:802: curPly->prevX = curPly->posX;
	ld	a,-4 (ix)
	add	a,#0x05
	ld	-16 (ix),a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	-15 (ix),a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
;carwar.c:803: curPly->prevY = curPly->posY;
	ld	a,-4 (ix)
	add	a,#0x07
	ld	-16 (ix),a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	-15 (ix),a
	ex	de,hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
;carwar.c:804: curPly->nextX = curPly->validX;
	ld	a,-4 (ix)
	add	a,#0x16
	ld	e,a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,-4 (ix)
	add	a,#0x12
	ld	l, a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	h, a
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ex	de,hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
;carwar.c:805: curPly->nextY = curPly->validY;
	ld	a,-4 (ix)
	add	a,#0x18
	ld	e,a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,-4 (ix)
	add	a,#0x14
	ld	l, a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	h, a
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ex	de,hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
;carwar.c:806: curPly->velX = 0;
	ld	a,-4 (ix)
	add	a,#0x0A
	ld	l, a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	h, a
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;carwar.c:807: curPly->velY = 0;
	ld	a,-4 (ix)
	add	a,#0x0C
	ld	l, a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	h, a
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;carwar.c:808: break;
	jp	00169$
00135$:
;carwar.c:812: friction = bg[op].Friction;
	ld	a,-2 (ix)
	ld	e,a
	add	a,a
	add	a,a
	add	a,e
	ld	d, a
	add	a,#<(_bg)
	ld	-16 (ix),a
	ld	a,#>(_bg)
	adc	a,#0x00
	ld	-15 (ix),a
	ld	c,-16 (ix)
	ld	b,-15 (ix)
	inc	bc
	ld	a,(bc)
	ld	e,a
;carwar.c:813: maxSpeed = cars[curPly->car].maxSpeed[bg[op].MaxSpeed];
	ld	a,-4 (ix)
	add	a,#0x0E
	ld	-24 (ix),a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	-23 (ix),a
	ld	l,-24 (ix)
	ld	h,-23 (ix)
	ld	l,(hl)
	push	de
	ld	a,l
	ld	e,a
	add	a,a
	add	a,a
	add	a,e
	pop	de
	add	a,#<(_cars)
	ld	c,a
	ld	a,#>(_cars)
	adc	a,#0x00
	ld	b,a
	inc	bc
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	l,(hl)
	ld	a,c
	add	a,l
	ld	c,a
	ld	a,b
	adc	a,#0x00
	ld	b,a
	ld	a,(bc)
	ld	-14 (ix), a
	ld	-13 (ix),#0x00
;carwar.c:814: x = Abs16(curPly->velX);
	ld	a,-4 (ix)
	add	a,#0x0A
	ld	-26 (ix),a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	-25 (ix),a
	ld	l,-26 (ix)
	ld	h,-25 (ix)
	ld	a,(hl)
	ld	-16 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-15 (ix), a
	and	a,#0x80
	jr	Z,00188$
	ld	c,-16 (ix)
	ld	b,-15 (ix)
	dec	bc
	ld	a,c
	cpl
	ld	c,a
	ld	a,b
	cpl
	ld	b,a
	jr	00189$
00188$:
	ld	c,-16 (ix)
	ld	b,-15 (ix)
00189$:
	ld	-6 (ix),c
;carwar.c:815: x >>= 8;
	ld	-5 (ix), b
	ld	-6 (ix), b
	ld	-5 (ix),#0x00
;carwar.c:816: y = Abs16(curPly->velY);
	ld	a,-4 (ix)
	add	a,#0x0C
	ld	-28 (ix),a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	-27 (ix),a
	ld	l,-28 (ix)
	ld	h,-27 (ix)
	ld	a,(hl)
	ld	-16 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-15 (ix), a
	and	a,#0x80
	jr	Z,00190$
	ld	c,-16 (ix)
	ld	b,-15 (ix)
	dec	bc
	ld	a,c
	cpl
	ld	c,a
	ld	a,b
	cpl
	ld	b,a
	jr	00191$
00190$:
	ld	c,-16 (ix)
	ld	b,-15 (ix)
00191$:
	ld	-8 (ix),c
;carwar.c:817: y >>= 8;
	ld	-7 (ix), b
	ld	-8 (ix), b
	ld	-7 (ix),#0x00
;carwar.c:818: speedSq = (x * x) + (y * y);
	push	de
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	call	__mulint_rrx_s
	pop	af
	pop	af
	ld	-15 (ix),h
	ld	-16 (ix),l
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	hl
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	hl
	call	__mulint_rrx_s
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	pop	de
	ld	a,-16 (ix)
	add	a,c
	ld	c,a
	ld	a,-15 (ix)
	adc	a,b
	ld	-12 (ix), c
	ld	-11 (ix), a
;carwar.c:819: if(!(curPly->flag & CAR_MOVE) || (speedSq > maxSpeed * maxSpeed))
	ld	a,-4 (ix)
	add	a,#0x0F
	ld	-16 (ix),a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	-15 (ix),a
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	a,(hl)
	and	a,#0x04
	jr	Z,00139$
	push	de
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	push	hl
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	push	hl
	call	__mulint_rrx_s
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	pop	de
	ld	a,c
	sub	a,-12 (ix)
	ld	a,b
	sbc	a,-11 (ix)
	jp	NC,00140$
00139$:
;carwar.c:821: if(speedSq <= (friction * friction))
	push	de
	ld	h,e
	ld	l,#0x00
	ld	d,l
	ld	b,#0x08
00267$:
	add	hl,hl
	jr	NC,00268$
	add	hl,de
00268$:
	djnz	00267$
	pop	de
	ld	a, l
	ld	b, h
	sub	a,-12 (ix)
	ld	a,b
	sbc	a,-11 (ix)
	jr	C,00137$
;carwar.c:823: curPly->velX = 0;
	ld	l,-26 (ix)
	ld	h,-25 (ix)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;carwar.c:824: curPly->velY = 0;
	ld	l,-28 (ix)
	ld	h,-27 (ix)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	jp	00140$
00137$:
;carwar.c:828: dir = VectorToAngle256(curPly->velX, curPly->velY);
	ld	l,-28 (ix)
	ld	h,-27 (ix)
	ld	a,(hl)
	ld	-30 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-29 (ix),a
	ld	l,-26 (ix)
	ld	h,-25 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	push	de
	ld	l,-30 (ix)
	ld	h,-29 (ix)
	push	hl
	push	bc
	call	_VectorToAngle256
	pop	af
	pop	af
	pop	de
	ld	c,l
;carwar.c:829: curPly->velX -= friction * g_Cosinus256[dir];
	ld	l,-26 (ix)
	ld	h,-25 (ix)
	ld	a,(hl)
	ld	-30 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-29 (ix),a
	ld	-32 (ix), c
	ld	-31 (ix), #0x00
	sla	-32 (ix)
	rl	-31 (ix)
	ld	a,#<(_g_Cosinus256)
	add	a,-32 (ix)
	ld	c,a
	ld	a,#>(_g_Cosinus256)
	adc	a,-31 (ix)
	ld	h, a
	ld	l, c
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	ld	-34 (ix),e
	ld	-33 (ix),#0x00
	push	de
	push	hl
	ld	l,-34 (ix)
	ld	h,-33 (ix)
	push	hl
	call	__mulint_rrx_s
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	pop	de
	ld	a,-30 (ix)
	sub	a,c
	ld	c,a
	ld	a,-29 (ix)
	sbc	a,b
	ld	b,a
	ld	l,-26 (ix)
	ld	h,-25 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
;carwar.c:830: curPly->velY -= friction * g_Sinus256[dir];
	ld	l,-28 (ix)
	ld	h,-27 (ix)
	ld	a,(hl)
	ld	-30 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-29 (ix),a
	ld	a,#<(_g_Sinus256)
	add	a,-32 (ix)
	ld	c,a
	ld	a,#>(_g_Sinus256)
	adc	a,-31 (ix)
	ld	h, a
	ld	l, c
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	push	de
	push	hl
	ld	l,-34 (ix)
	ld	h,-33 (ix)
	push	hl
	call	__mulint_rrx_s
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	pop	de
	ld	a,-30 (ix)
	sub	a,c
	ld	c,a
	ld	a,-29 (ix)
	sbc	a,b
	ld	b,a
	ld	l,-28 (ix)
	ld	h,-27 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
00140$:
;carwar.c:835: grip = bg[op].Grip;
	ld	a,#<(_bg)
	add	a,d
	ld	c,a
	ld	a,#>(_bg)
	adc	a,#0x00
	ld	b,a
	inc	bc
	inc	bc
	ld	a,(bc)
	ld	e,a
;carwar.c:836: x = Abs16(curPly->velX);
	ld	l,-26 (ix)
	ld	h,-25 (ix)
	ld	a,(hl)
	ld	-34 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-33 (ix), a
	and	a,#0x80
	jr	Z,00192$
	ld	c,-34 (ix)
	ld	b,-33 (ix)
	dec	bc
	ld	a,c
	cpl
	ld	c,a
	ld	a,b
	cpl
	ld	b,a
	jr	00193$
00192$:
	ld	c,-34 (ix)
	ld	b,-33 (ix)
00193$:
	ld	-6 (ix),c
;carwar.c:837: x >>= 8;
	ld	-5 (ix), b
	ld	-6 (ix), b
	ld	-5 (ix),#0x00
;carwar.c:838: y = Abs16(curPly->velY);
	ld	l,-28 (ix)
	ld	h,-27 (ix)
	ld	a,(hl)
	ld	-34 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-33 (ix), a
	and	a,#0x80
	jr	Z,00194$
	ld	c,-34 (ix)
	ld	b,-33 (ix)
	dec	bc
	ld	a,c
	cpl
	ld	c,a
	ld	a,b
	cpl
	ld	b,a
	jr	00195$
00194$:
	ld	c,-34 (ix)
	ld	b,-33 (ix)
00195$:
	ld	-8 (ix),c
;carwar.c:839: y >>= 8;
	ld	-7 (ix), b
	ld	-8 (ix), b
	ld	-7 (ix),#0x00
;carwar.c:840: speed = GetVectorLenght(x, y);
	push	de
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	hl
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	call	_GetVectorLenght
	pop	af
	pop	af
	pop	de
	ld	-10 (ix),l
	ld	-9 (ix),h
;carwar.c:841: if(speed <= grip)
	ld	c,e
	ld	b,#0x00
	ld	a,c
	sub	a,-10 (ix)
	ld	a,b
	sbc	a,-9 (ix)
	jr	C,00143$
;carwar.c:843: curPly->velX = 0;
	ld	l,-26 (ix)
	ld	h,-25 (ix)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;carwar.c:844: curPly->velY = 0;
	ld	l,-28 (ix)
	ld	h,-27 (ix)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	jp	00144$
00143$:
;carwar.c:848: speed = grip;
	ld	-10 (ix), c
	ld	-9 (ix), b
;carwar.c:849: dir = VectorToAngle256(curPly->velX, curPly->velY);
	ld	l,-28 (ix)
	ld	h,-27 (ix)
	ld	a,(hl)
	ld	-34 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-33 (ix),a
	ld	l,-26 (ix)
	ld	h,-25 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	push	de
	ld	l,-34 (ix)
	ld	h,-33 (ix)
	push	hl
	push	bc
	call	_VectorToAngle256
	pop	af
	pop	af
	pop	de
	ld	c,l
;carwar.c:850: curPly->velX -= grip * g_Cosinus256[dir];
	ld	l,-26 (ix)
	ld	h,-25 (ix)
	ld	a,(hl)
	ld	-34 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-33 (ix),a
	ld	-32 (ix), c
	ld	-31 (ix), #0x00
	sla	-32 (ix)
	rl	-31 (ix)
	ld	a,#<(_g_Cosinus256)
	add	a,-32 (ix)
	ld	c,a
	ld	a,#>(_g_Cosinus256)
	adc	a,-31 (ix)
	ld	h, a
	ld	l, c
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	ld	-30 (ix),e
	ld	-29 (ix),#0x00
	push	de
	push	hl
	ld	l,-30 (ix)
	ld	h,-29 (ix)
	push	hl
	call	__mulint_rrx_s
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	pop	de
	ld	a,-34 (ix)
	sub	a,c
	ld	c,a
	ld	a,-33 (ix)
	sbc	a,b
	ld	b,a
	ld	l,-26 (ix)
	ld	h,-25 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
;carwar.c:851: curPly->velY -= grip * g_Sinus256[dir];
	ld	l,-28 (ix)
	ld	h,-27 (ix)
	ld	a,(hl)
	ld	-34 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-33 (ix),a
	ld	a,#<(_g_Sinus256)
	add	a,-32 (ix)
	ld	c,a
	ld	a,#>(_g_Sinus256)
	adc	a,-31 (ix)
	ld	h, a
	ld	l, c
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	push	de
	push	hl
	ld	l,-30 (ix)
	ld	h,-29 (ix)
	push	hl
	call	__mulint_rrx_s
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	pop	de
	ld	a,-34 (ix)
	sub	a,c
	ld	c,a
	ld	a,-33 (ix)
	sbc	a,b
	ld	b,a
	ld	l,-28 (ix)
	ld	h,-27 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
00144$:
;carwar.c:855: if(curPly->flag & CAR_TURN_LEFT)
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	a,(hl)
	and	a,#0x02
	jr	Z,00146$
;carwar.c:857: curPly->rot += cars[curPly->car].rotSpeed; 
	ld	a,-4 (ix)
	add	a,#0x10
	ld	-34 (ix),a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	-33 (ix),a
	ld	l,-34 (ix)
	ld	h,-33 (ix)
	ld	e,(hl)
	ld	l,-24 (ix)
	ld	h,-23 (ix)
	ld	l,(hl)
	push	de
	ld	a,l
	ld	e,a
	add	a,a
	add	a,a
	add	a,e
	pop	de
	add	a,#<(_cars)
	ld	c,a
	ld	a,#>(_cars)
	adc	a,#0x00
	ld	b,a
	ld	a,(bc)
	add	a,e
	ld	l,-34 (ix)
	ld	h,-33 (ix)
	ld	(hl),a
00146$:
;carwar.c:859: if(curPly->flag & CAR_TURN_RIGHT)
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	a,(hl)
	and	a,#0x01
	jr	Z,00148$
;carwar.c:861: curPly->rot -= cars[curPly->car].rotSpeed; 
	ld	a,-4 (ix)
	add	a,#0x10
	ld	-34 (ix),a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	-33 (ix),a
	ld	l,-34 (ix)
	ld	h,-33 (ix)
	ld	e,(hl)
	ld	l,-24 (ix)
	ld	h,-23 (ix)
	ld	l,(hl)
	push	de
	ld	a,l
	ld	e,a
	add	a,a
	add	a,a
	add	a,e
	pop	de
	add	a,#<(_cars)
	ld	c,a
	ld	a,#>(_cars)
	adc	a,#0x00
	ld	b,a
	ld	a,(bc)
	ld	l,a
	ld	a,e
	sub	a,l
	ld	l,-34 (ix)
	ld	h,-33 (ix)
	ld	(hl),a
00148$:
;carwar.c:865: if(curPly->flag & CAR_MOVE)
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	a,(hl)
	and	a,#0x04
	jp	Z,00152$
;carwar.c:867: x = Abs16(curPly->velX);
	ld	l,-26 (ix)
	ld	h,-25 (ix)
	ld	a,(hl)
	ld	-34 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-33 (ix), a
	and	a,#0x80
	jr	Z,00196$
	ld	c,-34 (ix)
	ld	b,-33 (ix)
	dec	bc
	ld	a,c
	cpl
	ld	c,a
	ld	a,b
	cpl
	ld	b,a
	jr	00197$
00196$:
	ld	c,-34 (ix)
	ld	b,-33 (ix)
00197$:
	ld	-6 (ix),c
;carwar.c:868: x >>= 8;
	ld	-5 (ix), b
	ld	-6 (ix), b
	ld	-5 (ix),#0x00
;carwar.c:869: y = Abs16(curPly->velY);
	ld	l,-28 (ix)
	ld	h,-27 (ix)
	ld	a,(hl)
	ld	-34 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-33 (ix), a
	and	a,#0x80
	jr	Z,00198$
	ld	c,-34 (ix)
	ld	b,-33 (ix)
	dec	bc
	ld	a,c
	cpl
	ld	c,a
	ld	a,b
	cpl
	ld	b,a
	jr	00199$
00198$:
	ld	c,-34 (ix)
	ld	b,-33 (ix)
00199$:
	ld	-8 (ix),c
;carwar.c:870: y >>= 8;
	ld	-7 (ix), b
	ld	-8 (ix), b
	ld	-7 (ix),#0x00
;carwar.c:871: speedSq = (x * x) + (y * y);
	push	de
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	call	__mulint_rrx_s
	pop	af
	pop	af
	ld	-33 (ix),h
	ld	-34 (ix),l
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	hl
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	hl
	call	__mulint_rrx_s
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	pop	de
	ld	a,-34 (ix)
	add	a,c
	ld	c,a
	ld	a,-33 (ix)
	adc	a,b
	ld	-12 (ix), c
	ld	-11 (ix), a
;carwar.c:872: maxSpeed = cars[curPly->car].maxSpeed[bg[op].MaxSpeed];
	ld	l,-24 (ix)
	ld	h,-23 (ix)
	ld	l,(hl)
	push	de
	ld	a,l
	ld	e,a
	add	a,a
	add	a,a
	add	a,e
	pop	de
	add	a,#<(_cars)
	ld	-34 (ix),a
	ld	a,#>(_cars)
	adc	a,#0x00
	ld	-33 (ix),a
	ld	a,-34 (ix)
	add	a,#0x01
	ld	-32 (ix),a
	ld	a,-33 (ix)
	adc	a,#0x00
	ld	-31 (ix),a
	ld	a,#<(_bg)
	add	a,d
	ld	c,a
	ld	a,#>(_bg)
	adc	a,#0x00
	ld	b,a
	ld	a,(bc)
	ld	l,a
	ld	a,-32 (ix)
	add	a,l
	ld	c,a
	ld	a,-31 (ix)
	adc	a,#0x00
	ld	b,a
	ld	a,(bc)
	ld	-14 (ix), a
	ld	-13 (ix),#0x00
;carwar.c:873: if(speedSq < maxSpeed * maxSpeed)
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	push	hl
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	push	hl
	call	__mulint_rrx_s
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	ld	a,-12 (ix)
	sub	a,c
	ld	a,-11 (ix)
	sbc	a,b
	jr	NC,00152$
;carwar.c:875: speed += cars[curPly->car].accel;
	ld	a,-34 (ix)
	add	a,#0x04
	ld	c,a
	ld	a,-33 (ix)
	adc	a,#0x00
	ld	b,a
	ld	a,(bc)
	ld	l,a
	ld	h,#0x00
	ld	a,-10 (ix)
	add	a,l
	ld	-10 (ix),a
	ld	a,-9 (ix)
	adc	a,h
	ld	-9 (ix),a
00152$:
;carwar.c:878: if(op == OP_SPEEDER)
	ld	a,-2 (ix)
	sub	a,#0x04
	jr	NZ,00156$
;carwar.c:879: speed += 8;
	ld	a,-10 (ix)
	add	a,#0x08
	ld	-10 (ix),a
	ld	a,-9 (ix)
	adc	a,#0x00
	ld	-9 (ix),a
	jr	00157$
00156$:
;carwar.c:880: else if(op == OP_JUMPER)
	ld	a,-2 (ix)
	sub	a,#0x05
	jr	NZ,00157$
;carwar.c:882: curPly->jump = 20;
	ld	a,-4 (ix)
	add	a,#0x11
	ld	c,a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	b,a
	ld	a,#0x14
	ld	(bc),a
00157$:
;carwar.c:885: curPly->velX += speed * g_Cosinus256[curPly->rot];
	ld	l,-26 (ix)
	ld	h,-25 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,-4 (ix)
	add	a,#0x10
	ld	c,a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	b,a
	ld	a,(bc)
	ld	-32 (ix), a
	ld	-31 (ix), #0x00
	sla	-32 (ix)
	rl	-31 (ix)
	ld	a,#<(_g_Cosinus256)
	add	a,-32 (ix)
	ld	c,a
	ld	a,#>(_g_Cosinus256)
	adc	a,-31 (ix)
	ld	h, a
	ld	l, c
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	push	de
	push	hl
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	push	hl
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
	ld	b,a
	ld	l,-26 (ix)
	ld	h,-25 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
;carwar.c:886: curPly->velY += speed * g_Sinus256[curPly->rot];
	ld	l,-28 (ix)
	ld	h,-27 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,#<(_g_Sinus256)
	add	a,-32 (ix)
	ld	c,a
	ld	a,#>(_g_Sinus256)
	adc	a,-31 (ix)
	ld	h, a
	ld	l, c
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	push	de
	push	hl
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	push	hl
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
	ld	b,a
	ld	l,-28 (ix)
	ld	h,-27 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
;carwar.c:888: CarToWallCollision(i);
	ld	a,-1 (ix)
	push	af
	inc	sp
	call	_CarToWallCollision
	inc	sp
	jr	00160$
00159$:
;carwar.c:892: curPly->jump--;
	ld	a,c
	dec	a
	ld	(de),a
00160$:
;carwar.c:895: curPly->nextX = (i16)curPly->posX + (curPly->velX >> 4);
	ld	a,-4 (ix)
	add	a,#0x16
	ld	c,a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	b,a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,(hl)
	ld	-34 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-33 (ix),a
	ld	a,-4 (ix)
	add	a,#0x0A
	ld	l, a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	a,-34 (ix)
	add	a,l
	ld	e,a
	ld	a,-33 (ix)
	adc	a,h
	ld	d,a
	ld	l,c
	ld	h,b
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:896: curPly->nextY = (i16)curPly->posY - (curPly->velY >> 4);
	ld	a,-4 (ix)
	add	a,#0x18
	ld	c,a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	b,a
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	inc	hl
	inc	hl
	ld	a,(hl)
	ld	-34 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-33 (ix),a
	ld	a,-4 (ix)
	add	a,#0x0C
	ld	l, a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	a,-34 (ix)
	sub	a,l
	ld	e,a
	ld	a,-33 (ix)
	sbc	a,h
	ld	d,a
	ld	l,c
	ld	h,b
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:897: if(curPly->nextY < (5 << 8))
	ld	l,c
	ld	h,b
	inc	hl
	ld	a, (hl)
	sub	a,#0x05
	jr	NC,00164$
;carwar.c:898: curPly->nextY = (5 << 8);
	ld	l,c
	ld	h,b
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x05
	jr	00168$
00164$:
;carwar.c:899: else if(curPly->nextY > (206 << 8))
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
	jr	NC,00168$
;carwar.c:900: curPly->nextY = (206 << 8);
	ld	l,c
	ld	h,b
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0xCE
00168$:
;carwar.c:786: for(i=0; i<CAR_NUM; i++)
	ld	a,-22 (ix)
	add	a,#0x1A
	ld	-22 (ix),a
	inc	-1 (ix)
	jp	00166$
00169$:
;carwar.c:906: CarToCarCollision(0, 0, 1);
	ld	hl,#0x0100
	push	hl
	ld	a,#0x00
	push	af
	inc	sp
	call	_CarToCarCollision
;carwar.c:908: CarToCarCollision(1, 0, 2);
	inc	sp
	ld	hl,#0x0200
	ex	(sp),hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_CarToCarCollision
;carwar.c:909: CarToCarCollision(2, 1, 2);
	inc	sp
	ld	hl,#0x0201
	ex	(sp),hl
	ld	a,#0x02
	push	af
	inc	sp
	call	_CarToCarCollision
;carwar.c:911: CarToCarCollision(3, 0, 3);
	inc	sp
	ld	hl,#0x0300
	ex	(sp),hl
	ld	a,#0x03
	push	af
	inc	sp
	call	_CarToCarCollision
;carwar.c:912: CarToCarCollision(4, 1, 3);
	inc	sp
	ld	hl,#0x0301
	ex	(sp),hl
	ld	a,#0x04
	push	af
	inc	sp
	call	_CarToCarCollision
;carwar.c:913: CarToCarCollision(5, 2, 3);
	inc	sp
	ld	hl,#0x0302
	ex	(sp),hl
	ld	a,#0x05
	push	af
	inc	sp
	call	_CarToCarCollision
	pop	af
	inc	sp
;carwar.c:916: for(i=0; i<CAR_NUM; i++)
	ld	-1 (ix),#0x00
	ld	b,#0x00
	ld	-34 (ix),#0x00
	ld	-33 (ix),#0x00
00178$:
	ld	a,-1 (ix)
	sub	a,#0x04
	jp	NC,00181$
;carwar.c:918: curPly = &game.players[i];
	ld	a,#<(0x0107 + _game)
	add	a,b
	ld	c,a
	ld	a,#>(0x0107 + _game)
	adc	a,#0x00
	ld	-4 (ix), c
	ld	-3 (ix), a
;carwar.c:921: curPly->prevX = curPly->posX;
	ld	a,-4 (ix)
	add	a,#0x05
	ld	-32 (ix),a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	-31 (ix),a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	c,(hl)
	inc	hl
	ld	e,(hl)
	ld	l,-32 (ix)
	ld	h,-31 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),e
;carwar.c:922: curPly->prevY = curPly->posY;
	ld	a,-4 (ix)
	add	a,#0x07
	ld	-32 (ix),a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	-31 (ix),a
	ld	a,-4 (ix)
	add	a,#0x02
	ld	-30 (ix),a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	-29 (ix),a
	ld	l,-30 (ix)
	ld	h,-29 (ix)
	ld	d,(hl)
	inc	hl
	ld	c,(hl)
	ld	l,-32 (ix)
	ld	h,-31 (ix)
	ld	(hl),d
	inc	hl
	ld	(hl),c
;carwar.c:923: curPly->prevZ = curPly->posZ;
	ld	a,-4 (ix)
	add	a,#0x09
	ld	c,a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	e,a
	ld	a,-4 (ix)
	add	a,#0x04
	ld	-28 (ix),a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	-27 (ix),a
	ld	l,-28 (ix)
	ld	h,-27 (ix)
	ld	a,(hl)
	ld	l,c
	ld	h,e
	ld	(hl),a
;carwar.c:925: curPly->posX = curPly->nextX;
	ld	a,-4 (ix)
	add	a,#0x16
	ld	l, a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a,(hl)
	ld	-32 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-31 (ix),a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,-32 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-31 (ix)
	ld	(hl),a
;carwar.c:926: curPly->posY = curPly->nextY;
	ld	a,-4 (ix)
	add	a,#0x18
	ld	l, a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a,(hl)
	ld	-26 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-25 (ix),a
	ld	l,-30 (ix)
	ld	h,-29 (ix)
	ld	a,-26 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-25 (ix)
	ld	(hl),a
;carwar.c:927: curPly->posZ = height[curPly->jump];
	ld	a,-4 (ix)
	add	a,#0x11
	ld	l, a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	h, a
	ld	l,(hl)
	ld	a,#<(_height)
	add	a,l
	ld	e,a
	ld	a,#>(_height)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	ld	c,a
	ld	l,-28 (ix)
	ld	h,-27 (ix)
	ld	(hl),c
;carwar.c:930: VRAMtoVRAM(PosXToSprt(curPly->posX), game.yOffset + PosYToSprt(curPly->posY) - curPly->posZ, (13 * i) + (52 * game.page), 212, 13, 11 + 1 + game.players[i].posZ);
	ld	a,#<(0x0107 + _game)
	add	a,b
	ld	e,a
	ld	a,#>(0x0107 + _game)
	adc	a,#0x00
	ld	d,a
	inc	de
	inc	de
	inc	de
	inc	de
	ld	a,(de)
	ld	h, #0x00
	add	a,#0x0C
	ld	-30 (ix),a
	ld	a,h
	adc	a,#0x00
	ld	-29 (ix),a
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
	ld	a,-34 (ix)
	add	a,e
	ld	-28 (ix),a
	ld	a,-33 (ix)
	adc	a,d
	ld	-27 (ix),a
	ld	hl,#0x0005 + _game
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	ld	a, -25 (ix)
	ld	d, #0x00
	add	a,#0xFB
	ld	e,a
	ld	a,d
	adc	a,#0xFF
	ld	d,a
	add	hl,de
	ex	de,hl
	ld	l,c
	ld	h,#0x00
	ld	a,e
	sub	a,l
	ld	-26 (ix),a
	ld	a,d
	sbc	a,h
	ld	-25 (ix),a
	ld	a, -31 (ix)
	ld	h, #0x00
	add	a,#0xFA
	ld	c,a
	ld	a,h
	adc	a,#0xFF
	ld	e,a
	push	bc
	ld	l,-30 (ix)
	ld	h,-29 (ix)
	push	hl
	ld	hl,#0x000D
	push	hl
	ld	l, #0xD4
	push	hl
	ld	l,-28 (ix)
	ld	h,-27 (ix)
	push	hl
	ld	l,-26 (ix)
	ld	h,-25 (ix)
	push	hl
	ld	l,c
	ld	h,e
	push	hl
	call	_VRAMtoVRAM
	ld	hl,#0x000C
	add	hl,sp
	ld	sp,hl
	pop	bc
;carwar.c:916: for(i=0; i<CAR_NUM; i++)
	ld	a,b
	add	a,#0x1A
	ld	b,a
	ld	a,-34 (ix)
	add	a,#0x0D
	ld	-34 (ix),a
	ld	a,-33 (ix)
	adc	a,#0x00
	ld	-33 (ix),a
	inc	-1 (ix)
	jp	00178$
00181$:
;carwar.c:935: for(i=0; i<CAR_NUM; i++)
	ld	-1 (ix),#0x00
	ld	-34 (ix),#0x00
	ld	-30 (ix),#0x00
	ld	-29 (ix),#0x00
00182$:
	ld	a,-1 (ix)
	sub	a,#0x04
	jp	NC,00185$
;carwar.c:937: curPly = &game.players[i];
	ld	a,#<(0x0107 + _game)
	add	a,-34 (ix)
	ld	c,a
	ld	a,#>(0x0107 + _game)
	adc	a,#0x00
	ld	-4 (ix), c
	ld	-3 (ix), a
;carwar.c:938: VRAMtoVRAMTrans(13 * 16, 256 + 212, PosXToSprt(curPly->posX), game.yOffset + PosYToSprt(curPly->posY) + 3, 13, 8);
	ld	hl,#0x0005 + _game
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	add	a,#0xFE
	ld	e,a
	ld	a,h
	adc	a,#0xFF
	ld	d,a
	ld	c,-4 (ix)
	ld	b,-3 (ix)
	inc	bc
	inc	bc
	ld	l,c
	ld	h,b
	inc	hl
	ld	l, (hl)
	ld	h,#0x00
	add	hl,de
	ld	-32 (ix),l
	ld	-31 (ix),h
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	inc	hl
	ld	a, (hl)
	ld	h, #0x00
	add	a,#0xFA
	ld	e,a
	ld	a,h
	adc	a,#0xFF
	ld	d,a
	push	bc
	ld	hl,#0x0008
	push	hl
	ld	l, #0x0D
	push	hl
	ld	l,-32 (ix)
	ld	h,-31 (ix)
	push	hl
	push	de
	ld	hl,#0x01D4
	push	hl
	ld	hl,#0x00D0
	push	hl
	call	_VRAMtoVRAMTrans
	ld	hl,#0x000C
	add	hl,sp
	ld	sp,hl
	pop	bc
;carwar.c:939: VRAMtoVRAMTrans(13 * (curPly->rot >> 4), 256 + 212 + (11 * i), PosXToSprt(curPly->posX), game.yOffset + PosYToSprt(curPly->posY) - curPly->posZ, 13, 11);
	ld	hl,#0x0005 + _game
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,c
	ld	h,b
	inc	hl
	ld	a, (hl)
	ld	h, #0x00
	add	a,#0xFB
	ld	l,a
	ld	a,h
	adc	a,#0xFF
	ld	h,a
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,-4 (ix)
	add	a,#0x04
	ld	e,a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	ld	l,a
	ld	h,#0x00
	ld	a,c
	sub	a,l
	ld	c,a
	ld	a,b
	sbc	a,h
	ld	b,a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	inc	hl
	ld	a, (hl)
	ld	h, #0x00
	add	a,#0xFA
	ld	-32 (ix),a
	ld	a,h
	adc	a,#0xFF
	ld	-31 (ix),a
	ld	a,-30 (ix)
	add	a,#0xD4
	ld	-28 (ix),a
	ld	a,-29 (ix)
	adc	a,#0x01
	ld	-27 (ix),a
	ld	a,-4 (ix)
	add	a,#0x10
	ld	e,a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
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
	ld	hl,#0x000B
	push	hl
	ld	l, #0x0D
	push	hl
	push	bc
	ld	l,-32 (ix)
	ld	h,-31 (ix)
	push	hl
	ld	l,-28 (ix)
	ld	h,-27 (ix)
	push	hl
	push	de
	call	_VRAMtoVRAMTrans
	ld	hl,#0x000C
	add	hl,sp
	ld	sp,hl
;carwar.c:935: for(i=0; i<CAR_NUM; i++)
	ld	a,-34 (ix)
	add	a,#0x1A
	ld	-34 (ix),a
	ld	a,-30 (ix)
	add	a,#0x0B
	ld	-30 (ix),a
	ld	a,-29 (ix)
	adc	a,#0x00
	ld	-29 (ix),a
	inc	-1 (ix)
	jp	00182$
00185$:
;carwar.c:942: waitRetrace();
	call	_waitRetrace
	ld	sp,ix
	pop	ix
	ret
_StateUpdateGame_end::
;carwar.c:946: void InitializePlayer(Player* ply, u8 car, u8 posX, u8 posY)
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
;carwar.c:948: ply->car = car; // car index
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	hl,#0x000E
	add	hl,bc
	ex	de,hl
	ld	a,6 (ix)
	ld	(de),a
;carwar.c:949: ply->posX = posX << 8; // position X
	ld	d, 7 (ix)
	ld	e,#0x00
	ld	l,c
	ld	h,b
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:950: ply->posY = posY << 8; // position Y
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
;carwar.c:951: ply->prevX = ply->posX; // previous position X
	ld	hl,#0x0005
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
;carwar.c:952: ply->prevY = ply->posY; // previous position Y
	ld	hl,#0x0007
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
;carwar.c:953: ply->validX = ply->posX;
	ld	hl,#0x0012
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
;carwar.c:954: ply->validY = ply->posY;
	ld	hl,#0x0014
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
;carwar.c:955: ply->rot = 64; // rotation
	ld	hl,#0x0010
	add	hl,bc
	ex	de,hl
	ld	a,#0x40
	ld	(de),a
;carwar.c:956: ply->velX = 0; // velocity X
	ld	hl,#0x000A
	add	hl,bc
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;carwar.c:957: ply->velY = 0; // velocity Y
	ld	hl,#0x000C
	add	hl,bc
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;carwar.c:958: ply->jump = 0;
	ld	hl,#0x0011
	add	hl,bc
	ex	de,hl
	ld	a,#0x00
	ld	(de),a
;carwar.c:959: ply->posZ = 0;
	ld	hl,#0x0004
	add	hl,bc
	ex	de,hl
	ld	a,#0x00
	ld	(de),a
;carwar.c:960: ply->prevZ = 0;
	ld	hl,#0x0009
	add	hl,bc
	ld	(hl),#0x00
	ld	sp,ix
	pop	ix
	ret
_InitializePlayer_end::
;carwar.c:964: i8 AngleDifferent64(i8 angleA, i8 angleB)
;	---------------------------------
; Function AngleDifferent64
; ---------------------------------
_AngleDifferent64_start::
_AngleDifferent64:
	push	ix
	ld	ix,#0
	add	ix,sp
;carwar.c:967: diff = angleB - angleA;
	ld	a,5 (ix)
	sub	a,4 (ix)
;carwar.c:968: if(diff < -32)
	ld	c,a
	sub	a,#0xE0
	jp	PO,00109$
	xor	a,#0x80
00109$:
	jp	P,00102$
;carwar.c:969: diff += 64;
	ld	a,c
	add	a,#0x40
	ld	c,a
00102$:
;carwar.c:970: if(diff > 32)
	ld	a,#0x20
	sub	a,c
	jp	PO,00110$
	xor	a,#0x80
00110$:
	jp	P,00104$
;carwar.c:971: diff -= 64;
	ld	a,c
	add	a,#0xC0
	ld	c,a
00104$:
;carwar.c:972: return diff;
	ld	l,c
	pop	ix
	ret
_AngleDifferent64_end::
;carwar.c:989: u8 VectorToAngle256(i16 x, i16 y)
;	---------------------------------
; Function VectorToAngle256
; ---------------------------------
_VectorToAngle256_start::
_VectorToAngle256:
	push	ix
	ld	ix,#0
	add	ix,sp
;carwar.c:991: while(Abs16(x) > 15 || Abs16(y) > 15)
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
;carwar.c:993: x /= 2;
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
;carwar.c:994: y /= 2;
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
;carwar.c:996: x += 15; // x E [0;30]
	ld	a,4 (ix)
	add	a,#0x0F
	ld	4 (ix),a
	ld	a,5 (ix)
	adc	a,#0x00
	ld	5 (ix),a
;carwar.c:997: y += 15; // x E [0;30]
	ld	a,6 (ix)
	add	a,#0x0F
	ld	6 (ix),a
	ld	a,7 (ix)
	adc	a,#0x00
	ld	7 (ix),a
;carwar.c:998: return g_Rotation16[(x * 31) + y];
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
_VectorToAngle256_end::
;carwar.c:1002: u16 GetVectorLenght(i16 x, i16 y)
;	---------------------------------
; Function GetVectorLenght
; ---------------------------------
_GetVectorLenght_start::
_GetVectorLenght:
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;carwar.c:1007: div = 1;
	ld	-1 (ix),#0x01
;carwar.c:1008: lenSq = x*x + y*y; // get squared length
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	__mulint_rrx_s
	pop	af
	ex	(sp),hl
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
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
	ld	b,a
;carwar.c:1009: while(lenSq >= 1024)
00101$:
	ld	a,b
	sub	a,#0x04
	jr	C,00103$
;carwar.c:1011: lenSq /= 2;
	srl	b
	rr	c
;carwar.c:1012: div *= 2;
	sla	-1 (ix)
	jr	00101$
00103$:
;carwar.c:1014: div = g_SquareRoot1024[div] >> 3; // squared-root the div factor
	ld	a,#<(_g_SquareRoot1024)
	add	a,-1 (ix)
	ld	e,a
	ld	a,#>(_g_SquareRoot1024)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	srl	a
	srl	a
	srl	a
	ld	-1 (ix),a
;carwar.c:1015: ret = g_SquareRoot1024[lenSq] >> 3; // get square root (.2^3)
	ld	hl,#_g_SquareRoot1024
	add	hl,bc
	ld	a,(hl)
	srl	a
	srl	a
	srl	a
	ld	c, a
	ld	b,#0x00
;carwar.c:1016: return ret * div; // get length
	ld	l,-1 (ix)
	ld	h,#0x00
	push	hl
	push	bc
	call	__mulint_rrx_s
	ld	sp,ix
	pop	ix
	ret
_GetVectorLenght_end::
;carwar.c:1021: void CarToCarCollision(u8 idx, u8 car1, u8 car2)
;	---------------------------------
; Function CarToCarCollision
; ---------------------------------
_CarToCarCollision_start::
_CarToCarCollision:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-12
	add	hl,sp
	ld	sp,hl
;carwar.c:1027: dist = game.players[car2].nextX - game.players[car1].nextX;
	ld	a,6 (ix)
	ld	e,a
	add	a,a
	add	a,e
	add	a,a
	add	a,a
	add	a,e
	add	a,a
	ld	c, a
	add	a,#<(0x0107 + _game)
	ld	e,a
	ld	a,#>(0x0107 + _game)
	adc	a,#0x00
	ld	d,a
	ld	hl,#0x0016
	add	hl,de
	ld	a,(hl)
	ld	-12 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-11 (ix),a
	ld	a,5 (ix)
	ld	e,a
	add	a,a
	add	a,e
	add	a,a
	add	a,a
	add	a,e
	add	a,a
	ld	b, a
	add	a,#<(0x0107 + _game)
	ld	e,a
	ld	a,#>(0x0107 + _game)
	adc	a,#0x00
	ld	d,a
	ld	hl,#0x0016
	add	hl,de
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	ld	a,-12 (ix)
	sub	a,l
	ld	l,a
	ld	a,-11 (ix)
	sbc	a,h
	ld	-10 (ix), l
;carwar.c:1028: x1 = dist >> 8;
	ld	-9 (ix), a
	ld	-2 (ix), a
	rlc	a
	sbc	a,a
	ld	-1 (ix),a
;carwar.c:1029: dist = game.players[car2].nextY - game.players[car1].nextY;
	ld	a,#<(0x0107 + _game)
	add	a,c
	ld	e,a
	ld	a,#>(0x0107 + _game)
	adc	a,#0x00
	ld	d,a
	ld	hl,#0x0018
	add	hl,de
	ld	a,(hl)
	ld	-12 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-11 (ix),a
	ld	a,#<(0x0107 + _game)
	add	a,b
	ld	e,a
	ld	a,#>(0x0107 + _game)
	adc	a,#0x00
	ld	d,a
	ld	hl,#0x0018
	add	hl,de
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	ld	a,-12 (ix)
	sub	a,l
	ld	l,a
	ld	a,-11 (ix)
	sbc	a,h
	ld	-10 (ix), l
;carwar.c:1030: y1 = dist >> 8;
	ld	-9 (ix), a
	ld	-4 (ix), a
	rlc	a
	sbc	a,a
	ld	-3 (ix),a
;carwar.c:1031: dist = (x1 * x1) + (y1 * y1);
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
	ld	-11 (ix),h
	ld	-12 (ix),l
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
	ld	a,-12 (ix)
	add	a,e
	ld	e,a
	ld	a,-11 (ix)
	adc	a,d
	ld	-10 (ix), e
	ld	-9 (ix), a
;carwar.c:1032: if(dist < CAR_CHECK_LEN * CAR_CHECK_LEN) // Collision occured
	ld	a,-10 (ix)
	sub	a,#0x64
	ld	a,-9 (ix)
	sbc	a,#0x00
	jp	PO,00106$
	xor	a,#0x80
00106$:
	jp	P,00103$
;carwar.c:1034: x1 = game.players[car1].velX;
	ld	a,#<(0x0107 + _game)
	add	a,b
	ld	e,a
	ld	a,#>(0x0107 + _game)
	adc	a,#0x00
	ld	d,a
	ld	hl,#0x000A
	add	hl,de
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	-2 (ix), a
	ld	-1 (ix),h
;carwar.c:1035: y1 = game.players[car1].velY;
	ld	a,#<(0x0107 + _game)
	add	a,b
	ld	e,a
	ld	a,#>(0x0107 + _game)
	adc	a,#0x00
	ld	d,a
	ld	hl,#0x000C
	add	hl,de
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	-4 (ix), a
	ld	-3 (ix),h
;carwar.c:1036: x2 = game.players[car2].velX;
	ld	a,#<(0x0107 + _game)
	add	a,c
	ld	e,a
	ld	a,#>(0x0107 + _game)
	adc	a,#0x00
	ld	d,a
	ld	hl,#0x000A
	add	hl,de
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	-6 (ix), a
	ld	-5 (ix),h
;carwar.c:1037: y2 = game.players[car2].velY;
	ld	a,#<(0x0107 + _game)
	add	a,c
	ld	e,a
	ld	a,#>(0x0107 + _game)
	adc	a,#0x00
	ld	d,a
	ld	hl,#0x000C
	add	hl,de
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	-8 (ix), a
	ld	-7 (ix),h
;carwar.c:1039: game.players[car1].velX = x2 - x1;
	ld	a,#<(0x0107 + _game)
	add	a,b
	ld	e,a
	ld	a,#>(0x0107 + _game)
	adc	a,#0x00
	ld	d,a
	ld	hl,#0x000A
	add	hl,de
	ld	-12 (ix),l
	ld	-11 (ix),h
	ld	a,-6 (ix)
	sub	a,-2 (ix)
	ld	e,a
	ld	a,-5 (ix)
	sbc	a,-1 (ix)
	ld	d,a
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:1040: game.players[car1].velY = y2 - y1;
	ld	a,#<(0x0107 + _game)
	add	a,b
	ld	e,a
	ld	a,#>(0x0107 + _game)
	adc	a,#0x00
	ld	d,a
	ld	hl,#0x000C
	add	hl,de
	ld	-12 (ix),l
	ld	-11 (ix),h
	ld	a,-8 (ix)
	sub	a,-4 (ix)
	ld	e,a
	ld	a,-7 (ix)
	sbc	a,-3 (ix)
	ld	d,a
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:1041: game.players[car2].velX = x1 - x2;
	ld	a,#<(0x0107 + _game)
	add	a,c
	ld	e,a
	ld	a,#>(0x0107 + _game)
	adc	a,#0x00
	ld	d,a
	ld	hl,#0x000A
	add	hl,de
	ld	-12 (ix),l
	ld	-11 (ix),h
	ld	a,-2 (ix)
	sub	a,-6 (ix)
	ld	e,a
	ld	a,-1 (ix)
	sbc	a,-5 (ix)
	ld	d,a
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:1042: game.players[car2].velY = y1 - y2;
	ld	a,#<(0x0107 + _game)
	add	a,c
	ld	e,a
	ld	a,#>(0x0107 + _game)
	adc	a,#0x00
	ld	d,a
	ld	hl,#0x000C
	add	hl,de
	ld	-12 (ix),l
	ld	-11 (ix),h
	ld	a,-4 (ix)
	sub	a,-8 (ix)
	ld	e,a
	ld	a,-3 (ix)
	sbc	a,-7 (ix)
	ld	d,a
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:1044: game.players[car1].nextX = game.players[car1].posX;
	ld	a,#<(0x0107 + _game)
	add	a,b
	ld	e,a
	ld	a,#>(0x0107 + _game)
	adc	a,#0x00
	ld	d,a
	ld	hl,#0x0016
	add	hl,de
	ld	-12 (ix),l
	ld	-11 (ix),h
	ld	a,#<(0x0107 + _game)
	add	a,b
	ld	l, a
	ld	a, #>(0x0107 + _game)
	adc	a, #0x00
	ld	h, a
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:1045: game.players[car1].nextY = game.players[car1].posY;
	ld	a,#<(0x0107 + _game)
	add	a,b
	ld	e,a
	ld	a,#>(0x0107 + _game)
	adc	a,#0x00
	ld	d,a
	ld	hl,#0x0018
	add	hl,de
	ld	-12 (ix),l
	ld	-11 (ix),h
	ld	a,#<(0x0107 + _game)
	add	a,b
	ld	b,a
	ld	a,#>(0x0107 + _game)
	adc	a,#0x00
	ld	e,a
	ld	a,b
	add	a,#0x02
	ld	b,a
	ld	a,e
	adc	a,#0x00
	ld	h, a
	ld	l, b
	ld	b,(hl)
	inc	hl
	ld	e,(hl)
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	(hl),b
	inc	hl
	ld	(hl),e
;carwar.c:1046: game.players[car2].nextX = game.players[car2].posX;
	ld	a,#<(0x0107 + _game)
	add	a,c
	ld	e,a
	ld	a,#>(0x0107 + _game)
	adc	a,#0x00
	ld	d,a
	ld	hl,#0x0016
	add	hl,de
	ld	-12 (ix),l
	ld	-11 (ix),h
	ld	a,#<(0x0107 + _game)
	add	a,c
	ld	l, a
	ld	a, #>(0x0107 + _game)
	adc	a, #0x00
	ld	h, a
	ld	b,(hl)
	inc	hl
	ld	e,(hl)
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	(hl),b
	inc	hl
	ld	(hl),e
;carwar.c:1047: game.players[car2].nextY = game.players[car2].posY;
	ld	a,#<(0x0107 + _game)
	add	a,c
	ld	e,a
	ld	a,#>(0x0107 + _game)
	adc	a,#0x00
	ld	d,a
	ld	hl,#0x0018
	add	hl,de
	ex	de,hl
	ld	a,#<(0x0107 + _game)
	add	a,c
	ld	l, a
	ld	a, #>(0x0107 + _game)
	adc	a, #0x00
	ld	h, a
	inc	hl
	inc	hl
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
_CarToCarCollision_end::
;carwar.c:1052: void CarToWallCollision(u8 car)
;	---------------------------------
; Function CarToWallCollision
; ---------------------------------
_CarToWallCollision_start::
_CarToWallCollision:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-8
	add	hl,sp
	ld	sp,hl
;carwar.c:1056: ply = &game.players[car];
	ld	a,4 (ix)
	ld	e,a
	add	a,a
	add	a,e
	add	a,a
	add	a,a
	add	a,e
	add	a,a
	add	a,#<(0x0107 + _game)
	ld	c,a
	ld	a,#>(0x0107 + _game)
	adc	a,#0x00
	ld	-2 (ix), c
	ld	-1 (ix), a
;carwar.c:1058: if((ply->rot > 64) && (ply->rot > 64))
	ld	a,-2 (ix)
	add	a,#0x10
	ld	-6 (ix),a
	ld	a,-1 (ix)
	adc	a,#0x00
	ld	-5 (ix),a
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	l,(hl)
	ld	a,#0x40
	sub	a,l
	ld	a,#0x00
	rla
	ld	l,a
	or	a,a
	jp	Z,00106$
	xor	a,a
	or	a,l
	jp	Z,00106$
;carwar.c:1060: ground = ReadVRAM(game.page, PosToPxl(ply->posX) - WALL_CHECK_LEN + 256 * PosToPxl(ply->posY));
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	inc	hl
	ld	a, (hl)
	ld	h, #0x00
	add	a,#0xFC
	ld	e,a
	ld	a,h
	adc	a,#0xFF
	ld	d,a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	inc	hl
	inc	hl
	inc	hl
	ld	h, (hl)
	ld	l,#0x00
	add	hl,de
	ld	e,l
	ld	b,h
	ld	hl,#0x0004 + _game
	ld	c,(hl)
	ld	l,e
	ld	h,b
	push	hl
	ld	a,c
	push	af
	inc	sp
	call	_ReadVRAM
	pop	af
	inc	sp
;carwar.c:1061: op = game.colorCode[ground];
	ld	h,#0x00
	ld	a,#<(0x0007 + _game)
	add	a,l
	ld	b,a
	ld	a,#>(0x0007 + _game)
	adc	a,h
	ld	h, a
	ld	l, b
	ld	b, (hl)
;carwar.c:1062: if(op == OP_WALL)
	xor	a,a
	or	a,b
	jp	NZ,00107$
;carwar.c:1064: ply->velX = Abs16(ply->velX) >> 1;
	ld	a,-2 (ix)
	add	a,#0x0A
	ld	c,a
	ld	a,-1 (ix)
	adc	a,#0x00
	ld	b, a
	ld	l, c
	ld	h, a
	ld	a,(hl)
	ld	-4 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-3 (ix), a
	and	a,#0x80
	jr	Z,00118$
	ld	e,-4 (ix)
	ld	d,-3 (ix)
	dec	de
	ld	a,e
	cpl
	ld	e,a
	ld	a,d
	cpl
	ld	d,a
	jr	00119$
00118$:
	ld	e,-4 (ix)
	ld	d,-3 (ix)
00119$:
	srl	d
	rr	e
	ld	l,c
	ld	h,b
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:1065: ply->velY >>= 1;
	ld	a,-2 (ix)
	add	a,#0x0C
	ld	c,a
	ld	a,-1 (ix)
	adc	a,#0x00
	ld	b, a
	ld	l, c
	ld	h, a
	ld	a,(hl)
	inc	hl
	ld	d, (hl)
	ld	e, a
	sra	d
	rr	e
	ld	l,c
	ld	h,b
	ld	(hl),e
	inc	hl
	ld	(hl),d
	jp	00107$
00106$:
;carwar.c:1070: ground = ReadVRAM(game.page, PosToPxl(ply->posX) + WALL_CHECK_LEN + 256 * PosToPxl(ply->posY));
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	inc	hl
	ld	a, (hl)
	ld	h, #0x00
	add	a,#0x04
	ld	c,a
	ld	a,h
	adc	a,#0x00
	ld	b,a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	inc	hl
	inc	hl
	inc	hl
	ld	h, (hl)
	ld	l,#0x00
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	hl,#0x0004 + _game
	ld	e,(hl)
	push	bc
	ld	a,e
	push	af
	inc	sp
	call	_ReadVRAM
	pop	af
	inc	sp
;carwar.c:1071: op = game.colorCode[ground];
	ld	h,#0x00
	ld	a,#<(0x0007 + _game)
	add	a,l
	ld	e,a
	ld	a,#>(0x0007 + _game)
	adc	a,h
	ld	d,a
	ld	a,(de)
;carwar.c:1072: if(op == OP_WALL)
	or	a,a
	jr	NZ,00107$
;carwar.c:1074: ply->velX = -(Abs16(ply->velX) >> 1);
	ld	a,-2 (ix)
	add	a,#0x0A
	ld	c,a
	ld	a,-1 (ix)
	adc	a,#0x00
	ld	b, a
	ld	l, c
	ld	h, a
	ld	a,(hl)
	ld	-8 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-7 (ix), a
	and	a,#0x80
	jr	Z,00120$
	ld	e,-8 (ix)
	ld	d,-7 (ix)
	dec	de
	ld	a,e
	cpl
	ld	e,a
	ld	a,d
	cpl
	ld	d,a
	jr	00121$
00120$:
	ld	e,-8 (ix)
	ld	d,-7 (ix)
00121$:
	ex	de,hl
	srl	h
	rr	l
	xor	a,a
	sbc	a,l
	ld	e,a
	ld	a,#0x00
	sbc	a,h
	ld	d,a
	ld	l,c
	ld	h,b
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:1075: ply->velY >>= 1;
	ld	a,-2 (ix)
	add	a,#0x0C
	ld	c,a
	ld	a,-1 (ix)
	adc	a,#0x00
	ld	b, a
	ld	l, c
	ld	h, a
	ld	a,(hl)
	inc	hl
	ld	d, (hl)
	ld	e, a
	sra	d
	rr	e
	ld	l,c
	ld	h,b
	ld	(hl),e
	inc	hl
	ld	(hl),d
00107$:
;carwar.c:1079: if(ply->rot < 128)
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a, (hl)
	sub	a,#0x80
	jp	NC,00114$
;carwar.c:1081: ground = ReadVRAM(game.page, PosToPxl(ply->posX) + 256 * (PosToPxl(ply->posY) - WALL_CHECK_LEN));
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	inc	hl
	ld	c, (hl)
	ld	b,#0x00
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	h, #0x00
	add	a,#0xFC
	ld	l,a
	ld	a,h
	adc	a,#0xFF
	ld	h,l
	ld	l,#0x00
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	hl,#0x0004 + _game
	ld	e,(hl)
	push	bc
	ld	a,e
	push	af
	inc	sp
	call	_ReadVRAM
	pop	af
	inc	sp
;carwar.c:1082: op = game.colorCode[ground];
	ld	h,#0x00
	ld	a,#<(0x0007 + _game)
	add	a,l
	ld	e,a
	ld	a,#>(0x0007 + _game)
	adc	a,h
	ld	d,a
	ld	a,(de)
;carwar.c:1083: if(op == OP_WALL)
	or	a,a
	jp	NZ,00116$
;carwar.c:1085: ply->velX >>= 1;
	ld	a,-2 (ix)
	add	a,#0x0A
	ld	c,a
	ld	a,-1 (ix)
	adc	a,#0x00
	ld	b, a
	ld	l, c
	ld	h, a
	ld	a,(hl)
	inc	hl
	ld	d, (hl)
	ld	e, a
	sra	d
	rr	e
	ld	l,c
	ld	h,b
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:1086: ply->velY = -(Abs16(ply->velY) >> 1);
	ld	a,-2 (ix)
	add	a,#0x0C
	ld	c,a
	ld	a,-1 (ix)
	adc	a,#0x00
	ld	b, a
	ld	l, c
	ld	h, a
	ld	a,(hl)
	ld	-8 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-7 (ix), a
	and	a,#0x80
	jr	Z,00122$
	ld	e,-8 (ix)
	ld	d,-7 (ix)
	dec	de
	ld	a,e
	cpl
	ld	e,a
	ld	a,d
	cpl
	ld	d,a
	jr	00123$
00122$:
	ld	e,-8 (ix)
	ld	d,-7 (ix)
00123$:
	ex	de,hl
	srl	h
	rr	l
	xor	a,a
	sbc	a,l
	ld	e,a
	ld	a,#0x00
	sbc	a,h
	ld	d,a
	ld	l,c
	ld	h,b
	ld	(hl),e
	inc	hl
	ld	(hl),d
	jp	00116$
00114$:
;carwar.c:1091: ground = ReadVRAM(game.page, PosToPxl(ply->posX) + 256 * (PosToPxl(ply->posY) + WALL_CHECK_LEN));
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	inc	hl
	ld	c, (hl)
	ld	b,#0x00
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	h, #0x00
	add	a,#0x04
	ld	e,a
	ld	a,h
	adc	a,#0x00
	ld	h,e
	ld	l,#0x00
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	hl,#0x0004 + _game
	ld	e,(hl)
	push	bc
	ld	a,e
	push	af
	inc	sp
	call	_ReadVRAM
	pop	af
	inc	sp
;carwar.c:1092: op = game.colorCode[ground];
	ld	h,#0x00
	ld	a,#<(0x0007 + _game)
	add	a,l
	ld	e,a
	ld	a,#>(0x0007 + _game)
	adc	a,h
	ld	d,a
	ld	a,(de)
;carwar.c:1093: if(op == OP_WALL)
	or	a,a
	jr	NZ,00116$
;carwar.c:1095: ply->velX >>= 1;
	ld	a,-2 (ix)
	add	a,#0x0A
	ld	c,a
	ld	a,-1 (ix)
	adc	a,#0x00
	ld	b, a
	ld	l, c
	ld	h, a
	ld	a,(hl)
	inc	hl
	ld	d, (hl)
	ld	e, a
	sra	d
	rr	e
	ld	l,c
	ld	h,b
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:1096: ply->velY = Abs16(ply->velY) >> 1;
	ld	a,-2 (ix)
	add	a,#0x0C
	ld	-8 (ix),a
	ld	a,-1 (ix)
	adc	a,#0x00
	ld	-7 (ix),a
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,d
	and	a,#0x80
	jr	Z,00124$
	ld	c,e
	ld	b,d
	dec	bc
	ld	a,c
	cpl
	ld	c,a
	ld	a,b
	cpl
	ld	b,a
	jr	00125$
00124$:
	ld	c,e
	ld	b,d
00125$:
	srl	b
	rr	c
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
00116$:
	ld	sp,ix
	pop	ix
	ret
_CarToWallCollision_end::
;carwar.c:1148: void StateBuildTrack()
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
;carwar.c:1154: PrintSprite(64, 64, "BUILD\nTRACK", (u16)&defaultColor);
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
;carwar.c:1156: FillVRAM(0, 0, 128, 212, COLOR_KHAKI);
	ld	h,#0xD4
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
;carwar.c:1157: FillVRAM(128, 0, 128, 212, COLOR_KHAKI);
	ld	a,#0xD4
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
;carwar.c:1158: for(i=0; i<7; i++)
	ld	-1 (ix),#0x00
00134$:
	ld	a,-1 (ix)
	sub	a,#0x07
	jp	NC,00137$
;carwar.c:1160: for(j=0; j<6; j++)
	ld	-2 (ix),#0x00
	ld	-17 (ix),#0x00
	ld	-16 (ix),#0x00
00130$:
	ld	a,-2 (ix)
	sub	a,#0x06
	jp	NC,00136$
;carwar.c:1162: block = &track01.tiles[i + j * 7];
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
;carwar.c:1163: if((block->tile & 0x0F) == 2) // Plein block
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	a,(hl)
	and	a,#0x0F
	sub	a,#0x02
	jr	NZ,00152$
;carwar.c:1165: FillVRAM(16 + (32 * i), 8 + (32 * j), 32, 32, block->color1);
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
;carwar.c:1169: for(x=0; x<32; x++)
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
;carwar.c:1171: for(y=0; y<32; y++)
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
;carwar.c:1173: if((block->tile & 0xF0) == ROT_0)        { lx = x;      ly = y; }
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
;carwar.c:1174: else if((block->tile & 0xF0) == ROT_90)  { lx = y;      ly = 31 - x; }
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
;carwar.c:1175: else if((block->tile & 0xF0) == ROT_180) { lx = 31 - x; ly = 31 - y; }
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
;carwar.c:1176: else if((block->tile & 0xF0) == ROT_270) { lx = 31 - y; ly = x; }
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
;carwar.c:1177: else if((block->tile & 0xF0) == SYM_H)   { lx = x;      ly = 31 - y; }
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
;carwar.c:1178: else /* SYM_V */                         { lx = 31 - x; ly = y; }
	ld	a,-11 (ix)
	ld	-27 (ix),a
	ld	a,-10 (ix)
	ld	-26 (ix),a
	ld	a,-7 (ix)
	ld	-29 (ix),a
	ld	a,-6 (ix)
	ld	-28 (ix),a
00115$:
;carwar.c:1179: byte = trackTiles[32 * 4 * (block->tile & 0x0F) + (lx >> 3) + (ly * 32 >> 3)];
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
;carwar.c:1180: if(byte & (1 << (7 - (lx & 0x07))))
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
;carwar.c:1181: WriteVRAM(0, (16 + 32 * i + x) + 256 * (8 + 32 * j + y), block->color1);
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
;carwar.c:1183: WriteVRAM(0, (16 + 32 * i + x) + 256 * (8 + 32 * j + y), block->color0);
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
;carwar.c:1171: for(y=0; y<32; y++)
	inc	-7 (ix)
	jp	NZ,00122$
	inc	-6 (ix)
	jp	00122$
00128$:
;carwar.c:1169: for(x=0; x<32; x++)
	inc	-5 (ix)
	jp	NZ,00126$
	inc	-4 (ix)
	jp	00126$
00132$:
;carwar.c:1160: for(j=0; j<6; j++)
	ld	a,-17 (ix)
	add	a,#0x07
	ld	-17 (ix),a
	ld	a,-16 (ix)
	adc	a,#0x00
	ld	-16 (ix),a
	inc	-2 (ix)
	jp	00130$
00136$:
;carwar.c:1158: for(i=0; i<7; i++)
	inc	-1 (ix)
	jp	00134$
00137$:
;carwar.c:1189: ClearSprite();
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
;carwar.c:1193: void StateShadeTrack()
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
;carwar.c:1198: PrintSprite(64, 64, "SHADE\nTRACK", (u16)&defaultColor);
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
;carwar.c:1200: cur = ReadVRAM(0, 0);
	ld	hl,#0x0000
	ex	(sp),hl
	ld	a,#0x00
	push	af
	inc	sp
	call	_ReadVRAM
	pop	af
	inc	sp
;carwar.c:1201: for(x=0; x<256; x++)
	ld	-2 (ix),#0x00
	ld	-1 (ix),#0x00
00124$:
	ld	a,-1 (ix)
	sub	a,#0x01
	jp	NC,00127$
;carwar.c:1203: for(y=0; y<211; y++)
	ld	-4 (ix),#0x00
	ld	-3 (ix),#0x00
00120$:
	ld	a,-4 (ix)
	sub	a,#0xD3
	ld	a,-3 (ix)
	sbc	a,#0x00
	jp	NC,00126$
;carwar.c:1205: cur = ReadVRAM(0, x + 256 * y);
	ld	h,-4 (ix)
	ld	l,#0x00
	ld	a,-2 (ix)
	add	a,l
	ld	c,a
	ld	a,-1 (ix)
	adc	a,h
	ld	b,a
	push	bc
	ld	a,#0x00
	push	af
	inc	sp
	call	_ReadVRAM
	pop	af
	inc	sp
	ld	c,l
;carwar.c:1206: next = ReadVRAM(0, x + 256 * (y + 1));
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
	ld	a,#0x00
	push	af
	inc	sp
	call	_ReadVRAM
	pop	af
	inc	sp
	pop	bc
	ld	b,l
;carwar.c:1207: if(game.colorCode[cur] < OP_SPECIAL && game.colorCode[next] >= OP_SPECIAL)
	ld	l,c
	ld	h,#0x00
	ld	a,#<(0x0007 + _game)
	add	a,l
	ld	e,a
	ld	a,#>(0x0007 + _game)
	adc	a,h
	ld	d,a
	ld	a,(de)
	sub	a,#0x04
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
	sub	a,#0x04
	jp	C,00122$
;carwar.c:1209: for(i=0; i<BLOCK_SHADOW; i++)
	ld	-6 (ix),#0x00
	ld	-5 (ix),#0x00
00105$:
	ld	a,-6 (ix)
	sub	a,#0x03
	ld	a,-5 (ix)
	sbc	a,#0x00
	jr	NC,00108$
;carwar.c:1211: cur = ReadVRAM(0, x + 256 * (y - i));
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
	ld	a,#0x00
	push	af
	inc	sp
	call	_ReadVRAM
	pop	af
	inc	sp
	pop	de
	pop	bc
	ld	c,l
;carwar.c:1212: if((y - i < 212) && (game.colorCode[cur] < OP_SPECIAL))
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
	sub	a,#0x04
	jr	NC,00108$
;carwar.c:1213: WriteVRAM(0, x + 256 * (y - i), DarkenColor(cur, SHADOW_POWER));
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
;carwar.c:1209: for(i=0; i<BLOCK_SHADOW; i++)
	inc	-6 (ix)
	jr	NZ,00105$
	inc	-5 (ix)
	jp	00105$
00108$:
;carwar.c:1217: for(i=1; i<=ROAD_SHADOW; i++)
	ld	-6 (ix),#0x01
	ld	-5 (ix),#0x00
00113$:
	ld	a,#0x04
	sub	a,-6 (ix)
	ld	a,#0x00
	sbc	a,-5 (ix)
	jr	C,00116$
;carwar.c:1219: cur = ReadVRAM(0, x + 256 * (y + i));
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
	ld	a,#0x00
	push	af
	inc	sp
	call	_ReadVRAM
	pop	af
	inc	sp
	pop	de
	pop	bc
	ld	c,l
;carwar.c:1220: if((y + i < 212) && (game.colorCode[cur] >= OP_SPECIAL))
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
	sub	a,#0x04
	jr	C,00116$
;carwar.c:1221: WriteVRAM(0, x + 256 * (y + i), DarkenColor(cur, SHADOW_POWER));
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
;carwar.c:1217: for(i=1; i<=ROAD_SHADOW; i++)
	inc	-6 (ix)
	jr	NZ,00113$
	inc	-5 (ix)
	jp	00113$
00116$:
;carwar.c:1225: y += i;
	ld	a,-4 (ix)
	add	a,-6 (ix)
	ld	-4 (ix),a
	ld	a,-3 (ix)
	adc	a,-5 (ix)
	ld	-3 (ix),a
00122$:
;carwar.c:1203: for(y=0; y<211; y++)
	inc	-4 (ix)
	jp	NZ,00120$
	inc	-3 (ix)
	jp	00120$
00126$:
;carwar.c:1201: for(x=0; x<256; x++)
	inc	-2 (ix)
	jp	NZ,00124$
	inc	-1 (ix)
	jp	00124$
00127$:
;carwar.c:1229: ClearSprite();
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
;carwar.c:1235: u8 DarkenColor(u8 color, u8 power)
;	---------------------------------
; Function DarkenColor
; ---------------------------------
_DarkenColor_start::
_DarkenColor:
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;carwar.c:1238: g = ((color & 0xE0) >> 5);
	ld	a,4 (ix)
	and	a,#0xE0
	ld	c,a
	srl	c
	srl	c
	srl	c
	srl	c
	srl	c
;carwar.c:1239: r = ((color & 0x1C) >> 2);
	ld	a,4 (ix)
	and	a,#0x1C
	ld	b,a
	srl	b
	srl	b
;carwar.c:1240: b = (color & 0x03);
	ld	a,4 (ix)
	and	a,#0x03
	ld	-1 (ix),a
;carwar.c:1241: switch(power)
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
;carwar.c:1243: case 0: break;                       // x1
	jp	00110$
;carwar.c:1244: case 1: TransformColor(7, 3); break; // x0.875
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
;carwar.c:1245: case 2: TransformColor(3, 2); break; // x0.75
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
;carwar.c:1246: case 3: TransformColor(5, 3); break; // x0.625
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
;carwar.c:1247: case 4: TransformColor(1, 1); break; // x0.5
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
;carwar.c:1248: case 5: TransformColor(3, 3); break; // x0.375
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
;carwar.c:1249: case 6: TransformColor(1, 2); break; // x0.25
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
;carwar.c:1250: case 7:                              // x0.125
00108$:
;carwar.c:1251: default: TransformColor(1, 3); break;
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
;carwar.c:1252: }
00110$:
;carwar.c:1253: return (g << 5) + (r << 2) + b;
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
;carwar.c:1256: u8 GrayGradiant(u8 index)
;	---------------------------------
; Function GrayGradiant
; ---------------------------------
_GrayGradiant_start::
_GrayGradiant:
	push	ix
	ld	ix,#0
	add	ix,sp
;carwar.c:1259: col = index & 0xF; // 0:16
	ld	a,4 (ix)
	and	a,#0x0F
	ld	c,a
;carwar.c:1260: col >>= 1; // 0:8
	srl	c
;carwar.c:1261: col += 2; // 2:10
	inc	c
	inc	c
;carwar.c:1262: if(col > 5)
	ld	a,#0x05
	sub	a,c
	jr	NC,00102$
;carwar.c:1263: col = 12 - col; // 2:5 & 6:3
	ld	a,#0x0C
	sub	a,c
	ld	c,a
00102$:
;carwar.c:1264: return (col << 5) + (col << 2) + (col >> 1);
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
;carwar.c:1267: void DrawCharacter(u16 x, u16 y, u8 chr, u8 color)
;	---------------------------------
; Function DrawCharacter
; ---------------------------------
_DrawCharacter_start::
_DrawCharacter:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;carwar.c:1271: HMMV(x, y, 8, 8, color);
	ld	hl,#0x0980 + _game
	ld	a,4 (ix)
	ld	(hl),a
	inc	hl
	ld	a,5 (ix)
	ld	(hl),a
	ld	hl,#0x0002 + 0x0980 + _game
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
	ld	l,#<(0x0980 + _game)
	ld	h,#>(0x0980 + _game)
	push	hl
	call	_VPDCommand36
	pop	af
;carwar.c:1272: for(j=0; j<8; j++)
	ld	-2 (ix),#0x00
	ld	-1 (ix),#0x00
00101$:
	ld	a,-2 (ix)
	sub	a,#0x08
	ld	a,-1 (ix)
	sbc	a,#0x00
	jp	NC,00105$
;carwar.c:1274: LMMC(x, y + j, 8, 1, (u16)&game.bitToByte[charTable[chr * 8 + j] * 8], VDP_OP_AND);
	ld	hl,#0x0980 + _game
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
	ld	hl,#0x0002 + 0x0980 + _game
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
	ld	a,#<(0x0171 + _game)
	add	a,l
	ld	c,a
	ld	a,#>(0x0171 + _game)
	adc	a,h
	ld	h, a
	ld	l, c
	ld	a,(hl)
	ld	hl,#0x0008 + 0x0980 + _game
	ld	(hl),a
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0xB1
	ld	l,#<(0x0980 + _game)
	ld	h,#>(0x0980 + _game)
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
	ld	a,#<(0x0171 + _game)
	add	a,l
	ld	c,a
	ld	a,#>(0x0171 + _game)
	adc	a,h
	ld	h, a
	ld	l, c
	push	hl
	call	_VPDCommandLoop
	pop	af
;carwar.c:1272: for(j=0; j<8; j++)
	inc	-2 (ix)
	jp	NZ,00101$
	inc	-1 (ix)
	jp	00101$
00105$:
	ld	sp,ix
	pop	ix
	ret
_DrawCharacter_end::
;carwar.c:1278: void DrawText(u16 x, u16 y, const char* text, u8 color)
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
;carwar.c:1281: u16 curX = x;
	ld	a,4 (ix)
	ld	-4 (ix),a
	ld	a,5 (ix)
	ld	-3 (ix),a
;carwar.c:1282: u16 curY = y;
	ld	l,6 (ix)
	ld	h,7 (ix)
;carwar.c:1283: while(text[textIdx] != 0)
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
;carwar.c:1285: if(text[textIdx] == '\n')
	ld	c,a
	or	a,a
	jr	Z,00109$
	sub	a,#0x0A
	jr	NZ,00104$
;carwar.c:1287: curX = x;
	ld	a,4 (ix)
	ld	-4 (ix),a
	ld	a,5 (ix)
	ld	-3 (ix),a
;carwar.c:1288: curY += LINE_SPACE;
	ld	hl,#0x000A
	add	hl,de
	ex	de,hl
	jr	00105$
00104$:
;carwar.c:1292: if(text[textIdx] != ' ')
;carwar.c:1294: DrawCharacter(curX, curY, text[textIdx] - '0', color);
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
;carwar.c:1295: sprtIdx++;
	inc	-2 (ix)
00102$:
;carwar.c:1297: curX += 8;
	ld	a,-4 (ix)
	add	a,#0x08
	ld	-4 (ix),a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	-3 (ix),a
00105$:
;carwar.c:1299: textIdx++;
	inc	-1 (ix)
	jr	00106$
00109$:
	ld	sp,ix
	pop	ix
	ret
_DrawText_end::
;carwar.c:1303: void DebugPrintInt(i16 i, u8 x, u8 y)
;	---------------------------------
; Function DebugPrintInt
; ---------------------------------
_DebugPrintInt_start::
_DebugPrintInt:
	push	ix
	ld	ix,#0
	add	ix,sp
;carwar.c:1305: SetSpriteUniColor(0, x + 0 * 8, y, (i / 100000) % 10, 0x0F);
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
;carwar.c:1306: SetSpriteUniColor(1, x + 1 * 8, y, (i / 10000) % 10, 0x0F);
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
;carwar.c:1307: SetSpriteUniColor(2, x + 2 * 8, y, (i / 1000) % 10, 0x0F);
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
;carwar.c:1308: SetSpriteUniColor(3, x + 3 * 8, y, (i / 100) % 10, 0x0F);
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
;carwar.c:1309: SetSpriteUniColor(4, x + 4 * 8, y, (i / 10) % 10, 0x0F);
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
;carwar.c:1310: SetSpriteUniColor(5, x + 5 * 8, y, i % 10, 0x0F);
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
;carwar.c:1311: SetSpriteUniColor(6, 0, 216, 0, 0);
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
