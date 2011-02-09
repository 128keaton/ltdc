;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.0.0 #6037 (Oct 31 2010) (MINGW32)
; This file was generated Wed Feb 09 03:20:22 2011
;--------------------------------------------------------
	.module carwar
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _colorCode
	.globl _buffer32
	.globl _buffer36
	.globl _game
	.globl _players
	.globl _track01
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
	.globl _StateTitle
	.globl _StateMainMenu
	.globl _StateStartGame
	.globl _StateUpdateGame
	.globl _InitializePlayer
	.globl _CheckCollision
	.globl _StateBuildTrack
	.globl _StateShadeTrack
	.globl _DarkenColor
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
_g_slotPort	=	0x00a8
;--------------------------------------------------------
;  ram data
;--------------------------------------------------------
	.area _DATA
_players	=	0xc000
_game	=	0xc100
_buffer36	=	0xc200
_buffer32	=	0xc300
_colorCode	=	0xc400
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
;carwar.c:218: void main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main_start::
_main:
;carwar.c:224: __endasm;
	
		 di
		 ld sp, (#0xFC4A)
		 ei
		
;carwar.c:226: g_slotPort = (g_slotPort & 0xCF) | ((g_slotPort & 0x0C) << 2);
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
;carwar.c:228: MainLoop();
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
_g_Sinus:
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
_g_Cosinus:
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
	.db #0x18	; 24
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x20	; 32
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x1E	; 30
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x10	; 16
	.db #0x04	; 4
_track01:
	.db #0x00	; 0
	.db #0xE0	; 224
	.db #0x92	; 146
	.db #0x02	; 2
	.db #0xE0	; 224
	.db #0x92	; 146
	.db #0x02	; 2
	.db #0xE0	; 224
	.db #0x92	; 146
	.db #0x10	; 16
	.db #0xE0	; 224
	.db #0x92	; 146
	.db #0x00	; 0
	.db #0xE0	; 224
	.db #0x92	; 146
	.db #0x02	; 2
	.db #0xE0	; 224
	.db #0x92	; 146
	.db #0x10	; 16
	.db #0xE0	; 224
	.db #0x92	; 146
	.db #0x02	; 2
	.db #0xE0	; 224
	.db #0x92	; 146
	.db #0x01	; 1
	.db #0x92	; 146
	.db #0xE0	; 224
	.db #0x02	; 2
	.db #0x92	; 146
	.db #0xE0	; 224
	.db #0x30	; 48
	.db #0xE0	; 224
	.db #0x92	; 146
	.db #0x20	; 32
	.db #0xE0	; 224
	.db #0x92	; 146
	.db #0x11	; 17
	.db #0x92	; 146
	.db #0xE0	; 224
	.db #0x02	; 2
	.db #0xE0	; 224
	.db #0x92	; 146
	.db #0x03	; 3
	.db #0xFF	; 255
	.db #0x92	; 146
	.db #0x02	; 2
	.db #0x92	; 146
	.db #0xE0	; 224
	.db #0x02	; 2
	.db #0x92	; 146
	.db #0xE0	; 224
	.db #0x02	; 2
	.db #0x92	; 146
	.db #0xE0	; 224
	.db #0x02	; 2
	.db #0x92	; 146
	.db #0xE0	; 224
	.db #0x02	; 2
	.db #0x92	; 146
	.db #0xE0	; 224
	.db #0x19	; 25
	.db #0x90	; 144
	.db #0x92	; 146
	.db #0x02	; 2
	.db #0xE0	; 224
	.db #0x92	; 146
	.db #0x02	; 2
	.db #0x92	; 146
	.db #0xE0	; 224
	.db #0x02	; 2
	.db #0x92	; 146
	.db #0xE0	; 224
	.db #0x02	; 2
	.db #0x92	; 146
	.db #0xE0	; 224
	.db #0x02	; 2
	.db #0x92	; 146
	.db #0xE0	; 224
	.db #0x01	; 1
	.db #0xE0	; 224
	.db #0x90	; 144
	.db #0x02	; 2
	.db #0xE0	; 224
	.db #0x90	; 144
	.db #0x02	; 2
	.db #0xE0	; 224
	.db #0x92	; 146
	.db #0x00	; 0
	.db #0xE0	; 224
	.db #0x92	; 146
	.db #0x02	; 2
	.db #0xE0	; 224
	.db #0x92	; 146
	.db #0x02	; 2
	.db #0x92	; 146
	.db #0xE0	; 224
	.db #0x3B	; 59
	.db #0x5D	; 93
	.db #0x90	; 144
	.db #0x04	; 4
	.db #0xE0	; 224
	.db #0x90	; 144
	.db #0x02	; 2
	.db #0xE0	; 224
	.db #0x90	; 144
	.db #0x30	; 48
	.db #0xE0	; 224
	.db #0x92	; 146
	.db #0x02	; 2
	.db #0xE0	; 224
	.db #0x92	; 146
	.db #0x01	; 1
	.db #0x92	; 146
	.db #0xE0	; 224
	.db #0x02	; 2
	.db #0x92	; 146
	.db #0xE0	; 224
	.db #0x11	; 17
	.db #0x90	; 144
	.db #0xE0	; 224
	.db #0x02	; 2
	.db #0xE0	; 224
	.db #0x90	; 144
	.db #0x20	; 32
	.db #0xE0	; 224
	.db #0x90	; 144
;carwar.c:233: void MainLoop()
;	---------------------------------
; Function MainLoop
; ---------------------------------
_MainLoop_start::
_MainLoop:
;carwar.c:236: game.state = StateInitialize;
	ld	hl,#0x0003 + _game
	ld	(hl),#<(_StateInitialize)
	inc	hl
	ld	(hl),#>(_StateInitialize)
;carwar.c:238: while(1)
00102$:
;carwar.c:241: game.state();
	ld	hl,#0x0003 + _game
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
;carwar.c:246: void StateInitialize()
;	---------------------------------
; Function StateInitialize
; ---------------------------------
_StateInitialize_start::
_StateInitialize:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;carwar.c:252: SetScreen8(LINES_212);
	ld	a,#0x80
	push	af
	inc	sp
	call	_SetScreen8
	inc	sp
;carwar.c:253: SetSpriteMode(SPRITE_ON, SPRITE_NO_MAG + SPRITE_SIZE_8, 0xF800 >> 11, 0xF700 >> 7);
	ld	hl,#0x01EE
	push	hl
	ld	hl,#0x001F
	push	hl
	ld	l, #0x00
	push	hl
	call	_SetSpriteMode
	pop	af
	pop	af
;carwar.c:255: FillVRAM(0, 0,   256, 256, 0);
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
;carwar.c:256: FillVRAM(0, 256, 256, 256, 0);
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
;carwar.c:259: for(x=0; x<256; x++)
	ld	bc,#0x0000
00101$:
	ld	a,b
	sub	a,#0x01
	jr	NC,00104$
;carwar.c:260: colorCode[x] = OP_NONE;
	ld	hl,#_colorCode
	add	hl,bc
	ex	de,hl
	ld	a,#0x00
	ld	(de),a
;carwar.c:259: for(x=0; x<256; x++)
	inc	bc
	jr	00101$
00104$:
;carwar.c:262: colorCode[COLOR_BLACK]  = OP_HOLE;
	ld	hl,#_colorCode
	ld	(hl),#0x01
;carwar.c:263: colorCode[COLOR_GREEN]  = OP_WALL;
	ld	hl,#0x00e0 + _colorCode
	ld	(hl),#0x02
;carwar.c:264: colorCode[COLOR_GRAY]   = OP_ROAD;
	ld	hl,#0x0092 + _colorCode
	ld	(hl),#0x40
;carwar.c:265: colorCode[COLOR_ORANGE] = OP_JUMP;
	ld	hl,#0x005d + _colorCode
	ld	(hl),#0x03
;carwar.c:266: colorCode[COLOR_YELLOW] = OP_SAND;
	ld	hl,#0x0090 + _colorCode
	ld	(hl),#0x41
;carwar.c:267: colorCode[COLOR_WHITE]  = OP_ROAD;
	ld	hl,#0x00ff + _colorCode
	ld	(hl),#0x40
;carwar.c:268: colorCode[DarkenColor(COLOR_BLACK, SHADOW_POWER)]  = OP_HOLE;
	ld	hl,#0x0200
	push	hl
	call	_DarkenColor
	pop	af
	ld	a,#<(_colorCode)
	add	a,l
	ld	c,a
	ld	a,#>(_colorCode)
	adc	a,#0x00
	ld	b,a
	ld	a,#0x01
	ld	(bc),a
;carwar.c:269: colorCode[DarkenColor(COLOR_GREEN, SHADOW_POWER)]  = OP_WALL;
	ld	hl,#0x02E0
	push	hl
	call	_DarkenColor
	pop	af
	ld	a,#<(_colorCode)
	add	a,l
	ld	c,a
	ld	a,#>(_colorCode)
	adc	a,#0x00
	ld	b,a
	ld	a,#0x02
	ld	(bc),a
;carwar.c:270: colorCode[DarkenColor(COLOR_GRAY, SHADOW_POWER)]   = OP_ROAD;
	ld	hl,#0x0292
	push	hl
	call	_DarkenColor
	pop	af
	ld	a,#<(_colorCode)
	add	a,l
	ld	c,a
	ld	a,#>(_colorCode)
	adc	a,#0x00
	ld	b,a
	ld	a,#0x40
	ld	(bc),a
;carwar.c:271: colorCode[DarkenColor(COLOR_ORANGE, SHADOW_POWER)] = OP_JUMP;
	ld	hl,#0x025D
	push	hl
	call	_DarkenColor
	pop	af
	ld	a,#<(_colorCode)
	add	a,l
	ld	c,a
	ld	a,#>(_colorCode)
	adc	a,#0x00
	ld	b,a
	ld	a,#0x03
	ld	(bc),a
;carwar.c:272: colorCode[DarkenColor(COLOR_YELLOW, SHADOW_POWER)] = OP_SAND;
	ld	hl,#0x0290
	push	hl
	call	_DarkenColor
	pop	af
	ld	a,#<(_colorCode)
	add	a,l
	ld	c,a
	ld	a,#>(_colorCode)
	adc	a,#0x00
	ld	b,a
	ld	a,#0x41
	ld	(bc),a
;carwar.c:273: colorCode[DarkenColor(COLOR_WHITE, SHADOW_POWER)]  = OP_ROAD;
	ld	hl,#0x02FF
	push	hl
	call	_DarkenColor
	pop	af
	ld	a,#<(_colorCode)
	add	a,l
	ld	c,a
	ld	a,#>(_colorCode)
	adc	a,#0x00
	ld	b,a
	ld	a,#0x40
	ld	(bc),a
;carwar.c:277: for(x=0; x<sizeof(charTable)/8; x++)
	ld	-2 (ix),#0x00
	ld	-1 (ix),#0x00
00105$:
	ld	a,-2 (ix)
	sub	a,#0x30
	ld	a,-1 (ix)
	sbc	a,#0x00
	jr	NC,00108$
;carwar.c:279: RAMtoVRAM((x * 8) % 256, 248 + (x / 32), 8, 1, (u16)&charTable[x * 8]);
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
	ld	-4 (ix), l
	ld	-3 (ix), h
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
	ld	l,-4 (ix)
	ld	h,-3 (ix)
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
;carwar.c:277: for(x=0; x<sizeof(charTable)/8; x++)
	inc	-2 (ix)
	jr	NZ,00105$
	inc	-1 (ix)
	jr	00105$
00108$:
;carwar.c:282: game.page = 0;
	ld	hl,#_game
	ld	(hl),#0x00
;carwar.c:283: game.state = StateTitle;
	ld	hl,#0x0003 + _game
	ld	(hl),#<(_StateTitle)
	inc	hl
	ld	(hl),#>(_StateTitle)
	ld	sp,ix
	pop	ix
	ret
_StateInitialize_end::
;carwar.c:289: void StateTitle()
;	---------------------------------
; Function StateTitle
; ---------------------------------
_StateTitle_start::
_StateTitle:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-9
	add	hl,sp
	ld	sp,hl
;carwar.c:293: game.page = 1;
	ld	hl,#_game
	ld	(hl),#0x01
;carwar.c:294: SetPage8(game.page);
	ld	a, (hl)
	push	af
	inc	sp
	call	_SetPage8
	inc	sp
;carwar.c:296: for(j=0; j<24; j++)
	ld	-2 (ix),#0x00
	ld	-8 (ix),#0x00
	ld	-7 (ix),#0x00
00109$:
	ld	a,-2 (ix)
	sub	a,#0x18
	jp	NC,00112$
;carwar.c:298: for(i=0; i<232; i++)
	ld	hl,#0x0008
	push	hl
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	hl
	call	__divsint_rrx_s
	pop	af
	pop	af
	ld	-3 (ix),h
	ld	-4 (ix),l
	ld	-1 (ix),#0x00
00105$:
	ld	a,-1 (ix)
	sub	a,#0xE8
	jp	NC,00111$
;carwar.c:300: byte = title[(i / 8) + (j * 232 / 8)];
	ld	a,-1 (ix)
	srl	a
	srl	a
	srl	a
	ld	h, #0x00
	add	a,-4 (ix)
	ld	c,a
	ld	a,h
	adc	a,-3 (ix)
	ld	b,a
	ld	hl,#_title
	add	hl,bc
	ld	e, (hl)
;carwar.c:301: if(byte & (1 << (7 - (i & 0x07))))
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
	jr	00124$
00123$:
	sla	c
	rl	b
00124$:
	dec	a
	jr	NZ,00123$
	ld	a, e
	ld	h, #0x00
	and	a,c
	ld	l,a
	ld	a,h
	and	a,b
	ld	h,a
	ld	a,l
	or	a,h
	jr	Z,00107$
;carwar.c:303: col = (i + j) % 16; // 0:16
	ld	c,-1 (ix)
	ld	b,#0x00
	ld	a,-2 (ix)
	ld	-6 (ix),a
	ld	-5 (ix),#0x00
	ld	a,c
	add	a,-6 (ix)
	ld	e,a
	ld	a,b
	adc	a,-5 (ix)
	ld	d,a
	push	bc
	ld	hl,#0x0010
	push	hl
	push	de
	call	__modsint_rrx_s
	pop	af
	pop	af
	ld	e,l
	pop	bc
;carwar.c:304: col /= 2; // 0:8
	srl	e
;carwar.c:305: col += 2; // 2:10
	inc	e
	inc	e
;carwar.c:306: if(col > 5)
	ld	a,#0x05
	sub	a,e
	jr	NC,00102$
;carwar.c:307: col = 12 - col; // 2:5 & 6:3
	ld	a,#0x0C
	sub	a,e
	ld	e,a
00102$:
;carwar.c:308: WriteVRAM(TITLE_X + i + 256 * (TITLE_Y + j), (col << 5) + (col << 2) + (col >> 1));
	ld	a,e
	rrca
	rrca
	rrca
	and	a,#0xE0
	ld	l,a
	ld	a,e
	add	a,a
	add	a,a
	add	a,l
	ld	l,a
	srl	e
	ld	a,l
	add	a,e
	ld	-9 (ix),a
	ld	hl,#0x000C
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,-6 (ix)
	add	a,#0x20
	ld	h, a
	ld	a, -5 (ix)
	adc	a, #0x00
	ld	l,#0x00
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,-9 (ix)
	push	af
	inc	sp
	push	bc
	call	_WriteVRAM
	pop	af
	inc	sp
00107$:
;carwar.c:298: for(i=0; i<232; i++)
	inc	-1 (ix)
	jp	00105$
00111$:
;carwar.c:296: for(j=0; j<24; j++)
	ld	a,-8 (ix)
	add	a,#0xE8
	ld	-8 (ix),a
	ld	a,-7 (ix)
	adc	a,#0x00
	ld	-7 (ix),a
	inc	-2 (ix)
	jp	00109$
00112$:
;carwar.c:313: VRAMtoVRAM(TITLE_X, TITLE_Y, TITLE_X, TITLE_Y + 256, 232, 24);
	ld	hl,#0x0018
	push	hl
	ld	l, #0xE8
	push	hl
	ld	hl,#0x0120
	push	hl
	ld	hl,#0x000C
	push	hl
	ld	l, #0x20
	push	hl
	ld	l, #0x0C
	push	hl
	call	_VRAMtoVRAM
	ld	hl,#0x000C
	add	hl,sp
	ld	sp,hl
;carwar.c:314: PrintSprite(100, 150, "PRESS\n  A\n KEY", (u16)&defaultColor);
	ld	c,#<(_defaultColor)
	ld	b,#>(_defaultColor)
	push	bc
	ld	hl,#__str_0
	push	hl
	ld	hl,#0x9664
	push	hl
	call	_PrintSprite
	pop	af
	pop	af
	pop	af
;carwar.c:316: game.state = StateMainMenu;
	ld	hl,#0x0003 + _game
	ld	(hl),#<(_StateMainMenu)
	inc	hl
	ld	(hl),#>(_StateMainMenu)
	ld	sp,ix
	pop	ix
	ret
_StateTitle_end::
__str_0:
	.ascii "PRESS"
	.db 0x0A
	.ascii "  A"
	.db 0x0A
	.ascii " KEY"
	.db 0x00
;carwar.c:319: void StateMainMenu()
;	---------------------------------
; Function StateMainMenu
; ---------------------------------
_StateMainMenu_start::
_StateMainMenu:
;carwar.c:323: SetPage8(game.page);
	ld	a,(#_game)
	push	af
	inc	sp
	call	_SetPage8
	inc	sp
;carwar.c:324: game.page = 1 - game.page;
	ld	hl,#_game
	ld	l,(hl)
	ld	a,#0x01
	sub	a,l
	ld	(#_game),a
;carwar.c:326: keyLine = GetKeyMatrixLine(8);
	ld	a,#0x08
	push	af
	inc	sp
	call	_GetKeyMatrixLine
	inc	sp
	ld	a,l
;carwar.c:327: if((keyLine & KEY_SPACE) == 0
	and	a,#0x01
	jr	Z,00101$
;carwar.c:328: || Joytrig(1) != 0
	ld	a,#0x01
	push	af
	inc	sp
	call	_Joytrig
	inc	sp
	xor	a,a
	or	a,l
	jr	NZ,00101$
;carwar.c:329: || Joytrig(2) != 0) 
	ld	a,#0x02
	push	af
	inc	sp
	call	_Joytrig
	inc	sp
	xor	a,a
	or	a,l
	jr	Z,00102$
00101$:
;carwar.c:330: game.state = StateStartGame;
	ld	hl,#0x0003 + _game
	ld	(hl),#<(_StateStartGame)
	inc	hl
	ld	(hl),#>(_StateStartGame)
00102$:
;carwar.c:332: waitRetrace();
	call	_waitRetrace
	ret
_StateMainMenu_end::
;carwar.c:335: void StateStartGame()
;	---------------------------------
; Function StateStartGame
; ---------------------------------
_StateStartGame_start::
_StateStartGame:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-9
	add	hl,sp
	ld	sp,hl
;carwar.c:339: game.page = 0;
	ld	hl,#_game
	ld	(hl),#0x00
;carwar.c:340: SetPage8(game.page);
	ld	a, (hl)
	push	af
	inc	sp
	call	_SetPage8
	inc	sp
;carwar.c:344: StateBuildTrack();
	call	_StateBuildTrack
;carwar.c:345: StateShadeTrack();
	call	_StateShadeTrack
;carwar.c:346: VRAMtoVRAM(0, 0, 0, 256, 256, 212);
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
;carwar.c:350: PrintSprite(64, 64, "INIT\nCARS", (u16)&defaultColor);
	ld	c,#<(_defaultColor)
	ld	b,#>(_defaultColor)
	push	bc
	ld	hl,#__str_1
	push	hl
	ld	hl,#0x4040
	push	hl
	call	_PrintSprite
	pop	af
	pop	af
	pop	af
;carwar.c:351: for(i=0; i<16; i++)
	ld	-1 (ix),#0x00
	ld	de,#0x0000
	ld	-3 (ix),#0x00
	ld	-2 (ix),#0x00
00101$:
	ld	a,-1 (ix)
	sub	a,#0x10
	jp	NC,00104$
;carwar.c:353: RAMtoVRAM(i * 13, 256 + 212 + 0,  13, 11, (u16)&car1[13 * 11 * i]);
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
;carwar.c:354: RAMtoVRAM(i * 13, 256 + 212 + 11, 13, 11, (u16)&car2[13 * 11 * i]);
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
;carwar.c:355: RAMtoVRAM(i * 13, 256 + 212 + 22, 13, 11, (u16)&car3[13 * 11 * i]);
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
;carwar.c:356: RAMtoVRAM(i * 13, 256 + 212 + 33, 13, 11, (u16)&car4[13 * 11 * i]);
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
;carwar.c:351: for(i=0; i<16; i++)
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
;carwar.c:361: PrintSprite(64, 64, "INIT\nTRACK\nBACKUP", (u16)&defaultColor);
	ld	c,#<(_defaultColor)
	ld	b,#>(_defaultColor)
	push	bc
	ld	hl,#__str_2
	push	hl
	ld	hl,#0x4040
	push	hl
	call	_PrintSprite
	pop	af
	pop	af
	pop	af
;carwar.c:362: for(i=0; i<CAR_NUM; i++)
	ld	-1 (ix),#0x00
	ld	b,#0x00
	ld	-5 (ix),#0x00
	ld	-4 (ix),#0x00
00105$:
	ld	a,-1 (ix)
	sub	a,#0x04
	jp	NC,00108$
;carwar.c:364: InitializePlayer(&players[i], i, 50 + 50 * i, 100);
	ld	a,b
	add	a,#0x32
	ld	-3 (ix),a
	ld	a,-1 (ix)
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	ld	c, a
	add	a,#<(_players)
	ld	e,a
	ld	a,#>(_players)
	adc	a,#0x00
	ld	d,a
	push	bc
	ld	a,#0x64
	push	af
	inc	sp
	ld	h,-3 (ix)
	ld	l,-1 (ix)
	push	hl
	push	de
	call	_InitializePlayer
	pop	af
	pop	af
	inc	sp
	pop	bc
;carwar.c:365: VRAMtoVRAM(ScrPosX(players[i].posX), (256 * 0) + ScrPosY(players[i].posY), (13 * i) + (52 * 0), 212, 13, 11);
	ld	a,#<(_players)
	add	a,c
	ld	e,a
	ld	a,#>(_players)
	adc	a,#0x00
	ld	d,a
	inc	de
	ld	l,e
	ld	h,d
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	h, #0x00
	add	a,#0xFB
	ld	-7 (ix),a
	ld	a,h
	adc	a,#0xFF
	ld	-6 (ix),a
	ld	a,#<(_players)
	add	a,c
	ld	l, a
	ld	a, #>(_players)
	adc	a, #0x00
	ld	h, a
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
;carwar.c:366: VRAMtoVRAM(ScrPosX(players[i].posX), (256 * 1) + ScrPosY(players[i].posY), (13 * i) + (52 * 1), 212, 13, 11);
	ld	a,-5 (ix)
	add	a,#0x34
	ld	-7 (ix),a
	ld	a,-4 (ix)
	adc	a,#0x00
	ld	-6 (ix),a
	ld	a,#<(_players)
	add	a,c
	ld	e,a
	ld	a,#>(_players)
	adc	a,#0x00
	ld	d,a
	inc	de
	ld	l,e
	ld	h,d
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	h, #0x00
	add	a,#0xFB
	ld	-9 (ix),a
	ld	a,h
	adc	a,#0x00
	ld	-8 (ix),a
	ld	a,#<(_players)
	add	a,c
	ld	l, a
	ld	a, #>(_players)
	adc	a, #0x00
	ld	h, a
	inc	hl
	ld	a, (hl)
	ld	h, #0x00
	add	a,#0xFA
	ld	e,a
	ld	a,h
	adc	a,#0xFF
	ld	d,a
	ld	hl,#0x000B
	push	hl
	ld	l, #0x0D
	push	hl
	ld	l, #0xD4
	push	hl
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	push	hl
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	push	de
	call	_VRAMtoVRAM
	ld	hl,#0x000C
	add	hl,sp
	ld	sp,hl
;carwar.c:362: for(i=0; i<CAR_NUM; i++)
	ld	b,-3 (ix)
	ld	a,-5 (ix)
	add	a,#0x0D
	ld	-5 (ix),a
	ld	a,-4 (ix)
	adc	a,#0x00
	ld	-4 (ix),a
	inc	-1 (ix)
	jp	00105$
00108$:
;carwar.c:369: ClearSprite();
	call	_ClearSprite
;carwar.c:371: game.state = StateUpdateGame;
	ld	hl,#0x0003 + _game
	ld	(hl),#<(_StateUpdateGame)
	inc	hl
	ld	(hl),#>(_StateUpdateGame)
	ld	sp,ix
	pop	ix
	ret
_StateStartGame_end::
__str_1:
	.ascii "INIT"
	.db 0x0A
	.ascii "CARS"
	.db 0x00
__str_2:
	.ascii "INIT"
	.db 0x0A
	.ascii "TRACK"
	.db 0x0A
	.ascii "BACKUP"
	.db 0x00
;carwar.c:374: void StateUpdateGame()
;	---------------------------------
; Function StateUpdateGame
; ---------------------------------
_StateUpdateGame_start::
_StateUpdateGame:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-10
	add	hl,sp
	ld	sp,hl
;carwar.c:380: SetPage8(game.page);
	ld	a,(#_game)
	push	af
	inc	sp
	call	_SetPage8
	inc	sp
;carwar.c:381: game.page = 1 - game.page;
	ld	hl,#_game
	ld	l,(hl)
	ld	a,#0x01
	sub	a,l
	ld	hl,#_game
	ld	(hl),a
;carwar.c:382: game.yOffset = 256 * game.page;
	ld	b, (hl)
	ld	c,#0x00
	ld	hl,#0x0001 + _game
	ld	(hl),c
	inc	hl
	ld	(hl),b
;carwar.c:384: for(i=0; i<CAR_NUM; i++)
	ld	c,#0x00
00146$:
;carwar.c:385: players[i].flag = 0;
	ld	a,c
	cp	a,#0x04
	jr	NC,00149$
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	add	a,#<(_players)
	ld	e,a
	ld	a,#>(_players)
	adc	a,#0x00
	ld	d,a
	ld	hl,#0x000D
	add	hl,de
	ld	e,l
	ld	d,h
	ld	a,#0x00
	ld	(de),a
;carwar.c:384: for(i=0; i<CAR_NUM; i++)
	inc	c
	jr	00146$
00149$:
;carwar.c:389: curPly = &players[0];
	ld	-3 (ix),#<(_players)
	ld	-2 (ix),#>(_players)
;carwar.c:390: keyLine = GetKeyMatrixLine(8);
	ld	a,#0x08
	push	af
	inc	sp
	call	_GetKeyMatrixLine
	inc	sp
	ld	c,l
;carwar.c:391: if((keyLine & KEY_LEFT) == 0)
	ld	a,c
	and	a,#0x10
	jr	NZ,00102$
;carwar.c:392: curPly->flag |= CAR_TURN_LEFT;
	ld	a,-3 (ix)
	add	a,#0x0D
	ld	e,a
	ld	a,-2 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	or	a,#0x02
	ld	(de),a
00102$:
;carwar.c:393: if((keyLine & KEY_RIGHT) == 0)
	ld	a,c
	and	a,#0x80
	jr	NZ,00104$
;carwar.c:394: curPly->flag |= CAR_TURN_RIGHT;
	ld	a,-3 (ix)
	add	a,#0x0D
	ld	e,a
	ld	a,-2 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	or	a,#0x01
	ld	(de),a
00104$:
;carwar.c:395: if((keyLine & KEY_UP) == 0)
	ld	a,c
	and	a,#0x20
	jr	NZ,00106$
;carwar.c:396: curPly->flag |= CAR_MOVE;
	ld	a,-3 (ix)
	add	a,#0x0D
	ld	e,a
	ld	a,-2 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	or	a,#0x04
	ld	(de),a
00106$:
;carwar.c:400: curPly = &players[1];
	ld	hl,#_players + 16
	ld	-3 (ix),l
	ld	-2 (ix),h
;carwar.c:401: keyLine = GetKeyMatrixLine(5);
	ld	a,#0x05
	push	af
	inc	sp
	call	_GetKeyMatrixLine
	inc	sp
;carwar.c:402: if((keyLine & KEY_Z) == 0)
	ld	a, l
	and	a,#0x80
	jr	NZ,00108$
;carwar.c:403: curPly->flag |= CAR_TURN_LEFT;
	ld	a,-3 (ix)
	add	a,#0x0D
	ld	e,a
	ld	a,-2 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	or	a,#0x02
	ld	(de),a
00108$:
;carwar.c:404: keyLine = GetKeyMatrixLine(3);
	ld	a,#0x03
	push	af
	inc	sp
	call	_GetKeyMatrixLine
	inc	sp
;carwar.c:405: if((keyLine & KEY_C) == 0)
	ld	a, l
	and	a,#0x01
	jr	NZ,00110$
;carwar.c:406: curPly->flag |= CAR_TURN_RIGHT;
	ld	a,-3 (ix)
	add	a,#0x0D
	ld	e,a
	ld	a,-2 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	or	a,#0x01
	ld	(de),a
00110$:
;carwar.c:407: keyLine = GetKeyMatrixLine(5);
	ld	a,#0x05
	push	af
	inc	sp
	call	_GetKeyMatrixLine
	inc	sp
;carwar.c:408: if((keyLine & KEY_X) == 0)
	ld	a, l
	and	a,#0x20
	jr	NZ,00112$
;carwar.c:409: curPly->flag |= CAR_MOVE;
	ld	a,-3 (ix)
	add	a,#0x0D
	ld	e,a
	ld	a,-2 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	or	a,#0x04
	ld	(de),a
00112$:
;carwar.c:413: curPly = &players[2];
	ld	hl,#_players + 32
	ld	-3 (ix),l
	ld	-2 (ix),h
;carwar.c:414: switch (Joystick(1)) // Joy 1 direction
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
	ld	e,a
	push	de
	ld	d,#0x00
	ld	hl,#00216$
	add	hl,de
	add	hl,de
;carwar.c:416: case 2: // up-right
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
;carwar.c:417: case 3: // right
00114$:
;carwar.c:418: case 4: // down-right
00115$:
;carwar.c:419: curPly->flag |= CAR_TURN_RIGHT;
	ld	a,-3 (ix)
	add	a,#0x0D
	ld	e,a
	ld	a,-2 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	or	a,#0x01
	ld	(de),a
;carwar.c:420: break;
	jr	00119$
;carwar.c:421: case 6: // down-left
00116$:
;carwar.c:422: case 7: // left
00117$:
;carwar.c:423: case 8:// up-left
00118$:
;carwar.c:424: curPly->flag |= CAR_TURN_LEFT;
	ld	a,-3 (ix)
	add	a,#0x0D
	ld	e,a
	ld	a,-2 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	or	a,#0x02
	ld	(de),a
;carwar.c:426: }
00119$:
;carwar.c:427: if(Joytrig(1) != 0) // Joy 1 Button A
	ld	a,#0x01
	push	af
	inc	sp
	call	_Joytrig
	inc	sp
	xor	a,a
	or	a,l
	jr	Z,00121$
;carwar.c:428: curPly->flag |= CAR_MOVE;
	ld	a,-3 (ix)
	add	a,#0x0D
	ld	e,a
	ld	a,-2 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	or	a,#0x04
	ld	(de),a
00121$:
;carwar.c:432: curPly = &players[3];
	ld	hl,#_players + 48
	ld	-3 (ix),l
	ld	-2 (ix),h
;carwar.c:433: switch (Joystick(2)) // Joy 2 direction
	ld	a,#0x02
	push	af
	inc	sp
	call	_Joystick
	inc	sp
	ld	a,l
	sub	a,#0x02
	jp	PO,00217$
	xor	a,#0x80
00217$:
	jp	M,00128$
	ld	a,#0x08
	sub	a,l
	jp	PO,00218$
	xor	a,#0x80
00218$:
	jp	M,00128$
	ld	a,l
	add	a,#0xFE
	ld	e,a
	push	de
	ld	d,#0x00
	ld	hl,#00219$
	add	hl,de
	add	hl,de
;carwar.c:435: case 2: // up-right
	pop	de
	jp	(hl)
00219$:
	jr	00122$
	jr	00123$
	jr	00124$
	jr	00128$
	jr	00125$
	jr	00126$
	jr	00127$
00122$:
;carwar.c:436: case 3: // right
00123$:
;carwar.c:437: case 4: // down-right
00124$:
;carwar.c:438: curPly->flag |= CAR_TURN_RIGHT;
	ld	a,-3 (ix)
	add	a,#0x0D
	ld	e,a
	ld	a,-2 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	or	a,#0x01
	ld	(de),a
;carwar.c:439: break;
	jr	00128$
;carwar.c:440: case 6: // down-left
00125$:
;carwar.c:441: case 7: // left
00126$:
;carwar.c:442: case 8:// up-left
00127$:
;carwar.c:443: curPly->flag |= CAR_TURN_LEFT;
	ld	a,-3 (ix)
	add	a,#0x0D
	ld	e,a
	ld	a,-2 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	or	a,#0x02
	ld	(de),a
;carwar.c:445: }
00128$:
;carwar.c:446: if(Joytrig(2) != 0) // Joy 2 Button A
	ld	a,#0x02
	push	af
	inc	sp
	call	_Joytrig
	inc	sp
	xor	a,a
	or	a,l
	jr	Z,00183$
;carwar.c:447: curPly->flag |= CAR_MOVE;
	ld	a,-3 (ix)
	add	a,#0x0D
	ld	e,a
	ld	a,-2 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	or	a,#0x04
	ld	(de),a
;carwar.c:451: for(i=0; i<CAR_NUM; i++)
00183$:
	ld	-1 (ix),#0x00
	ld	-5 (ix),#0x00
	ld	-4 (ix),#0x00
00150$:
	ld	a,-1 (ix)
	sub	a,#0x04
	jp	NC,00153$
;carwar.c:453: VRAMtoVRAM((13 * i) + (52 * game.page), 212, ScrPosX(players[i].prevX), game.yOffset + ScrPosY(players[i].prevY), 13, 11);
	ld	hl,#0x0001 + _game
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,-1 (ix)
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	ld	-8 (ix),a
	add	a,#<(_players)
	ld	e,a
	ld	a,#>(_players)
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
	ld	a,#<(_players)
	add	a,-8 (ix)
	ld	l, a
	ld	a, #>(_players)
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
	ld	-10 (ix),a
	ld	a,h
	adc	a,#0xFF
	ld	-9 (ix),a
	ld	hl,#_game
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
	ld	a,-5 (ix)
	add	a,e
	ld	e,a
	ld	a,-4 (ix)
	adc	a,d
	ld	d,a
	ld	hl,#0x000B
	push	hl
	ld	l, #0x0D
	push	hl
	push	bc
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	push	hl
	ld	hl,#0x00D4
	push	hl
	push	de
	call	_VRAMtoVRAM
	ld	hl,#0x000C
	add	hl,sp
	ld	sp,hl
;carwar.c:451: for(i=0; i<CAR_NUM; i++)
	ld	a,-5 (ix)
	add	a,#0x0D
	ld	-5 (ix),a
	ld	a,-4 (ix)
	adc	a,#0x00
	ld	-4 (ix),a
	inc	-1 (ix)
	jp	00150$
00153$:
;carwar.c:458: for(i=0; i<CAR_NUM; i++)
	ld	-1 (ix),#0x00
00154$:
	ld	a,-1 (ix)
	sub	a,#0x04
	jp	NC,00157$
;carwar.c:460: curPly = &players[i];
	ld	a,-1 (ix)
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	add	a,#<(_players)
	ld	e,a
	ld	a,#>(_players)
	adc	a,#0x00
	ld	-3 (ix), e
	ld	-2 (ix), a
;carwar.c:462: if(curPly->flag & CAR_TURN_LEFT)
	ld	a,-3 (ix)
	add	a,#0x0D
	ld	e,a
	ld	a,-2 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	and	a,#0x02
	jr	Z,00132$
;carwar.c:464: curPly->rot += cars[curPly->car].rotSpeed; 
	ld	a,-3 (ix)
	add	a,#0x0E
	ld	e,a
	ld	a,-2 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	ld	-10 (ix),a
	ld	a,-3 (ix)
	add	a,#0x0C
	ld	c,a
	ld	a,-2 (ix)
	adc	a,#0x00
	ld	b,a
	ld	a,(bc)
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
	ld	a,(bc)
	ld	l,a
	ld	a,-10 (ix)
	add	a,l
	ld	(de),a
00132$:
;carwar.c:466: if(curPly->flag & CAR_TURN_RIGHT)
	ld	a,-3 (ix)
	add	a,#0x0D
	ld	c,a
	ld	a,-2 (ix)
	adc	a,#0x00
	ld	b,a
	ld	a,(bc)
	ld	-8 (ix), a
	and	a,#0x01
	jr	Z,00134$
;carwar.c:468: curPly->rot -= cars[curPly->car].rotSpeed; 
	ld	a,-3 (ix)
	add	a,#0x0E
	ld	e,a
	ld	a,-2 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	ld	-10 (ix),a
	ld	a,-3 (ix)
	add	a,#0x0C
	ld	c,a
	ld	a,-2 (ix)
	adc	a,#0x00
	ld	b,a
	ld	a,(bc)
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
	ld	a,(bc)
	ld	l,a
	ld	a,-10 (ix)
	sub	a,l
	ld	(de),a
00134$:
;carwar.c:470: if(curPly->flag & CAR_MOVE)
	ld	a,-8 (ix)
	and	a,#0x04
	jr	Z,00136$
;carwar.c:472: angle = curPly->rot / 4;
	ld	a,-3 (ix)
	add	a,#0x0E
	ld	c,a
	ld	a,-2 (ix)
	adc	a,#0x00
	ld	b,a
	ld	a,(bc)
	ld	c,a
	srl	c
	srl	c
;carwar.c:473: curPly->dX = g_Cosinus[angle];
	ld	a,-3 (ix)
	add	a,#0x08
	ld	-10 (ix),a
	ld	a,-2 (ix)
	adc	a,#0x00
	ld	-9 (ix),a
	sla	c
	ld	a,#<(_g_Cosinus)
	add	a,c
	ld	l, a
	ld	a, #>(_g_Cosinus)
	adc	a, #0x00
	ld	h, a
	ld	b,(hl)
	inc	hl
	ld	e,(hl)
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),b
	inc	hl
	ld	(hl),e
;carwar.c:474: curPly->dY = g_Sinus[angle];
	ld	a,-3 (ix)
	add	a,#0x0A
	ld	e,a
	ld	a,-2 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,#<(_g_Sinus)
	add	a,c
	ld	l, a
	ld	a, #>(_g_Sinus)
	adc	a, #0x00
	ld	h, a
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ex	de,hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
;carwar.c:475: curPly->speed += 2;
	ld	a,-3 (ix)
	add	a,#0x0F
	ld	c,a
	ld	a,-2 (ix)
	adc	a,#0x00
	ld	b,a
	ld	a,(bc)
	add	a,#0x02
	ld	(bc),a
00136$:
;carwar.c:478: if(curPly->speed > 0)
	ld	a,-3 (ix)
	add	a,#0x0F
	ld	c,a
	ld	a,-2 (ix)
	adc	a,#0x00
	ld	b,a
	ld	a,(bc)
;carwar.c:479: curPly->speed--;
	or	a,a
	jr	Z,00138$
	dec	a
	ld	(bc),a
00138$:
;carwar.c:480: if(curPly->speed > cars[curPly->car].maxSpeed)
	ld	a,(bc)
	ld	-10 (ix),a
	ld	a,-3 (ix)
	add	a,#0x0C
	ld	e,a
	ld	a,-2 (ix)
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
	ld	a,(de)
	ld	e,a
	sub	a,-10 (ix)
	jr	NC,00140$
;carwar.c:481: curPly->speed = cars[curPly->car].maxSpeed;
	ld	a,e
	ld	(bc),a
00140$:
;carwar.c:483: curPly->prevX = curPly->posX;
	ld	a,-3 (ix)
	add	a,#0x04
	ld	e,a
	ld	a,-2 (ix)
	adc	a,#0x00
	ld	d,a
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	a,(hl)
	ld	-7 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-6 (ix),a
	ex	de,hl
	ld	a,-7 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-6 (ix)
	ld	(hl),a
;carwar.c:484: curPly->prevY = curPly->posY;
	ld	a,-3 (ix)
	add	a,#0x06
	ld	-10 (ix),a
	ld	a,-2 (ix)
	adc	a,#0x00
	ld	-9 (ix),a
	ld	a,-3 (ix)
	add	a,#0x02
	ld	-5 (ix),a
	ld	a,-2 (ix)
	adc	a,#0x00
	ld	-4 (ix),a
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:485: curPly->posX += (curPly->speed * curPly->dX) / 8;
	ld	a,(bc)
	ld	-10 (ix),a
	ld	a,-3 (ix)
	add	a,#0x08
	ld	l, a
	ld	a, -2 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	ld	a,-10 (ix)
	ld	-10 (ix),a
	ld	-9 (ix),#0x00
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
	ld	hl,#0x0008
	push	hl
	push	bc
	call	__divsint_rrx_s
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	pop	de
	ld	a,-7 (ix)
	add	a,c
	ld	c,a
	ld	a,-6 (ix)
	adc	a,b
	ld	b,a
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
;carwar.c:486: curPly->posY -= (curPly->speed * curPly->dY) / 8;
	ld	a,-3 (ix)
	add	a,#0x0A
	ld	l, a
	ld	a, -2 (ix)
	adc	a, #0x00
	ld	h, a
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
	sub	a,c
	ld	e,a
	ld	a,d
	sbc	a,b
	ld	d,a
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:458: for(i=0; i<CAR_NUM; i++)
	inc	-1 (ix)
	jp	00154$
00157$:
;carwar.c:490: CheckCollision(0, 1);
	ld	hl,#0x0100
	push	hl
	call	_CheckCollision
;carwar.c:491: CheckCollision(0, 2);
	ld	hl,#0x0200
	ex	(sp),hl
	call	_CheckCollision
;carwar.c:492: CheckCollision(0, 3);
	ld	hl,#0x0300
	ex	(sp),hl
	call	_CheckCollision
;carwar.c:493: CheckCollision(1, 2);
	ld	hl,#0x0201
	ex	(sp),hl
	call	_CheckCollision
;carwar.c:494: CheckCollision(1, 3);
	ld	hl,#0x0301
	ex	(sp),hl
	call	_CheckCollision
;carwar.c:495: CheckCollision(2, 3);
	ld	hl,#0x0302
	ex	(sp),hl
	call	_CheckCollision
	pop	af
;carwar.c:498: for(i=0; i<CAR_NUM; i++)
	ld	-1 (ix),#0x00
	ld	de,#0x0000
00158$:
	ld	a,-1 (ix)
	sub	a,#0x04
	jp	NC,00161$
;carwar.c:500: curPly = &players[i];
	ld	a,-1 (ix)
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	add	a,#<(_players)
	ld	c,a
	ld	a,#>(_players)
	adc	a,#0x00
	ld	-3 (ix), c
	ld	-2 (ix), a
;carwar.c:501: if(curPly->posY < (5 << 8))
	ld	c,-3 (ix)
	ld	b,-2 (ix)
	inc	bc
	inc	bc
	ld	l,c
	ld	h,b
	inc	hl
	ld	a, (hl)
	sub	a,#0x05
	jr	NC,00144$
;carwar.c:502: curPly->posY = (5 << 8);
	ld	l,c
	ld	h,b
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x05
	jr	00145$
00144$:
;carwar.c:503: else if(curPly->posY > (206 << 8))
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
	jr	NC,00145$
;carwar.c:504: curPly->posY = (206 << 8);
	ld	l,c
	ld	h,b
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0xCE
00145$:
;carwar.c:507: VRAMtoVRAM(ScrPosX(curPly->posX), game.yOffset + ScrPosY(curPly->posY), (13 * i) + (52 * game.page), 212, 13, 11);
	ld	hl,#_game
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
	ld	-10 (ix),a
	ld	a,d
	adc	a,b
	ld	-9 (ix),a
	ld	hl,#0x0001 + _game
	ld	a,(hl)
	ld	-7 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-6 (ix),a
	ld	l, -3 (ix)
	ld	h, -2 (ix)
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
	ld	a,-7 (ix)
	add	a,l
	ld	-7 (ix),a
	ld	a,-6 (ix)
	adc	a,h
	ld	-6 (ix),a
	ld	l,-3 (ix)
	ld	h,-2 (ix)
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
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	push	hl
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	push	hl
	push	bc
	call	_VRAMtoVRAM
	ld	hl,#0x000C
	add	hl,sp
	ld	sp,hl
	pop	de
;carwar.c:498: for(i=0; i<CAR_NUM; i++)
	ld	hl,#0x000D
	add	hl,de
	ld	e,l
	ld	d,h
	inc	-1 (ix)
	jp	00158$
00161$:
;carwar.c:512: for(i=0; i<CAR_NUM; i++)
	ld	-1 (ix),#0x00
	ld	-7 (ix),#0x00
	ld	-6 (ix),#0x00
00162$:
	ld	a,-1 (ix)
	sub	a,#0x04
	jp	NC,00165$
;carwar.c:514: VRAMtoVRAMTrans(13 * (players[i].rot / 16), 256 + 212 + (11 * i), ScrPosX(players[i].posX), game.yOffset + ScrPosY(players[i].posY), 13, 11);
	ld	hl,#0x0001 + _game
	ld	a,(hl)
	ld	-10 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-9 (ix),a
	ld	a,-1 (ix)
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	ld	c, a
	add	a,#<(_players)
	ld	b,a
	ld	a,#>(_players)
	adc	a,#0x00
	ld	e,a
	ld	a,b
	add	a,#0x02
	ld	b,a
	ld	a,e
	adc	a,#0x00
	ld	h, a
	ld	l, b
	inc	hl
	ld	a, (hl)
	ld	h, #0x00
	add	a,#0xFB
	ld	l,a
	ld	a,h
	adc	a,#0xFF
	ld	h,a
	ld	a,-10 (ix)
	add	a,l
	ld	-10 (ix),a
	ld	a,-9 (ix)
	adc	a,h
	ld	-9 (ix),a
	ld	a,#<(_players)
	add	a,c
	ld	l, a
	ld	a, #>(_players)
	adc	a, #0x00
	ld	h, a
	inc	hl
	ld	a, (hl)
	ld	h, #0x00
	add	a,#0xFA
	ld	-5 (ix),a
	ld	a,h
	adc	a,#0xFF
	ld	-4 (ix),a
	ld	a,-7 (ix)
	add	a,#0xD4
	ld	b,a
	ld	a,-6 (ix)
	adc	a,#0x01
	ld	e,a
	ld	a,#<(_players)
	add	a,c
	ld	c,a
	ld	a,#>(_players)
	adc	a,#0x00
	ld	d,a
	ld	a,c
	add	a,#0x0E
	ld	c,a
	ld	a,d
	adc	a,#0x00
	ld	d, a
	ld	l, c
	ld	h, a
	ld	a,(hl)
	srl	a
	srl	a
	srl	a
	srl	a
	ld	l,a
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
	pop	de
	ld	c,l
	ld	d,h
	ld	hl,#0x000B
	push	hl
	ld	l, #0x0D
	push	hl
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	push	hl
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	push	hl
	ld	l,b
	ld	h,e
	push	hl
	ld	e,c
	push	de
	call	_VRAMtoVRAMTrans
	ld	hl,#0x000C
	add	hl,sp
	ld	sp,hl
;carwar.c:512: for(i=0; i<CAR_NUM; i++)
	ld	a,-7 (ix)
	add	a,#0x0B
	ld	-7 (ix),a
	ld	a,-6 (ix)
	adc	a,#0x00
	ld	-6 (ix),a
	inc	-1 (ix)
	jp	00162$
00165$:
;carwar.c:517: waitRetrace();
	call	_waitRetrace
	ld	sp,ix
	pop	ix
	ret
_StateUpdateGame_end::
;carwar.c:521: void InitializePlayer(Player* ply, u8 car, u8 posX, u8 posY)
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
;carwar.c:523: ply->car = car; // car index
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	hl,#0x000C
	add	hl,bc
	ex	de,hl
	ld	a,6 (ix)
	ld	(de),a
;carwar.c:524: ply->posX = 128 + posX << 7; // position X
	ld	a, 7 (ix)
	ld	h, #0x00
	add	a,#0x80
	ld	e,a
	ld	a,h
	adc	a,#0x00
	ld	d,a
	sla	e
	rl	d
	sla	e
	rl	d
	sla	e
	rl	d
	sla	e
	rl	d
	sla	e
	rl	d
	sla	e
	rl	d
	sla	e
	rl	d
	ld	l,c
	ld	h,b
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:525: ply->posY = 128 + posY << 7; // position Y
	ld	hl,#0x0002
	add	hl,bc
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	a, 8 (ix)
	ld	h, #0x00
	add	a,#0x80
	ld	e,a
	ld	a,h
	adc	a,#0x00
	ld	d,a
	sla	e
	rl	d
	sla	e
	rl	d
	sla	e
	rl	d
	sla	e
	rl	d
	sla	e
	rl	d
	sla	e
	rl	d
	sla	e
	rl	d
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:526: ply->prevX = ply->posX; // previous position X
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
;carwar.c:527: ply->prevY = ply->posY; // previous position Y
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
;carwar.c:528: ply->rot = 0; // rotation
	ld	hl,#0x000E
	add	hl,bc
	ex	de,hl
	ld	a,#0x00
	ld	(de),a
;carwar.c:529: ply->dX = 0; // velocity X
	ld	hl,#0x0008
	add	hl,bc
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;carwar.c:530: ply->dY = 0; // velocity Y
	ld	hl,#0x000A
	add	hl,bc
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;carwar.c:531: ply->speed = 0;
	ld	hl,#0x000F
	add	hl,bc
	ld	(hl),#0x00
	ld	sp,ix
	pop	ix
	ret
_InitializePlayer_end::
;carwar.c:535: void CheckCollision(u8 car1, u8 car2)
;	---------------------------------
; Function CheckCollision
; ---------------------------------
_CheckCollision_start::
_CheckCollision:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-6
	add	hl,sp
	ld	sp,hl
;carwar.c:538: dist = players[car1].posX - players[car2].posX;
	ld	a,4 (ix)
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	ld	-6 (ix),a
	add	a,#<(_players)
	ld	e,a
	ld	a,#>(_players)
	adc	a,#0x00
	ld	h, a
	ld	l, e
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,5 (ix)
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	ld	-5 (ix),a
	add	a,#<(_players)
	ld	l, a
	ld	a, #>(_players)
	adc	a, #0x00
	ld	h, a
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	ld	a,c
	sub	a,l
	ld	l,a
	ld	a,b
	sbc	a,h
	ld	-2 (ix), l
;carwar.c:539: x = dist >> 8;
	ld	-1 (ix), a
	ld	e,a
	rlc	a
	sbc	a,a
	ld	d,a
;carwar.c:540: dist = players[car1].posY - players[car2].posY;
	ld	a,#<(_players)
	add	a,-6 (ix)
	ld	l, a
	ld	a, #>(_players)
	adc	a, #0x00
	ld	h, a
	inc	hl
	inc	hl
	ld	a,(hl)
	ld	-4 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-3 (ix),a
	ld	a,#<(_players)
	add	a,-5 (ix)
	ld	l, a
	ld	a, #>(_players)
	adc	a, #0x00
	ld	h, a
	inc	hl
	inc	hl
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	ld	a,-4 (ix)
	sub	a,l
	ld	l,a
	ld	a,-3 (ix)
	sbc	a,h
	ld	-2 (ix), l
;carwar.c:541: y = dist >> 8;
	ld	-1 (ix), a
	ld	c,a
	rlc	a
	sbc	a,a
	ld	b,a
;carwar.c:542: dist = (x * x) + (y * y);
	push	bc
	push	de
	push	de
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
	ld	-2 (ix), c
	ld	-1 (ix), a
;carwar.c:553: if(dist < 11 * 11) // Collision occured
	ld	a,-2 (ix)
	sub	a,#0x79
	ld	a,-1 (ix)
	sbc	a,#0x00
	jp	PO,00106$
	xor	a,#0x80
00106$:
	jp	P,00103$
;carwar.c:555: dist = players[car1].speed;
	ld	a,#<(_players)
	add	a,-6 (ix)
	ld	c,a
	ld	a,#>(_players)
	adc	a,#0x00
	ld	b,a
	ld	hl,#0x000F
	add	hl,bc
	ld	a,(hl)
	ld	-2 (ix), a
	ld	-1 (ix),#0x00
;carwar.c:556: players[car1].speed = players[car2].speed;
	ld	a,#<(_players)
	add	a,-6 (ix)
	ld	c,a
	ld	a,#>(_players)
	adc	a,#0x00
	ld	b,a
	ld	hl,#0x000F
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,#<(_players)
	add	a,-5 (ix)
	ld	e,a
	ld	a,#>(_players)
	adc	a,#0x00
	ld	d,a
	ld	hl,#0x000F
	add	hl,de
	ld	a,(hl)
	ld	(bc),a
;carwar.c:557: players[car1].posX = players[car1].prevX;
	ld	a,#<(_players)
	add	a,-6 (ix)
	ld	c,a
	ld	a,#>(_players)
	adc	a,#0x00
	ld	b,a
	ld	a,#<(_players)
	add	a,-6 (ix)
	ld	l, a
	ld	a, #>(_players)
	adc	a, #0x00
	ld	h, a
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,c
	ld	h,b
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:558: players[car2].speed = dist;
	ld	a,#<(_players)
	add	a,-5 (ix)
	ld	c,a
	ld	a,#>(_players)
	adc	a,#0x00
	ld	b,a
	ld	hl,#0x000F
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,-2 (ix)
	ld	(bc),a
;carwar.c:559: players[car2].posY = players[car2].prevY;
	ld	a,#<(_players)
	add	a,-5 (ix)
	ld	c,a
	ld	a,#>(_players)
	adc	a,#0x00
	ld	b,a
	inc	bc
	inc	bc
	ld	a,#<(_players)
	add	a,-5 (ix)
	ld	e,a
	ld	a,#>(_players)
	adc	a,#0x00
	ld	d,a
	ld	hl,#0x0006
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,c
	ld	h,b
	ld	(hl),e
	inc	hl
	ld	(hl),d
00103$:
	ld	sp,ix
	pop	ix
	ret
_CheckCollision_end::
;carwar.c:564: void StateBuildTrack()
;	---------------------------------
; Function StateBuildTrack
; ---------------------------------
_StateBuildTrack_start::
_StateBuildTrack:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-22
	add	hl,sp
	ld	sp,hl
;carwar.c:570: PrintSprite(64, 64, "BUILD\nTRACK", (u16)&defaultColor);
	ld	c,#<(_defaultColor)
	ld	b,#>(_defaultColor)
	push	bc
	ld	hl,#__str_3
	push	hl
	ld	hl,#0x4040
	push	hl
	call	_PrintSprite
	pop	af
	pop	af
;carwar.c:583: FillVRAM(0, 0, 256, 212, COLOR_GREEN);
	ld	h,#0xE0
	ex	(sp),hl
	inc	sp
	ld	hl,#0x00D4
	push	hl
	ld	hl,#0x0100
	push	hl
	ld	h, #0x00
	push	hl
	ld	l, #0x00
	push	hl
	call	_FillVRAM
	ld	hl,#0x0009
	add	hl,sp
	ld	sp,hl
;carwar.c:584: for(i=0; i<7; i++)
	ld	-1 (ix),#0x00
00134$:
	ld	a,-1 (ix)
	sub	a,#0x07
	jp	NC,00137$
;carwar.c:586: for(j=0; j<6; j++)
	ld	-2 (ix),#0x00
	ld	-12 (ix),#0x00
00130$:
	ld	a,-2 (ix)
	sub	a,#0x06
	jp	NC,00136$
;carwar.c:588: block = &track01[i + j * 7];
	ld	a,-1 (ix)
	add	a,-12 (ix)
	ld	e,a
	add	a,a
	add	a,e
	add	a,#<(_track01)
	ld	c,a
	ld	a,#>(_track01)
	adc	a,#0x00
	ld	-9 (ix), c
	ld	-8 (ix), a
;carwar.c:589: if((block->tile & 0x0F) == 2) // Plein block
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	a,(hl)
	and	a,#0x0F
	sub	a,#0x02
	jr	NZ,00152$
;carwar.c:591: FillVRAM(16 + (32 * i), 8 + (32 * j), 32, 32, block->color1);
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
	ld	-11 (ix),a
	ld	a,h
	adc	a,#0x00
	ld	-10 (ix),a
	ld	l,-1 (ix)
	ld	h,#0x00
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
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	push	hl
	push	bc
	call	_FillVRAM
	ld	hl,#0x0009
	add	hl,sp
	ld	sp,hl
	jp	00132$
;carwar.c:595: for(x=0; x<32; x++)
00152$:
	ld	a,-9 (ix)
	add	a,#0x01
	ld	-22 (ix),a
	ld	a,-8 (ix)
	adc	a,#0x00
	ld	-21 (ix),a
	ld	a,-9 (ix)
	add	a,#0x02
	ld	-11 (ix),a
	ld	a,-8 (ix)
	adc	a,#0x00
	ld	-10 (ix),a
	ld	-5 (ix),#0x00
	ld	-4 (ix),#0x00
00126$:
	ld	a,-5 (ix)
	sub	a,#0x20
	ld	a,-4 (ix)
	sbc	a,#0x00
	jp	NC,00132$
;carwar.c:597: for(y=0; y<32; y++)
	ld	a,#0x1F
	sub	a,-5 (ix)
	ld	-14 (ix),a
	ld	a,#0x00
	sbc	a,-4 (ix)
	ld	-13 (ix),a
	ld	a,-14 (ix)
	ld	-16 (ix),a
	ld	a,-13 (ix)
	ld	-15 (ix),a
	ld	a,-14 (ix)
	ld	-18 (ix),a
	ld	a,-13 (ix)
	ld	-17 (ix),a
	ld	-7 (ix),#0x00
	ld	-6 (ix),#0x00
00122$:
	ld	a,-7 (ix)
	sub	a,#0x20
	ld	a,-6 (ix)
	sbc	a,#0x00
	jp	NC,00128$
;carwar.c:599: if((block->tile & 0xF0) == ROT_0)        { lx = x;      ly = y; }
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	a,(hl)
	and	a,#0xF0
	ld	l,a
	or	a,a
	jr	NZ,00114$
	ld	c,-5 (ix)
	ld	b,-4 (ix)
	ld	a,-7 (ix)
	ld	-20 (ix),a
	ld	a,-6 (ix)
	ld	-19 (ix),a
	jp	00115$
00114$:
;carwar.c:600: else if((block->tile & 0xF0) == ROT_90)  { lx = y;      ly = 31 - x; }
	ld	a,l
	sub	a,#0x10
	jr	NZ,00111$
	ld	c,-7 (ix)
	ld	b,-6 (ix)
	ld	a,-18 (ix)
	ld	-20 (ix),a
	ld	a,-17 (ix)
	ld	-19 (ix),a
	jr	00115$
00111$:
;carwar.c:601: else if((block->tile & 0xF0) == ROT_180) { lx = 31 - x; ly = 31 - y; }
	ld	a,l
	sub	a,#0x20
	jr	NZ,00108$
	ld	c,-16 (ix)
	ld	b,-15 (ix)
	ld	a,#0x1F
	sub	a,-7 (ix)
	ld	-20 (ix),a
	ld	a,#0x00
	sbc	a,-6 (ix)
	ld	-19 (ix),a
	jr	00115$
00108$:
;carwar.c:602: else if((block->tile & 0xF0) == ROT_270) { lx = 31 - y; ly = x; }
	ld	a,l
	sub	a,#0x30
	jr	NZ,00105$
	ld	a,#0x1F
	sub	a,-7 (ix)
	ld	c,a
	ld	a,#0x00
	sbc	a,-6 (ix)
	ld	b,a
	ld	a,-5 (ix)
	ld	-20 (ix),a
	ld	a,-4 (ix)
	ld	-19 (ix),a
	jr	00115$
00105$:
;carwar.c:603: else if((block->tile & 0xF0) == SYM_H)   { lx = x;      ly = 31 - y; }
	ld	a,l
	sub	a,#0x40
	jr	NZ,00102$
	ld	c,-5 (ix)
	ld	b,-4 (ix)
	ld	a,#0x1F
	sub	a,-7 (ix)
	ld	-20 (ix),a
	ld	a,#0x00
	sbc	a,-6 (ix)
	ld	-19 (ix),a
	jr	00115$
00102$:
;carwar.c:604: else /* SYM_V */                         { lx = 31 - x; ly = y; }
	ld	c,-14 (ix)
	ld	b,-13 (ix)
	ld	a,-7 (ix)
	ld	-20 (ix),a
	ld	a,-6 (ix)
	ld	-19 (ix),a
00115$:
;carwar.c:605: byte = trackTiles[32 * 4 * (block->tile & 0x0F) + (lx / 8) + (ly * 32 / 8)];
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
	ld	e,c
	ld	d,b
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
	add	hl,de
	ex	de,hl
	ld	l,-20 (ix)
	ld	h,-19 (ix)
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
;carwar.c:606: if(byte & (1 << (7 - (lx & 0x07))))
	ld	a,c
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
;carwar.c:607: WriteVRAM((16 + 32 * i + x) + 256 * (8 + 32 * j + y), block->color1);
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	a,(hl)
	ld	-20 (ix),a
	ld	l,-1 (ix)
	ld	h,#0x00
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	ld	de, #0x0010
	add	hl, de
	ld	a, l
	ld	d, h
	add	a,-5 (ix)
	ld	e,a
	ld	a,d
	adc	a,-4 (ix)
	ld	d,a
	ld	l,-2 (ix)
	ld	h,#0x00
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	ld	bc, #0x0008
	add	hl,bc
	ld	a, l
	ld	b, h
	add	a,-7 (ix)
	ld	c,a
	ld	a,b
	adc	a,-6 (ix)
	ld	h,c
	ld	l,#0x00
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,-20 (ix)
	push	af
	inc	sp
	push	bc
	call	_WriteVRAM
	pop	af
	inc	sp
	jr	00124$
00117$:
;carwar.c:609: WriteVRAM((16 + 32 * i + x) + 256 * (8 + 32 * j + y), block->color0);
	ld	l,-22 (ix)
	ld	h,-21 (ix)
	ld	a,(hl)
	ld	-20 (ix),a
	ld	l,-1 (ix)
	ld	h,#0x00
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	ld	de, #0x0010
	add	hl, de
	ld	a, l
	ld	d, h
	add	a,-5 (ix)
	ld	e,a
	ld	a,d
	adc	a,-4 (ix)
	ld	d,a
	ld	l,-2 (ix)
	ld	h,#0x00
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	ld	bc, #0x0008
	add	hl,bc
	ld	a, l
	ld	b, h
	add	a,-7 (ix)
	ld	c,a
	ld	a,b
	adc	a,-6 (ix)
	ld	h,c
	ld	l,#0x00
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,-20 (ix)
	push	af
	inc	sp
	push	bc
	call	_WriteVRAM
	pop	af
	inc	sp
00124$:
;carwar.c:597: for(y=0; y<32; y++)
	inc	-7 (ix)
	jp	NZ,00122$
	inc	-6 (ix)
	jp	00122$
00128$:
;carwar.c:595: for(x=0; x<32; x++)
	inc	-5 (ix)
	jp	NZ,00126$
	inc	-4 (ix)
	jp	00126$
00132$:
;carwar.c:586: for(j=0; j<6; j++)
	ld	a,-12 (ix)
	add	a,#0x07
	ld	-12 (ix),a
	inc	-2 (ix)
	jp	00130$
00136$:
;carwar.c:584: for(i=0; i<7; i++)
	inc	-1 (ix)
	jp	00134$
00137$:
;carwar.c:615: ClearSprite();
	call	_ClearSprite
	ld	sp,ix
	pop	ix
	ret
_StateBuildTrack_end::
__str_3:
	.ascii "BUILD"
	.db 0x0A
	.ascii "TRACK"
	.db 0x00
;carwar.c:619: void StateShadeTrack()
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
;carwar.c:624: PrintSprite(64, 64, "SHADE\nTRACK", (u16)&defaultColor);
	ld	c,#<(_defaultColor)
	ld	b,#>(_defaultColor)
	push	bc
	ld	hl,#__str_4
	push	hl
	ld	hl,#0x4040
	push	hl
	call	_PrintSprite
	pop	af
	pop	af
;carwar.c:626: cur = ReadVRAM(0);
	ld	hl,#0x0000
	ex	(sp),hl
	call	_ReadVRAM
	pop	af
;carwar.c:627: for(x=0; x<256; x++)
	ld	-2 (ix),#0x00
	ld	-1 (ix),#0x00
00124$:
	ld	a,-1 (ix)
	sub	a,#0x01
	jp	NC,00127$
;carwar.c:629: for(y=0; y<211; y++)
	ld	-4 (ix),#0x00
	ld	-3 (ix),#0x00
00120$:
	ld	a,-4 (ix)
	sub	a,#0xD3
	ld	a,-3 (ix)
	sbc	a,#0x00
	jp	NC,00126$
;carwar.c:631: cur = ReadVRAM(x + 256 * y);
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
;carwar.c:632: next = ReadVRAM(x + 256 * (y + 1));
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
;carwar.c:633: if(colorCode[cur] < OP_ROAD && colorCode[next] >= OP_ROAD)
	ld	a,#<(_colorCode)
	add	a,c
	ld	e,a
	ld	a,#>(_colorCode)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	sub	a,#0x40
	jp	NC,00122$
	ld	a,#<(_colorCode)
	add	a,b
	ld	l, a
	ld	a, #>(_colorCode)
	adc	a, #0x00
	ld	h, a
	ld	a, (hl)
	sub	a,#0x40
	jp	C,00122$
;carwar.c:635: for(i=0; i<BLOCK_SHADOW; i++)
	ld	-6 (ix),#0x00
	ld	-5 (ix),#0x00
00105$:
	ld	a,-6 (ix)
	sub	a,#0x03
	ld	a,-5 (ix)
	sbc	a,#0x00
	jr	NC,00108$
;carwar.c:637: cur = ReadVRAM(x + 256 * (y - i));
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
;carwar.c:638: if((y - i < 212) && (colorCode[cur] < OP_ROAD))
	ld	a,b
	sub	a,#0xD4
	ld	a,e
	sbc	a,#0x00
	jr	NC,00108$
	ld	a,#<(_colorCode)
	add	a,c
	ld	e,a
	ld	a,#>(_colorCode)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	sub	a,#0x40
	jr	NC,00108$
;carwar.c:639: WriteVRAM(x + 256 * (y - i), DarkenColor(cur, SHADOW_POWER));
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
	call	_WriteVRAM
	pop	af
	inc	sp
;carwar.c:635: for(i=0; i<BLOCK_SHADOW; i++)
	inc	-6 (ix)
	jr	NZ,00105$
	inc	-5 (ix)
	jr	00105$
00108$:
;carwar.c:643: for(i=1; i<=ROAD_SHADOW; i++)
	ld	-6 (ix),#0x01
	ld	-5 (ix),#0x00
00113$:
	ld	a,#0x02
	sub	a,-6 (ix)
	ld	a,#0x00
	sbc	a,-5 (ix)
	jr	C,00116$
;carwar.c:645: cur = ReadVRAM(x + 256 * (y + i));
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
;carwar.c:646: if((y + i < 212) && (colorCode[cur] >= OP_ROAD))
	ld	a,b
	sub	a,#0xD4
	ld	a,e
	sbc	a,#0x00
	jr	NC,00116$
	ld	a,#<(_colorCode)
	add	a,c
	ld	e,a
	ld	a,#>(_colorCode)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	sub	a,#0x40
	jr	C,00116$
;carwar.c:647: WriteVRAM(x + 256 * (y + i), DarkenColor(cur, SHADOW_POWER));
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
	call	_WriteVRAM
	pop	af
	inc	sp
;carwar.c:643: for(i=1; i<=ROAD_SHADOW; i++)
	inc	-6 (ix)
	jr	NZ,00113$
	inc	-5 (ix)
	jr	00113$
00116$:
;carwar.c:651: y += i;
	ld	a,-4 (ix)
	add	a,-6 (ix)
	ld	-4 (ix),a
	ld	a,-3 (ix)
	adc	a,-5 (ix)
	ld	-3 (ix),a
00122$:
;carwar.c:629: for(y=0; y<211; y++)
	inc	-4 (ix)
	jp	NZ,00120$
	inc	-3 (ix)
	jp	00120$
00126$:
;carwar.c:627: for(x=0; x<256; x++)
	inc	-2 (ix)
	jp	NZ,00124$
	inc	-1 (ix)
	jp	00124$
00127$:
;carwar.c:655: ClearSprite();
	call	_ClearSprite
	ld	sp,ix
	pop	ix
	ret
_StateShadeTrack_end::
__str_4:
	.ascii "SHADE"
	.db 0x0A
	.ascii "TRACK"
	.db 0x00
;carwar.c:661: u8 DarkenColor(u8 color, u8 power)
;	---------------------------------
; Function DarkenColor
; ---------------------------------
_DarkenColor_start::
_DarkenColor:
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;carwar.c:664: g = ((color & 0xE0) >> 5);
	ld	a,4 (ix)
	and	a,#0xE0
	ld	c,a
	srl	c
	srl	c
	srl	c
	srl	c
	srl	c
;carwar.c:665: r = ((color & 0x1C) >> 2);
	ld	a,4 (ix)
	and	a,#0x1C
	ld	b,a
	srl	b
	srl	b
;carwar.c:666: b = (color & 0x03);
	ld	a,4 (ix)
	and	a,#0x03
	ld	-1 (ix),a
;carwar.c:667: switch(power)
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
;carwar.c:669: case 0: break;                       // x1
	jp	00110$
;carwar.c:670: case 1: TransformColor(7, 3); break; // x0.875
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
;carwar.c:671: case 2: TransformColor(3, 2); break; // x0.75
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
;carwar.c:672: case 3: TransformColor(5, 3); break; // x0.625
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
;carwar.c:673: case 4: TransformColor(1, 1); break; // x0.5
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
;carwar.c:674: case 5: TransformColor(3, 3); break; // x0.375
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
;carwar.c:675: case 6: TransformColor(1, 2); break; // x0.25
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
;carwar.c:676: case 7:                              // x0.125
00108$:
;carwar.c:677: default: TransformColor(1, 3); break;
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
;carwar.c:678: }
00110$:
;carwar.c:679: return (g << 5) + (r << 2) + b;
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
	.area _CODE
	.area _CABS
