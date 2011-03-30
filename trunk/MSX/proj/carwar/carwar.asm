;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.0.0 #6037 (Oct 31 2010) (MINGW32)
; This file was generated Thu Mar 31 00:51:02 2011
;--------------------------------------------------------
	.module carwar
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _game
	.globl _g_SmokeFrq
	.globl _g_AnimIndex
	.globl _g_DefaultColor
	.globl _g_HeightTab
	.globl _g_Menus
	.globl _g_MenuTrackList
	.globl _g_MenuPlayer
	.globl _g_MenuTrack
	.globl _g_MenuMode
	.globl _g_MenuMain
	.globl _g_Tracks
	.globl _g_TrackTiles03
	.globl _g_TrackTiles02
	.globl _g_TrackTiles01
	.globl _testTrack
	.globl _g_BG
	.globl _g_Cars
	.globl _g_Pilots
	.globl _g_Title
	.globl _g_TrackTiles
	.globl _g_CharTable
	.globl _g_Shadow
	.globl _g_Car4
	.globl _g_Car3
	.globl _g_Car2
	.globl _g_Car1
	.globl _MainLoop
	.globl _StateInitialize
	.globl _InitializeMenu
	.globl _StateTitle
	.globl _StateMainMenu
	.globl _StateStartGame
	.globl _StateUpdateGame
	.globl _InitializePlayer
	.globl _CheckJoy
	.globl _DamageCar
	.globl _AngleDifferent64
	.globl _VectorToAngle256
	.globl _GetVectorLenght256
	.globl _CarToCarCollision
	.globl _CarToWallCollision
	.globl _UpackTiles
	.globl _BuildTile
	.globl _BuildTrack
	.globl _ShadeTrack
	.globl _DarkenColor
	.globl _GrayGradiant
	.globl _DrawCharacter
	.globl _DrawText
	.globl _CopyCropped16
	.globl _VBlankInterrupt
	.globl _StartGame
	.globl _SelectPlayer
	.globl _SelectRule
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
;carwar.c:677: void main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main_start::
_main:
;carwar.c:683: __endasm;
	
		 di
		 ld sp, (#0xFC4A)
		 ei
		
;carwar.c:685: g_slotPort = (g_slotPort & 0xCF) | ((g_slotPort & 0x0C) << 2);
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
;carwar.c:687: MainLoop();
	call	_MainLoop
	ret
_main_end::
_g_Car1:
	.db #0x02	; 2
	.db #0xC7	; 199
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
	.db #0x02	; 2
	.db #0xC7	; 199
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
	.db #0x10	; 16
	.db #0xBA	; 186
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
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0xB6	; 182
	.db #0xDA	; 218
	.db #0x91	; 145
	.db #0x49	; 73	I
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
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x9B	; 155
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
	.db #0x92	; 146
	.db #0xDA	; 218
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0xB8	; 184
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
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x42	; 66	B
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0x6D	; 109	m
	.db #0x24	; 36
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
	.db #0xB2	; 178
	.db #0xFB	; 251
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x63	; 99	c
	.db #0x24	; 36
	.db #0x24	; 36
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
	.db #0x04	; 4
	.db #0x21	; 33
	.db #0x42	; 66	B
	.db #0x63	; 99	c
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
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
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x8B	; 139
	.db #0x00	; 0
	.db #0x6D	; 109	m
	.db #0x98	; 152
	.db #0x24	; 36
	.db #0x49	; 73	I
	.db #0x98	; 152
	.db #0x6D	; 109	m
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xB6	; 182
	.db #0x92	; 146
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0x92	; 146
	.db #0xB6	; 182
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x91	; 145
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0x92	; 146
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x6D	; 109	m
	.db #0x21	; 33
	.db #0x41	; 65	A
	.db #0x42	; 66	B
	.db #0x63	; 99	c
	.db #0x6D	; 109	m
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x41	; 65	A
	.db #0x42	; 66	B
	.db #0x63	; 99	c
	.db #0x42	; 66	B
	.db #0x24	; 36
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
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x21	; 33
	.db #0x42	; 66	B
	.db #0x63	; 99	c
	.db #0x21	; 33
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x6D	; 109	m
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x9B	; 155
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x49	; 73	I
	.db #0x98	; 152
	.db #0x6D	; 109	m
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
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0x6D	; 109	m
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
	.db #0x24	; 36
	.db #0x10	; 16
	.db #0xFB	; 251
	.db #0xD6	; 214
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
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
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x42	; 66	B
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
	.db #0x11	; 17
	.db #0xB9	; 185
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
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x6D	; 109	m
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0xC9	; 201
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
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0xB7	; 183
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
	.db #0x01	; 1
	.db #0xC9	; 201
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
	.db #0x01	; 1
	.db #0xBA	; 186
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
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x11	; 17
	.db #0x9A	; 154
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
	.db #0x04	; 4
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
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
	.db #0x04	; 4
	.db #0x41	; 65	A
	.db #0xAE	; 174
	.db #0xD6	; 214
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x04	; 4
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
	.db #0x91	; 145
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0x42	; 66	B
	.db #0x04	; 4
	.db #0x04	; 4
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
	.db #0x24	; 36
	.db #0x49	; 73	I
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x21	; 33
	.db #0x8A	; 138
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x6D	; 109	m
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x21	; 33
	.db #0x42	; 66	B
	.db #0x63	; 99	c
	.db #0x21	; 33
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x1C	; 28
	.db #0xFB	; 251
	.db #0xD6	; 214
	.db #0x10	; 16
	.db #0x04	; 4
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
	.db #0x04	; 4
	.db #0x21	; 33
	.db #0x42	; 66	B
	.db #0x63	; 99	c
	.db #0x42	; 66	B
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x6D	; 109	m
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0x6D	; 109	m
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x91	; 145
	.db #0xB6	; 182
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0xB6	; 182
	.db #0x92	; 146
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0xB6	; 182
	.db #0xFC	; 252
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0xFC	; 252
	.db #0xB6	; 182
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0x6D	; 109	m
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x21	; 33
	.db #0x9A	; 154
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x6D	; 109	m
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
	.db #0x04	; 4
	.db #0x21	; 33
	.db #0x42	; 66	B
	.db #0x63	; 99	c
	.db #0x21	; 33
	.db #0x1C	; 28
	.db #0x04	; 4
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
	.db #0x04	; 4
	.db #0x21	; 33
	.db #0x42	; 66	B
	.db #0x63	; 99	c
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0x6D	; 109	m
	.db #0x24	; 36
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
	.db #0x49	; 73	I
	.db #0x91	; 145
	.db #0x92	; 146
	.db #0x6D	; 109	m
	.db #0x24	; 36
	.db #0xFC	; 252
	.db #0x24	; 36
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
	.db #0x04	; 4
	.db #0x49	; 73	I
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x11	; 17
	.db #0xBA	; 186
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
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0xC8	; 200
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
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
_g_Car2:
	.db #0x01	; 1
	.db #0xC8	; 200
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
	.db #0x01	; 1
	.db #0xC9	; 201
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
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0xBA	; 186
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
	.db #0x74	; 116	t
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x49	; 73	I
	.db #0x24	; 36
	.db #0x50	; 80	P
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
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0xAB	; 171
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
	.db #0xB8	; 184
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x24	; 36
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
	.db #0x98	; 152
	.db #0x04	; 4
	.db #0x49	; 73	I
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0xFC	; 252
	.db #0x98	; 152
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
	.db #0x98	; 152
	.db #0x74	; 116	t
	.db #0xDC	; 220
	.db #0xBC	; 188
	.db #0x63	; 99	c
	.db #0x41	; 65	A
	.db #0x74	; 116	t
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
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x8B	; 139
	.db #0x00	; 0
	.db #0xBC	; 188
	.db #0x74	; 116	t
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x74	; 116	t
	.db #0xBC	; 188
	.db #0x00	; 0
	.db #0x98	; 152
	.db #0xB8	; 184
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0xFC	; 252
	.db #0x98	; 152
	.db #0xBC	; 188
	.db #0xBC	; 188
	.db #0x04	; 4
	.db #0x49	; 73	I
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0xBC	; 188
	.db #0xBC	; 188
	.db #0x04	; 4
	.db #0x98	; 152
	.db #0x04	; 4
	.db #0x49	; 73	I
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x98	; 152
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x74	; 116	t
	.db #0xDC	; 220
	.db #0xBC	; 188
	.db #0xBC	; 188
	.db #0xB8	; 184
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x74	; 116	t
	.db #0x62	; 98	b
	.db #0x63	; 99	c
	.db #0x63	; 99	c
	.db #0x41	; 65	A
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0x98	; 152
	.db #0x74	; 116	t
	.db #0xDC	; 220
	.db #0xBC	; 188
	.db #0xBC	; 188
	.db #0xB8	; 184
	.db #0x74	; 116	t
	.db #0x98	; 152
	.db #0xBC	; 188
	.db #0x98	; 152
	.db #0x42	; 66	B
	.db #0x42	; 66	B
	.db #0x42	; 66	B
	.db #0x21	; 33
	.db #0x98	; 152
	.db #0xBC	; 188
	.db #0x04	; 4
	.db #0xB8	; 184
	.db #0x63	; 99	c
	.db #0x42	; 66	B
	.db #0x42	; 66	B
	.db #0x41	; 65	A
	.db #0x74	; 116	t
	.db #0x04	; 4
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
	.db #0xB2	; 178
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0xAB	; 171
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
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0xB8	; 184
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
	.db #0x04	; 4
	.db #0x18	; 24
	.db #0xB2	; 178
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0xBA	; 186
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
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0xB8	; 184
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
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x74	; 116	t
	.db #0xB2	; 178
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0xC9	; 201
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
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x11	; 17
	.db #0xC8	; 200
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
	.db #0x01	; 1
	.db #0xD8	; 216
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
	.db #0xCA	; 202
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
	.db #0x10	; 16
	.db #0xAB	; 171
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
	.db #0xBC	; 188
	.db #0x98	; 152
	.db #0xB8	; 184
	.db #0x42	; 66	B
	.db #0x42	; 66	B
	.db #0x63	; 99	c
	.db #0x18	; 24
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
	.db #0x98	; 152
	.db #0x74	; 116	t
	.db #0xB8	; 184
	.db #0x42	; 66	B
	.db #0x63	; 99	c
	.db #0x62	; 98	b
	.db #0x74	; 116	t
	.db #0x04	; 4
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
	.db #0x98	; 152
	.db #0xBC	; 188
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0x49	; 73	I
	.db #0x04	; 4
	.db #0x50	; 80	P
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
	.db #0x50	; 80	P
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0xFC	; 252
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x8B	; 139
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x74	; 116	t
	.db #0x98	; 152
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xB8	; 184
	.db #0x63	; 99	c
	.db #0x42	; 66	B
	.db #0x42	; 66	B
	.db #0x41	; 65	A
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0xBC	; 188
	.db #0x98	; 152
	.db #0xDC	; 220
	.db #0xBC	; 188
	.db #0xBC	; 188
	.db #0xB8	; 184
	.db #0x74	; 116	t
	.db #0xBC	; 188
	.db #0x98	; 152
	.db #0x74	; 116	t
	.db #0xDC	; 220
	.db #0xBC	; 188
	.db #0xBC	; 188
	.db #0xB8	; 184
	.db #0x74	; 116	t
	.db #0x98	; 152
	.db #0x24	; 36
	.db #0x74	; 116	t
	.db #0x62	; 98	b
	.db #0x63	; 99	c
	.db #0x63	; 99	c
	.db #0x41	; 65	A
	.db #0x50	; 80	P
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x74	; 116	t
	.db #0xDC	; 220
	.db #0xBC	; 188
	.db #0xBC	; 188
	.db #0xB8	; 184
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x98	; 152
	.db #0x04	; 4
	.db #0x49	; 73	I
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x98	; 152
	.db #0x00	; 0
	.db #0xBC	; 188
	.db #0xBC	; 188
	.db #0x04	; 4
	.db #0x49	; 73	I
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0xBC	; 188
	.db #0xBC	; 188
	.db #0x98	; 152
	.db #0xB8	; 184
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0xBC	; 188
	.db #0x98	; 152
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
	.db #0x50	; 80	P
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0x50	; 80	P
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0xAB	; 171
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
	.db #0x74	; 116	t
	.db #0x98	; 152
	.db #0x42	; 66	B
	.db #0x41	; 65	A
	.db #0x74	; 116	t
	.db #0x50	; 80	P
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
	.db #0x24	; 36
	.db #0xB8	; 184
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0x50	; 80	P
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0xCA	; 202
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
	.db #0x04	; 4
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x11	; 17
	.db #0xC8	; 200
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
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0xB8	; 184
	.db #0x50	; 80	P
	.db #0x00	; 0
	.db #0x00	; 0
_g_Car3:
	.db #0x12	; 18
	.db #0xB7	; 183
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
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x11	; 17
	.db #0xB8	; 184
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
	.db #0x65	; 101	e
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0xAE	; 174
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x0C	; 12
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
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x11	; 17
	.db #0xB9	; 185
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
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x9A	; 154
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
	.db #0x10	; 16
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x0C	; 12
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
	.db #0x08	; 8
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0xD6	; 214
	.db #0xB2	; 178
	.db #0x8A	; 138
	.db #0x1C	; 28
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0xB2	; 178
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0xB2	; 178
	.db #0x14	; 20
	.db #0x0C	; 12
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
	.db #0x1C	; 28
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x8A	; 138
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x0C	; 12
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
	.db #0x10	; 16
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x1C	; 28
	.db #0x10	; 16
	.db #0x0C	; 12
	.db #0x08	; 8
	.db #0x8A	; 138
	.db #0xD6	; 214
	.db #0xB2	; 178
	.db #0x8A	; 138
	.db #0x08	; 8
	.db #0x0C	; 12
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0xB2	; 178
	.db #0xB2	; 178
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x14	; 20
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
	.db #0x18	; 24
	.db #0x1C	; 28
	.db #0x1C	; 28
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x9A	; 154
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
	.db #0x24	; 36
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x98	; 152
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
	.db #0x0C	; 12
	.db #0x08	; 8
	.db #0x8A	; 138
	.db #0x18	; 24
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x08	; 8
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
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0xB2	; 178
	.db #0xB2	; 178
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x14	; 20
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
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x9C	; 156
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x9C	; 156
	.db #0x18	; 24
	.db #0x1C	; 28
	.db #0x1C	; 28
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x11	; 17
	.db #0xB9	; 185
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
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x11	; 17
	.db #0xB9	; 185
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
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x12	; 18
	.db #0xB7	; 183
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
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0xC9	; 201
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
	.db #0x65	; 101	e
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x65	; 101	e
	.db #0x0C	; 12
	.db #0x20	; 32
	.db #0x14	; 20
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
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0xBB	; 187
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
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x1C	; 28
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
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x9B	; 155
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
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x14	; 20
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
	.db #0x04	; 4
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0xB2	; 178
	.db #0xB2	; 178
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0x04	; 4
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0x8A	; 138
	.db #0x18	; 24
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x04	; 4
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
	.db #0x04	; 4
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x1C	; 28
	.db #0x0C	; 12
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
	.db #0x10	; 16
	.db #0x0C	; 12
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x8B	; 139
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x1C	; 28
	.db #0x1C	; 28
	.db #0x18	; 24
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
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0xB2	; 178
	.db #0xB2	; 178
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x04	; 4
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0x8A	; 138
	.db #0xD6	; 214
	.db #0xB2	; 178
	.db #0x8A	; 138
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x04	; 4
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x1C	; 28
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0xFC	; 252
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x0C	; 12
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x0C	; 12
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x9B	; 155
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
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x14	; 20
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
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x14	; 20
	.db #0xB2	; 178
	.db #0xB2	; 178
	.db #0x14	; 20
	.db #0x0C	; 12
	.db #0x04	; 4
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
	.db #0x14	; 20
	.db #0x8A	; 138
	.db #0xB2	; 178
	.db #0xD6	; 214
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x14	; 20
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
	.db #0x24	; 36
	.db #0x1C	; 28
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0xFC	; 252
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
	.db #0x04	; 4
	.db #0x0C	; 12
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0xBB	; 187
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
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x11	; 17
	.db #0xB9	; 185
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
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_Car4:
	.db #0x11	; 17
	.db #0xA9	; 169
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
	.db #0x10	; 16
	.db #0xBB	; 187
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
	.db #0x40	; 64
	.db #0x44	; 68	D
	.db #0x89	; 137
	.db #0x64	; 100	d
	.db #0x44	; 68	D
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
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0xCB	; 203
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
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0xBB	; 187
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
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x11	; 17
	.db #0xA9	; 169
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
	.db #0x64	; 100	d
	.db #0x89	; 137
	.db #0x64	; 100	d
	.db #0xD6	; 214
	.db #0xB2	; 178
	.db #0x64	; 100	d
	.db #0x89	; 137
	.db #0x64	; 100	d
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
	.db #0xBB	; 187
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
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xCB	; 203
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
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0xBB	; 187
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
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x21	; 33
	.db #0xA9	; 169
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
	.db #0x20	; 32
	.db #0xBB	; 187
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
	.db #0x64	; 100	d
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
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
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0xCB	; 203
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
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x11	; 17
	.db #0xBA	; 186
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
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x11	; 17
	.db #0xA9	; 169
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
	.db #0x89	; 137
	.db #0x8D	; 141
	.db #0x8D	; 141
	.db #0x42	; 66	B
	.db #0x21	; 33
	.db #0x8D	; 141
	.db #0x89	; 137
	.db #0x64	; 100	d
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
	.db #0x11	; 17
	.db #0xBA	; 186
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
	.db #0xCB	; 203
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
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xBB	; 187
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
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
_g_Shadow:
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
_g_CharTable:
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
	.db #0x38	; 56
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x38	; 56
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x38	; 56
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x38	; 56
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7E	; 126
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x1C	; 28
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1C	; 28
	.db #0x3C	; 60
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1C	; 28
	.db #0x3C	; 60
	.db #0x3E	; 62
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x3E	; 62
	.db #0x7E	; 126
	.db #0x7E	; 126
	.db #0x3C	; 60
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x38	; 56
	.db #0x7E	; 126
	.db #0xFF	; 255
	.db #0x6F	; 111	o
	.db #0xF6	; 246
	.db #0xFF	; 255
	.db #0x7E	; 126
	.db #0x2C	; 44
	.db #0x7C	; 124
	.db #0xFF	; 255
	.db #0xEF	; 239
	.db #0x67	; 103	g
	.db #0xC2	; 194
	.db #0xE7	; 231
	.db #0xFF	; 255
	.db #0x6E	; 110	n
	.db #0x00	; 0
	.db #0x2C	; 44
	.db #0x46	; 70	F
	.db #0x02	; 2
	.db #0x40	; 64
	.db #0x42	; 66	B
	.db #0x2C	; 44
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x34	; 52
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x42	; 66	B
	.db #0x4A	; 74	J
	.db #0x6A	; 106	j
	.db #0x3A	; 58
	.db #0x3C	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x4A	; 74	J
	.db #0x00	; 0
	.db #0x4A	; 74	J
	.db #0x3C	; 60
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x11	; 17
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x34	; 52
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_TrackTiles:
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFE	; 254
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
	.db #0xE0	; 224
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x80	; 128
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFE	; 254
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xF0	; 240
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
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFE	; 254
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFE	; 254
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xF0	; 240
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
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFE	; 254
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0xF8	; 248
	.db #0x1F	; 31
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0xFF	; 255
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3F	; 63
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0F	; 15
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFE	; 254
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFE	; 254
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0F	; 15
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1F	; 31
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3F	; 63
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7F	; 127
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0xFF	; 255
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0xE0	; 224
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xC0	; 192
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
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFE	; 254
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0xE0	; 224
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xC0	; 192
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
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFE	; 254
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3F	; 63
	.db #0xFC	; 252
	.db #0x3F	; 63
	.db #0xFC	; 252
	.db #0x3F	; 63
	.db #0xFC	; 252
	.db #0x3F	; 63
	.db #0xFC	; 252
	.db #0x3F	; 63
	.db #0xFC	; 252
	.db #0x3F	; 63
	.db #0xFC	; 252
	.db #0x3F	; 63
	.db #0xFC	; 252
	.db #0x3F	; 63
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x33	; 51
	.db #0x33	; 51
	.db #0x33	; 51
	.db #0x33	; 51
	.db #0x33	; 51
	.db #0x33	; 51
	.db #0x33	; 51
	.db #0x33	; 51
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3F	; 63
	.db #0xFE	; 254
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7F	; 127
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
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
	.db #0x3F	; 63
	.db #0xFE	; 254
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7F	; 127
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xE7	; 231
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0xE7	; 231
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0F	; 15
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x30	; 48
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x30	; 48
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0F	; 15
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1F	; 31
	.db #0xF8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3F	; 63
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7F	; 127
	.db #0xFE	; 254
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0F	; 15
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1F	; 31
	.db #0xF8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3F	; 63
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7F	; 127
	.db #0xFE	; 254
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0F	; 15
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1F	; 31
	.db #0xF8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3F	; 63
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7F	; 127
	.db #0xFE	; 254
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0xFF	; 255
	.db #0xBC	; 188
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xF1	; 241
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xEF	; 239
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x91	; 145
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xDA	; 218
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xED	; 237
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFC	; 252
	.db #0x78	; 120	x
	.db #0x40	; 64
	.db #0xFF	; 255
	.db #0xBE	; 190
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xE0	; 224
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xB0	; 176
	.db #0x50	; 80	P
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0x61	; 97	a
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xC5	; 197
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xE0	; 224
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x87	; 135
	.db #0x80	; 128
	.db #0xFF	; 255
	.db #0xB1	; 177
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xE3	; 227
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFC	; 252
	.db #0x3C	; 60
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x80	; 128
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x83	; 131
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x83	; 131
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xEE	; 238
	.db #0xD0	; 208
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xE2	; 226
	.db #0x42	; 66	B
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFE	; 254
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x9C	; 156
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xC2	; 194
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xF0	; 240
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xE1	; 225
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x89	; 137
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFE	; 254
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFC	; 252
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
	.db #0xFE	; 254
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFC	; 252
	.db #0x00	; 0
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFE	; 254
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFC	; 252
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
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFC	; 252
	.db #0x00	; 0
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
	.db #0x00	; 0
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
	.db #0xF8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7F	; 127
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFE	; 254
	.db #0x3F	; 63
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFC	; 252
	.db #0x3F	; 63
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFC	; 252
	.db #0x1F	; 31
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x0F	; 15
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xF0	; 240
	.db #0x07	; 7
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xE0	; 224
	.db #0x03	; 3
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1F	; 31
	.db #0xF8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x3F	; 63
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1F	; 31
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1F	; 31
	.db #0xC0	; 192
	.db #0x38	; 56
	.db #0x01	; 1
	.db #0xBF	; 191
	.db #0xE0	; 224
	.db #0xF8	; 248
	.db #0x07	; 7
	.db #0xFF	; 255
	.db #0xF3	; 243
	.db #0xF8	; 248
	.db #0x07	; 7
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xF0	; 240
	.db #0x03	; 3
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xE0	; 224
	.db #0x01	; 1
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
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0x01	; 1
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFC	; 252
	.db #0x03	; 3
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFC	; 252
	.db #0x07	; 7
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFC	; 252
	.db #0x03	; 3
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xFC	; 252
	.db #0x01	; 1
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xF8	; 248
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0x7F	; 127
	.db #0x9C	; 156
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0x7F	; 127
	.db #0x1C	; 28
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x0C	; 12
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0xFE	; 254
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7C	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0F	; 15
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1F	; 31
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1F	; 31
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1F	; 31
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1F	; 31
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1F	; 31
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0F	; 15
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0F	; 15
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1F	; 31
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1F	; 31
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1F	; 31
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1F	; 31
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1F	; 31
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0F	; 15
	.db #0xE0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0xC0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3F	; 63
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7F	; 127
	.db #0xFE	; 254
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x80	; 128
	.db #0x03	; 3
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0x03	; 3
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0x03	; 3
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0x03	; 3
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0x03	; 3
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0x03	; 3
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0x03	; 3
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0x03	; 3
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0xC0	; 192
	.db #0x01	; 1
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7F	; 127
	.db #0xFE	; 254
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3F	; 63
	.db #0xFC	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0F	; 15
	.db #0xF0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_Title:
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
_g_Pilots:
	.db #0x20	; 32
	.db #0x27	; 39
	.db #0x2C	; 44
	.db #0x08	; 8
	.db #0x2C	; 44
	.db #0x95	; 149
	.db #0xB8	; 184
	.db #0x98	; 152
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x21	; 33
	.db #0x41	; 65	A
	.db #0x2C	; 44
	.db #0x51	; 81	Q
	.db #0x10	; 16
	.db #0x47	; 71	G
	.db #0x00	; 0
	.db #0x2C	; 44
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2C	; 44
	.db #0x71	; 113	q
	.db #0x00	; 0
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0xB8	; 184
	.db #0x00	; 0
	.db #0x75	; 117	u
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0xBA	; 186
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x41	; 65	A
	.db #0x21	; 33
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2C	; 44
	.db #0x51	; 81	Q
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x47	; 71	G
	.db #0x00	; 0
	.db #0x2C	; 44
	.db #0x2C	; 44
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x2C	; 44
	.db #0x00	; 0
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0x98	; 152
	.db #0x98	; 152
	.db #0x75	; 117	u
	.db #0x50	; 80	P
	.db #0x74	; 116	t
	.db #0xBA	; 186
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x21	; 33
	.db #0x41	; 65	A
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2C	; 44
	.db #0x51	; 81	Q
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x47	; 71	G
	.db #0x00	; 0
	.db #0x2C	; 44
	.db #0x2C	; 44
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x51	; 81	Q
	.db #0x2C	; 44
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xB8	; 184
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0xBA	; 186
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0xBA	; 186
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x51	; 81	Q
	.db #0x2C	; 44
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x27	; 39
	.db #0x2C	; 44
	.db #0x2C	; 44
	.db #0x95	; 149
	.db #0x08	; 8
	.db #0x74	; 116	t
	.db #0xB8	; 184
	.db #0x98	; 152
	.db #0xBA	; 186
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x41	; 65	A
	.db #0x21	; 33
	.db #0x51	; 81	Q
	.db #0x2C	; 44
	.db #0x00	; 0
	.db #0x57	; 87	W
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2C	; 44
	.db #0x2C	; 44
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x95	; 149
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x74	; 116	t
	.db #0x98	; 152
	.db #0x74	; 116	t
	.db #0x98	; 152
	.db #0xBA	; 186
	.db #0x00	; 0
	.db #0x74	; 116	t
	.db #0xBA	; 186
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x21	; 33
	.db #0x41	; 65	A
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2C	; 44
	.db #0x51	; 81	Q
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x47	; 71	G
	.db #0x00	; 0
	.db #0x2C	; 44
	.db #0x2C	; 44
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xBA	; 186
	.db #0xBA	; 186
	.db #0x00	; 0
	.db #0xBC	; 188
	.db #0x98	; 152
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0xBA	; 186
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0xBA	; 186
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x62	; 98	b
	.db #0x42	; 66	B
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2C	; 44
	.db #0x2C	; 44
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x57	; 87	W
	.db #0x00	; 0
	.db #0x2C	; 44
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2C	; 44
	.db #0x95	; 149
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xB8	; 184
	.db #0x98	; 152
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xBA	; 186
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0x51	; 81	Q
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x42	; 66	B
	.db #0x41	; 65	A
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x51	; 81	Q
	.db #0x2C	; 44
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x37	; 55
	.db #0x2C	; 44
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x2C	; 44
	.db #0x71	; 113	q
	.db #0x00	; 0
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0x74	; 116	t
	.db #0x98	; 152
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x21	; 33
	.db #0x00	; 0
	.db #0x42	; 66	B
	.db #0x2C	; 44
	.db #0x00	; 0
	.db #0x51	; 81	Q
	.db #0x00	; 0
	.db #0x57	; 87	W
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2C	; 44
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2C	; 44
	.db #0x2C	; 44
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0xB8	; 184
	.db #0xBA	; 186
	.db #0x75	; 117	u
	.db #0x00	; 0
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x41	; 65	A
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x21	; 33
	.db #0x00	; 0
	.db #0x51	; 81	Q
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2C	; 44
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x47	; 71	G
	.db #0x00	; 0
	.db #0x2C	; 44
	.db #0x2C	; 44
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x2C	; 44
	.db #0x75	; 117	u
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0x98	; 152
	.db #0x98	; 152
	.db #0xBA	; 186
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x41	; 65	A
	.db #0x21	; 33
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x51	; 81	Q
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x47	; 71	G
	.db #0x00	; 0
	.db #0x2C	; 44
	.db #0x2C	; 44
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x95	; 149
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x98	; 152
	.db #0xB8	; 184
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0xBA	; 186
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x2C	; 44
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x51	; 81	Q
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x47	; 71	G
	.db #0x00	; 0
	.db #0x2C	; 44
	.db #0x2C	; 44
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x95	; 149
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xB8	; 184
	.db #0x98	; 152
	.db #0x00	; 0
	.db #0xBA	; 186
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0xBA	; 186
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x2C	; 44
	.db #0x21	; 33
	.db #0x41	; 65	A
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x51	; 81	Q
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x57	; 87	W
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2C	; 44
	.db #0x2C	; 44
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x95	; 149
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0xBA	; 186
	.db #0x74	; 116	t
	.db #0x98	; 152
	.db #0x74	; 116	t
	.db #0x98	; 152
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0xBA	; 186
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x41	; 65	A
	.db #0x51	; 81	Q
	.db #0x00	; 0
	.db #0x2C	; 44
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x47	; 71	G
	.db #0x00	; 0
	.db #0x2C	; 44
	.db #0x2C	; 44
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xBA	; 186
	.db #0xBA	; 186
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x74	; 116	t
	.db #0x98	; 152
	.db #0x74	; 116	t
	.db #0x98	; 152
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0xBA	; 186
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x42	; 66	B
	.db #0x2C	; 44
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2C	; 44
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x47	; 71	G
	.db #0x00	; 0
	.db #0x2C	; 44
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2C	; 44
	.db #0x71	; 113	q
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x98	; 152
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x74	; 116	t
	.db #0xBA	; 186
	.db #0x2C	; 44
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x21	; 33
	.db #0x42	; 66	B
	.db #0x00	; 0
	.db #0x2C	; 44
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x51	; 81	Q
	.db #0x10	; 16
	.db #0x47	; 71	G
	.db #0x00	; 0
	.db #0x2C	; 44
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x71	; 113	q
	.db #0x75	; 117	u
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x74	; 116	t
	.db #0x98	; 152
	.db #0x00	; 0
	.db #0xBA	; 186
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0x95	; 149
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x41	; 65	A
	.db #0x21	; 33
	.db #0x2C	; 44
	.db #0x00	; 0
	.db #0x51	; 81	Q
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x47	; 71	G
	.db #0x00	; 0
	.db #0x2C	; 44
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2C	; 44
	.db #0x71	; 113	q
	.db #0x00	; 0
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0xB8	; 184
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x74	; 116	t
	.db #0xBA	; 186
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x42	; 66	B
	.db #0x41	; 65	A
	.db #0x2C	; 44
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x51	; 81	Q
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x47	; 71	G
	.db #0x00	; 0
	.db #0x2C	; 44
	.db #0x2C	; 44
	.db #0x00	; 0
	.db #0x75	; 117	u
	.db #0x2C	; 44
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0x98	; 152
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0xB8	; 184
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0xBA	; 186
	.db #0x00	; 0
	.db #0x41	; 65	A
	.db #0x21	; 33
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x51	; 81	Q
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x57	; 87	W
	.db #0x00	; 0
	.db #0x2C	; 44
	.db #0x2C	; 44
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x51	; 81	Q
	.db #0x2C	; 44
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xBA	; 186
	.db #0xB8	; 184
	.db #0x98	; 152
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0xBA	; 186
	.db #0x21	; 33
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x51	; 81	Q
	.db #0x00	; 0
	.db #0x21	; 33
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2C	; 44
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x37	; 55
	.db #0x00	; 0
	.db #0x2C	; 44
	.db #0x2C	; 44
	.db #0x00	; 0
	.db #0x95	; 149
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0xB8	; 184
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0xBA	; 186
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x42	; 66	B
	.db #0x00	; 0
	.db #0x21	; 33
	.db #0x51	; 81	Q
	.db #0x00	; 0
	.db #0x2C	; 44
	.db #0x10	; 16
	.db #0x47	; 71	G
	.db #0x00	; 0
	.db #0x2C	; 44
	.db #0x2C	; 44
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x95	; 149
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x74	; 116	t
	.db #0x98	; 152
	.db #0xBC	; 188
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x74	; 116	t
	.db #0xBA	; 186
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x41	; 65	A
	.db #0x21	; 33
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x51	; 81	Q
	.db #0x00	; 0
	.db #0x2C	; 44
	.db #0x10	; 16
	.db #0x47	; 71	G
	.db #0x00	; 0
	.db #0x2C	; 44
	.db #0x2C	; 44
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xBA	; 186
	.db #0xBA	; 186
	.db #0x00	; 0
	.db #0x74	; 116	t
	.db #0x98	; 152
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0x98	; 152
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0xBA	; 186
	.db #0x00	; 0
	.db #0x2C	; 44
	.db #0x42	; 66	B
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2C	; 44
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x57	; 87	W
	.db #0x00	; 0
	.db #0x2C	; 44
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x71	; 113	q
	.db #0x95	; 149
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xB8	; 184
	.db #0x98	; 152
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0x95	; 149
	.db #0xBA	; 186
	.db #0x74	; 116	t
	.db #0x74	; 116	t
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x42	; 66	B
	.db #0x21	; 33
	.db #0x41	; 65	A
	.db #0x00	; 0
	.db #0x51	; 81	Q
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2C	; 44
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
_g_SquareRoot256:
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0x1B	; 27
	.db #0x20	; 32
	.db #0x23	; 35
	.db #0x27	; 39
	.db #0x2A	; 42
	.db #0x2D	; 45
	.db #0x30	; 48
	.db #0x32	; 50
	.db #0x35	; 53
	.db #0x37	; 55
	.db #0x39	; 57
	.db #0x3B	; 59
	.db #0x3D	; 61
	.db #0x40	; 64
	.db #0x41	; 65	A
	.db #0x43	; 67	C
	.db #0x45	; 69	E
	.db #0x47	; 71	G
	.db #0x49	; 73	I
	.db #0x4B	; 75	K
	.db #0x4C	; 76	L
	.db #0x4E	; 78	N
	.db #0x50	; 80	P
	.db #0x51	; 81	Q
	.db #0x53	; 83	S
	.db #0x54	; 84	T
	.db #0x56	; 86	V
	.db #0x57	; 87	W
	.db #0x59	; 89	Y
	.db #0x5A	; 90	Z
	.db #0x5B	; 91
	.db #0x5D	; 93
	.db #0x5E	; 94
	.db #0x60	; 96
	.db #0x61	; 97	a
	.db #0x62	; 98	b
	.db #0x63	; 99	c
	.db #0x65	; 101	e
	.db #0x66	; 102	f
	.db #0x67	; 103	g
	.db #0x68	; 104	h
	.db #0x6A	; 106	j
	.db #0x6B	; 107	k
	.db #0x6C	; 108	l
	.db #0x6D	; 109	m
	.db #0x6E	; 110	n
	.db #0x70	; 112	p
	.db #0x71	; 113	q
	.db #0x72	; 114	r
	.db #0x73	; 115	s
	.db #0x74	; 116	t
	.db #0x75	; 117	u
	.db #0x76	; 118	v
	.db #0x77	; 119	w
	.db #0x78	; 120	x
	.db #0x79	; 121	y
	.db #0x7A	; 122	z
	.db #0x7B	; 123
	.db #0x7C	; 124
	.db #0x7D	; 125
	.db #0x7E	; 126
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x81	; 129
	.db #0x82	; 130
	.db #0x83	; 131
	.db #0x84	; 132
	.db #0x85	; 133
	.db #0x86	; 134
	.db #0x87	; 135
	.db #0x88	; 136
	.db #0x89	; 137
	.db #0x8A	; 138
	.db #0x8B	; 139
	.db #0x8C	; 140
	.db #0x8D	; 141
	.db #0x8E	; 142
	.db #0x8F	; 143
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0x91	; 145
	.db #0x92	; 146
	.db #0x93	; 147
	.db #0x94	; 148
	.db #0x95	; 149
	.db #0x96	; 150
	.db #0x96	; 150
	.db #0x97	; 151
	.db #0x98	; 152
	.db #0x99	; 153
	.db #0x9A	; 154
	.db #0x9B	; 155
	.db #0x9B	; 155
	.db #0x9C	; 156
	.db #0x9D	; 157
	.db #0x9E	; 158
	.db #0x9F	; 159
	.db #0xA0	; 160
	.db #0xA0	; 160
	.db #0xA1	; 161
	.db #0xA2	; 162
	.db #0xA3	; 163
	.db #0xA3	; 163
	.db #0xA4	; 164
	.db #0xA5	; 165
	.db #0xA6	; 166
	.db #0xA7	; 167
	.db #0xA7	; 167
	.db #0xA8	; 168
	.db #0xA9	; 169
	.db #0xAA	; 170
	.db #0xAA	; 170
	.db #0xAB	; 171
	.db #0xAC	; 172
	.db #0xAD	; 173
	.db #0xAD	; 173
	.db #0xAE	; 174
	.db #0xAF	; 175
	.db #0xB0	; 176
	.db #0xB0	; 176
	.db #0xB1	; 177
	.db #0xB2	; 178
	.db #0xB2	; 178
	.db #0xB3	; 179
	.db #0xB4	; 180
	.db #0xB5	; 181
	.db #0xB5	; 181
	.db #0xB6	; 182
	.db #0xB7	; 183
	.db #0xB7	; 183
	.db #0xB8	; 184
	.db #0xB9	; 185
	.db #0xB9	; 185
	.db #0xBA	; 186
	.db #0xBB	; 187
	.db #0xBB	; 187
	.db #0xBC	; 188
	.db #0xBD	; 189
	.db #0xBD	; 189
	.db #0xBE	; 190
	.db #0xBF	; 191
	.db #0xC0	; 192
	.db #0xC0	; 192
	.db #0xC1	; 193
	.db #0xC1	; 193
	.db #0xC2	; 194
	.db #0xC3	; 195
	.db #0xC3	; 195
	.db #0xC4	; 196
	.db #0xC5	; 197
	.db #0xC5	; 197
	.db #0xC6	; 198
	.db #0xC7	; 199
	.db #0xC7	; 199
	.db #0xC8	; 200
	.db #0xC9	; 201
	.db #0xC9	; 201
	.db #0xCA	; 202
	.db #0xCB	; 203
	.db #0xCB	; 203
	.db #0xCC	; 204
	.db #0xCC	; 204
	.db #0xCD	; 205
	.db #0xCE	; 206
	.db #0xCE	; 206
	.db #0xCF	; 207
	.db #0xD0	; 208
	.db #0xD0	; 208
	.db #0xD1	; 209
	.db #0xD1	; 209
	.db #0xD2	; 210
	.db #0xD3	; 211
	.db #0xD3	; 211
	.db #0xD4	; 212
	.db #0xD4	; 212
	.db #0xD5	; 213
	.db #0xD6	; 214
	.db #0xD6	; 214
	.db #0xD7	; 215
	.db #0xD7	; 215
	.db #0xD8	; 216
	.db #0xD9	; 217
	.db #0xD9	; 217
	.db #0xDA	; 218
	.db #0xDA	; 218
	.db #0xDB	; 219
	.db #0xDB	; 219
	.db #0xDC	; 220
	.db #0xDD	; 221
	.db #0xDD	; 221
	.db #0xDE	; 222
	.db #0xDE	; 222
	.db #0xDF	; 223
	.db #0xE0	; 224
	.db #0xE0	; 224
	.db #0xE1	; 225
	.db #0xE1	; 225
	.db #0xE2	; 226
	.db #0xE2	; 226
	.db #0xE3	; 227
	.db #0xE3	; 227
	.db #0xE4	; 228
	.db #0xE5	; 229
	.db #0xE5	; 229
	.db #0xE6	; 230
	.db #0xE6	; 230
	.db #0xE7	; 231
	.db #0xE7	; 231
	.db #0xE8	; 232
	.db #0xE8	; 232
	.db #0xE9	; 233
	.db #0xEA	; 234
	.db #0xEA	; 234
	.db #0xEB	; 235
	.db #0xEB	; 235
	.db #0xEC	; 236
	.db #0xEC	; 236
	.db #0xED	; 237
	.db #0xED	; 237
	.db #0xEE	; 238
	.db #0xEE	; 238
	.db #0xEF	; 239
	.db #0xF0	; 240
	.db #0xF0	; 240
	.db #0xF1	; 241
	.db #0xF1	; 241
	.db #0xF2	; 242
	.db #0xF2	; 242
	.db #0xF3	; 243
	.db #0xF3	; 243
	.db #0xF4	; 244
	.db #0xF4	; 244
	.db #0xF5	; 245
	.db #0xF5	; 245
	.db #0xF6	; 246
	.db #0xF6	; 246
	.db #0xF7	; 247
	.db #0xF7	; 247
	.db #0xF8	; 248
	.db #0xF8	; 248
	.db #0xF9	; 249
	.db #0xF9	; 249
	.db #0xFA	; 250
	.db #0xFA	; 250
	.db #0xFB	; 251
	.db #0xFB	; 251
	.db #0xFC	; 252
	.db #0xFC	; 252
	.db #0xFD	; 253
	.db #0xFD	; 253
	.db #0xFE	; 254
	.db #0xFE	; 254
	.db #0xFF	; 255
_g_Cars:
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
	.db #0x0A	; 10
	.db #0x0F	; 15
	.db #0x0F	; 15
	.db #0x0F	; 15
	.db #0x05	; 5
_g_BG:
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
	.db #0xF8	; 248
	.db #0xB0	; 176
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
_testTrack:
	.db #0x19	; 25
	.db #0x01	; 1
	.db #0xBF	; 191
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x19	; 25
	.db #0xC0	; 192
	.db #0x9F	; 159
	.db #0x09	; 9
	.db #0x19	; 25
	.db #0x21	; 33
	.db #0x0F	; 15
	.db #0x19	; 25
	.db #0x11	; 17
	.db #0xBF	; 191
	.db #0x19	; 25
	.db #0x48	; 72	H
	.db #0x0F	; 15
	.db #0x19	; 25
	.db #0x2A	; 42
	.db #0x0F	; 15
	.db #0x00	; 0
	.db #0x19	; 25
	.db #0x0A	; 10
	.db #0x0F	; 15
	.db #0x09	; 9
	.db #0x19	; 25
	.db #0x31	; 49
	.db #0x0F	; 15
	.db #0x0F	; 15
	.db #0x0F	; 15
	.db #0x0F	; 15
	.db #0x1F	; 31
	.db #0x21	; 33
	.db #0x0F	; 15
	.db #0x19	; 25
	.db #0x08	; 8
	.db #0x0F	; 15
	.db #0x2B	; 43
	.db #0x88	; 136
	.db #0x94	; 148
	.db #0x80	; 128
	.db #0x1B	; 27
	.db #0x48	; 72	H
	.db #0x0F	; 15
	.db #0x1B	; 27
	.db #0x1F	; 31
	.db #0x0F	; 15
	.db #0x1B	; 27
	.db #0x8B	; 139
	.db #0x5F	; 95
	.db #0x2B	; 43
	.db #0x21	; 33
	.db #0xF1	; 241
	.db #0xF0	; 240
	.db #0x0F	; 15
	.db #0x00	; 0
	.db #0x1B	; 27
	.db #0x48	; 72	H
	.db #0x0F	; 15
	.db #0x1B	; 27
	.db #0x1F	; 31
	.db #0x0F	; 15
	.db #0x1B	; 27
	.db #0xE9	; 233
	.db #0xFF	; 255
	.db #0x1B	; 27
	.db #0xE9	; 233
	.db #0xFF	; 255
	.db #0x1B	; 27
	.db #0xE9	; 233
	.db #0xFF	; 255
	.db #0x0F	; 15
	.db #0x1B	; 27
	.db #0xE9	; 233
	.db #0xFF	; 255
	.db #0x1B	; 27
	.db #0xE9	; 233
	.db #0xFF	; 255
	.db #0x1B	; 27
	.db #0xE9	; 233
	.db #0xFF	; 255
	.db #0x1F	; 31
	.db #0xE9	; 233
	.db #0x8F	; 143
	.db #0x1F	; 31
	.db #0xE9	; 233
	.db #0x8F	; 143
	.db #0x1F	; 31
	.db #0xE9	; 233
	.db #0x8F	; 143
	.db #0x1F	; 31
	.db #0xE9	; 233
	.db #0x8F	; 143
	.db #0x1F	; 31
	.db #0xE9	; 233
	.db #0x8F	; 143
	.db #0x1F	; 31
	.db #0xE9	; 233
	.db #0x8F	; 143
	.db #0x1F	; 31
	.db #0xE9	; 233
	.db #0x8F	; 143
_g_TrackTiles01:
	.db #0x02	; 2
	.db #0xD4	; 212
	.db #0xB6	; 182
	.db #0x00	; 0
	.db #0xB6	; 182
	.db #0x00	; 0
	.db #0xB6	; 182
	.db #0x12	; 18
	.db #0xD4	; 212
	.db #0xB6	; 182
	.db #0x02	; 2
	.db #0xD4	; 212
	.db #0xB6	; 182
	.db #0x00	; 0
	.db #0xB6	; 182
	.db #0x12	; 18
	.db #0xD4	; 212
	.db #0xB6	; 182
	.db #0x00	; 0
	.db #0xB6	; 182
	.db #0x01	; 1
	.db #0xB6	; 182
	.db #0xD4	; 212
	.db #0x00	; 0
	.db #0xD4	; 212
	.db #0x32	; 50
	.db #0xD4	; 212
	.db #0xB6	; 182
	.db #0x22	; 34
	.db #0xD4	; 212
	.db #0xB6	; 182
	.db #0x11	; 17
	.db #0xB6	; 182
	.db #0xD4	; 212
	.db #0x00	; 0
	.db #0xB6	; 182
	.db #0x03	; 3
	.db #0xFF	; 255
	.db #0xB6	; 182
	.db #0x00	; 0
	.db #0xD4	; 212
	.db #0x00	; 0
	.db #0xD4	; 212
	.db #0x00	; 0
	.db #0xD4	; 212
	.db #0x00	; 0
	.db #0xD4	; 212
	.db #0x00	; 0
	.db #0xD4	; 212
	.db #0x00	; 0
	.db #0xB6	; 182
	.db #0x00	; 0
	.db #0xB6	; 182
	.db #0x00	; 0
	.db #0xD4	; 212
	.db #0x00	; 0
	.db #0xD4	; 212
	.db #0x00	; 0
	.db #0xD4	; 212
	.db #0x00	; 0
	.db #0xD4	; 212
	.db #0x01	; 1
	.db #0xD4	; 212
	.db #0xB6	; 182
	.db #0x00	; 0
	.db #0xB6	; 182
	.db #0x19	; 25
	.db #0xD9	; 217
	.db #0xB6	; 182
	.db #0x02	; 2
	.db #0xD4	; 212
	.db #0xD9	; 217
	.db #0x00	; 0
	.db #0xD9	; 217
	.db #0x00	; 0
	.db #0xD4	; 212
	.db #0x3B	; 59
	.db #0x9C	; 156
	.db #0xB6	; 182
	.db #0x04	; 4
	.db #0xD4	; 212
	.db #0xB6	; 182
	.db #0x00	; 0
	.db #0xB6	; 182
	.db #0x32	; 50
	.db #0xD4	; 212
	.db #0xD9	; 217
	.db #0x00	; 0
	.db #0xD9	; 217
	.db #0x01	; 1
	.db #0xD9	; 217
	.db #0xD4	; 212
	.db #0x00	; 0
	.db #0xD4	; 212
	.db #0x11	; 17
	.db #0xB6	; 182
	.db #0xD4	; 212
	.db #0x00	; 0
	.db #0xB6	; 182
	.db #0x22	; 34
	.db #0xD4	; 212
	.db #0xB6	; 182
_g_TrackTiles02:
	.db #0x01	; 1
	.db #0xD4	; 212
	.db #0xB6	; 182
	.db #0x35	; 53
	.db #0xD4	; 212
	.db #0xB6	; 182
	.db #0x35	; 53
	.db #0xD4	; 212
	.db #0xB6	; 182
	.db #0x00	; 0
	.db #0xB6	; 182
	.db #0x05	; 5
	.db #0xD4	; 212
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x31	; 49
	.db #0xD4	; 212
	.db #0xB6	; 182
	.db #0x00	; 0
	.db #0xB6	; 182
	.db #0x1B	; 27
	.db #0x9C	; 156
	.db #0xB6	; 182
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x09	; 9
	.db #0xD9	; 217
	.db #0xB6	; 182
	.db #0x12	; 18
	.db #0x00	; 0
	.db #0xD9	; 217
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xD4	; 212
	.db #0x00	; 0
	.db #0xD4	; 212
	.db #0x00	; 0
	.db #0xD4	; 212
	.db #0x0B	; 11
	.db #0x9C	; 156
	.db #0xB6	; 182
	.db #0x00	; 0
	.db #0xD4	; 212
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0xD9	; 217
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0xD4	; 212
	.db #0xB6	; 182
	.db #0x00	; 0
	.db #0xB6	; 182
	.db #0x0A	; 10
	.db #0xFB	; 251
	.db #0xB6	; 182
	.db #0x22	; 34
	.db #0xD4	; 212
	.db #0xB6	; 182
	.db #0x00	; 0
	.db #0xD4	; 212
	.db #0x31	; 49
	.db #0xD4	; 212
	.db #0xD9	; 217
	.db #0x11	; 17
	.db #0xD4	; 212
	.db #0xD9	; 217
	.db #0x0A	; 10
	.db #0x9B	; 155
	.db #0xB6	; 182
	.db #0x00	; 0
	.db #0xD4	; 212
	.db #0x00	; 0
	.db #0xD4	; 212
	.db #0x00	; 0
	.db #0xD4	; 212
	.db #0x00	; 0
	.db #0xD4	; 212
	.db #0x01	; 1
	.db #0xD4	; 212
	.db #0xD9	; 217
	.db #0x21	; 33
	.db #0xD4	; 212
	.db #0xD9	; 217
	.db #0x31	; 49
	.db #0xD4	; 212
	.db #0xB6	; 182
	.db #0x0A	; 10
	.db #0xFB	; 251
	.db #0xB6	; 182
	.db #0x00	; 0
	.db #0xB6	; 182
	.db #0x13	; 19
	.db #0xFF	; 255
	.db #0xB6	; 182
	.db #0x09	; 9
	.db #0xD9	; 217
	.db #0xB6	; 182
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0xD9	; 217
	.db #0x00	; 0
	.db #0xD4	; 212
_g_TrackTiles03:
	.db #0x00	; 0
	.db #0xD4	; 212
	.db #0x01	; 1
	.db #0xD4	; 212
	.db #0xFB	; 251
	.db #0x0A	; 10
	.db #0x8B	; 139
	.db #0xFB	; 251
	.db #0x00	; 0
	.db #0xFB	; 251
	.db #0x0A	; 10
	.db #0x8B	; 139
	.db #0xFB	; 251
	.db #0x0A	; 10
	.db #0x9B	; 155
	.db #0xFB	; 251
	.db #0x11	; 17
	.db #0xD4	; 212
	.db #0xFB	; 251
	.db #0x02	; 2
	.db #0xD4	; 212
	.db #0xFB	; 251
	.db #0x0A	; 10
	.db #0x9B	; 155
	.db #0xFB	; 251
	.db #0x3B	; 59
	.db #0x9C	; 156
	.db #0xFB	; 251
	.db #0x21	; 33
	.db #0xD4	; 212
	.db #0xFB	; 251
	.db #0x00	; 0
	.db #0xFB	; 251
	.db #0x0A	; 10
	.db #0x8B	; 139
	.db #0xFB	; 251
	.db #0x21	; 33
	.db #0xD4	; 212
	.db #0xFB	; 251
	.db #0x19	; 25
	.db #0x50	; 80	P
	.db #0xFB	; 251
	.db #0x31	; 49
	.db #0xD4	; 212
	.db #0xFB	; 251
	.db #0x21	; 33
	.db #0xD4	; 212
	.db #0xFB	; 251
	.db #0x00	; 0
	.db #0xD4	; 212
	.db #0x19	; 25
	.db #0xFF	; 255
	.db #0xFB	; 251
	.db #0x31	; 49
	.db #0xD4	; 212
	.db #0xFB	; 251
	.db #0x11	; 17
	.db #0xD4	; 212
	.db #0xFB	; 251
	.db #0x00	; 0
	.db #0x50	; 80	P
	.db #0x00	; 0
	.db #0xD4	; 212
	.db #0x00	; 0
	.db #0xD4	; 212
	.db #0x00	; 0
	.db #0xD4	; 212
	.db #0x0A	; 10
	.db #0x9B	; 155
	.db #0xFF	; 255
	.db #0x09	; 9
	.db #0xFB	; 251
	.db #0xFF	; 255
	.db #0x0A	; 10
	.db #0x9B	; 155
	.db #0xFB	; 251
	.db #0x19	; 25
	.db #0xB6	; 182
	.db #0x50	; 80	P
	.db #0x00	; 0
	.db #0xD4	; 212
	.db #0x00	; 0
	.db #0xD4	; 212
	.db #0x00	; 0
	.db #0xD4	; 212
	.db #0x00	; 0
	.db #0xD4	; 212
	.db #0x32	; 50
	.db #0xD4	; 212
	.db #0xFB	; 251
	.db #0x12	; 18
	.db #0xD4	; 212
	.db #0xFB	; 251
	.db #0x00	; 0
	.db #0xB6	; 182
	.db #0x0B	; 11
	.db #0xD9	; 217
	.db #0xB6	; 182
	.db #0x09	; 9
	.db #0x8B	; 139
	.db #0xB6	; 182
	.db #0x09	; 9
	.db #0xD9	; 217
	.db #0x8B	; 139
	.db #0x09	; 9
	.db #0xFB	; 251
	.db #0xD9	; 217
	.db #0x13	; 19
	.db #0xFF	; 255
	.db #0xFB	; 251
	.db #0x22	; 34
	.db #0xD4	; 212
	.db #0xFB	; 251
_g_Tracks:
	.dw _str_0
	.db #0x07	; 7
	.db #0x06	; 6
	.dw _testTrack
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x40	; 64
	.db #0x19	; 25
	.db #0x64	; 100	d
	.db #0x28	; 40
	.db #0x64	; 100	d
	.db #0x19	; 25
	.db #0x78	; 120	x
	.db #0x28	; 40
	.db #0x78	; 120	x
	.dw _str_1
	.db #0x07	; 7
	.db #0x06	; 6
	.dw _testTrack
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x80	; 128
	.db #0x82	; 130
	.db #0xB4	; 180
	.db #0x82	; 130
	.db #0xC3	; 195
	.db #0x91	; 145
	.db #0xB4	; 180
	.db #0x91	; 145
	.db #0xC3	; 195
	.dw _str_2
	.db #0x07	; 7
	.db #0x06	; 6
	.dw _testTrack
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x82	; 130
	.db #0xB4	; 180
	.db #0x82	; 130
	.db #0xC3	; 195
	.db #0x91	; 145
	.db #0xB4	; 180
	.db #0x91	; 145
	.db #0xC3	; 195
_g_MenuMain:
	.dw _str_3
	.db #0x03	; 3
	.dw #0x0000
	.db #0x00	;  0
	.dw _str_4
	.db #0x80	; 128
	.dw #0x0000
	.db #0x00	;  0
	.dw _str_5
	.db #0x80	; 128
	.dw #0x0000
	.db #0x00	;  0
	.dw _str_6
	.db #0x80	; 128
	.dw #0x0000
	.db #0x00	;  0
_g_MenuMode:
	.dw _str_7
	.db #0x02	; 2
	.dw _SelectRule
	.db #0x00	;  0
	.dw _str_8
	.db #0x80	; 128
	.dw _SelectRule
	.db #0x01	;  1
	.dw _str_9
	.db #0x80	; 128
	.dw _SelectRule
	.db #0x02	;  2
	.dw _str_10
	.db #0x80	; 128
	.dw _SelectRule
	.db #0x03	;  3
	.dw _str_11
	.db #0x03	; 3
	.dw #0x0000
	.db #0x00	;  0
_g_MenuTrack:
	.dw _str_12
	.db #0x04	; 4
	.dw #0x0000
	.db #0x00	;  0
	.dw _str_13
	.db #0x80	; 128
	.dw #0x0000
	.db #0x00	;  0
	.dw _str_11
	.db #0x01	; 1
	.dw #0x0000
	.db #0x00	;  0
_g_MenuPlayer:
	.dw _str_14
	.db #0x01	; 1
	.dw _SelectPlayer
	.db #0x02	;  2
	.dw _str_15
	.db #0x01	; 1
	.dw _SelectPlayer
	.db #0x03	;  3
	.dw _str_16
	.db #0x01	; 1
	.dw _SelectPlayer
	.db #0x04	;  4
	.dw _str_11
	.db #0x00	; 0
	.dw #0x0000
	.db #0x00	;  0
_g_MenuTrackList:
	.dw _str_0
	.db #0x81	; 129
	.dw _StartGame
	.db #0x00	;  0
	.dw _str_1
	.db #0x81	; 129
	.dw _StartGame
	.db #0x01	;  1
	.dw _str_2
	.db #0x81	; 129
	.dw _StartGame
	.db #0x02	;  2
	.dw _str_11
	.db #0x02	; 2
	.dw #0x0000
	.db #0x00	;  0
_g_Menus:
	.dw _str_17
	.dw _str_18
	.dw _g_MenuMain
	.db #0x04	; 4
	.dw _str_19
	.dw _str_20
	.dw _g_MenuMode
	.db #0x05	; 5
	.dw _str_21
	.dw _str_22
	.dw _g_MenuTrack
	.db #0x03	; 3
	.dw _str_23
	.dw _str_24
	.dw _g_MenuPlayer
	.db #0x04	; 4
	.dw _str_25
	.dw _str_26
	.dw _g_MenuTrackList
	.db #0x04	; 4
_g_HeightTab:
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
_g_DefaultColor:
	.db #0x02	; 2
	.db #0x0A	; 10
	.db #0x0A	; 10
	.db #0x0E	; 14
	.db #0x0E	; 14
	.db #0x0A	; 10
	.db #0x0A	; 10
	.db #0x02	; 2
_g_AnimIndex:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x02	; 2
_g_SmokeFrq:
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0xFF	; 255
_str_0:
	.ascii "AOI1"
	.db 0x00
_str_1:
	.ascii "NOE1"
	.db 0x00
_str_2:
	.ascii "NOE2"
	.db 0x00
_str_3:
	.ascii "PLAY"
	.db 0x00
_str_4:
	.ascii "EDITOR"
	.db 0x00
_str_5:
	.ascii "OPTIONS"
	.db 0x00
_str_6:
	.ascii "CREDITS"
	.db 0x00
_str_7:
	.ascii "RACE"
	.db 0x00
_str_8:
	.ascii "SURVIVOR"
	.db 0x00
_str_9:
	.ascii "TAG"
	.db 0x00
_str_10:
	.ascii "SOCCER"
	.db 0x00
_str_11:
	.ascii "BACK"
	.db 0x00
_str_12:
	.ascii "FROM ROM"
	.db 0x00
_str_13:
	.ascii "FROM DISK"
	.db 0x00
_str_14:
	.ascii "2 PLAYERS"
	.db 0x00
_str_15:
	.ascii "3 PLAYERS"
	.db 0x00
_str_16:
	.ascii "4 PLAYERS"
	.db 0x00
_str_17:
	.db 0x00
_str_18:
	.ascii "PRESS SPACE"
	.db 0x00
_str_19:
	.ascii "GAME MODE"
	.db 0x00
_str_20:
	.ascii "PRESS SPACE"
	.db 0x00
_str_21:
	.ascii "TRACK SELECT"
	.db 0x00
_str_22:
	.ascii "PRESS SPACE"
	.db 0x00
_str_23:
	.ascii "PLAYER SELECT"
	.db 0x00
_str_24:
	.ascii "PRESS SPACE"
	.db 0x00
_str_25:
	.ascii "TRACK SELECT"
	.db 0x00
_str_26:
	.ascii "PRESS SPACE"
	.db 0x00
;carwar.c:692: void MainLoop()
;	---------------------------------
; Function MainLoop
; ---------------------------------
_MainLoop_start::
_MainLoop:
;carwar.c:695: game.state = StateInitialize;
	ld	hl,#0x017a + _game
	ld	(hl),#<(_StateInitialize)
	inc	hl
	ld	(hl),#>(_StateInitialize)
;carwar.c:697: while(1)
00102$:
;carwar.c:700: game.state();
	ld	hl,#0x017a + _game
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
;carwar.c:705: void StateInitialize()
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
;carwar.c:709: game.vdp36.ARG = 0; 
	ld	hl,#0x0009 + 0x09af + _game
	ld	(hl),#0x00
;carwar.c:710: game.vdp32.ARG = 0; 
	ld	hl,#0x000d + 0x09a0 + _game
	ld	(hl),#0x00
;carwar.c:713: SetFreq(FREQ_50);
	ld	a,#0x20
	push	af
	inc	sp
	call	_SetFreq
	inc	sp
;carwar.c:714: SetScreen8(LINES_212);
	ld	a,#0x80
	push	af
	inc	sp
	call	_SetScreen8
	inc	sp
;carwar.c:715: SetSpriteMode(SPRITE_ON, SPRITE_NO_MAG + SPRITE_SIZE_8, 0xF800 >> 11, 0xF700 >> 7);
	ld	hl,#0x01EE
	push	hl
	ld	hl,#0x001F
	push	hl
	ld	l, #0x00
	push	hl
	call	_SetSpriteMode
	pop	af
	pop	af
	pop	af
;carwar.c:717: for(i=0; i<5; i++)
	ld	bc,#0x0000
00104$:
	ld	a,c
	sub	a,#0x05
	ld	a,b
	sbc	a,#0x00
	jr	NC,00107$
;carwar.c:718: game.timer[i]= 0;
	ld	hl,#0x0dba + _game
	add	hl,bc
	ex	de,hl
	ld	a,#0x00
	ld	(de),a
;carwar.c:717: for(i=0; i<5; i++)
	inc	bc
	jr	00104$
00107$:
;carwar.c:719: SetHook(H_TIMI, (u16)VBlankInterrupt);
	ld	l,#<(_VBlankInterrupt)
	ld	h,#>(_VBlankInterrupt)
	push	hl
	ld	hl,#0xFD9F
	push	hl
	call	_SetHook
	pop	af
;carwar.c:722: FillVRAM(0, 0,   256, 256, 0);
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
;carwar.c:723: FillVRAM(0, 256, 256, 256, 0);
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
;carwar.c:726: for(x=0; x<256; x++)
	ld	bc,#0x0000
00108$:
	ld	a,b
	sub	a,#0x01
	jr	NC,00111$
;carwar.c:727: game.colorCode[x] = OP_NONE;
	ld	hl,#0x0009 + _game
	add	hl,bc
	ex	de,hl
	ld	a,#0x00
	ld	(de),a
;carwar.c:726: for(x=0; x<256; x++)
	inc	bc
	jr	00108$
00111$:
;carwar.c:729: game.colorCode[COLOR_KHAKI]        = OP_WALL;
	ld	hl,#0x00d4 + 0x0009 + _game
	ld	(hl),#0x00
;carwar.c:730: game.colorCode[COLOR_DARKKAKHI]    = OP_WALL;
	ld	hl,#0x008c + 0x0009 + _game
	ld	(hl),#0x00
;carwar.c:731: game.colorCode[COLOR_SKIN]         = OP_BLADE;
	ld	hl,#0x00ba + 0x0009 + _game
	ld	(hl),#0x01
;carwar.c:732: game.colorCode[COLOR_DARKSKIN]     = OP_BLADE;
	ld	hl,#0x0071 + 0x0009 + _game
	ld	(hl),#0x01
;carwar.c:733: game.colorCode[COLOR_PINK]         = OP_BUMPER;
	ld	hl,#0x001e + 0x0009 + _game
	ld	(hl),#0x02
;carwar.c:734: game.colorCode[COLOR_DARKPINK]     = OP_BUMPER;
	ld	hl,#0x0015 + 0x0009 + _game
	ld	(hl),#0x02
;carwar.c:735: game.colorCode[COLOR_SAND]         = OP_ASPHALT;
	ld	hl,#0x00da + 0x0009 + _game
	ld	(hl),#0x09
;carwar.c:736: game.colorCode[COLOR_LIGHTMAUVE]   = OP_ASPHALT;
	ld	hl,#0x00b7 + 0x0009 + _game
	ld	(hl),#0x09
;carwar.c:737: game.colorCode[COLOR_GRAY]         = OP_ASPHALT;
	dec	hl
	ld	(hl),#0x09
;carwar.c:738: game.colorCode[COLOR_DARKGRAY]     = OP_ASPHALT;
	ld	hl,#0x006d + 0x0009 + _game
	ld	(hl),#0x09
;carwar.c:739: game.colorCode[COLOR_BROWN]        = OP_MUD;
	ld	hl,#0x0050 + 0x0009 + _game
	ld	(hl),#0x0A
;carwar.c:740: game.colorCode[COLOR_DARKBROWN]    = OP_MUD;
	ld	hl,#0x0028 + 0x0009 + _game
	ld	(hl),#0x0A
;carwar.c:741: game.colorCode[COLOR_YELLOW]       = OP_SAND;
	ld	hl,#0x00d9 + 0x0009 + _game
	ld	(hl),#0x0B
;carwar.c:742: game.colorCode[COLOR_DARKYELLOW]   = OP_SAND;
	ld	hl,#0x0090 + 0x0009 + _game
	ld	(hl),#0x0B
;carwar.c:743: game.colorCode[COLOR_GREEN]        = OP_GRASS;
	ld	hl,#0x00a0 + 0x0009 + _game
	ld	(hl),#0x0C
;carwar.c:744: game.colorCode[COLOR_DARKGREEN]    = OP_GRASS;
	ld	hl,#0x0060 + 0x0009 + _game
	ld	(hl),#0x0C
;carwar.c:745: game.colorCode[COLOR_WHITE]        = OP_SNOW;
	ld	hl,#0x00ff + 0x0009 + _game
	ld	(hl),#0x0D
;carwar.c:746: game.colorCode[COLOR_LIGHTGRAY]    = OP_SNOW;
	ld	hl,#0x00db + 0x0009 + _game
	ld	(hl),#0x0D
;carwar.c:747: game.colorCode[COLOR_CYAN]         = OP_ICE;
	ld	hl,#0x00fb + 0x0009 + _game
	ld	(hl),#0x0E
;carwar.c:748: game.colorCode[COLOR_LIGHTBLUE]    = OP_ICE;
	ld	hl,#0x00d7 + 0x0009 + _game
	ld	(hl),#0x0E
;carwar.c:749: game.colorCode[COLOR_BLUE]         = OP_WATER;
	ld	hl,#0x008b + 0x0009 + _game
	ld	(hl),#0x0F
;carwar.c:750: game.colorCode[COLOR_DARKBLUE]     = OP_WATER;
	ld	hl,#0x0047 + 0x0009 + _game
	ld	(hl),#0x0F
;carwar.c:751: game.colorCode[COLOR_MAUVE]        = OP_SPEEDER;
	ld	hl,#0x009b + 0x0009 + _game
	ld	(hl),#0x04
;carwar.c:752: game.colorCode[COLOR_DARKMAUVE]    = OP_SPEEDER;
	ld	hl,#0x0072 + 0x0009 + _game
	ld	(hl),#0x04
;carwar.c:753: game.colorCode[COLOR_ORANGE]       = OP_JUMPER;
	ld	hl,#0x009c + 0x0009 + _game
	ld	(hl),#0x05
;carwar.c:754: game.colorCode[COLOR_DARKORANGE]   = OP_JUMPER;
	ld	hl,#0x0058 + 0x0009 + _game
	ld	(hl),#0x05
;carwar.c:755: game.colorCode[COLOR_RED]          = OP_MAGMA;
	ld	hl,#0x003c + 0x0009 + _game
	ld	(hl),#0x06
;carwar.c:756: game.colorCode[COLOR_DARKRED]      = OP_MAGMA;
	ld	hl,#0x0034 + 0x0009 + _game
	ld	(hl),#0x06
;carwar.c:757: game.colorCode[COLOR_BLACK]        = OP_HOLE;
	ld	hl,#0x0009 + _game
	ld	(hl),#0x08
;carwar.c:758: game.colorCode[COLOR_NAVYBLUE]     = OP_HOLE;
	ld	hl,#0x0002 + 0x0009 + _game
	ld	(hl),#0x08
;carwar.c:759: game.colorCode[COLOR_DARKNAVYBLUE] = OP_HOLE;
	dec	hl
	ld	(hl),#0x08
;carwar.c:760: game.colorCode[COLOR_LIME]         = OP_HEALTH;
	ld	hl,#0x00f8 + 0x0009 + _game
	ld	(hl),#0x07
;carwar.c:761: game.colorCode[COLOR_DARKLIME]     = OP_HEALTH;
	ld	hl,#0x00b0 + 0x0009 + _game
	ld	(hl),#0x07
;carwar.c:764: for(x=0; x<sizeof(g_CharTable) / 8; x++)
	ld	-2 (ix),#0x00
	ld	-1 (ix),#0x00
00112$:
	ld	a,-2 (ix)
	sub	a,#0x40
	ld	a,-1 (ix)
	sbc	a,#0x00
	jr	NC,00115$
;carwar.c:766: RAMtoVRAM(Modulo2(x * 8, 256), 248 + (x / 32), 8, 1, (u16)&g_CharTable[x * 8]);
	ld	e,-2 (ix)
	ld	d,-1 (ix)
	sla	e
	rl	d
	sla	e
	rl	d
	sla	e
	rl	d
	ld	hl,#_g_CharTable
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
;carwar.c:764: for(x=0; x<sizeof(g_CharTable) / 8; x++)
	inc	-2 (ix)
	jr	NZ,00112$
	inc	-1 (ix)
	jr	00112$
00115$:
;carwar.c:770: for(x=0; x<256; x++)
	ld	-2 (ix),#0x00
	ld	-1 (ix),#0x00
00120$:
	ld	a,-1 (ix)
	sub	a,#0x01
	jp	NC,00123$
;carwar.c:772: for(i=0; i<8; i++)
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
00116$:
	ld	a,-4 (ix)
	sub	a,#0x08
	ld	a,-3 (ix)
	sbc	a,#0x00
	jr	NC,00122$
;carwar.c:774: if(x & (1 << (7 - (i & 0x07))))
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
	jr	00156$
00155$:
	sla	c
	rl	b
00156$:
	dec	a
	jr	NZ,00155$
	ld	a,-2 (ix)
	and	a,c
	ld	l,a
	ld	a,-1 (ix)
	and	a,b
	ld	h,a
	ld	a,l
	or	a,h
	jr	Z,00102$
;carwar.c:775: game.bitToByte[x * 8 + i] = 0xFF;
	ld	a,-6 (ix)
	add	a,-4 (ix)
	ld	c,a
	ld	a,-5 (ix)
	adc	a,-3 (ix)
	ld	b,a
	ld	hl,#0x017c + _game
	add	hl,bc
	ld	(hl),#0xFF
	jr	00118$
00102$:
;carwar.c:777: game.bitToByte[x * 8 + i] = 0x00;
	ld	a,e
	add	a,-4 (ix)
	ld	c,a
	ld	a,d
	adc	a,-3 (ix)
	ld	b,a
	ld	hl,#0x017c + _game
	add	hl,bc
	ld	(hl),#0x00
00118$:
;carwar.c:772: for(i=0; i<8; i++)
	inc	-4 (ix)
	jr	NZ,00116$
	inc	-3 (ix)
	jr	00116$
00122$:
;carwar.c:770: for(x=0; x<256; x++)
	inc	-2 (ix)
	jp	NZ,00120$
	inc	-1 (ix)
	jp	00120$
00123$:
;carwar.c:782: for(x=0; x<12; x++)
	ld	-2 (ix),#0x00
	ld	-1 (ix),#0x00
	ld	de,#0x0000
00124$:
	ld	a,-2 (ix)
	sub	a,#0x0C
	ld	a,-1 (ix)
	sbc	a,#0x00
	jr	NC,00127$
;carwar.c:783: game.smokes[x].step = 0xFF;
	ld	hl,#0x097c + _game
	add	hl,de
	ld	(hl),#0xFF
;carwar.c:782: for(x=0; x<12; x++)
	inc	de
	inc	de
	inc	de
	inc	-2 (ix)
	jr	NZ,00124$
	inc	-1 (ix)
	jr	00124$
00127$:
;carwar.c:785: game.track = 0;
	ld	hl,#0x0006 + _game
	ld	(hl),#0x00
;carwar.c:786: game.page = 0;
	dec	hl
	ld	(hl),#0x00
;carwar.c:788: game.state = StateStartGame;
	ld	hl,#0x017a + _game
	ld	(hl),#<(_StateStartGame)
	inc	hl
	ld	(hl),#>(_StateStartGame)
	ld	sp,ix
	pop	ix
	ret
_StateInitialize_end::
;carwar.c:792: void InitializeMenu(u8 menu)
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
;carwar.c:795: game.menu = menu;
	ld	hl,#0x0001 + _game
	ld	a,4 (ix)
	ld	(hl),a
;carwar.c:796: game.item = 0;
	inc	hl
	ld	(hl),#0x00
;carwar.c:798: game.page = 1;
	ld	hl,#0x0005 + _game
	ld	(hl),#0x01
;carwar.c:799: SetPage8(game.page);
	ld	a, (hl)
	push	af
	inc	sp
	call	_SetPage8
	inc	sp
;carwar.c:801: HMMV(MENU_X, MENU_Y, 256 - MENU_X, 212 - MENU_Y, COLOR_BLACK);
	ld	hl,#0x09af + _game
	ld	(hl),#0x54
	inc	hl
	ld	(hl),#0x00
	ld	hl,#0x0002 + 0x09af + _game
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
	inc	hl
	ld	(hl),#0xC0
	ld	l,#<(0x09af + _game)
	ld	h,#>(0x09af + _game)
	push	hl
	call	_VPDCommand36
	pop	af
;carwar.c:803: DrawText(MENU_X, MENU_Y, g_Menus[game.menu].title, COLOR_WHITE);
	ld	a,(#0x0001 + _game)
	ld	e,a
	add	a,a
	add	a,e
	add	a,a
	add	a,e
	add	a,#<(_g_Menus)
	ld	l, a
	ld	a, #>(_g_Menus)
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
;carwar.c:804: for(item = 0; item < g_Menus[game.menu].itemNum; item++)
	ld	-1 (ix),#0x00
	ld	de,#0x0000
	ld	-3 (ix),#0x00
	ld	-2 (ix),#0x00
	ld	-5 (ix),#0x00
	ld	-4 (ix),#0x00
00101$:
	ld	hl,#0x0001 + _game
	ld	l,(hl)
	push	de
	ld	a,l
	ld	e,a
	add	a,a
	add	a,e
	add	a,a
	add	a,e
	pop	de
	add	a,#<(_g_Menus)
	ld	c,a
	ld	a,#>(_g_Menus)
	adc	a,#0x00
	ld	b,a
	ld	hl,#0x0006
	add	hl,bc
	ld	a,-1 (ix)
	sub	a,(hl)
	jp	NC,00104$
;carwar.c:806: DrawText(MENU_X + 12, MENU_Y + TITLE_SPACE + LINE_SPACE * item, g_Menus[game.menu].items[item].text, g_Menus[game.menu].items[item].nextIdx == ITEM_INVALID ? COLOR_GRAY : COLOR_WHITE);
	ld	hl,#0x0001 + _game
	ld	l,(hl)
	push	de
	ld	a,l
	ld	e,a
	add	a,a
	add	a,e
	add	a,a
	add	a,e
	pop	de
	add	a,#<(_g_Menus)
	ld	l, a
	ld	a, #>(_g_Menus)
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
	ld	hl,#0x0001 + _game
	ld	l,(hl)
	push	de
	ld	a,l
	ld	e,a
	add	a,a
	add	a,e
	add	a,a
	add	a,e
	pop	de
	add	a,#<(_g_Menus)
	ld	l, a
	ld	a, #>(_g_Menus)
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
;carwar.c:804: for(item = 0; item < g_Menus[game.menu].itemNum; item++)
	ld	hl,#0x0006
	add	hl,de
	ex	de,hl
	ld	a,-3 (ix)
	add	a,#0x06
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
;carwar.c:809: HMMM(MENU_X, MENU_Y, MENU_X, MENU_Y + 256, 256 - MENU_X, 212 - MENU_Y);
	ld	hl,#0x09a0 + _game
	ld	(hl),#0x54
	inc	hl
	ld	(hl),#0x00
	ld	hl,#0x0002 + 0x09a0 + _game
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
	ld	hl,#0x000e + 0x09a0 + _game
	ld	(hl),#0xD0
	ld	l,#<(0x09a0 + _game)
	ld	h,#>(0x09a0 + _game)
	push	hl
	call	_VPDCommand32
	ld	sp,ix
	pop	ix
	ret
_InitializeMenu_end::
;carwar.c:813: void StateTitle()
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
;carwar.c:817: SetPage8(1);
	ld	a,#0x01
	push	af
	inc	sp
	call	_SetPage8
	inc	sp
;carwar.c:818: FillVRAM(0,   0, 256, 212, 0);
	ld	a,#0x00
	push	af
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
;carwar.c:819: FillVRAM(0, 256, 256, 212, 0);
	ld	a,#0x00
	push	af
	inc	sp
	ld	hl,#0x00D4
	push	hl
	ld	hl,#0x0100
	push	hl
	ld	l, #0x00
	push	hl
	ld	h, #0x00
	push	hl
	call	_FillVRAM
	ld	hl,#0x0009
	add	hl,sp
	ld	sp,hl
;carwar.c:822: for(j=0; j<24; j++)
	ld	-2 (ix),#0x00
	ld	de,#0x0000
00107$:
	ld	a,-2 (ix)
	sub	a,#0x18
	jp	NC,00110$
;carwar.c:824: for(i=0; i<232; i++)
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
;carwar.c:826: byte = g_Title[(i >> 3) + (j * 232 >> 3)];
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
	ld	hl,#_g_Title
	add	hl,bc
	ld	a,(hl)
	ld	-3 (ix),a
;carwar.c:827: if(byte & (1 << (7 - (i & 0x07))))
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
;carwar.c:829: WriteVRAM(0, TITLE_X + i + 256 * (TITLE_Y + j), GrayGradiant(i + j));
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
;carwar.c:824: for(i=0; i<232; i++)
	inc	-1 (ix)
	jp	00103$
00106$:
;carwar.c:833: HMMM(TITLE_X, TITLE_Y + j, TITLE_X, TITLE_Y + 256 + j, 232, 1);
	ld	hl,#0x09a0 + _game
	ld	(hl),#0x10
	inc	hl
	ld	(hl),#0x00
	ld	a,-2 (ix)
	ld	-8 (ix),a
	ld	-7 (ix),#0x00
	ld	a,-8 (ix)
	add	a,#0x20
	ld	c,a
	ld	a,-7 (ix)
	adc	a,#0x00
	ld	b,a
	ld	hl,#0x0002 + 0x09a0 + _game
	ld	(hl),c
	inc	hl
	ld	(hl),b
	inc	hl
	ld	(hl),#0x10
	inc	hl
	ld	(hl),#0x00
	ld	a,-8 (ix)
	add	a,#0x20
	ld	c,a
	ld	a,-7 (ix)
	adc	a,#0x01
	ld	b,a
	inc	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
	inc	hl
	ld	(hl),#0xE8
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x01
	inc	hl
	ld	(hl),#0x00
	ld	hl,#0x000e + 0x09a0 + _game
	ld	(hl),#0xD0
	ld	l,#<(0x09a0 + _game)
	ld	h,#>(0x09a0 + _game)
	push	de
	push	hl
	call	_VPDCommand32
	pop	af
	pop	de
;carwar.c:822: for(j=0; j<24; j++)
	ld	hl,#0x00E8
	add	hl,de
	ex	de,hl
	inc	-2 (ix)
	jp	00107$
00110$:
;carwar.c:836: InitializeMenu(0);
	ld	a,#0x00
	push	af
	inc	sp
	call	_InitializeMenu
	inc	sp
;carwar.c:837: game.pressed = 0;
	ld	hl,#0x0003 + _game
	ld	(hl),#0x00
;carwar.c:838: game.page = 0;
	inc	hl
	inc	hl
	ld	(hl),#0x00
;carwar.c:839: game.state = StateMainMenu;
	ld	hl,#0x017a + _game
	ld	(hl),#<(_StateMainMenu)
	inc	hl
	ld	(hl),#>(_StateMainMenu)
	ld	sp,ix
	pop	ix
	ret
_StateTitle_end::
;carwar.c:843: void StateMainMenu()
;	---------------------------------
; Function StateMainMenu
; ---------------------------------
_StateMainMenu_start::
_StateMainMenu:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;carwar.c:847: SetPage8(game.page);
	ld	a,(#0x0005 + _game)
	push	af
	inc	sp
	call	_SetPage8
	inc	sp
;carwar.c:848: game.page = 1 - game.page;
	ld	hl,#0x0005 + _game
	ld	l,(hl)
	ld	a,#0x01
	sub	a,l
	ld	hl,#0x0005 + _game
	ld	(hl),a
;carwar.c:849: game.yOffset = 256 * game.page;
	ld	b, (hl)
	ld	c,#0x00
	ld	hl,#0x0007 + _game
	ld	(hl),c
	inc	hl
	ld	(hl),b
;carwar.c:852: keyLine = GetKeyMatrixLine(8);
	ld	a,#0x08
	push	af
	inc	sp
	call	_GetKeyMatrixLine
	inc	sp
	ld	c,l
;carwar.c:853: if((keyLine & KEY_SPACE) == 0
	ld	a,c
	and	a,#0x01
	jr	Z,00105$
;carwar.c:854: || Joytrig(1) != 0
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
;carwar.c:855: || Joytrig(2) != 0)
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
;carwar.c:857: if(g_Menus[game.menu].items[game.item].action != 0)
	ld	a,(#0x0001 + _game)
	ld	e,a
	add	a,a
	add	a,e
	add	a,a
	add	a,e
	add	a,#<(_g_Menus)
	ld	b,a
	ld	a,#>(_g_Menus)
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
	ld	hl,#0x0002 + _game
	ld	l,(hl)
	push	de
	ld	e,l
	ld	d,#0x00
	ld	l,e
	ld	h,d
	add	hl,hl
	add	hl,de
	add	hl,hl
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
	jp	Z,00102$
;carwar.c:858: g_Menus[game.menu].items[game.item].action(g_Menus[game.menu].items[game.item].value);
	ld	a,(#0x0001 + _game)
	ld	e,a
	add	a,a
	add	a,e
	add	a,a
	add	a,e
	add	a,#<(_g_Menus)
	ld	b,a
	ld	a,#>(_g_Menus)
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
	ld	hl,#0x0002 + _game
	ld	l,(hl)
	push	de
	ld	e,l
	ld	d,#0x00
	ld	l,e
	ld	h,d
	add	hl,hl
	add	hl,de
	add	hl,hl
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
	ld	-2 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-1 (ix),a
	ld	a,(#0x0001 + _game)
	ld	e,a
	add	a,a
	add	a,e
	add	a,a
	add	a,e
	add	a,#<(_g_Menus)
	ld	e,a
	ld	a,#>(_g_Menus)
	adc	a,#0x00
	ld	b,a
	ld	a,e
	add	a,#0x04
	ld	e,a
	ld	a,b
	adc	a,#0x00
	ld	h, a
	ld	l, e
	ld	e,(hl)
	inc	hl
	ld	c,(hl)
	ld	hl,#0x0002 + _game
	ld	l,(hl)
	push	de
	ld	e,l
	ld	d,#0x00
	ld	l,e
	ld	h,d
	add	hl,hl
	add	hl,de
	add	hl,hl
	pop	de
	ld	d,l
	ld	b,h
	ld	a,e
	add	a,d
	ld	d,a
	ld	a,c
	adc	a,b
	ld	b,a
	ld	a,d
	add	a,#0x05
	ld	d,a
	ld	a,b
	adc	a,#0x00
	ld	b, a
	ld	l, d
	ld	h, a
	ld	a, (hl)
	push	af
	inc	sp
	ld	hl,#00137$
	push	hl
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	jp	(hl)
00137$:
	inc	sp
00102$:
;carwar.c:859: if((g_Menus[game.menu].items[game.item].nextIdx & 0x80) == 0)
	ld	a,(#0x0001 + _game)
	ld	e,a
	add	a,a
	add	a,e
	add	a,a
	add	a,e
	add	a,#<(_g_Menus)
	ld	b,a
	ld	a,#>(_g_Menus)
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
	ld	hl,#0x0002 + _game
	ld	l,(hl)
	push	de
	ld	e,l
	ld	d,#0x00
	ld	l,e
	ld	h,d
	add	hl,hl
	add	hl,de
	add	hl,hl
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
	jp	NZ,00123$
;carwar.c:860: InitializeMenu(g_Menus[game.menu].items[game.item].nextIdx);
	ld	a,(#0x0001 + _game)
	ld	e,a
	add	a,a
	add	a,e
	add	a,a
	add	a,e
	add	a,#<(_g_Menus)
	ld	b,a
	ld	a,#>(_g_Menus)
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
	ld	hl,#0x0002 + _game
	ld	l,(hl)
	push	de
	ld	e,l
	ld	d,#0x00
	ld	l,e
	ld	h,d
	add	hl,hl
	add	hl,de
	add	hl,hl
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
;carwar.c:861: return;
	jp	00123$
00106$:
;carwar.c:865: if(game.pressed > 16)
	ld	hl,#0x0003 + _game
	ld	l,(hl)
	ld	a,#0x10
	sub	a,l
	jr	NC,00110$
;carwar.c:866: game.pressed = 0;
	ld	hl,#0x0003 + _game
	ld	(hl),#0x00
00110$:
;carwar.c:867: if(((keyLine & KEY_UP) == 0) && (game.item > 0))
	ld	a,c
	and	a,#0x20
	jr	NZ,00120$
	ld	hl,#0x0002 + _game
	ld	a,(hl)
	or	a,a
	jr	Z,00120$
;carwar.c:869: if(game.pressed == 0)
	inc	hl
	ld	a,(hl)
	or	a,a
	jr	NZ,00112$
;carwar.c:870: game.item--;
	dec	hl
	ld	a, (hl)
	dec	a
	ld	(#0x0002 + _game),a
00112$:
;carwar.c:871: game.pressed++;
	ld	a,(#0x0003 + _game)
	inc	a
	ld	(#0x0003 + _game),a
	jr	00121$
00120$:
;carwar.c:873: else if(((keyLine & KEY_DOWN) == 0) && (game.item < g_Menus[game.menu].itemNum - 1))
	ld	a,c
	and	a,#0x40
	jr	NZ,00116$
	ld	hl,#0x0002 + _game
	ld	c,(hl)
	dec	hl
	ld	a, (hl)
	ld	e,a
	add	a,a
	add	a,e
	add	a,a
	add	a,e
	add	a,#<(_g_Menus)
	ld	b,a
	ld	a,#>(_g_Menus)
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
;carwar.c:875: if(game.pressed == 0)
	ld	hl,#0x0003 + _game
	ld	a,(hl)
	or	a,a
	jr	NZ,00114$
;carwar.c:876: game.item++;
	dec	hl
	ld	a, (hl)
	inc	a
	ld	(#0x0002 + _game),a
00114$:
;carwar.c:877: game.pressed++;
	ld	a,(#0x0003 + _game)
	inc	a
	ld	(#0x0003 + _game),a
	jr	00121$
00116$:
;carwar.c:880: game.pressed = 0;
	ld	hl,#0x0003 + _game
	ld	(hl),#0x00
00121$:
;carwar.c:883: HMMV(MENU_X, MENU_Y + TITLE_SPACE + game.yOffset, 8, LINE_SPACE * g_Menus[game.menu].itemNum, COLOR_BLACK);
	ld	hl,#0x09af + _game
	ld	(hl),#0x54
	inc	hl
	ld	(hl),#0x00
	ld	hl,#0x0007 + _game
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	add	a,#0x74
	ld	c,a
	ld	a,h
	adc	a,#0x00
	ld	b,a
	ld	hl,#0x0002 + 0x09af + _game
	ld	(hl),c
	inc	hl
	ld	(hl),b
	inc	hl
	ld	(hl),#0x08
	inc	hl
	ld	(hl),#0x00
	ld	a,(#0x0001 + _game)
	ld	e,a
	add	a,a
	add	a,e
	add	a,a
	add	a,e
	add	a,#<(_g_Menus)
	ld	c,a
	ld	a,#>(_g_Menus)
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
	ld	hl,#0x0006 + 0x09af + _game
	ld	(hl),c
	inc	hl
	ld	(hl),b
	inc	hl
	ld	(hl),#0x00
	inc	hl
	inc	hl
	ld	(hl),#0xC0
	ld	l,#<(0x09af + _game)
	ld	h,#>(0x09af + _game)
	push	hl
	call	_VPDCommand36
	pop	af
;carwar.c:884: DrawText(MENU_X, MENU_Y + TITLE_SPACE + game.yOffset + (LINE_SPACE * game.item), "@", COLOR_WHITE);
	ld	hl,#0x0007 + _game
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	add	a,#0x74
	ld	c,a
	ld	a,h
	adc	a,#0x00
	ld	b,a
	ld	hl,#0x0002 + _game
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
	ld	hl,#__str_27
	push	hl
	push	bc
	ld	hl,#0x0054
	push	hl
	call	_DrawText
	pop	af
	pop	af
	pop	af
	inc	sp
;carwar.c:885: waitRetrace();
	call	_waitRetrace
00123$:
	ld	sp,ix
	pop	ix
	ret
_StateMainMenu_end::
__str_27:
	.ascii "@"
	.db 0x00
;carwar.c:896: void StateStartGame()
;	---------------------------------
; Function StateStartGame
; ---------------------------------
_StateStartGame_start::
_StateStartGame:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-5
	add	hl,sp
	ld	sp,hl
;carwar.c:899: game.page = 0;
	ld	hl,#0x0005 + _game
	ld	(hl),#0x00
;carwar.c:900: SetPage8(game.page);
	ld	a, (hl)
	push	af
	inc	sp
	call	_SetPage8
	inc	sp
;carwar.c:904: UpackTiles();
	call	_UpackTiles
;carwar.c:905: BuildTrack();
	call	_BuildTrack
;carwar.c:908: HMMM(0, 0, 0, 256, 256, 212);
	ld	hl,#0x09a0 + _game
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	ld	hl,#0x0002 + 0x09a0 + _game
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x01
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x01
	inc	hl
	ld	(hl),#0xD4
	inc	hl
	ld	(hl),#0x00
	ld	hl,#0x000e + 0x09a0 + _game
	ld	(hl),#0xD0
	ld	l,#<(0x09a0 + _game)
	ld	h,#>(0x09a0 + _game)
	push	hl
	call	_VPDCommand32
	pop	af
;carwar.c:912: PrintSprite(64, 64, "INIT\nCARS", (u16)&g_DefaultColor);
	ld	c,#<(_g_DefaultColor)
	ld	b,#>(_g_DefaultColor)
	push	bc
	ld	hl,#__str_28
	push	hl
	ld	hl,#0x4040
	push	hl
	call	_PrintSprite
	pop	af
	pop	af
	pop	af
;carwar.c:914: CopyCropped16(0, 256 + 212 + 0,  13, 11, 16, 0, (u16)&g_Car1);
	ld	l,#<(_g_Car1)
	ld	h,#>(_g_Car1)
	push	hl
	ld	hl,#0x0010
	push	hl
	ld	hl,#0x0B0D
	push	hl
	ld	hl,#0x01D4
	push	hl
	ld	a,#0x00
	push	af
	inc	sp
	call	_CopyCropped16
	ld	hl,#0x0009
	add	hl,sp
	ld	sp,hl
;carwar.c:915: CopyCropped16(0, 256 + 212 + 11, 13, 11, 16, 0, (u16)&g_Car2);
	ld	l,#<(_g_Car2)
	ld	h,#>(_g_Car2)
	push	hl
	ld	hl,#0x0010
	push	hl
	ld	hl,#0x0B0D
	push	hl
	ld	hl,#0x01DF
	push	hl
	ld	a,#0x00
	push	af
	inc	sp
	call	_CopyCropped16
	ld	hl,#0x0009
	add	hl,sp
	ld	sp,hl
;carwar.c:916: CopyCropped16(0, 256 + 212 + 22, 13, 11, 16, 0, (u16)&g_Car3);
	ld	l,#<(_g_Car3)
	ld	h,#>(_g_Car3)
	push	hl
	ld	hl,#0x0010
	push	hl
	ld	hl,#0x0B0D
	push	hl
	ld	hl,#0x01EA
	push	hl
	ld	a,#0x00
	push	af
	inc	sp
	call	_CopyCropped16
	ld	hl,#0x0009
	add	hl,sp
	ld	sp,hl
;carwar.c:917: CopyCropped16(0, 256 + 212 + 33, 13, 11, 16, 0, (u16)&g_Car4);
	ld	l,#<(_g_Car4)
	ld	h,#>(_g_Car4)
	push	hl
	ld	hl,#0x0010
	push	hl
	ld	hl,#0x0B0D
	push	hl
	ld	hl,#0x01F5
	push	hl
	ld	a,#0x00
	push	af
	inc	sp
	call	_CopyCropped16
	ld	hl,#0x0009
	add	hl,sp
	ld	sp,hl
;carwar.c:918: RAMtoVRAM(16 * 13, 256 + 212, 13, 8, (u16)&g_Shadow);
	ld	l,#<(_g_Shadow)
	ld	h,#>(_g_Shadow)
	push	hl
	ld	hl,#0x0008
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
;carwar.c:919: CopyCropped16(208, 476, 6, 8, 8 * 3, 1, (u16)&g_Pilots);
	ld	l,#<(_g_Pilots)
	ld	h,#>(_g_Pilots)
	push	hl
	ld	hl,#0x0118
	push	hl
	ld	hl,#0x0806
	push	hl
	ld	hl,#0x01DC
	push	hl
	ld	a,#0xD0
	push	af
	inc	sp
	call	_CopyCropped16
	ld	hl,#0x0009
	add	hl,sp
	ld	sp,hl
;carwar.c:923: PrintSprite(64, 64, "INIT\nTRACK\nBACKUP", (u16)&g_DefaultColor);
	ld	c,#<(_g_DefaultColor)
	ld	b,#>(_g_DefaultColor)
	push	bc
	ld	hl,#__str_29
	push	hl
	ld	hl,#0x4040
	push	hl
	call	_PrintSprite
	pop	af
	pop	af
	pop	af
;carwar.c:924: for(i=0; i<CAR_NUM; i++)
	ld	-1 (ix),#0x00
	ld	b,#0x00
	ld	-3 (ix),#0x00
	ld	-2 (ix),#0x00
00101$:
	ld	a,-1 (ix)
	sub	a,#0x04
	jp	NC,00104$
;carwar.c:926: InitializePlayer(&game.players[i], i, g_Tracks[game.track].startPos[i].x, g_Tracks[game.track].startPos[i].y, g_Tracks[game.track].rotation);
	ld	a,(#0x0006 + _game)
	ld	e,a
	add	a,a
	add	a,a
	add	a,a
	add	a,a
	add	a,e
	add	a,#<(_g_Tracks)
	ld	c,a
	ld	a,#>(_g_Tracks)
	adc	a,#0x00
	ld	e,a
	ld	a,c
	add	a,#0x08
	ld	c,a
	ld	a,e
	adc	a,#0x00
	ld	h, a
	ld	l, c
	ld	a,(hl)
	ld	-4 (ix),a
	ld	a,(#0x0006 + _game)
	ld	e,a
	add	a,a
	add	a,a
	add	a,a
	add	a,a
	add	a,e
	add	a,#<(_g_Tracks)
	ld	e,a
	ld	a,#>(_g_Tracks)
	adc	a,#0x00
	ld	d,a
	ld	hl,#0x0009
	add	hl,de
	ex	de,hl
	ld	a,-1 (ix)
	add	a,a
	ld	c, a
	add	a,e
	ld	e,a
	ld	a,d
	adc	a,#0x00
	ld	d,a
	inc	de
	ld	a,(de)
	ld	-5 (ix),a
	ld	a,(#0x0006 + _game)
	ld	e,a
	add	a,a
	add	a,a
	add	a,a
	add	a,a
	add	a,e
	add	a,#<(_g_Tracks)
	ld	e,a
	ld	a,#>(_g_Tracks)
	adc	a,#0x00
	ld	d,a
	ld	hl,#0x0009
	add	hl,de
	ld	a, l
	ld	d, h
	add	a,c
	ld	e,a
	ld	a,d
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	ld	c,a
	ld	a,#<(0x010a + _game)
	add	a,b
	ld	e,a
	ld	a,#>(0x010a + _game)
	adc	a,#0x00
	ld	d,a
	push	bc
	ld	a,-4 (ix)
	push	af
	inc	sp
	ld	b, -5 (ix)
	push	bc
	ld	a,-1 (ix)
	push	af
	inc	sp
	push	de
	call	_InitializePlayer
	pop	af
	pop	af
	pop	af
	pop	bc
;carwar.c:927: HMMM(PosXToSprt(game.players[i].posX), (256 * 0) + PosYToSprt(game.players[i].posY), (13 * i) + (52 * 0), 212, 13, 11 + 1);
	ld	a,#<(0x010a + _game)
	add	a,b
	ld	l, a
	ld	a, #>(0x010a + _game)
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
	ld	hl,#0x09a0 + _game
	ld	(hl),e
	inc	hl
	ld	(hl),d
	ld	a,#<(0x010a + _game)
	add	a,b
	ld	l, a
	ld	a, #>(0x010a + _game)
	adc	a, #0x00
	ld	h, a
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	h, #0x00
	add	a,#0xFB
	ld	e,a
	ld	a,h
	adc	a,#0xFF
	ld	d,a
	ld	hl,#0x0002 + 0x09a0 + _game
	ld	(hl),e
	inc	hl
	ld	(hl),d
	inc	hl
	ld	a,-3 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-2 (ix)
	ld	(hl),a
	inc	hl
	ld	(hl),#0xD4
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x0D
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x0C
	inc	hl
	ld	(hl),#0x00
	ld	hl,#0x000e + 0x09a0 + _game
	ld	(hl),#0xD0
	ld	l,#<(0x09a0 + _game)
	ld	h,#>(0x09a0 + _game)
	push	bc
	push	hl
	call	_VPDCommand32
	pop	af
	pop	bc
;carwar.c:928: HMMM(PosXToSprt(game.players[i].posX), (256 * 1) + PosYToSprt(game.players[i].posY), (13 * i) + (52 * 1), 212, 13, 11 + 1);
	ld	a,#<(0x010a + _game)
	add	a,b
	ld	l, a
	ld	a, #>(0x010a + _game)
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
	ld	hl,#0x09a0 + _game
	ld	(hl),e
	inc	hl
	ld	(hl),d
	ld	a,#<(0x010a + _game)
	add	a,b
	ld	l, a
	ld	a, #>(0x010a + _game)
	adc	a, #0x00
	ld	h, a
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	h, #0x00
	add	a,#0xFB
	ld	e,a
	ld	a,h
	adc	a,#0x00
	ld	d,a
	ld	hl,#0x0002 + 0x09a0 + _game
	ld	(hl),e
	inc	hl
	ld	(hl),d
	ld	a,-3 (ix)
	add	a,#0x34
	ld	e,a
	ld	a,-2 (ix)
	adc	a,#0x00
	ld	d,a
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	inc	hl
	ld	(hl),#0xD4
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x0D
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x0C
	inc	hl
	ld	(hl),#0x00
	ld	hl,#0x000e + 0x09a0 + _game
	ld	(hl),#0xD0
	ld	l,#<(0x09a0 + _game)
	ld	h,#>(0x09a0 + _game)
	push	bc
	push	hl
	call	_VPDCommand32
	pop	af
	pop	bc
;carwar.c:924: for(i=0; i<CAR_NUM; i++)
	ld	a,b
	add	a,#0x1C
	ld	b,a
	ld	a,-3 (ix)
	add	a,#0x0D
	ld	-3 (ix),a
	ld	a,-2 (ix)
	adc	a,#0x00
	ld	-2 (ix),a
	inc	-1 (ix)
	jp	00101$
00104$:
;carwar.c:931: ClearSprite();
	call	_ClearSprite
;carwar.c:932: for(i=0; i<32; i++)
	ld	c,#0x00
00105$:
	ld	a,c
	sub	a,#0x20
	jr	NC,00108$
;carwar.c:933: SetSpriteUniColor(i, 0, 248, 0, 0);
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
;carwar.c:932: for(i=0; i<32; i++)
	inc	c
	jr	00105$
00108$:
;carwar.c:935: game.state = StateUpdateGame;
	ld	hl,#0x017a + _game
	ld	(hl),#<(_StateUpdateGame)
	inc	hl
	ld	(hl),#>(_StateUpdateGame)
	ld	sp,ix
	pop	ix
	ret
_StateStartGame_end::
__str_28:
	.ascii "INIT"
	.db 0x0A
	.ascii "CARS"
	.db 0x00
__str_29:
	.ascii "INIT"
	.db 0x0A
	.ascii "TRACK"
	.db 0x0A
	.ascii "BACKUP"
	.db 0x00
;carwar.c:939: void StateUpdateGame()
;	---------------------------------
; Function StateUpdateGame
; ---------------------------------
_StateUpdateGame_start::
_StateUpdateGame:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-33
	add	hl,sp
	ld	sp,hl
;carwar.c:945: SetPage8(game.page);
	ld	a,(#0x0005 + _game)
	push	af
	inc	sp
	call	_SetPage8
	inc	sp
;carwar.c:946: game.page = 1 - game.page;
	ld	hl,#0x0005 + _game
	ld	l,(hl)
	ld	a,#0x01
	sub	a,l
	ld	hl,#0x0005 + _game
	ld	(hl),a
;carwar.c:947: game.yOffset = 256 * game.page;
	ld	b, (hl)
	ld	c,#0x00
	ld	hl,#0x0007 + _game
	ld	(hl),c
	inc	hl
	ld	(hl),b
;carwar.c:949: for(i=0; i<CAR_NUM; i++)
	ld	bc,#0x0000
00181$:
	ld	a,c
	sub	a,#0x04
	jr	NC,00184$
;carwar.c:950: game.players[i].flag = 0;
	ld	a,#<(0x010a + _game)
	add	a,b
	ld	e,a
	ld	a,#>(0x010a + _game)
	adc	a,#0x00
	ld	d,a
	ld	hl,#0x000F
	add	hl,de
	ex	de,hl
	ld	a,#0x00
	ld	(de),a
;carwar.c:949: for(i=0; i<CAR_NUM; i++)
	ld	a,b
	add	a,#0x1C
	ld	b,a
	inc	c
	jr	00181$
00184$:
;carwar.c:954: curPly = &game.players[0];
	ld	hl,#_game + 266
	ld	-7 (ix),l
	ld	-6 (ix),h
;carwar.c:955: keyLine = GetKeyMatrixLine(8);
	ld	a,#0x08
	push	af
	inc	sp
	call	_GetKeyMatrixLine
	inc	sp
	ld	c,l
;carwar.c:956: if((keyLine & KEY_LEFT) == 0)
	ld	a,c
	and	a,#0x10
	jr	NZ,00102$
;carwar.c:957: curPly->flag |= CAR_TURN_LEFT;
	ld	a,-7 (ix)
	add	a,#0x0F
	ld	e,a
	ld	a,-6 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	or	a,#0x02
	ld	(de),a
00102$:
;carwar.c:958: if((keyLine & KEY_RIGHT) == 0)
	ld	a,c
	and	a,#0x80
	jr	NZ,00104$
;carwar.c:959: curPly->flag |= CAR_TURN_RIGHT;
	ld	a,-7 (ix)
	add	a,#0x0F
	ld	e,a
	ld	a,-6 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	or	a,#0x01
	ld	(de),a
00104$:
;carwar.c:960: if((keyLine & KEY_UP) == 0)
	ld	a,c
	and	a,#0x20
	jr	NZ,00106$
;carwar.c:961: curPly->flag |= CAR_MOVE;
	ld	a,-7 (ix)
	add	a,#0x0F
	ld	e,a
	ld	a,-6 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	or	a,#0x04
	ld	(de),a
00106$:
;carwar.c:965: curPly = &game.players[1];
	ld	hl,#0x010a + _game + 28
	ld	-7 (ix),l
	ld	-6 (ix),h
;carwar.c:966: keyLine = GetKeyMatrixLine(5);
	ld	a,#0x05
	push	af
	inc	sp
	call	_GetKeyMatrixLine
	inc	sp
;carwar.c:967: if((keyLine & KEY_Z) == 0)
	ld	a, l
	and	a,#0x80
	jr	NZ,00108$
;carwar.c:968: curPly->flag |= CAR_TURN_LEFT;
	ld	a,-7 (ix)
	add	a,#0x0F
	ld	e,a
	ld	a,-6 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	or	a,#0x02
	ld	(de),a
00108$:
;carwar.c:969: keyLine = GetKeyMatrixLine(3);
	ld	a,#0x03
	push	af
	inc	sp
	call	_GetKeyMatrixLine
	inc	sp
;carwar.c:970: if((keyLine & KEY_C) == 0)
	ld	a, l
	and	a,#0x01
	jr	NZ,00110$
;carwar.c:971: curPly->flag |= CAR_TURN_RIGHT;
	ld	a,-7 (ix)
	add	a,#0x0F
	ld	e,a
	ld	a,-6 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	or	a,#0x01
	ld	(de),a
00110$:
;carwar.c:972: keyLine = GetKeyMatrixLine(5);
	ld	a,#0x05
	push	af
	inc	sp
	call	_GetKeyMatrixLine
	inc	sp
;carwar.c:973: if((keyLine & KEY_X) == 0)
	ld	a, l
	and	a,#0x20
	jr	NZ,00112$
;carwar.c:974: curPly->flag |= CAR_MOVE;
	ld	a,-7 (ix)
	add	a,#0x0F
	ld	e,a
	ld	a,-6 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	or	a,#0x04
	ld	(de),a
00112$:
;carwar.c:978: CheckJoy(&game.players[2], 1);
	ld	a,#0x01
	push	af
	inc	sp
	ld	hl,#0x0038 + 0x010a + _game
	push	hl
	call	_CheckJoy
	pop	af
	inc	sp
;carwar.c:982: CheckJoy(&game.players[3], 2);
	ld	a,#0x02
	push	af
	inc	sp
	ld	hl,#0x0054 + 0x010a + _game
	push	hl
	call	_CheckJoy
	pop	af
	inc	sp
;carwar.c:986: for(i=0; i<CAR_NUM; i++)
	ld	-1 (ix),#0x00
	ld	bc,#0x0000
	ld	-18 (ix),#0x00
00185$:
	ld	a,-1 (ix)
	sub	a,#0x04
	jp	NC,00188$
;carwar.c:988: HMMM((13 * i) + (52 * game.page), 212, PosXToSprt(game.players[i].prevX), game.yOffset + PosYToSprt(game.players[i].prevY) - game.players[i].prevZ, 13, 11 + 1 + game.players[i].prevZ);
	ld	hl,#0x0005 + _game
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
	ld	a,c
	add	a,e
	ld	e,a
	ld	a,b
	adc	a,d
	ld	d,a
	ld	hl,#0x09a0 + _game
	ld	(hl),e
	inc	hl
	ld	(hl),d
	ld	hl,#0x0002 + 0x09a0 + _game
	ld	(hl),#0xD4
	inc	hl
	ld	(hl),#0x00
	ld	a,#<(0x010a + _game)
	add	a,-18 (ix)
	ld	l, a
	ld	a, #>(0x010a + _game)
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
	ld	e,a
	ld	a,h
	adc	a,#0xFF
	ld	d,a
	ld	hl,#0x0004 + 0x09a0 + _game
	ld	(hl),e
	inc	hl
	ld	(hl),d
	ld	hl,#0x0007 + _game
	ld	a,(hl)
	ld	-22 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-21 (ix),a
	ld	a,#<(0x010a + _game)
	add	a,-18 (ix)
	ld	e,a
	ld	a,#>(0x010a + _game)
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
	ld	a,-22 (ix)
	add	a,l
	ld	-22 (ix),a
	ld	a,-21 (ix)
	adc	a,h
	ld	-21 (ix),a
	ld	a,#<(0x010a + _game)
	add	a,-18 (ix)
	ld	e,a
	ld	a,#>(0x010a + _game)
	adc	a,#0x00
	ld	d,a
	ld	hl,#0x0009
	add	hl,de
	ld	l, (hl)
	ld	h,#0x00
	ld	a,-22 (ix)
	sub	a,l
	ld	e,a
	ld	a,-21 (ix)
	sbc	a,h
	ld	d,a
	ld	hl,#0x0006 + 0x09a0 + _game
	ld	(hl),e
	inc	hl
	ld	(hl),d
	inc	hl
	ld	(hl),#0x0D
	inc	hl
	ld	(hl),#0x00
	ld	a,#<(0x010a + _game)
	add	a,-18 (ix)
	ld	e,a
	ld	a,#>(0x010a + _game)
	adc	a,#0x00
	ld	d,a
	ld	hl,#0x0009
	add	hl,de
	ld	a,(hl)
	ld	h, #0x00
	add	a,#0x0C
	ld	e,a
	ld	a,h
	adc	a,#0x00
	ld	d,a
	ld	hl,#0x000a + 0x09a0 + _game
	ld	(hl),e
	inc	hl
	ld	(hl),d
	ld	hl,#0x000e + 0x09a0 + _game
	ld	(hl),#0xD0
	ld	l,#<(0x09a0 + _game)
	ld	h,#>(0x09a0 + _game)
	push	bc
	push	hl
	call	_VPDCommand32
	pop	af
	pop	bc
;carwar.c:986: for(i=0; i<CAR_NUM; i++)
	ld	hl,#0x000D
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,-18 (ix)
	add	a,#0x1C
	ld	-18 (ix),a
	inc	-1 (ix)
	jp	00185$
00188$:
;carwar.c:993: for(i=0; i<CAR_NUM; i++)
	ld	-1 (ix),#0x00
	ld	-22 (ix),#0x00
00157$:
	ld	a,-1 (ix)
	sub	a,#0x04
	jp	NC,00160$
;carwar.c:995: curPly = &game.players[i];
	ld	a,#<(0x010a + _game)
	add	a,-22 (ix)
	ld	e,a
	ld	a,#>(0x010a + _game)
	adc	a,#0x00
	ld	-7 (ix), e
	ld	-6 (ix), a
;carwar.c:997: car = (curPly->life == 0) ? 4 : curPly->car;
	ld	a,-7 (ix)
	add	a,#0x1A
	ld	e,a
	ld	a,-6 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	sub	a,#0x01
	ld	a,#0x00
	rla
	or	a,a
	jr	Z,00203$
	ld	e,#0x04
	jr	00204$
00203$:
	ld	a,-7 (ix)
	add	a,#0x0E
	ld	l, a
	ld	a, -6 (ix)
	adc	a, #0x00
	ld	h, a
	ld	e,(hl)
00204$:
	ld	-5 (ix),e
;carwar.c:999: if(curPly->jump == 0)
	ld	a,-7 (ix)
	add	a,#0x11
	ld	e,a
	ld	a,-6 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	or	a,a
	jp	NZ,00150$
;carwar.c:1001: ground = ReadVRAM(game.page, PosToPxl(curPly->posX) + 256 * PosToPxl(curPly->posY));
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	inc	hl
	ld	c, (hl)
	ld	b,#0x00
	ld	a,-7 (ix)
	add	a,#0x02
	ld	-20 (ix),a
	ld	a,-6 (ix)
	adc	a,#0x00
	ld	-19 (ix),a
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	inc	hl
	ld	h, (hl)
	ld	l,#0x00
	add	hl,bc
	ld	-24 (ix),l
	ld	-23 (ix),h
	ld	hl,#0x0005 + _game
	ld	c,(hl)
	push	de
	ld	l,-24 (ix)
	ld	h,-23 (ix)
	push	hl
	ld	a,c
	push	af
	inc	sp
	call	_ReadVRAM
	pop	af
	inc	sp
	pop	de
;carwar.c:1002: op = game.colorCode[ground];
	ld	h,#0x00
	ld	a,#<(0x0009 + _game)
	add	a,l
	ld	c,a
	ld	a,#>(0x0009 + _game)
	adc	a,h
	ld	b,a
	ld	a,(bc)
;carwar.c:1004: if(op >= OP_ROAD) // Backup last valid position
	ld	-2 (ix), a
	sub	a,#0x09
	jr	C,00116$
;carwar.c:1006: curPly->validX = curPly->posX;
	ld	a,-7 (ix)
	add	a,#0x12
	ld	-24 (ix),a
	ld	a,-6 (ix)
	adc	a,#0x00
	ld	-23 (ix),a
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l,-24 (ix)
	ld	h,-23 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
;carwar.c:1007: curPly->validY = curPly->posY;
	ld	a,-7 (ix)
	add	a,#0x14
	ld	-24 (ix),a
	ld	a,-6 (ix)
	adc	a,#0x00
	ld	-23 (ix),a
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l,-24 (ix)
	ld	h,-23 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
	jp	00117$
00116$:
;carwar.c:1009: else if(op < OP_SPECIAL)
	ld	a,-2 (ix)
	sub	a,#0x04
	jp	NC,00117$
;carwar.c:1011: curPly->prevX = curPly->posX;
	ld	a,-7 (ix)
	add	a,#0x05
	ld	e,a
	ld	a,-6 (ix)
	adc	a,#0x00
	ld	d,a
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ex	de,hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
;carwar.c:1012: curPly->prevY = curPly->posY;
	ld	a,-7 (ix)
	add	a,#0x07
	ld	e,a
	ld	a,-6 (ix)
	adc	a,#0x00
	ld	d,a
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ex	de,hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
;carwar.c:1013: curPly->nextX = curPly->validX;
	ld	a,-7 (ix)
	add	a,#0x16
	ld	e,a
	ld	a,-6 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,-7 (ix)
	add	a,#0x12
	ld	l, a
	ld	a, -6 (ix)
	adc	a, #0x00
	ld	h, a
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ex	de,hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
;carwar.c:1014: curPly->nextY = curPly->validY;
	ld	a,-7 (ix)
	add	a,#0x18
	ld	e,a
	ld	a,-6 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,-7 (ix)
	add	a,#0x14
	ld	l, a
	ld	a, -6 (ix)
	adc	a, #0x00
	ld	h, a
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ex	de,hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
;carwar.c:1015: curPly->velX = 0;
	ld	a,-7 (ix)
	add	a,#0x0A
	ld	l, a
	ld	a, -6 (ix)
	adc	a, #0x00
	ld	h, a
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;carwar.c:1016: curPly->velY = 0;
	ld	a,-7 (ix)
	add	a,#0x0C
	ld	l, a
	ld	a, -6 (ix)
	adc	a, #0x00
	ld	h, a
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;carwar.c:1017: curPly->life = 0;
	ld	a,-7 (ix)
	add	a,#0x1A
	ld	c,a
	ld	a,-6 (ix)
	adc	a,#0x00
	ld	b,a
	ld	a,#0x00
	ld	(bc),a
;carwar.c:1018: break;
	jp	00160$
00117$:
;carwar.c:1020: if(op == OP_HEALTH)
	ld	a,-2 (ix)
	sub	a,#0x07
	jr	NZ,00122$
;carwar.c:1022: if(curPly->life < 255 - 5)
	ld	a,-7 (ix)
	add	a,#0x1A
	ld	c,a
	ld	a,-6 (ix)
	adc	a,#0x00
	ld	b,a
	ld	a,(bc)
	ld	l,a
	sub	a,#0xFA
	jr	NC,00119$
;carwar.c:1023: curPly->life += 5;
	ld	a,l
	add	a,#0x05
	ld	(bc),a
	jr	00122$
00119$:
;carwar.c:1025: curPly->life = 255;
	ld	a,#0xFF
	ld	(bc),a
00122$:
;carwar.c:1029: friction = g_BG[op].Friction;
	push	de
	ld	a,-2 (ix)
	ld	e,a
	add	a,a
	add	a,a
	add	a,e
	pop	de
	ld	-24 (ix),a
	add	a,#<(_g_BG)
	ld	-20 (ix),a
	ld	a,#>(_g_BG)
	adc	a,#0x00
	ld	-19 (ix),a
	ld	c,-20 (ix)
	ld	b,-19 (ix)
	inc	bc
	ld	a,(bc)
	ld	-3 (ix),a
;carwar.c:1030: maxSpeed = g_Cars[car].maxSpeed[g_BG[op].MaxSpeed];
	push	de
	ld	a,-5 (ix)
	ld	e,a
	add	a,a
	add	a,a
	add	a,e
	pop	de
	ld	-18 (ix),a
	add	a,#<(_g_Cars)
	ld	c,a
	ld	a,#>(_g_Cars)
	adc	a,#0x00
	ld	b,a
	inc	bc
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	ld	l,(hl)
	ld	a,c
	add	a,l
	ld	c,a
	ld	a,b
	adc	a,#0x00
	ld	b,a
	ld	a,(bc)
	ld	-17 (ix), a
	ld	-16 (ix),#0x00
;carwar.c:1031: x = Abs16(curPly->velX);
	ld	a,-7 (ix)
	add	a,#0x0A
	ld	-20 (ix),a
	ld	a,-6 (ix)
	adc	a,#0x00
	ld	-19 (ix),a
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	ld	a,(hl)
	ld	-26 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-25 (ix), a
	and	a,#0x80
	jr	Z,00205$
	ld	c,-26 (ix)
	ld	b,-25 (ix)
	dec	bc
	ld	a,c
	cpl
	ld	c,a
	ld	a,b
	cpl
	ld	b,a
	jr	00206$
00205$:
	ld	c,-26 (ix)
	ld	b,-25 (ix)
00206$:
	ld	-9 (ix),c
;carwar.c:1032: x >>= 8;
	ld	-8 (ix), b
	ld	-9 (ix), b
	ld	-8 (ix),#0x00
;carwar.c:1033: y = Abs16(curPly->velY);
	ld	a,-7 (ix)
	add	a,#0x0C
	ld	-26 (ix),a
	ld	a,-6 (ix)
	adc	a,#0x00
	ld	-25 (ix),a
	ld	l,-26 (ix)
	ld	h,-25 (ix)
	ld	a,(hl)
	ld	-28 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-27 (ix), a
	and	a,#0x80
	jr	Z,00207$
	ld	c,-28 (ix)
	ld	b,-27 (ix)
	dec	bc
	ld	a,c
	cpl
	ld	c,a
	ld	a,b
	cpl
	ld	b,a
	jr	00208$
00207$:
	ld	c,-28 (ix)
	ld	b,-27 (ix)
00208$:
	ld	-11 (ix),c
;carwar.c:1034: y >>= 8;
	ld	-10 (ix), b
	ld	-11 (ix), b
	ld	-10 (ix),#0x00
;carwar.c:1035: speedSq = (x * x) + (y * y);
	push	de
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	call	__mulint_rrx_s
	pop	af
	pop	af
	ld	-27 (ix),h
	ld	-28 (ix),l
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	push	hl
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	push	hl
	call	__mulint_rrx_s
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	pop	de
	ld	a,-28 (ix)
	add	a,c
	ld	c,a
	ld	a,-27 (ix)
	adc	a,b
	ld	-15 (ix), c
	ld	-14 (ix), a
;carwar.c:1036: if(!(curPly->flag & CAR_MOVE) || (speedSq > maxSpeed * maxSpeed))
	ld	a,-7 (ix)
	add	a,#0x0F
	ld	-28 (ix),a
	ld	a,-6 (ix)
	adc	a,#0x00
	ld	-27 (ix),a
	ld	l,-28 (ix)
	ld	h,-27 (ix)
	ld	a,(hl)
	and	a,#0x04
	jr	Z,00126$
	push	de
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	push	hl
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	push	hl
	call	__mulint_rrx_s
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	pop	de
	ld	a,c
	sub	a,-15 (ix)
	ld	a,b
	sbc	a,-14 (ix)
	jp	NC,00127$
00126$:
;carwar.c:1038: if(speedSq <= (friction * friction))
	push	de
	ld	e,-3 (ix)
	ld	h,-3 (ix)
	ld	l,#0x00
	ld	d,l
	ld	b,#0x08
00291$:
	add	hl,hl
	jr	NC,00292$
	add	hl,de
00292$:
	djnz	00291$
	pop	de
	ld	a, l
	ld	b, h
	sub	a,-15 (ix)
	ld	a,b
	sbc	a,-14 (ix)
	jr	C,00124$
;carwar.c:1040: curPly->velX = 0;
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;carwar.c:1041: curPly->velY = 0;
	ld	l,-26 (ix)
	ld	h,-25 (ix)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	jp	00127$
00124$:
;carwar.c:1045: dir = VectorToAngle256(curPly->velX, curPly->velY) >> 2;
	ld	l,-26 (ix)
	ld	h,-25 (ix)
	ld	a,(hl)
	ld	-30 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-29 (ix),a
	ld	l,-20 (ix)
	ld	h,-19 (ix)
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
	ld	b,l
	srl	b
	srl	b
;carwar.c:1046: curPly->velX -= friction * g_Cosinus64[dir];
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	ld	a,(hl)
	ld	-30 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-29 (ix),a
	ld	a,b
	add	a,a
	ld	-31 (ix),a
	add	a,#<(_g_Cosinus64)
	ld	l, a
	ld	a, #>(_g_Cosinus64)
	adc	a, #0x00
	ld	h, a
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	ld	a,-3 (ix)
	ld	-33 (ix),a
	ld	-32 (ix),#0x00
	push	de
	push	hl
	ld	l,-33 (ix)
	ld	h,-32 (ix)
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
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
;carwar.c:1047: curPly->velY -= friction * g_Sinus64[dir];
	ld	l,-26 (ix)
	ld	h,-25 (ix)
	ld	a,(hl)
	ld	-30 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-29 (ix),a
	ld	a,#<(_g_Sinus64)
	add	a,-31 (ix)
	ld	l, a
	ld	a, #>(_g_Sinus64)
	adc	a, #0x00
	ld	h, a
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	push	de
	push	hl
	ld	l,-33 (ix)
	ld	h,-32 (ix)
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
00127$:
;carwar.c:1052: grip = g_BG[op].Grip;
	ld	a,#<(_g_BG)
	add	a,-24 (ix)
	ld	c,a
	ld	a,#>(_g_BG)
	adc	a,#0x00
	ld	b,a
	inc	bc
	inc	bc
	ld	a,(bc)
	ld	-4 (ix),a
;carwar.c:1053: x = Abs16(curPly->velX);
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	ld	a,(hl)
	ld	-33 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-32 (ix), a
	and	a,#0x80
	jr	Z,00209$
	ld	c,-33 (ix)
	ld	b,-32 (ix)
	dec	bc
	ld	a,c
	cpl
	ld	c,a
	ld	a,b
	cpl
	ld	b,a
	jr	00210$
00209$:
	ld	c,-33 (ix)
	ld	b,-32 (ix)
00210$:
	ld	-9 (ix),c
;carwar.c:1054: x >>= 8;
	ld	-8 (ix), b
	ld	-9 (ix), b
	ld	-8 (ix),#0x00
;carwar.c:1055: y = Abs16(curPly->velY);
	ld	l,-26 (ix)
	ld	h,-25 (ix)
	ld	a,(hl)
	ld	-33 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-32 (ix), a
	and	a,#0x80
	jr	Z,00211$
	ld	c,-33 (ix)
	ld	b,-32 (ix)
	dec	bc
	ld	a,c
	cpl
	ld	c,a
	ld	a,b
	cpl
	ld	b,a
	jr	00212$
00211$:
	ld	c,-33 (ix)
	ld	b,-32 (ix)
00212$:
	ld	-11 (ix),c
;carwar.c:1056: y >>= 8;
	ld	-10 (ix), b
	ld	-11 (ix), b
	ld	-10 (ix),#0x00
;carwar.c:1057: speed = GetVectorLenght256(x, y);
	push	de
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	push	hl
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	call	_GetVectorLenght256
	pop	af
	pop	af
	pop	de
	ld	-13 (ix),l
	ld	-12 (ix),h
;carwar.c:1058: if(speed <= grip)
	ld	c,-4 (ix)
	ld	b,#0x00
	ld	a,c
	sub	a,-13 (ix)
	ld	a,b
	sbc	a,-12 (ix)
	jr	C,00130$
;carwar.c:1060: curPly->velX = 0;
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;carwar.c:1061: curPly->velY = 0;
	ld	l,-26 (ix)
	ld	h,-25 (ix)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	jp	00131$
00130$:
;carwar.c:1065: speed = grip;
	ld	-13 (ix), c
	ld	-12 (ix), b
;carwar.c:1066: dir = VectorToAngle256(curPly->velX, curPly->velY) >> 2;
	ld	l,-26 (ix)
	ld	h,-25 (ix)
	ld	a,(hl)
	ld	-33 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-32 (ix),a
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	push	de
	ld	l,-33 (ix)
	ld	h,-32 (ix)
	push	hl
	push	bc
	call	_VectorToAngle256
	pop	af
	pop	af
	pop	de
	ld	b,l
	srl	b
	srl	b
;carwar.c:1067: curPly->velX -= grip * g_Cosinus64[dir];
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	ld	a,(hl)
	ld	-33 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-32 (ix),a
	ld	a,b
	add	a,a
	ld	-31 (ix),a
	add	a,#<(_g_Cosinus64)
	ld	l, a
	ld	a, #>(_g_Cosinus64)
	adc	a, #0x00
	ld	h, a
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	ld	a,-4 (ix)
	ld	-30 (ix),a
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
	ld	a,-33 (ix)
	sub	a,c
	ld	c,a
	ld	a,-32 (ix)
	sbc	a,b
	ld	b,a
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
;carwar.c:1068: curPly->velY -= grip * g_Sinus64[dir];
	ld	l,-26 (ix)
	ld	h,-25 (ix)
	ld	a,(hl)
	ld	-33 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-32 (ix),a
	ld	a,#<(_g_Sinus64)
	add	a,-31 (ix)
	ld	l, a
	ld	a, #>(_g_Sinus64)
	adc	a, #0x00
	ld	h, a
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
	ld	a,-33 (ix)
	sub	a,c
	ld	c,a
	ld	a,-32 (ix)
	sbc	a,b
	ld	b,a
	ld	l,-26 (ix)
	ld	h,-25 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
00131$:
;carwar.c:1072: if(curPly->flag & CAR_TURN_LEFT)
	ld	l,-28 (ix)
	ld	h,-27 (ix)
	ld	a,(hl)
	and	a,#0x02
	jr	Z,00133$
;carwar.c:1074: curPly->rot += g_Cars[car].rotSpeed; 
	ld	a,-7 (ix)
	add	a,#0x10
	ld	-33 (ix),a
	ld	a,-6 (ix)
	adc	a,#0x00
	ld	-32 (ix),a
	ld	l,-33 (ix)
	ld	h,-32 (ix)
	ld	a,(hl)
	ld	-31 (ix),a
	ld	a,#<(_g_Cars)
	add	a,-18 (ix)
	ld	c,a
	ld	a,#>(_g_Cars)
	adc	a,#0x00
	ld	b,a
	ld	a,(bc)
	ld	l,a
	ld	a,-31 (ix)
	add	a,l
	ld	l,-33 (ix)
	ld	h,-32 (ix)
	ld	(hl),a
00133$:
;carwar.c:1076: if(curPly->flag & CAR_TURN_RIGHT)
	ld	l,-28 (ix)
	ld	h,-27 (ix)
	ld	a,(hl)
	and	a,#0x01
	jr	Z,00135$
;carwar.c:1078: curPly->rot -= g_Cars[car].rotSpeed; 
	ld	a,-7 (ix)
	add	a,#0x10
	ld	-33 (ix),a
	ld	a,-6 (ix)
	adc	a,#0x00
	ld	-32 (ix),a
	ld	l,-33 (ix)
	ld	h,-32 (ix)
	ld	a,(hl)
	ld	-31 (ix),a
	ld	a,#<(_g_Cars)
	add	a,-18 (ix)
	ld	c,a
	ld	a,#>(_g_Cars)
	adc	a,#0x00
	ld	b,a
	ld	a,(bc)
	ld	l,a
	ld	a,-31 (ix)
	sub	a,l
	ld	l,-33 (ix)
	ld	h,-32 (ix)
	ld	(hl),a
00135$:
;carwar.c:1082: if(curPly->flag & CAR_MOVE)
	ld	l,-28 (ix)
	ld	h,-27 (ix)
	ld	a,(hl)
	and	a,#0x04
	jp	Z,00139$
;carwar.c:1084: x = Abs16(curPly->velX);
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	ld	a,(hl)
	ld	-33 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-32 (ix), a
	and	a,#0x80
	jr	Z,00213$
	ld	c,-33 (ix)
	ld	b,-32 (ix)
	dec	bc
	ld	a,c
	cpl
	ld	c,a
	ld	a,b
	cpl
	ld	b,a
	jr	00214$
00213$:
	ld	c,-33 (ix)
	ld	b,-32 (ix)
00214$:
	ld	-9 (ix),c
;carwar.c:1085: x >>= 8;
	ld	-8 (ix), b
	ld	-9 (ix), b
	ld	-8 (ix),#0x00
;carwar.c:1086: y = Abs16(curPly->velY);
	ld	l,-26 (ix)
	ld	h,-25 (ix)
	ld	a,(hl)
	ld	-33 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-32 (ix), a
	and	a,#0x80
	jr	Z,00215$
	ld	c,-33 (ix)
	ld	b,-32 (ix)
	dec	bc
	ld	a,c
	cpl
	ld	c,a
	ld	a,b
	cpl
	ld	b,a
	jr	00216$
00215$:
	ld	c,-33 (ix)
	ld	b,-32 (ix)
00216$:
	ld	-11 (ix),c
;carwar.c:1087: y >>= 8;
	ld	-10 (ix), b
	ld	-11 (ix), b
	ld	-10 (ix),#0x00
;carwar.c:1088: speedSq = (x * x) + (y * y);
	push	de
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	call	__mulint_rrx_s
	pop	af
	pop	af
	ld	-32 (ix),h
	ld	-33 (ix),l
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	push	hl
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	push	hl
	call	__mulint_rrx_s
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	pop	de
	ld	a,-33 (ix)
	add	a,c
	ld	c,a
	ld	a,-32 (ix)
	adc	a,b
	ld	-15 (ix), c
	ld	-14 (ix), a
;carwar.c:1089: maxSpeed = g_Cars[car].maxSpeed[g_BG[op].MaxSpeed];
	ld	a,#<(_g_Cars)
	add	a,-18 (ix)
	ld	-33 (ix),a
	ld	a,#>(_g_Cars)
	adc	a,#0x00
	ld	-32 (ix),a
	ld	a,-33 (ix)
	add	a,#0x01
	ld	-30 (ix),a
	ld	a,-32 (ix)
	adc	a,#0x00
	ld	-29 (ix),a
	ld	a,#<(_g_BG)
	add	a,-24 (ix)
	ld	c,a
	ld	a,#>(_g_BG)
	adc	a,#0x00
	ld	b,a
	ld	a,(bc)
	ld	l,a
	ld	a,-30 (ix)
	add	a,l
	ld	c,a
	ld	a,-29 (ix)
	adc	a,#0x00
	ld	b,a
	ld	a,(bc)
	ld	-17 (ix), a
	ld	-16 (ix),#0x00
;carwar.c:1090: if(speedSq < maxSpeed * maxSpeed)
	push	de
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	push	hl
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	push	hl
	call	__mulint_rrx_s
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	pop	de
	ld	a,-15 (ix)
	sub	a,c
	ld	a,-14 (ix)
	sbc	a,b
	jr	NC,00139$
;carwar.c:1092: speed += g_Cars[car].accel;
	ld	a,-33 (ix)
	add	a,#0x04
	ld	c,a
	ld	a,-32 (ix)
	adc	a,#0x00
	ld	b,a
	ld	a,(bc)
	ld	l,a
	ld	h,#0x00
	ld	a,-13 (ix)
	add	a,l
	ld	-13 (ix),a
	ld	a,-12 (ix)
	adc	a,h
	ld	-12 (ix),a
00139$:
;carwar.c:1095: if(op == OP_SPEEDER)
	ld	a,-2 (ix)
	sub	a,#0x04
	jr	NZ,00143$
;carwar.c:1096: speed += 8;
	ld	a,-13 (ix)
	add	a,#0x08
	ld	-13 (ix),a
	ld	a,-12 (ix)
	adc	a,#0x00
	ld	-12 (ix),a
	jr	00144$
00143$:
;carwar.c:1097: else if(op == OP_JUMPER)
	ld	a,-2 (ix)
	sub	a,#0x05
	jr	NZ,00144$
;carwar.c:1099: curPly->jump = 20;
	ld	a,#0x14
	ld	(de),a
00144$:
;carwar.c:1102: dir = curPly->rot >> 2;
	ld	a,-7 (ix)
	add	a,#0x10
	ld	c,a
	ld	a,-6 (ix)
	adc	a,#0x00
	ld	b,a
	ld	a,(bc)
	ld	b,a
	srl	b
	srl	b
;carwar.c:1103: curPly->velX += speed * g_Cosinus64[dir];
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,b
	add	a,a
	ld	-31 (ix),a
	add	a,#<(_g_Cosinus64)
	ld	l, a
	ld	a, #>(_g_Cosinus64)
	adc	a, #0x00
	ld	h, a
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	push	de
	push	hl
	ld	l,-13 (ix)
	ld	h,-12 (ix)
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
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
;carwar.c:1104: curPly->velY += speed * g_Sinus64[dir];
	ld	l,-26 (ix)
	ld	h,-25 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,#<(_g_Sinus64)
	add	a,-31 (ix)
	ld	l, a
	ld	a, #>(_g_Sinus64)
	adc	a, #0x00
	ld	h, a
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	push	de
	push	hl
	ld	l,-13 (ix)
	ld	h,-12 (ix)
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
;carwar.c:1106: CarToWallCollision(curPly);
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	push	hl
	call	_CarToWallCollision
	pop	af
	jr	00151$
00150$:
;carwar.c:1110: if(curPly->flag & CAR_TURN_LEFT)
	ld	a,-7 (ix)
	add	a,#0x0F
	ld	c,a
	ld	a,-6 (ix)
	adc	a,#0x00
	ld	b,a
	ld	a,(bc)
	ld	-33 (ix), a
	and	a,#0x02
	jr	Z,00146$
;carwar.c:1112: curPly->rot += 2; 
	ld	a,-7 (ix)
	add	a,#0x10
	ld	c,a
	ld	a,-6 (ix)
	adc	a,#0x00
	ld	b,a
	ld	a,(bc)
	add	a,#0x02
	ld	(bc),a
00146$:
;carwar.c:1114: if(curPly->flag & CAR_TURN_RIGHT)
	ld	a,-33 (ix)
	and	a,#0x01
	jr	Z,00148$
;carwar.c:1116: curPly->rot -= 2; 
	ld	a,-7 (ix)
	add	a,#0x10
	ld	c,a
	ld	a,-6 (ix)
	adc	a,#0x00
	ld	b,a
	ld	a,(bc)
	add	a,#0xFE
	ld	(bc),a
00148$:
;carwar.c:1118: curPly->jump--;
	ld	a,(de)
	dec	a
	ld	(de),a
00151$:
;carwar.c:1121: curPly->nextX = (i16)curPly->posX + (curPly->velX >> 4);
	ld	a,-7 (ix)
	add	a,#0x16
	ld	c,a
	ld	a,-6 (ix)
	adc	a,#0x00
	ld	b,a
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	a,(hl)
	ld	-33 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-32 (ix),a
	ld	a,-7 (ix)
	add	a,#0x0A
	ld	l, a
	ld	a, -6 (ix)
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
	ld	a,-33 (ix)
	add	a,l
	ld	e,a
	ld	a,-32 (ix)
	adc	a,h
	ld	d,a
	ld	l,c
	ld	h,b
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:1122: curPly->nextY = (i16)curPly->posY - (curPly->velY >> 4);
	ld	a,-7 (ix)
	add	a,#0x18
	ld	c,a
	ld	a,-6 (ix)
	adc	a,#0x00
	ld	b,a
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	inc	hl
	inc	hl
	ld	a,(hl)
	ld	-33 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-32 (ix),a
	ld	a,-7 (ix)
	add	a,#0x0C
	ld	l, a
	ld	a, -6 (ix)
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
	ld	a,-33 (ix)
	sub	a,l
	ld	e,a
	ld	a,-32 (ix)
	sbc	a,h
	ld	d,a
	ld	l,c
	ld	h,b
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:1123: if(curPly->nextY < (5 << 8))
	ld	l,c
	ld	h,b
	inc	hl
	ld	a, (hl)
	sub	a,#0x05
	jr	NC,00155$
;carwar.c:1124: curPly->nextY = (5 << 8);
	ld	l,c
	ld	h,b
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x05
	jr	00159$
00155$:
;carwar.c:1125: else if(curPly->nextY > (206 << 8))
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
	jr	NC,00159$
;carwar.c:1126: curPly->nextY = (206 << 8);
	ld	l,c
	ld	h,b
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0xCE
00159$:
;carwar.c:993: for(i=0; i<CAR_NUM; i++)
	ld	a,-22 (ix)
	add	a,#0x1C
	ld	-22 (ix),a
	inc	-1 (ix)
	jp	00157$
00160$:
;carwar.c:1132: CarToCarCollision(&game.players[0], &game.players[1]);
	ld	hl,#0x001c + 0x010a + _game
	push	hl
	ld	hl,#0x010a + _game
	push	hl
	call	_CarToCarCollision
	pop	af
	pop	af
;carwar.c:1134: CarToCarCollision(&game.players[0], &game.players[2]);
	ld	hl,#0x0038 + 0x010a + _game
	push	hl
	ld	hl,#0x010a + _game
	push	hl
	call	_CarToCarCollision
	pop	af
	pop	af
;carwar.c:1135: CarToCarCollision(&game.players[1], &game.players[2]);
	ld	hl,#0x0038 + 0x010a + _game
	push	hl
	ld	hl,#0x001c + 0x010a + _game
	push	hl
	call	_CarToCarCollision
	pop	af
	pop	af
;carwar.c:1137: CarToCarCollision(&game.players[0], &game.players[3]);
	ld	hl,#0x0054 + 0x010a + _game
	push	hl
	ld	hl,#0x010a + _game
	push	hl
	call	_CarToCarCollision
	pop	af
	pop	af
;carwar.c:1138: CarToCarCollision(&game.players[1], &game.players[3]);
	ld	hl,#0x0054 + 0x010a + _game
	push	hl
	ld	hl,#0x001c + 0x010a + _game
	push	hl
	call	_CarToCarCollision
	pop	af
	pop	af
;carwar.c:1139: CarToCarCollision(&game.players[2], &game.players[3]);
	ld	hl,#0x0054 + 0x010a + _game
	push	hl
	ld	hl,#0x0038 + 0x010a + _game
	push	hl
	call	_CarToCarCollision
	pop	af
	pop	af
;carwar.c:1142: for(i=0; i<CAR_NUM; i++)
	ld	-1 (ix),#0x00
	ld	b,#0x00
	ld	-33 (ix),#0x00
	ld	-32 (ix),#0x00
00189$:
	ld	a,-1 (ix)
	sub	a,#0x04
	jp	NC,00192$
;carwar.c:1144: curPly = &game.players[i];
	ld	a,#<(0x010a + _game)
	add	a,b
	ld	c,a
	ld	a,#>(0x010a + _game)
	adc	a,#0x00
	ld	-7 (ix), c
	ld	-6 (ix), a
;carwar.c:1147: curPly->prevX = curPly->posX;
	ld	a,-7 (ix)
	add	a,#0x05
	ld	-30 (ix),a
	ld	a,-6 (ix)
	adc	a,#0x00
	ld	-29 (ix),a
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	c,(hl)
	inc	hl
	ld	e,(hl)
	ld	l,-30 (ix)
	ld	h,-29 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),e
;carwar.c:1148: curPly->prevY = curPly->posY;
	ld	a,-7 (ix)
	add	a,#0x07
	ld	-30 (ix),a
	ld	a,-6 (ix)
	adc	a,#0x00
	ld	-29 (ix),a
	ld	a,-7 (ix)
	add	a,#0x02
	ld	-28 (ix),a
	ld	a,-6 (ix)
	adc	a,#0x00
	ld	-27 (ix),a
	ld	l,-28 (ix)
	ld	h,-27 (ix)
	ld	d,(hl)
	inc	hl
	ld	c,(hl)
	ld	l,-30 (ix)
	ld	h,-29 (ix)
	ld	(hl),d
	inc	hl
	ld	(hl),c
;carwar.c:1149: curPly->prevZ = curPly->posZ;
	ld	a,-7 (ix)
	add	a,#0x09
	ld	c,a
	ld	a,-6 (ix)
	adc	a,#0x00
	ld	e,a
	ld	a,-7 (ix)
	add	a,#0x04
	ld	-26 (ix),a
	ld	a,-6 (ix)
	adc	a,#0x00
	ld	-25 (ix),a
	ld	l,-26 (ix)
	ld	h,-25 (ix)
	ld	a,(hl)
	ld	l,c
	ld	h,e
	ld	(hl),a
;carwar.c:1152: curPly->posX = curPly->nextX;
	ld	a,-7 (ix)
	add	a,#0x16
	ld	l, a
	ld	a, -6 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a,(hl)
	ld	-30 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-29 (ix),a
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	a,-30 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-29 (ix)
	ld	(hl),a
;carwar.c:1153: curPly->posY = curPly->nextY;
	ld	a,-7 (ix)
	add	a,#0x18
	ld	l, a
	ld	a, -6 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a,(hl)
	ld	-24 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-23 (ix),a
	ld	l,-28 (ix)
	ld	h,-27 (ix)
	ld	a,-24 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-23 (ix)
	ld	(hl),a
;carwar.c:1154: curPly->posZ = g_HeightTab[curPly->jump];
	ld	a,-7 (ix)
	add	a,#0x11
	ld	l, a
	ld	a, -6 (ix)
	adc	a, #0x00
	ld	h, a
	ld	l,(hl)
	ld	a,#<(_g_HeightTab)
	add	a,l
	ld	e,a
	ld	a,#>(_g_HeightTab)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	ld	c,a
	ld	l,-26 (ix)
	ld	h,-25 (ix)
	ld	(hl),c
;carwar.c:1157: HMMM(PosXToSprt(curPly->posX), game.yOffset + PosYToSprt(curPly->posY) - curPly->posZ, (13 * i) + (52 * game.page), 212, 13, 11 + 1 + game.players[i].posZ);
	ld	a, -29 (ix)
	ld	h, #0x00
	add	a,#0xFA
	ld	e,a
	ld	a,h
	adc	a,#0xFF
	ld	d,a
	ld	hl,#0x09a0 + _game
	ld	(hl),e
	inc	hl
	ld	(hl),d
	ld	hl,#0x0007 + _game
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	ld	a, -23 (ix)
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
	ld	e,a
	ld	a,d
	sbc	a,h
	ld	d,a
	ld	hl,#0x0002 + 0x09a0 + _game
	ld	(hl),e
	inc	hl
	ld	(hl),d
	ld	hl,#0x0005 + _game
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
	ld	a,-33 (ix)
	add	a,e
	ld	e,a
	ld	a,-32 (ix)
	adc	a,d
	ld	d,a
	ld	hl,#0x0004 + 0x09a0 + _game
	ld	(hl),e
	inc	hl
	ld	(hl),d
	inc	hl
	ld	(hl),#0xD4
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x0D
	inc	hl
	ld	(hl),#0x00
	ld	a,#<(0x010a + _game)
	add	a,b
	ld	e,a
	ld	a,#>(0x010a + _game)
	adc	a,#0x00
	ld	d,a
	inc	de
	inc	de
	inc	de
	inc	de
	ld	a,(de)
	ld	h, #0x00
	add	a,#0x0C
	ld	e,a
	ld	a,h
	adc	a,#0x00
	ld	d,a
	ld	hl,#0x000a + 0x09a0 + _game
	ld	(hl),e
	inc	hl
	ld	(hl),d
	ld	hl,#0x000e + 0x09a0 + _game
	ld	(hl),#0xD0
	ld	l,#<(0x09a0 + _game)
	ld	h,#>(0x09a0 + _game)
	push	bc
	push	hl
	call	_VPDCommand32
	pop	af
	pop	bc
;carwar.c:1142: for(i=0; i<CAR_NUM; i++)
	ld	a,b
	add	a,#0x1C
	ld	b,a
	ld	a,-33 (ix)
	add	a,#0x0D
	ld	-33 (ix),a
	ld	a,-32 (ix)
	adc	a,#0x00
	ld	-32 (ix),a
	inc	-1 (ix)
	jp	00189$
00192$:
;carwar.c:1162: for(i=0; i<CAR_NUM; i++)
	ld	-1 (ix),#0x00
	ld	-31 (ix),#0x00
	ld	-30 (ix),#0x00
	ld	-33 (ix),#0x00
	ld	-32 (ix),#0x00
00193$:
	ld	a,-1 (ix)
	sub	a,#0x04
	jp	NC,00196$
;carwar.c:1164: curPly = &game.players[i];
	ld	a,#<(0x010a + _game)
	add	a,-30 (ix)
	ld	d,a
	ld	a,#>(0x010a + _game)
	adc	a,#0x00
	ld	-7 (ix), d
	ld	-6 (ix), a
;carwar.c:1165: if(curPly->life != 0) 
	ld	a,-7 (ix)
	add	a,#0x1A
	ld	c,a
	ld	a,-6 (ix)
	adc	a,#0x00
	ld	d, a
	ld	l, c
	ld	h, a
	ld	a,(hl)
	or	a,a
	jp	Z,00170$
;carwar.c:1168: LMMM(13 * 16, 256 + 212, PosXToSprt(curPly->posX), game.yOffset + PosYToSprt(curPly->posY) + 2, 13, 8, VDP_OP_TIMP);
	ld	hl,#0x09a0 + _game
	ld	(hl),#0xD0
	inc	hl
	ld	(hl),#0x00
	ld	hl,#0x0002 + 0x09a0 + _game
	ld	(hl),#0xD4
	inc	hl
	ld	(hl),#0x01
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	inc	hl
	ld	a, (hl)
	ld	h, #0x00
	add	a,#0xFA
	ld	b,a
	ld	a,h
	adc	a,#0xFF
	ld	e,a
	ld	hl,#0x0004 + 0x09a0 + _game
	ld	(hl),b
	inc	hl
	ld	(hl),e
	ld	hl,#0x0007 + _game
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	add	a,#0xFD
	ld	b,a
	ld	a,h
	adc	a,#0xFF
	ld	e,a
	ld	a,-7 (ix)
	add	a,#0x02
	ld	-28 (ix),a
	ld	a,-6 (ix)
	adc	a,#0x00
	ld	-27 (ix),a
	ld	l,-28 (ix)
	ld	h,-27 (ix)
	inc	hl
	ld	l, (hl)
	ld	h,#0x00
	ld	a,b
	add	a,l
	ld	b,a
	ld	a,e
	adc	a,h
	ld	e,a
	ld	hl,#0x0006 + 0x09a0 + _game
	ld	(hl),b
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),#0x0D
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x08
	inc	hl
	ld	(hl),#0x00
	ld	hl,#0x000e + 0x09a0 + _game
	ld	(hl),#0x98
	ld	l,#<(0x09a0 + _game)
	ld	h,#>(0x09a0 + _game)
	push	bc
	push	de
	push	hl
	call	_VPDCommand32
	pop	af
	pop	de
	pop	bc
;carwar.c:1169: LMMM(13 * (curPly->rot >> 4), 256 + 212 + (11 * i), PosXToSprt(curPly->posX), game.yOffset + PosYToSprt(curPly->posY) - curPly->posZ, 13, 11, VDP_OP_TIMP);
	ld	a,-7 (ix)
	add	a,#0x10
	ld	-26 (ix),a
	ld	a,-6 (ix)
	adc	a,#0x00
	ld	-25 (ix),a
	ld	l,-26 (ix)
	ld	h,-25 (ix)
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
	ld	b,l
	ld	e,h
	ld	hl,#0x09a0 + _game
	ld	(hl),b
	inc	hl
	ld	(hl),e
	ld	a,-33 (ix)
	add	a,#0xD4
	ld	b,a
	ld	a,-32 (ix)
	adc	a,#0x01
	ld	e,a
	ld	hl,#0x0002 + 0x09a0 + _game
	ld	(hl),b
	inc	hl
	ld	(hl),e
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	inc	hl
	ld	a, (hl)
	ld	h, #0x00
	add	a,#0xFA
	ld	b,a
	ld	a,h
	adc	a,#0xFF
	ld	e,a
	ld	hl,#0x0004 + 0x09a0 + _game
	ld	(hl),b
	inc	hl
	ld	(hl),e
	ld	hl,#0x0007 + _game
	ld	b,(hl)
	inc	hl
	ld	e,(hl)
	ld	l,-28 (ix)
	ld	h,-27 (ix)
	inc	hl
	ld	a, (hl)
	ld	h, #0x00
	add	a,#0xFB
	ld	l,a
	ld	a,h
	adc	a,#0xFF
	ld	h,a
	ld	a,b
	add	a,l
	ld	b,a
	ld	a,e
	adc	a,h
	ld	e,a
	ld	a,-7 (ix)
	add	a,#0x04
	ld	-24 (ix),a
	ld	a,-6 (ix)
	adc	a,#0x00
	ld	-23 (ix),a
	ld	l,-24 (ix)
	ld	h,-23 (ix)
	ld	l,(hl)
	ld	h,#0x00
	ld	a,b
	sub	a,l
	ld	b,a
	ld	a,e
	sbc	a,h
	ld	e,a
	ld	hl,#0x0006 + 0x09a0 + _game
	ld	(hl),b
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),#0x0D
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x0B
	inc	hl
	ld	(hl),#0x00
	ld	hl,#0x000e + 0x09a0 + _game
	ld	(hl),#0x98
	ld	l,#<(0x09a0 + _game)
	ld	h,#>(0x09a0 + _game)
	push	bc
	push	de
	push	hl
	call	_VPDCommand32
	pop	af
	pop	de
	pop	bc
;carwar.c:1172: j = g_SmokeFrq[curPly->life >> 5];
	ld	l,c
	ld	h,d
	ld	a,(hl)
	srl	a
	srl	a
	srl	a
	srl	a
	srl	a
	add	a,#<(_g_SmokeFrq)
	ld	c,a
	ld	a,#>(_g_SmokeFrq)
	adc	a,#0x00
	ld	b,a
	ld	a,(bc)
;carwar.c:1173: if((j != 255) && Modulo2(game.frame, j) == 0)
	ld	c,a
	inc	a
	jp	Z,00195$
	ld	hl,#_game
	ld	l,(hl)
	ld	e,c
	ld	d,#0x00
	dec	de
	ld	h,#0x00
	ld	a,l
	and	a,e
	ld	l,a
	ld	a,h
	and	a,d
	ld	h,a
	ld	a,l
	or	a,h
	jp	NZ,00195$
;carwar.c:1175: j = (i * 3) + curPly->sprt;
	ld	a,-7 (ix)
	add	a,#0x1B
	ld	e,a
	ld	a,-6 (ix)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	ld	l,a
	ld	a,-31 (ix)
	add	a,l
	ld	c,a
;carwar.c:1176: curPly->sprt++;
	ld	b,l
	inc	b
	ld	a,b
	ld	(de),a
;carwar.c:1177: if(curPly->sprt > 2)
	ld	a,#0x02
	sub	a,b
	jr	NC,00162$
;carwar.c:1178: curPly->sprt = 0;
	ld	a,#0x00
	ld	(de),a
00162$:
;carwar.c:1179: game.smokes[j].step = 0;
	ld	a,c
	ld	e,a
	add	a,a
	add	a,e
	ld	c, a
	add	a,#<(0x097c + _game)
	ld	e,a
	ld	a,#>(0x097c + _game)
	adc	a,#0x00
	ld	d,a
	ld	a,#0x00
	ld	(de),a
;carwar.c:1180: dir = curPly->rot >> 2;
	ld	l,-26 (ix)
	ld	h,-25 (ix)
	ld	b, (hl)
	srl	b
	srl	b
;carwar.c:1181: game.smokes[j].pos.x = PosToPxl(curPly->posX) - 4 - (g_Cosinus64[dir] >> 5);
	ld	a,#<(0x097c + _game)
	add	a,c
	ld	e,a
	ld	a,#>(0x097c + _game)
	adc	a,#0x00
	ld	d,a
	ld	hl,#0x0001
	add	hl,de
	ld	-22 (ix),l
	ld	-21 (ix),h
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	inc	hl
	ld	a, (hl)
	add	a,#0xFC
	ld	-26 (ix),a
	sla	b
	ld	a,#<(_g_Cosinus64)
	add	a,b
	ld	l, a
	ld	a, #>(_g_Cosinus64)
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
	sra	h
	rr	l
	ld	a,-26 (ix)
	sub	a,l
	ld	l,-22 (ix)
	ld	h,-21 (ix)
	ld	(hl),a
;carwar.c:1182: game.smokes[j].pos.y = PosToPxl(curPly->posY) - 4 + (g_Sinus64[dir] >> 5) - curPly->posZ;
	ld	a,#<(0x097c + _game)
	add	a,c
	ld	c,a
	ld	a,#>(0x097c + _game)
	adc	a,#0x00
	ld	e,a
	ld	a,c
	add	a,#0x02
	ld	c,a
	ld	a,e
	adc	a,#0x00
	ld	e,a
	ld	l,-28 (ix)
	ld	h,-27 (ix)
	inc	hl
	ld	a, (hl)
	add	a,#0xFC
	ld	-28 (ix),a
	ld	a,#<(_g_Sinus64)
	add	a,b
	ld	l, a
	ld	a, #>(_g_Sinus64)
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
	sra	h
	rr	l
	ld	a,-28 (ix)
	add	a,l
	ld	b,a
	ld	l,-24 (ix)
	ld	h,-23 (ix)
	ld	l,(hl)
	ld	a,b
	sub	a,l
	ld	l,c
	ld	h,e
	ld	(hl),a
	jp	00195$
00170$:
;carwar.c:1187: if(curPly->flag & CAR_MOVE)
	ld	a,-7 (ix)
	add	a,#0x0F
	ld	c,a
	ld	a,-6 (ix)
	adc	a,#0x00
	ld	b,a
	ld	a,(bc)
	and	a,#0x04
	jr	Z,00167$
;carwar.c:1188: curPly->sprt = Modulo2(++curPly->sprt, 4);
	ld	a,-7 (ix)
	add	a,#0x1B
	ld	c,a
	ld	a,-6 (ix)
	adc	a,#0x00
	ld	b,a
	ld	a,(bc)
	inc	a
	ld	(bc),a
	and	a,#0x03
	ld	(bc),a
	jr	00168$
00167$:
;carwar.c:1190: curPly->sprt = 0;
	ld	a,-7 (ix)
	add	a,#0x1B
	ld	c,a
	ld	a,-6 (ix)
	adc	a,#0x00
	ld	b,a
	ld	a,#0x00
	ld	(bc),a
00168$:
;carwar.c:1191: LMMM(208 + 6 * (curPly->rot >> 5), 476 + 8 * g_AnimIndex[curPly->sprt], PosToPxl(curPly->posX) - 3, game.yOffset + PosToPxl(curPly->posY) - 4 - curPly->posZ, 6, 8, VDP_OP_TIMP);
	ld	a,-7 (ix)
	add	a,#0x10
	ld	c,a
	ld	a,-6 (ix)
	adc	a,#0x00
	ld	b,a
	ld	a,(bc)
	srl	a
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
	ld	bc,#0x00D0
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	hl,#0x09a0 + _game
	ld	(hl),c
	inc	hl
	ld	(hl),b
	ld	a,-7 (ix)
	add	a,#0x1B
	ld	c,a
	ld	a,-6 (ix)
	adc	a,#0x00
	ld	b,a
	ld	a,(bc)
	add	a,#<(_g_AnimIndex)
	ld	c,a
	ld	a,#>(_g_AnimIndex)
	adc	a,#0x00
	ld	b,a
	ld	a,(bc)
	ld	l,a
	ld	h,#0x00
	add	hl,hl
	add	hl,hl
	add	hl,hl
	ld	bc, #0x01DC
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	hl,#0x0002 + 0x09a0 + _game
	ld	(hl),c
	inc	hl
	ld	(hl),b
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	inc	hl
	ld	a, (hl)
	ld	h, #0x00
	add	a,#0xFD
	ld	c,a
	ld	a,h
	adc	a,#0xFF
	ld	b,a
	ld	hl,#0x0004 + 0x09a0 + _game
	ld	(hl),c
	inc	hl
	ld	(hl),b
	ld	hl,#0x0007 + _game
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	inc	hl
	inc	hl
	inc	hl
	ld	l, (hl)
	ld	h,#0x00
	add	hl,bc
	ld	a, l
	ld	b, h
	add	a,#0xFC
	ld	c,a
	ld	a,b
	adc	a,#0xFF
	ld	b,a
	ld	a,-7 (ix)
	add	a,#0x04
	ld	e,a
	ld	a,-6 (ix)
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
	ld	hl,#0x0006 + 0x09a0 + _game
	ld	(hl),c
	inc	hl
	ld	(hl),b
	inc	hl
	ld	(hl),#0x06
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x08
	inc	hl
	ld	(hl),#0x00
	ld	hl,#0x000e + 0x09a0 + _game
	ld	(hl),#0x98
	ld	l,#<(0x09a0 + _game)
	ld	h,#>(0x09a0 + _game)
	push	hl
	call	_VPDCommand32
	pop	af
00195$:
;carwar.c:1162: for(i=0; i<CAR_NUM; i++)
	inc	-31 (ix)
	inc	-31 (ix)
	inc	-31 (ix)
	ld	a,-30 (ix)
	add	a,#0x1C
	ld	-30 (ix),a
	ld	a,-33 (ix)
	add	a,#0x0B
	ld	-33 (ix),a
	ld	a,-32 (ix)
	adc	a,#0x00
	ld	-32 (ix),a
	inc	-1 (ix)
	jp	00193$
00196$:
;carwar.c:1197: for(i=0; i<12; i++)
	ld	-1 (ix),#0x00
	ld	b,#0x00
00197$:
	ld	a,-1 (ix)
	sub	a,#0x0C
	jp	NC,00200$
;carwar.c:1199: if(game.smokes[i].step != 0xFF)
	ld	a,#<(0x097c + _game)
	add	a,b
	ld	e,a
	ld	a,#>(0x097c + _game)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	inc	a
	jr	Z,00175$
;carwar.c:1201: SetSpriteUniColor(i, game.smokes[i].pos.x, game.smokes[i].pos.y, 16 * 3 + game.smokes[i].step, 0x07);
	ld	a,#<(0x097c + _game)
	add	a,b
	ld	e,a
	ld	a,#>(0x097c + _game)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	add	a,#0x30
	ld	e,a
	ld	a,#<(0x097c + _game)
	add	a,b
	ld	d,a
	ld	a,#>(0x097c + _game)
	adc	a,#0x00
	ld	c,a
	ld	a,d
	add	a,#0x02
	ld	d,a
	ld	a,c
	adc	a,#0x00
	ld	h, a
	ld	l, d
	ld	a,(hl)
	ld	-33 (ix),a
	ld	a,#<(0x097c + _game)
	add	a,b
	ld	c,a
	ld	a,#>(0x097c + _game)
	adc	a,#0x00
	ld	d,a
	inc	c
	jr	NZ,00313$
	inc	d
00313$:
	ld	l,c
	ld	h,d
	ld	c,(hl)
	push	bc
	ld	d,#0x07
	push	de
	ld	b, -33 (ix)
	push	bc
	ld	a,-1 (ix)
	push	af
	inc	sp
	call	_SetSpriteUniColor
	pop	af
	pop	af
	inc	sp
	pop	bc
;carwar.c:1202: game.smokes[i].step++;
	ld	a,#<(0x097c + _game)
	add	a,b
	ld	e,a
	ld	a,#>(0x097c + _game)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	inc	a
	ld	(de),a
;carwar.c:1203: if(game.smokes[i].step >= 8)
	ld	a,#<(0x097c + _game)
	add	a,b
	ld	e,a
	ld	a,#>(0x097c + _game)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	sub	a,#0x08
	jr	C,00199$
;carwar.c:1204: game.smokes[i].step = 0xFF;
	ld	a,#<(0x097c + _game)
	add	a,b
	ld	e,a
	ld	a,#>(0x097c + _game)
	adc	a,#0x00
	ld	d,a
	ld	a,#0xFF
	ld	(de),a
	jr	00199$
00175$:
;carwar.c:1207: SetSpriteUniColor(i, 0, 212, 0, 0);
	push	bc
	ld	hl,#0x0000
	push	hl
	ld	h, #0xD4
	push	hl
	ld	a,-1 (ix)
	push	af
	inc	sp
	call	_SetSpriteUniColor
	pop	af
	pop	af
	inc	sp
	pop	bc
00199$:
;carwar.c:1197: for(i=0; i<12; i++)
	inc	b
	inc	b
	inc	b
	inc	-1 (ix)
	jp	00197$
00200$:
;carwar.c:1211: keyLine = GetKeyMatrixLine(7);
	ld	a,#0x07
	push	af
	inc	sp
	call	_GetKeyMatrixLine
	inc	sp
	ld	c,l
;carwar.c:1212: if((keyLine & KEY_F5) == 0)
	ld	a,c
	and	a,#0x02
	jr	NZ,00178$
;carwar.c:1213: game.state = StateStartGame;
	ld	hl,#0x017a + _game
	ld	(hl),#<(_StateStartGame)
	inc	hl
	ld	(hl),#>(_StateStartGame)
00178$:
;carwar.c:1214: if((keyLine & KEY_ESC) == 0)
	ld	a,c
	and	a,#0x04
	jr	NZ,00180$
;carwar.c:1215: game.state = StateTitle;
	ld	hl,#0x017a + _game
	ld	(hl),#<(_StateTitle)
	inc	hl
	ld	(hl),#>(_StateTitle)
00180$:
;carwar.c:1217: waitRetrace();
	call	_waitRetrace
;carwar.c:1218: game.frame++;
	ld	a,(#_game)
	inc	a
	ld	(#_game),a
	ld	sp,ix
	pop	ix
	ret
_StateUpdateGame_end::
;carwar.c:1228: void InitializePlayer(Player* ply, u8 car, u8 posX, u8 posY, u8 rot)
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
;carwar.c:1230: ply->car = car; // car index
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	hl,#0x000E
	add	hl,bc
	ex	de,hl
	ld	a,6 (ix)
	ld	(de),a
;carwar.c:1231: ply->posX = posX << 8; // position X
	ld	d, 7 (ix)
	ld	e,#0x00
	ld	l,c
	ld	h,b
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:1232: ply->posY = posY << 8; // position Y
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
;carwar.c:1233: ply->prevX = ply->posX; // previous position X
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
;carwar.c:1234: ply->prevY = ply->posY; // previous position Y
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
;carwar.c:1235: ply->validX = ply->posX;
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
;carwar.c:1236: ply->validY = ply->posY;
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
;carwar.c:1237: ply->rot = rot; // rotation
	ld	hl,#0x0010
	add	hl,bc
	ex	de,hl
	ld	a,9 (ix)
	ld	(de),a
;carwar.c:1238: ply->velX = 0; // velocity X
	ld	hl,#0x000A
	add	hl,bc
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;carwar.c:1239: ply->velY = 0; // velocity Y
	ld	hl,#0x000C
	add	hl,bc
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;carwar.c:1240: ply->jump = 0;
	ld	hl,#0x0011
	add	hl,bc
	ex	de,hl
	ld	a,#0x00
	ld	(de),a
;carwar.c:1241: ply->posZ = 0;
	ld	hl,#0x0004
	add	hl,bc
	ex	de,hl
	ld	a,#0x00
	ld	(de),a
;carwar.c:1242: ply->prevZ = 0;
	ld	hl,#0x0009
	add	hl,bc
	ex	de,hl
	ld	a,#0x00
	ld	(de),a
;carwar.c:1243: ply->life = 0xFF;
	ld	hl,#0x001A
	add	hl,bc
	ex	de,hl
	ld	a,#0xFF
	ld	(de),a
;carwar.c:1244: ply->sprt = 0;
	ld	hl,#0x001B
	add	hl,bc
	ld	(hl),#0x00
	ld	sp,ix
	pop	ix
	ret
_InitializePlayer_end::
;carwar.c:1248: void CheckJoy(Player* ply, u8 joy)
;	---------------------------------
; Function CheckJoy
; ---------------------------------
_CheckJoy_start::
_CheckJoy:
	push	ix
	ld	ix,#0
	add	ix,sp
;carwar.c:1250: switch (Joystick(joy)) // Joy 1 direction
	ld	c,6 (ix)
	push	bc
	ld	a,c
	push	af
	inc	sp
	call	_Joystick
	inc	sp
	pop	bc
	ld	a,l
	sub	a,#0x02
	jp	PO,00115$
	xor	a,#0x80
00115$:
	jp	M,00107$
	ld	a,#0x08
	sub	a,l
	jp	PO,00116$
	xor	a,#0x80
00116$:
	jp	M,00107$
	ld	a,l
	add	a,#0xFE
	ld	b,a
	push	de
	ld	e,b
	ld	d,#0x00
	ld	hl,#00117$
	add	hl,de
	add	hl,de
;carwar.c:1252: case 2: // up-right
	pop	de
	jp	(hl)
00117$:
	jr	00101$
	jr	00102$
	jr	00103$
	jr	00107$
	jr	00104$
	jr	00105$
	jr	00106$
00101$:
;carwar.c:1253: case 3: // right
00102$:
;carwar.c:1254: case 4: // down-right
00103$:
;carwar.c:1255: ply->flag |= CAR_TURN_RIGHT;
	ld	a, 4 (ix)
	ld	h, 5 (ix)
	add	a,#0x0F
	ld	e,a
	ld	a,h
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	or	a,#0x01
	ld	(de),a
;carwar.c:1256: break;
	jr	00107$
;carwar.c:1257: case 6: // down-left
00104$:
;carwar.c:1258: case 7: // left
00105$:
;carwar.c:1259: case 8:// up-left
00106$:
;carwar.c:1260: ply->flag |= CAR_TURN_LEFT;
	ld	a, 4 (ix)
	ld	h, 5 (ix)
	add	a,#0x0F
	ld	e,a
	ld	a,h
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	or	a,#0x02
	ld	(de),a
;carwar.c:1262: }
00107$:
;carwar.c:1263: if(Joytrig(joy) != 0) // Joy 1 Button A
	ld	a, c
	push	af
	inc	sp
	call	_Joytrig
	inc	sp
	xor	a,a
	or	a,l
	jr	Z,00110$
;carwar.c:1264: ply->flag |= CAR_MOVE;
	ld	a, 4 (ix)
	ld	h, 5 (ix)
	add	a,#0x0F
	ld	c,a
	ld	a,h
	adc	a,#0x00
	ld	b,a
	ld	a,(bc)
	or	a,#0x04
	ld	(bc),a
00110$:
	pop	ix
	ret
_CheckJoy_end::
;carwar.c:1268: void DamageCar(Player* ply, u8 hit)
;	---------------------------------
; Function DamageCar
; ---------------------------------
_DamageCar_start::
_DamageCar:
	push	ix
	ld	ix,#0
	add	ix,sp
;carwar.c:1270: if(ply->life > hit)
	ld	a, 4 (ix)
	ld	h, 5 (ix)
	add	a,#0x1A
	ld	c,a
	ld	a,h
	adc	a,#0x00
	ld	b,a
	ld	a,(bc)
	ld	l,a
	ld	a,6 (ix)
	sub	a,l
	jr	NC,00102$
;carwar.c:1271: ply->life -= hit;
	ld	a,l
	sub	a,6 (ix)
	ld	(bc),a
	jr	00104$
00102$:
;carwar.c:1273: ply->life = 0;
	ld	a,#0x00
	ld	(bc),a
00104$:
	pop	ix
	ret
_DamageCar_end::
;carwar.c:1277: i8 AngleDifferent64(i8 angleA, i8 angleB)
;	---------------------------------
; Function AngleDifferent64
; ---------------------------------
_AngleDifferent64_start::
_AngleDifferent64:
	push	ix
	ld	ix,#0
	add	ix,sp
;carwar.c:1280: diff = angleB - angleA;
	ld	a,5 (ix)
	sub	a,4 (ix)
;carwar.c:1281: if(diff < -32)
	ld	c,a
	sub	a,#0xE0
	jp	PO,00109$
	xor	a,#0x80
00109$:
	jp	P,00102$
;carwar.c:1282: diff += 64;
	ld	a,c
	add	a,#0x40
	ld	c,a
00102$:
;carwar.c:1283: if(diff > 32)
	ld	a,#0x20
	sub	a,c
	jp	PO,00110$
	xor	a,#0x80
00110$:
	jp	P,00104$
;carwar.c:1284: diff -= 64;
	ld	a,c
	add	a,#0xC0
	ld	c,a
00104$:
;carwar.c:1285: return diff;
	ld	l,c
	pop	ix
	ret
_AngleDifferent64_end::
;carwar.c:1302: u8 VectorToAngle256(i16 x, i16 y)
;	---------------------------------
; Function VectorToAngle256
; ---------------------------------
_VectorToAngle256_start::
_VectorToAngle256:
	push	ix
	ld	ix,#0
	add	ix,sp
;carwar.c:1304: while(Abs16(x) > 15 || Abs16(y) > 15)
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
;carwar.c:1306: x >>= 2;
	sra	5 (ix)
	rr	4 (ix)
	sra	5 (ix)
	rr	4 (ix)
;carwar.c:1307: y >>= 2;
	sra	7 (ix)
	rr	6 (ix)
	sra	7 (ix)
	rr	6 (ix)
	jr	00102$
00104$:
;carwar.c:1309: x += 15; // x E [0;30]
	ld	a,4 (ix)
	add	a,#0x0F
	ld	4 (ix),a
	ld	a,5 (ix)
	adc	a,#0x00
	ld	5 (ix),a
;carwar.c:1310: y += 15; // x E [0;30]
	ld	a,6 (ix)
	add	a,#0x0F
	ld	6 (ix),a
	ld	a,7 (ix)
	adc	a,#0x00
	ld	7 (ix),a
;carwar.c:1311: return g_Rotation16[(x * 31) + y];
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
;carwar.c:1333: u16 GetVectorLenght256(i16 x, i16 y)
;	---------------------------------
; Function GetVectorLenght256
; ---------------------------------
_GetVectorLenght256_start::
_GetVectorLenght256:
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;carwar.c:1338: div = 1;
	ld	-1 (ix),#0x01
;carwar.c:1339: lenSq = x*x + y*y; // get squared length
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
;carwar.c:1340: while(lenSq >= 256)
00101$:
	ld	a,b
	sub	a,#0x01
	jr	C,00103$
;carwar.c:1342: lenSq /= 2;
	srl	b
	rr	c
;carwar.c:1343: div *= 2;
	sla	-1 (ix)
	jr	00101$
00103$:
;carwar.c:1345: div = g_SquareRoot256[div] >> 4; // squared-root the div factor
	ld	a,#<(_g_SquareRoot256)
	add	a,-1 (ix)
	ld	e,a
	ld	a,#>(_g_SquareRoot256)
	adc	a,#0x00
	ld	d,a
	ld	a,(de)
	srl	a
	srl	a
	srl	a
	srl	a
	ld	-1 (ix),a
;carwar.c:1346: ret = g_SquareRoot256[lenSq] >> 4; // get square root (.2^3)
	ld	hl,#_g_SquareRoot256
	add	hl,bc
	ld	a,(hl)
	srl	a
	srl	a
	srl	a
	srl	a
	ld	c, a
	ld	b,#0x00
;carwar.c:1347: return ret * div; // get length
	ld	l,-1 (ix)
	ld	h,#0x00
	push	hl
	push	bc
	call	__mulint_rrx_s
	ld	sp,ix
	pop	ix
	ret
_GetVectorLenght256_end::
;carwar.c:1352: void CarToCarCollision(Player* ply1, Player* ply2)
;	---------------------------------
; Function CarToCarCollision
; ---------------------------------
_CarToCarCollision_start::
_CarToCarCollision:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-28
	add	hl,sp
	ld	sp,hl
;carwar.c:1356: dist = ply2->nextX - ply1->nextX;
	ld	c,6 (ix)
	ld	b,7 (ix)
	ld	hl,#0x0016
	add	hl,bc
	ld	-12 (ix),l
	ld	-11 (ix),h
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,4 (ix)
	ld	-14 (ix),a
	ld	a,5 (ix)
	ld	-13 (ix),a
	ld	a,-14 (ix)
	add	a,#0x16
	ld	-16 (ix),a
	ld	a,-13 (ix)
	adc	a,#0x00
	ld	-15 (ix),a
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	ld	a,e
	sub	a,l
	ld	l,a
	ld	a,d
	sbc	a,h
	ld	-10 (ix), l
;carwar.c:1357: x1 = dist >> 8;
	ld	-9 (ix), a
	ld	-2 (ix), a
	rlc	a
	sbc	a,a
	ld	-1 (ix),a
;carwar.c:1358: dist = ply2->nextY - ply1->nextY;
	ld	hl,#0x0018
	add	hl,bc
	ld	-18 (ix),l
	ld	-17 (ix),h
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,-14 (ix)
	add	a,#0x18
	ld	-20 (ix),a
	ld	a,-13 (ix)
	adc	a,#0x00
	ld	-19 (ix),a
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	ld	a,e
	sub	a,l
	ld	l,a
	ld	a,d
	sbc	a,h
	ld	-10 (ix), l
;carwar.c:1359: y1 = dist >> 8;
	ld	-9 (ix), a
	ld	-4 (ix), a
	rlc	a
	sbc	a,a
	ld	-3 (ix),a
;carwar.c:1360: dist = (x1 * x1) + (y1 * y1);
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
	ld	-21 (ix),h
	ld	-22 (ix),l
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
	ld	a,-22 (ix)
	add	a,e
	ld	e,a
	ld	a,-21 (ix)
	adc	a,d
	ld	-10 (ix), e
	ld	-9 (ix), a
;carwar.c:1361: if(dist < CAR_CHECK_LEN * CAR_CHECK_LEN) // Collision occured
	ld	a,-10 (ix)
	sub	a,#0x64
	ld	a,-9 (ix)
	sbc	a,#0x00
	jp	PO,00106$
	xor	a,#0x80
00106$:
	jp	P,00103$
;carwar.c:1363: x1 = ply1->velX;
	ld	a,-14 (ix)
	add	a,#0x0A
	ld	-22 (ix),a
	ld	a,-13 (ix)
	adc	a,#0x00
	ld	-21 (ix),a
	ld	l,-22 (ix)
	ld	h,-21 (ix)
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	-2 (ix), a
	ld	-1 (ix),h
;carwar.c:1364: y1 = ply1->velY;
	ld	a,-14 (ix)
	add	a,#0x0C
	ld	-24 (ix),a
	ld	a,-13 (ix)
	adc	a,#0x00
	ld	-23 (ix),a
	ld	l,-24 (ix)
	ld	h,-23 (ix)
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	-4 (ix), a
	ld	-3 (ix),h
;carwar.c:1365: x2 = ply2->velX;
	ld	hl,#0x000A
	add	hl,bc
	ld	-26 (ix),l
	ld	-25 (ix),h
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	-6 (ix), a
	ld	-5 (ix),h
;carwar.c:1366: y2 = ply2->velY;
	ld	hl,#0x000C
	add	hl,bc
	ld	-28 (ix),l
	ld	-27 (ix),h
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	-8 (ix), a
	ld	-7 (ix),h
;carwar.c:1368: ply1->velX = x2 - x1;
	ld	a,-6 (ix)
	sub	a,-2 (ix)
	ld	e,a
	ld	a,-5 (ix)
	sbc	a,-1 (ix)
	ld	d,a
	ld	l,-22 (ix)
	ld	h,-21 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:1369: ply1->velY = y2 - y1;
	ld	a,-8 (ix)
	sub	a,-4 (ix)
	ld	e,a
	ld	a,-7 (ix)
	sbc	a,-3 (ix)
	ld	d,a
	ld	l,-24 (ix)
	ld	h,-23 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:1370: ply2->velX = x1 - x2;
	ld	a,-2 (ix)
	sub	a,-6 (ix)
	ld	e,a
	ld	a,-1 (ix)
	sbc	a,-5 (ix)
	ld	d,a
	ld	l,-26 (ix)
	ld	h,-25 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:1371: ply2->velY = y1 - y2;
	ld	a,-4 (ix)
	sub	a,-8 (ix)
	ld	e,a
	ld	a,-3 (ix)
	sbc	a,-7 (ix)
	ld	d,a
	ld	l,-28 (ix)
	ld	h,-27 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:1373: ply1->nextX = ply1->posX;
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:1374: ply1->nextY = ply1->posY;
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	inc	hl
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:1375: ply2->nextX = ply2->posX;
	ld	l,c
	ld	h,b
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:1376: ply2->nextY = ply2->posY;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:1378: DamageCar(ply1, 4);
	push	bc
	ld	a,#0x04
	push	af
	inc	sp
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	push	hl
	call	_DamageCar
	pop	af
	inc	sp
	pop	bc
;carwar.c:1379: DamageCar(ply2, 4);
	ld	a,#0x04
	push	af
	inc	sp
	push	bc
	call	_DamageCar
	pop	af
	inc	sp
00103$:
	ld	sp,ix
	pop	ix
	ret
_CarToCarCollision_end::
;carwar.c:1384: void CarToWallCollision(Player* ply)
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
;carwar.c:1388: if((ply->rot > 64) && (ply->rot < 192))
	ld	a,4 (ix)
	ld	-6 (ix),a
	ld	a,5 (ix)
	ld	-5 (ix),a
	ld	a,-6 (ix)
	add	a,#0x10
	ld	-2 (ix),a
	ld	a,-5 (ix)
	adc	a,#0x00
	ld	-1 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	l,(hl)
	ld	a,#0x40
	sub	a,l
	jp	NC,00110$
	ld	a,l
	sub	a,#0xC0
	jp	NC,00110$
;carwar.c:1390: ground = ReadVRAM(game.page, PosToPxl(ply->posX) - WALL_CHECK_LEN + 256 * PosToPxl(ply->posY));
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	inc	hl
	ld	a, (hl)
	ld	h, #0x00
	add	a,#0xFC
	ld	c,a
	ld	a,h
	adc	a,#0xFF
	ld	b,a
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	inc	hl
	inc	hl
	inc	hl
	ld	h, (hl)
	ld	l,#0x00
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	hl,#0x0005 + _game
	ld	e,(hl)
	push	bc
	ld	a,e
	push	af
	inc	sp
	call	_ReadVRAM
	pop	af
	inc	sp
;carwar.c:1391: op = game.colorCode[ground];
	ld	h,#0x00
	ld	a,#<(0x0009 + _game)
	add	a,l
	ld	d,a
	ld	a,#>(0x0009 + _game)
	adc	a,h
	ld	h, a
	ld	l, d
	ld	c, (hl)
;carwar.c:1392: if(op == OP_WALL)
	xor	a,a
	or	a,c
	jp	NZ,00111$
;carwar.c:1394: ply->velX = Abs16(ply->velX) /*>> 1*/;
	ld	a,-6 (ix)
	add	a,#0x0A
	ld	c,a
	ld	a,-5 (ix)
	adc	a,#0x00
	ld	e, a
	ld	l, c
	ld	h, a
	ld	a,(hl)
	ld	-4 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-3 (ix), a
	and	a,#0x80
	jr	Z,00126$
	ld	a,-4 (ix)
	add	a,#0xFF
	ld	b,a
	ld	a,-3 (ix)
	adc	a,#0xFF
	ld	d,a
	ld	a,b
	cpl
	ld	b,a
	ld	a,d
	cpl
	ld	d,a
	jr	00127$
00126$:
	ld	b,-4 (ix)
	ld	d,-3 (ix)
00127$:
	ld	l,c
	ld	h,e
	ld	(hl),b
	inc	hl
	ld	(hl),d
;carwar.c:1395: ply->velY >>= 1;
	ld	a,-6 (ix)
	add	a,#0x0C
	ld	c,a
	ld	a,-5 (ix)
	adc	a,#0x00
	ld	e, a
	ld	l, c
	ld	h, a
	ld	a,(hl)
	inc	hl
	ld	d, (hl)
	ld	b, a
	sra	d
	rr	b
	ld	l,c
	ld	h,e
	ld	(hl),b
	inc	hl
	ld	(hl),d
;carwar.c:1396: if(ply->flag & CAR_MOVE)
	ld	a,-6 (ix)
	add	a,#0x0F
	ld	l, a
	ld	a, -5 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a,(hl)
	and	a,#0x04
	jp	Z,00111$
;carwar.c:1397: DamageCar(ply, 5);
	ld	a,#0x05
	push	af
	inc	sp
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	call	_DamageCar
	pop	af
	inc	sp
	jp	00111$
00110$:
;carwar.c:1402: ground = ReadVRAM(game.page, PosToPxl(ply->posX) + WALL_CHECK_LEN + 256 * PosToPxl(ply->posY));
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	inc	hl
	ld	a, (hl)
	ld	h, #0x00
	add	a,#0x04
	ld	c,a
	ld	a,h
	adc	a,#0x00
	ld	e,a
	ld	a,-6 (ix)
	add	a,#0x02
	ld	l, a
	ld	a, -5 (ix)
	adc	a, #0x00
	ld	h, a
	inc	hl
	ld	h, (hl)
	ld	l,#0x00
	ld	a,c
	add	a,l
	ld	c,a
	ld	a,e
	adc	a,h
	ld	e,a
	ld	hl,#0x0005 + _game
	ld	b,(hl)
	ld	l,c
	ld	h,e
	push	hl
	push	bc
	inc	sp
	call	_ReadVRAM
	pop	af
	inc	sp
;carwar.c:1403: op = game.colorCode[ground];
	ld	h,#0x00
	ld	a,#<(0x0009 + _game)
	add	a,l
	ld	b,a
	ld	a,#>(0x0009 + _game)
	adc	a,h
	ld	h, a
	ld	l, b
	ld	c, (hl)
;carwar.c:1404: if(op == OP_WALL)
	xor	a,a
	or	a,c
	jp	NZ,00111$
;carwar.c:1406: ply->velX = -(Abs16(ply->velX) /*>> 1*/);
	ld	a,-6 (ix)
	add	a,#0x0A
	ld	c,a
	ld	a,-5 (ix)
	adc	a,#0x00
	ld	e, a
	ld	l, c
	ld	h, a
	ld	a,(hl)
	ld	-8 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-7 (ix), a
	and	a,#0x80
	jr	Z,00128$
	ld	a,-8 (ix)
	add	a,#0xFF
	ld	b,a
	ld	a,-7 (ix)
	adc	a,#0xFF
	ld	d,a
	ld	a,b
	cpl
	ld	b,a
	ld	a,d
	cpl
	ld	d,a
	jr	00129$
00128$:
	ld	b,-8 (ix)
	ld	d,-7 (ix)
00129$:
	xor	a,a
	sbc	a,b
	ld	b,a
	ld	a,#0x00
	sbc	a,d
	ld	d,a
	ld	l,c
	ld	h,e
	ld	(hl),b
	inc	hl
	ld	(hl),d
;carwar.c:1407: ply->velY >>= 1;
	ld	a,-6 (ix)
	add	a,#0x0C
	ld	c,a
	ld	a,-5 (ix)
	adc	a,#0x00
	ld	e, a
	ld	l, c
	ld	h, a
	ld	a,(hl)
	inc	hl
	ld	d, (hl)
	ld	b, a
	sra	d
	rr	b
	ld	l,c
	ld	h,e
	ld	(hl),b
	inc	hl
	ld	(hl),d
;carwar.c:1408: if(ply->flag & CAR_MOVE)
	ld	a,-6 (ix)
	add	a,#0x0F
	ld	l, a
	ld	a, -5 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a,(hl)
	and	a,#0x04
	jr	Z,00111$
;carwar.c:1409: DamageCar(ply, 5);
	ld	a,#0x05
	push	af
	inc	sp
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	call	_DamageCar
	pop	af
	inc	sp
00111$:
;carwar.c:1413: if(ply->rot < 128)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a, (hl)
	sub	a,#0x80
	jp	NC,00122$
;carwar.c:1415: ground = ReadVRAM(game.page, PosToPxl(ply->posX) + 256 * (PosToPxl(ply->posY) - WALL_CHECK_LEN));
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	inc	hl
	ld	c, (hl)
	ld	e,#0x00
	ld	a,-6 (ix)
	add	a,#0x02
	ld	l, a
	ld	a, -5 (ix)
	adc	a, #0x00
	ld	h, a
	inc	hl
	ld	a, (hl)
	ld	h, #0x00
	add	a,#0xFC
	ld	l,a
	ld	a,h
	adc	a,#0xFF
	ld	h,l
	ld	l,#0x00
	ld	a,c
	add	a,l
	ld	c,a
	ld	a,e
	adc	a,h
	ld	e,a
	ld	hl,#0x0005 + _game
	ld	b,(hl)
	ld	l,c
	ld	h,e
	push	hl
	push	bc
	inc	sp
	call	_ReadVRAM
	pop	af
	inc	sp
;carwar.c:1416: op = game.colorCode[ground];
	ld	h,#0x00
	ld	a,#<(0x0009 + _game)
	add	a,l
	ld	b,a
	ld	a,#>(0x0009 + _game)
	adc	a,h
	ld	h, a
	ld	l, b
	ld	c, (hl)
;carwar.c:1417: if(op == OP_WALL)
	xor	a,a
	or	a,c
	jp	NZ,00124$
;carwar.c:1419: ply->velX >>= 1;
	ld	a,-6 (ix)
	add	a,#0x0A
	ld	c,a
	ld	a,-5 (ix)
	adc	a,#0x00
	ld	e, a
	ld	l, c
	ld	h, a
	ld	a,(hl)
	inc	hl
	ld	d, (hl)
	ld	b, a
	sra	d
	rr	b
	ld	l,c
	ld	h,e
	ld	(hl),b
	inc	hl
	ld	(hl),d
;carwar.c:1420: ply->velY = -(Abs16(ply->velY) /*>> 1*/);
	ld	a,-6 (ix)
	add	a,#0x0C
	ld	c,a
	ld	a,-5 (ix)
	adc	a,#0x00
	ld	e, a
	ld	l, c
	ld	h, a
	ld	a,(hl)
	ld	-8 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-7 (ix), a
	and	a,#0x80
	jr	Z,00130$
	ld	a,-8 (ix)
	add	a,#0xFF
	ld	b,a
	ld	a,-7 (ix)
	adc	a,#0xFF
	ld	d,a
	ld	a,b
	cpl
	ld	b,a
	ld	a,d
	cpl
	ld	d,a
	jr	00131$
00130$:
	ld	b,-8 (ix)
	ld	d,-7 (ix)
00131$:
	xor	a,a
	sbc	a,b
	ld	b,a
	ld	a,#0x00
	sbc	a,d
	ld	d,a
	ld	l,c
	ld	h,e
	ld	(hl),b
	inc	hl
	ld	(hl),d
;carwar.c:1421: if(ply->flag & CAR_MOVE)
	ld	a,-6 (ix)
	add	a,#0x0F
	ld	l, a
	ld	a, -5 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a,(hl)
	and	a,#0x04
	jp	Z,00124$
;carwar.c:1422: DamageCar(ply, 5);
	ld	a,#0x05
	push	af
	inc	sp
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	call	_DamageCar
	pop	af
	inc	sp
	jp	00124$
00122$:
;carwar.c:1427: ground = ReadVRAM(game.page, PosToPxl(ply->posX) + 256 * (PosToPxl(ply->posY) + WALL_CHECK_LEN));
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	inc	hl
	ld	c, (hl)
	ld	e,#0x00
	ld	a,-6 (ix)
	add	a,#0x02
	ld	l, a
	ld	a, -5 (ix)
	adc	a, #0x00
	ld	h, a
	inc	hl
	ld	a, (hl)
	ld	h, #0x00
	add	a,#0x04
	ld	b,a
	ld	a,h
	adc	a,#0x00
	ld	h,b
	ld	l,#0x00
	ld	a,c
	add	a,l
	ld	c,a
	ld	a,e
	adc	a,h
	ld	e,a
	ld	hl,#0x0005 + _game
	ld	b,(hl)
	ld	l,c
	ld	h,e
	push	hl
	push	bc
	inc	sp
	call	_ReadVRAM
	pop	af
	inc	sp
;carwar.c:1428: op = game.colorCode[ground];
	ld	h,#0x00
	ld	a,#<(0x0009 + _game)
	add	a,l
	ld	e,a
	ld	a,#>(0x0009 + _game)
	adc	a,h
	ld	d,a
	ld	a,(de)
;carwar.c:1429: if(op == OP_WALL)
	or	a,a
	jr	NZ,00124$
;carwar.c:1431: ply->velX >>= 1;
	ld	a,-6 (ix)
	add	a,#0x0A
	ld	c,a
	ld	a,-5 (ix)
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
;carwar.c:1432: ply->velY = Abs16(ply->velY) /*>> 1*/;
	ld	a,-6 (ix)
	add	a,#0x0C
	ld	-8 (ix),a
	ld	a,-5 (ix)
	adc	a,#0x00
	ld	-7 (ix),a
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,d
	and	a,#0x80
	jr	Z,00132$
	ld	c,e
	ld	b,d
	dec	bc
	ld	a,c
	cpl
	ld	c,a
	ld	a,b
	cpl
	ld	b,a
	jr	00133$
00132$:
	ld	c,e
	ld	b,d
00133$:
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
;carwar.c:1433: if(ply->flag & CAR_MOVE)
	ld	a,-6 (ix)
	add	a,#0x0F
	ld	c,a
	ld	a,-5 (ix)
	adc	a,#0x00
	ld	b,a
	ld	a,(bc)
	and	a,#0x04
	jr	Z,00124$
;carwar.c:1434: DamageCar(ply, 5);
	ld	a,#0x05
	push	af
	inc	sp
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	call	_DamageCar
	pop	af
	inc	sp
00124$:
	ld	sp,ix
	pop	ix
	ret
_CarToWallCollision_end::
;carwar.c:1441: void UpackTiles()
;	---------------------------------
; Function UpackTiles
; ---------------------------------
_UpackTiles_start::
_UpackTiles:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-10
	add	hl,sp
	ld	sp,hl
;carwar.c:1444: PrintSprite(64, 64, "UNPACK\nTILES", (u16)&g_DefaultColor);
	ld	c,#<(_g_DefaultColor)
	ld	b,#>(_g_DefaultColor)
	push	bc
	ld	hl,#__str_30
	push	hl
	ld	hl,#0x4040
	push	hl
	call	_PrintSprite
	pop	af
	pop	af
	pop	af
;carwar.c:1445: for(j=0; j<4; j++)
	ld	-2 (ix),#0x00
00113$:
	ld	a,-2 (ix)
	sub	a,#0x04
	jp	NC,00116$
;carwar.c:1447: for(i=0; i<8; i++)
	ld	-1 (ix),#0x00
00109$:
	ld	a,-1 (ix)
	sub	a,#0x08
	jp	NC,00115$
;carwar.c:1449: for(y=0; y<32; y++)
	ld	-4 (ix),#0x00
00105$:
	ld	a,-4 (ix)
	sub	a,#0x20
	jp	NC,00111$
;carwar.c:1451: for(x=0; x<32/8; x++)
	ld	-3 (ix),#0x00
00101$:
	ld	a,-3 (ix)
	sub	a,#0x04
	jp	NC,00107$
;carwar.c:1453: HMMC(i * 32 + x * 8, 256 + j * 32 + y, 8, 1, (u16)&game.bitToByte[g_TrackTiles[(i + j * 8) * 32 * 4 + y * 4 + x] * 8]);
	ld	c,-1 (ix)
	ld	b,#0x00
	ld	l,c
	ld	h,b
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	ld	a,-3 (ix)
	ld	-6 (ix),a
	ld	-5 (ix),#0x00
	ld	e,-6 (ix)
	ld	d,-5 (ix)
	sla	e
	rl	d
	sla	e
	rl	d
	sla	e
	rl	d
	add	hl,de
	ex	de,hl
	ld	hl,#0x09af + _game
	ld	(hl),e
	inc	hl
	ld	(hl),d
	ld	a,-2 (ix)
	ld	-8 (ix),a
	ld	-7 (ix),#0x00
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	ld	e, l
	ld	a,h
	add	a,#0x01
	ld	d,a
	ld	a,-4 (ix)
	ld	-10 (ix),a
	ld	-9 (ix),#0x00
	ld	a,e
	add	a,-10 (ix)
	ld	e,a
	ld	a,d
	adc	a,-9 (ix)
	ld	d,a
	ld	hl,#0x0002 + 0x09af + _game
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
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,bc
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	ld	c,-10 (ix)
	ld	b,-9 (ix)
	sla	c
	rl	b
	sla	c
	rl	b
	add	hl,bc
	ld	a, l
	ld	b, h
	add	a,-6 (ix)
	ld	c,a
	ld	a,b
	adc	a,-5 (ix)
	ld	b,a
	ld	hl,#_g_TrackTiles
	add	hl,bc
	ld	l, (hl)
	ld	h,#0x00
	add	hl,hl
	add	hl,hl
	add	hl,hl
	ld	a,#<(0x017c + _game)
	add	a,l
	ld	e,a
	ld	a,#>(0x017c + _game)
	adc	a,h
	ld	h, a
	ld	l, e
	ld	a,(hl)
	ld	hl,#0x0008 + 0x09af + _game
	ld	(hl),a
	inc	hl
	inc	hl
	ld	(hl),#0xF0
	ld	l,#<(0x09af + _game)
	ld	h,#>(0x09af + _game)
	push	bc
	push	hl
	call	_VPDCommand36
	pop	af
	pop	bc
	ld	hl,#_g_TrackTiles
	add	hl,bc
	ld	l, (hl)
	ld	h,#0x00
	add	hl,hl
	add	hl,hl
	add	hl,hl
	ld	a,#<(0x017c + _game)
	add	a,l
	ld	c,a
	ld	a,#>(0x017c + _game)
	adc	a,h
	ld	h, a
	ld	l, c
	push	hl
	call	_VPDCommandLoop
	pop	af
;carwar.c:1451: for(x=0; x<32/8; x++)
	inc	-3 (ix)
	jp	00101$
00107$:
;carwar.c:1449: for(y=0; y<32; y++)
	inc	-4 (ix)
	jp	00105$
00111$:
;carwar.c:1447: for(i=0; i<8; i++)
	inc	-1 (ix)
	jp	00109$
00115$:
;carwar.c:1445: for(j=0; j<4; j++)
	inc	-2 (ix)
	jp	00113$
00116$:
;carwar.c:1458: ClearSprite();
	call	_ClearSprite
	ld	sp,ix
	pop	ix
	ret
_UpackTiles_end::
__str_30:
	.ascii "UNPACK"
	.db 0x0A
	.ascii "TILES"
	.db 0x00
;carwar.c:1462: void BuildTile(u16 px, u16 py, u8 flag, u8 tile, u8 op, u8 op0)
;	---------------------------------
; Function BuildTile
; ---------------------------------
_BuildTile_start::
_BuildTile:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-13
	add	hl,sp
	ld	sp,hl
;carwar.c:1467: if(flag & BANK_2)
	ld	a,8 (ix)
	and	a,#0x08
	jr	Z,00102$
;carwar.c:1468: tile += 16;
	ld	a,9 (ix)
	add	a,#0x10
	ld	9 (ix),a
00102$:
;carwar.c:1470: if((op0 == OP_WATER) && (op == OP_HOLE))
	ld	a,11 (ix)
	sub	a,#0x0F
	jr	NZ,00108$
	ld	a,10 (ix)
	sub	a,#0x08
	jr	NZ,00108$
;carwar.c:1471: color = COLOR_NAVYBLUE;
	ld	-2 (ix),#0x02
	jr	00142$
00108$:
;carwar.c:1472: else if((op0 == OP_ASPHALT) && (op == OP_ASPHALT))
	ld	a,11 (ix)
	sub	a,#0x09
	jr	NZ,00104$
	ld	a,10 (ix)
	sub	a,#0x09
	jr	NZ,00104$
;carwar.c:1473: color = COLOR_SAND;	
	ld	-2 (ix),#0xDA
	jr	00142$
00104$:
;carwar.c:1475: color = g_BG[op].ColorLight;
	ld	a,10 (ix)
	ld	e,a
	add	a,a
	add	a,a
	add	a,e
	add	a,#<(_g_BG)
	ld	b,a
	ld	a,#>(_g_BG)
	adc	a,#0x00
	ld	e,a
	ld	a,b
	add	a,#0x03
	ld	b,a
	ld	a,e
	adc	a,#0x00
	ld	h, a
	ld	l, b
	ld	a,(hl)
	ld	-2 (ix),a
;carwar.c:1477: for(x=0; x<32; x++)
00142$:
	ld	a,8 (ix)
	and	a,#0x04
	ld	b,a
	ld	a,8 (ix)
	and	a,#0x01
	ld	e,a
	ld	a,8 (ix)
	and	a,#0x02
	ld	-7 (ix),a
	ld	-6 (ix),#0x00
	ld	-5 (ix),#0x00
00124$:
	ld	a,-6 (ix)
	sub	a,#0x20
	ld	a,-5 (ix)
	sbc	a,#0x00
	jp	NC,00128$
;carwar.c:1479: for(y=0; y<32; y++)
	ld	a,4 (ix)
	add	a,-6 (ix)
	ld	-9 (ix),a
	ld	a,5 (ix)
	adc	a,-5 (ix)
	ld	-8 (ix),a
	ld	-4 (ix),#0x00
	ld	-3 (ix),#0x00
00120$:
	ld	a,-4 (ix)
	sub	a,#0x20
	ld	a,-3 (ix)
	sbc	a,#0x00
	jp	NC,00126$
;carwar.c:1481: if(flag & SYM_D) { lx = y; ly = x; }
	xor	a,a
	or	a,b
	jr	Z,00112$
	ld	a,-4 (ix)
	ld	-11 (ix),a
	ld	a,-3 (ix)
	ld	-10 (ix),a
	ld	a,-6 (ix)
	ld	-13 (ix),a
	ld	a,-5 (ix)
	ld	-12 (ix),a
	jr	00113$
00112$:
;carwar.c:1482: else             { lx = x;	ly = y; }
	ld	a,-6 (ix)
	ld	-11 (ix),a
	ld	a,-5 (ix)
	ld	-10 (ix),a
	ld	a,-4 (ix)
	ld	-13 (ix),a
	ld	a,-3 (ix)
	ld	-12 (ix),a
00113$:
;carwar.c:1483: if(flag & SYM_H) { ly = 31 - ly; }
	xor	a,a
	or	a,e
	jr	Z,00115$
	ld	a,#0x1F
	sub	a,-13 (ix)
	ld	-13 (ix),a
	ld	a,#0x00
	sbc	a,-12 (ix)
	ld	-12 (ix),a
00115$:
;carwar.c:1484: if(flag & SYM_V) { lx = 31 - lx; }
	xor	a,a
	or	a,-7 (ix)
	jr	Z,00117$
	ld	a,#0x1F
	sub	a,-11 (ix)
	ld	-11 (ix),a
	ld	a,#0x00
	sbc	a,-10 (ix)
	ld	-10 (ix),a
00117$:
;carwar.c:1485: byte = g_TrackTiles[(tile << 7) + (lx >> 3) + (ly << 2)];
	ld	l,9 (ix)
	ld	h,#0x00
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	ld	c,-11 (ix)
	ld	d,-10 (ix)
	srl	d
	rr	c
	srl	d
	rr	c
	srl	d
	rr	c
	ld	a,l
	add	a,c
	ld	c,a
	ld	a,h
	adc	a,d
	ld	d,a
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	add	hl,hl
	add	hl,hl
	ld	a,c
	add	a,l
	ld	c,a
	ld	a,d
	adc	a,h
	ld	d,a
	ld	a,#<(_g_TrackTiles)
	add	a,c
	ld	c,a
	ld	a,#>(_g_TrackTiles)
	adc	a,d
	ld	h, a
	ld	l, c
	ld	a,(hl)
	ld	-1 (ix),a
;carwar.c:1486: if(byte & (1 << (7 - (lx & 0x07))))
	ld	a,-11 (ix)
	and	a,#0x07
	ld	l,a
	ld	h,#0x00
	ld	a,#0x07
	sub	a,l
	ld	d,a
	ld	a,#0x00
	sbc	a,h
	ld	a,d
	inc	a
	push	af
	ld	d,#0x01
	ld	c,#0x00
	pop	af
	jr	00156$
00155$:
	sla	d
	rl	c
00156$:
	dec	a
	jr	NZ,00155$
	ld	a, -1 (ix)
	ld	h, #0x00
	and	a,d
	ld	l,a
	ld	a,h
	and	a,c
	ld	h,a
	ld	a,l
	or	a,h
	jr	Z,00122$
;carwar.c:1487: WriteVRAM(0, (px + x) + 256 * (py + y), color);
	ld	a,6 (ix)
	add	a,-4 (ix)
	ld	c,a
	ld	a,7 (ix)
	adc	a,-3 (ix)
	ld	h,c
	ld	l,#0x00
	ld	a,-9 (ix)
	add	a,l
	ld	c,a
	ld	a,-8 (ix)
	adc	a,h
	ld	d,a
	push	bc
	push	de
	ld	a,-2 (ix)
	push	af
	inc	sp
	ld	e,c
	push	de
	ld	a,#0x00
	push	af
	inc	sp
	call	_WriteVRAM
	pop	af
	pop	af
	pop	de
	pop	bc
00122$:
;carwar.c:1479: for(y=0; y<32; y++)
	inc	-4 (ix)
	jp	NZ,00120$
	inc	-3 (ix)
	jp	00120$
00126$:
;carwar.c:1477: for(x=0; x<32; x++)
	inc	-6 (ix)
	jp	NZ,00124$
	inc	-5 (ix)
	jp	00124$
00128$:
	ld	sp,ix
	pop	ix
	ret
_BuildTile_end::
;carwar.c:1493: void BuildTrack()
;	---------------------------------
; Function BuildTrack
; ---------------------------------
_BuildTrack_start::
_BuildTrack:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-17
	add	hl,sp
	ld	sp,hl
;carwar.c:1501: PrintSprite(64, 64, "BUILD\nTRACK", (u16)&g_DefaultColor);
	ld	c,#<(_g_DefaultColor)
	ld	b,#>(_g_DefaultColor)
	push	bc
	ld	hl,#__str_31
	push	hl
	ld	hl,#0x4040
	push	hl
	call	_PrintSprite
	pop	af
	pop	af
;carwar.c:1503: FillVRAM(0, 0, 128, 212, COLOR_KHAKI);
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
;carwar.c:1504: FillVRAM(128, 0, 128, 212, COLOR_KHAKI);
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
;carwar.c:1506: block = g_Tracks[game.track].tiles;
	ld	a,(#0x0006 + _game)
	ld	e,a
	add	a,a
	add	a,a
	add	a,a
	add	a,a
	add	a,e
	add	a,#<(_g_Tracks)
	ld	c,a
	ld	a,#>(_g_Tracks)
	adc	a,#0x00
	ld	b,a
	inc	bc
	inc	bc
	inc	bc
	ld	l,c
	ld	h,b
	inc	hl
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	-12 (ix), a
	ld	-11 (ix),h
;carwar.c:1507: for(j=0; j<6; j++)
	ld	-2 (ix),#0x00
00109$:
	ld	a,-2 (ix)
	sub	a,#0x06
	jp	NC,00112$
;carwar.c:1509: for(i=0; i<7; i++)
	ld	-1 (ix),#0x00
00105$:
	ld	a,-1 (ix)
	sub	a,#0x07
	jp	NC,00111$
;carwar.c:1511: set0 = *block++;
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	a,(hl)
	inc	-12 (ix)
	jr	NZ,00123$
	inc	-11 (ix)
00123$:
;carwar.c:1512: op0 = set0 & 0x0F;
	ld	-3 (ix), a
	and	a,#0x0F
	ld	-4 (ix),a
;carwar.c:1513: set0 >>= 4;
	ld	a,-3 (ix)
	srl	a
	srl	a
	srl	a
	srl	a
	ld	-3 (ix),a
;carwar.c:1515: FillVRAM(g_Tracks[game.track].offset.x + (32 * i), g_Tracks[game.track].offset.y + (32 * j), 32, 32, g_BG[op0].ColorLight);
	ld	a,-4 (ix)
	ld	e,a
	add	a,a
	add	a,a
	add	a,e
	add	a,#<(_g_BG)
	ld	e,a
	ld	a,#>(_g_BG)
	adc	a,#0x00
	ld	d,a
	inc	de
	inc	de
	inc	de
	ld	a,(de)
	ld	-13 (ix),a
	ld	a,(#0x0006 + _game)
	ld	e,a
	add	a,a
	add	a,a
	add	a,a
	add	a,a
	add	a,e
	add	a,#<(_g_Tracks)
	ld	d,a
	ld	a,#>(_g_Tracks)
	adc	a,#0x00
	ld	c,a
	ld	a,d
	add	a,#0x07
	ld	d,a
	ld	a,c
	adc	a,#0x00
	ld	h, a
	ld	l, d
	ld	l,(hl)
	ld	h,#0x00
	ld	c,-2 (ix)
	ld	b,#0x00
	sla	c
	rl	b
	sla	c
	rl	b
	sla	c
	rl	b
	sla	c
	rl	b
	sla	c
	rl	b
	add	hl,bc
	ld	-15 (ix),l
	ld	-14 (ix),h
	ld	a,(#0x0006 + _game)
	ld	e,a
	add	a,a
	add	a,a
	add	a,a
	add	a,a
	add	a,e
	add	a,#<(_g_Tracks)
	ld	e,a
	ld	a,#>(_g_Tracks)
	adc	a,#0x00
	ld	d,a
	ld	hl,#0x0006
	add	hl,de
	ld	l, (hl)
	ld	h,#0x00
	ld	e,-1 (ix)
	ld	-17 (ix), e
	ld	-16 (ix), #0x00
	ld	a,#0x05+1
	jr	00127$
00126$:
	sla	-17 (ix)
	rl	-16 (ix)
00127$:
	dec	a
	jr	NZ,00126$
	ld	a,l
	add	a,-17 (ix)
	ld	e,a
	ld	a,h
	adc	a,-16 (ix)
	ld	d,a
	push	bc
	ld	a,-13 (ix)
	push	af
	inc	sp
	ld	hl,#0x0020
	push	hl
	ld	l, #0x20
	push	hl
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	push	hl
	push	de
	call	_FillVRAM
	ld	hl,#0x0009
	add	hl,sp
	ld	sp,hl
	pop	bc
;carwar.c:1517: if(set0 >= 1) // first tile
	ld	a,-3 (ix)
	sub	a,#0x01
	jp	C,00107$
;carwar.c:1519: flag1 = *block++;
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	a,(hl)
	inc	-12 (ix)
	jr	NZ,00128$
	inc	-11 (ix)
00128$:
;carwar.c:1520: tile1 = flag1 & 0x0F;
	ld	-5 (ix), a
	and	a,#0x0F
	ld	-6 (ix),a
;carwar.c:1521: flag1 >>= 4;
	ld	a,-5 (ix)
	srl	a
	srl	a
	srl	a
	srl	a
	ld	-5 (ix),a
;carwar.c:1523: flag2 = *block++; 
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	a,(hl)
	inc	-12 (ix)
	jr	NZ,00129$
	inc	-11 (ix)
00129$:
;carwar.c:1524: op1 = flag2 >> 4;
	ld	-8 (ix), a
	srl	a
	srl	a
	srl	a
	srl	a
	ld	-7 (ix),a
;carwar.c:1526: BuildTile(g_Tracks[game.track].offset.x + 32 * i, g_Tracks[game.track].offset.y + 32 * j, flag1, tile1, op1, op0);
	ld	a,(#0x0006 + _game)
	ld	e,a
	add	a,a
	add	a,a
	add	a,a
	add	a,a
	add	a,e
	add	a,#<(_g_Tracks)
	ld	e,a
	ld	a,#>(_g_Tracks)
	adc	a,#0x00
	ld	d,a
	ld	hl,#0x0007
	add	hl,de
	ld	l, (hl)
	ld	h,#0x00
	add	hl,bc
	ld	-15 (ix),l
	ld	-14 (ix),h
	ld	a,(#0x0006 + _game)
	ld	e,a
	add	a,a
	add	a,a
	add	a,a
	add	a,a
	add	a,e
	add	a,#<(_g_Tracks)
	ld	e,a
	ld	a,#>(_g_Tracks)
	adc	a,#0x00
	ld	d,a
	ld	hl,#0x0006
	add	hl,de
	ld	a,(hl)
	ld	h, #0x00
	add	a,-17 (ix)
	ld	e,a
	ld	a,h
	adc	a,-16 (ix)
	ld	d,a
	push	bc
	ld	h,-4 (ix)
	ld	l,-7 (ix)
	push	hl
	ld	h,-6 (ix)
	ld	l,-5 (ix)
	push	hl
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	push	hl
	push	de
	call	_BuildTile
	pop	af
	pop	af
	pop	af
	pop	af
	pop	bc
;carwar.c:1528: if(set0 >= 2) // second tile
	ld	a,-3 (ix)
	sub	a,#0x02
	jp	C,00107$
;carwar.c:1530: flag2 &= 0x0F;
	ld	a,-8 (ix)
	and	a,#0x0F
	ld	-8 (ix),a
;carwar.c:1532: tile2 = *block++;
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	a,(hl)
	inc	-12 (ix)
	jr	NZ,00130$
	inc	-11 (ix)
00130$:
;carwar.c:1533: op2 = tile2 & 0x0F;
	ld	-9 (ix), a
	and	a,#0x0F
	ld	-10 (ix),a
;carwar.c:1534: tile2 >>= 4;
	ld	a,-9 (ix)
	srl	a
	srl	a
	srl	a
	srl	a
	ld	-9 (ix),a
;carwar.c:1536: BuildTile(g_Tracks[game.track].offset.x + 32 * i, g_Tracks[game.track].offset.y + 32 * j, flag2, tile2, op2, op0);
	ld	a,(#0x0006 + _game)
	ld	e,a
	add	a,a
	add	a,a
	add	a,a
	add	a,a
	add	a,e
	add	a,#<(_g_Tracks)
	ld	e,a
	ld	a,#>(_g_Tracks)
	adc	a,#0x00
	ld	d,a
	ld	hl,#0x0007
	add	hl,de
	ld	l, (hl)
	ld	h,#0x00
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,(#0x0006 + _game)
	ld	e,a
	add	a,a
	add	a,a
	add	a,a
	add	a,a
	add	a,e
	add	a,#<(_g_Tracks)
	ld	e,a
	ld	a,#>(_g_Tracks)
	adc	a,#0x00
	ld	d,a
	ld	hl,#0x0006
	add	hl,de
	ld	a,(hl)
	ld	h, #0x00
	add	a,-17 (ix)
	ld	e,a
	ld	a,h
	adc	a,-16 (ix)
	ld	d,a
	ld	h,-4 (ix)
	ld	l,-10 (ix)
	push	hl
	ld	h,-9 (ix)
	ld	l,-8 (ix)
	push	hl
	push	bc
	push	de
	call	_BuildTile
	pop	af
	pop	af
	pop	af
	pop	af
;carwar.c:1538: if(set0 >= 3) // third tile
00107$:
;carwar.c:1509: for(i=0; i<7; i++)
	inc	-1 (ix)
	jp	00105$
00111$:
;carwar.c:1507: for(j=0; j<6; j++)
	inc	-2 (ix)
	jp	00109$
00112$:
;carwar.c:1546: ClearSprite();
	call	_ClearSprite
	ld	sp,ix
	pop	ix
	ret
_BuildTrack_end::
__str_31:
	.ascii "BUILD"
	.db 0x0A
	.ascii "TRACK"
	.db 0x00
;carwar.c:1550: void ShadeTrack()
;	---------------------------------
; Function ShadeTrack
; ---------------------------------
_ShadeTrack_start::
_ShadeTrack:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-8
	add	hl,sp
	ld	sp,hl
;carwar.c:1555: PrintSprite(64, 64, "SHADE\nTRACK", (u16)&g_DefaultColor);
	ld	c,#<(_g_DefaultColor)
	ld	b,#>(_g_DefaultColor)
	push	bc
	ld	hl,#__str_32
	push	hl
	ld	hl,#0x4040
	push	hl
	call	_PrintSprite
	pop	af
	pop	af
;carwar.c:1557: cur = ReadVRAM(0, 0);
	ld	hl,#0x0000
	ex	(sp),hl
	ld	a,#0x00
	push	af
	inc	sp
	call	_ReadVRAM
	pop	af
	inc	sp
;carwar.c:1558: for(x=0; x<256; x++)
	ld	-2 (ix),#0x00
	ld	-1 (ix),#0x00
00124$:
	ld	a,-1 (ix)
	sub	a,#0x01
	jp	NC,00127$
;carwar.c:1560: for(y=0; y<211; y++)
	ld	-4 (ix),#0x00
	ld	-3 (ix),#0x00
00120$:
	ld	a,-4 (ix)
	sub	a,#0xD3
	ld	a,-3 (ix)
	sbc	a,#0x00
	jp	NC,00126$
;carwar.c:1562: cur = ReadVRAM(0, x + 256 * y);
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
;carwar.c:1563: next = ReadVRAM(0, x + 256 * (y + 1));
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
;carwar.c:1564: if(game.colorCode[cur] < OP_SPECIAL && game.colorCode[next] >= OP_SPECIAL)
	ld	l,c
	ld	h,#0x00
	ld	a,#<(0x0009 + _game)
	add	a,l
	ld	e,a
	ld	a,#>(0x0009 + _game)
	adc	a,h
	ld	d,a
	ld	a,(de)
	sub	a,#0x04
	jp	NC,00122$
	ld	l,b
	ld	h,#0x00
	ld	a,#<(0x0009 + _game)
	add	a,l
	ld	e,a
	ld	a,#>(0x0009 + _game)
	adc	a,h
	ld	d,a
	ld	a,(de)
	sub	a,#0x04
	jp	C,00122$
;carwar.c:1566: for(i=0; i<BLOCK_SHADOW; i++)
	ld	-6 (ix),#0x00
	ld	-5 (ix),#0x00
00105$:
	ld	a,-6 (ix)
	sub	a,#0x03
	ld	a,-5 (ix)
	sbc	a,#0x00
	jr	NC,00108$
;carwar.c:1568: cur = ReadVRAM(0, x + 256 * (y - i));
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
;carwar.c:1569: if((y - i < 212) && (game.colorCode[cur] < OP_SPECIAL))
	ld	a,b
	sub	a,#0xD4
	ld	a,e
	sbc	a,#0x00
	jr	NC,00108$
	ld	l,c
	ld	h,#0x00
	ld	a,#<(0x0009 + _game)
	add	a,l
	ld	e,a
	ld	a,#>(0x0009 + _game)
	adc	a,h
	ld	d,a
	ld	a,(de)
	sub	a,#0x04
	jr	NC,00108$
;carwar.c:1570: WriteVRAM(0, x + 256 * (y - i), DarkenColor(cur, SHADOW_POWER));
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
;carwar.c:1566: for(i=0; i<BLOCK_SHADOW; i++)
	inc	-6 (ix)
	jr	NZ,00105$
	inc	-5 (ix)
	jp	00105$
00108$:
;carwar.c:1574: for(i=1; i<=ROAD_SHADOW; i++)
	ld	-6 (ix),#0x01
	ld	-5 (ix),#0x00
00113$:
	ld	a,#0x04
	sub	a,-6 (ix)
	ld	a,#0x00
	sbc	a,-5 (ix)
	jr	C,00116$
;carwar.c:1576: cur = ReadVRAM(0, x + 256 * (y + i));
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
;carwar.c:1577: if((y + i < 212) && (game.colorCode[cur] >= OP_SPECIAL))
	ld	a,b
	sub	a,#0xD4
	ld	a,e
	sbc	a,#0x00
	jr	NC,00116$
	ld	l,c
	ld	h,#0x00
	ld	a,#<(0x0009 + _game)
	add	a,l
	ld	e,a
	ld	a,#>(0x0009 + _game)
	adc	a,h
	ld	d,a
	ld	a,(de)
	sub	a,#0x04
	jr	C,00116$
;carwar.c:1578: WriteVRAM(0, x + 256 * (y + i), DarkenColor(cur, SHADOW_POWER));
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
;carwar.c:1574: for(i=1; i<=ROAD_SHADOW; i++)
	inc	-6 (ix)
	jr	NZ,00113$
	inc	-5 (ix)
	jp	00113$
00116$:
;carwar.c:1582: y += i;
	ld	a,-4 (ix)
	add	a,-6 (ix)
	ld	-4 (ix),a
	ld	a,-3 (ix)
	adc	a,-5 (ix)
	ld	-3 (ix),a
00122$:
;carwar.c:1560: for(y=0; y<211; y++)
	inc	-4 (ix)
	jp	NZ,00120$
	inc	-3 (ix)
	jp	00120$
00126$:
;carwar.c:1558: for(x=0; x<256; x++)
	inc	-2 (ix)
	jp	NZ,00124$
	inc	-1 (ix)
	jp	00124$
00127$:
;carwar.c:1586: ClearSprite();
	call	_ClearSprite
	ld	sp,ix
	pop	ix
	ret
_ShadeTrack_end::
__str_32:
	.ascii "SHADE"
	.db 0x0A
	.ascii "TRACK"
	.db 0x00
;carwar.c:1592: u8 DarkenColor(u8 color, u8 power)
;	---------------------------------
; Function DarkenColor
; ---------------------------------
_DarkenColor_start::
_DarkenColor:
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;carwar.c:1595: g = ((color & 0xE0) >> 5);
	ld	a,4 (ix)
	and	a,#0xE0
	ld	c,a
	srl	c
	srl	c
	srl	c
	srl	c
	srl	c
;carwar.c:1596: r = ((color & 0x1C) >> 2);
	ld	a,4 (ix)
	and	a,#0x1C
	ld	b,a
	srl	b
	srl	b
;carwar.c:1597: b = (color & 0x03);
	ld	a,4 (ix)
	and	a,#0x03
	ld	-1 (ix),a
;carwar.c:1598: switch(power)
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
;carwar.c:1600: case 0: break;                       // x1
	jp	00110$
;carwar.c:1601: case 1: TransformColor(7, 3); break; // x0.875
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
;carwar.c:1602: case 2: TransformColor(3, 2); break; // x0.75
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
;carwar.c:1603: case 3: TransformColor(5, 3); break; // x0.625
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
;carwar.c:1604: case 4: TransformColor(1, 1); break; // x0.5
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
;carwar.c:1605: case 5: TransformColor(3, 3); break; // x0.375
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
;carwar.c:1606: case 6: TransformColor(1, 2); break; // x0.25
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
;carwar.c:1607: case 7:                              // x0.125
00108$:
;carwar.c:1608: default: TransformColor(1, 3); break;
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
;carwar.c:1609: }
00110$:
;carwar.c:1610: return (g << 5) + (r << 2) + b;
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
;carwar.c:1613: u8 GrayGradiant(u8 index)
;	---------------------------------
; Function GrayGradiant
; ---------------------------------
_GrayGradiant_start::
_GrayGradiant:
	push	ix
	ld	ix,#0
	add	ix,sp
;carwar.c:1616: col = index & 0xF; // 0:16
	ld	a,4 (ix)
	and	a,#0x0F
	ld	c,a
;carwar.c:1617: col >>= 1; // 0:8
	srl	c
;carwar.c:1618: col += 2; // 2:10
	inc	c
	inc	c
;carwar.c:1619: if(col > 5)
	ld	a,#0x05
	sub	a,c
	jr	NC,00102$
;carwar.c:1620: col = 12 - col; // 2:5 & 6:3
	ld	a,#0x0C
	sub	a,c
	ld	c,a
00102$:
;carwar.c:1621: return (col << 5) + (col << 2) + (col >> 1);
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
;carwar.c:1624: void DrawCharacter(u16 x, u16 y, u8 chr, u8 color)
;	---------------------------------
; Function DrawCharacter
; ---------------------------------
_DrawCharacter_start::
_DrawCharacter:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;carwar.c:1628: HMMV(x, y, 8, 8, color);
	ld	hl,#0x09af + _game
	ld	a,4 (ix)
	ld	(hl),a
	inc	hl
	ld	a,5 (ix)
	ld	(hl),a
	ld	hl,#0x0002 + 0x09af + _game
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
	inc	hl
	ld	(hl),#0xC0
	ld	l,#<(0x09af + _game)
	ld	h,#>(0x09af + _game)
	push	hl
	call	_VPDCommand36
	pop	af
;carwar.c:1629: for(j=0; j<8; j++)
	ld	-2 (ix),#0x00
	ld	-1 (ix),#0x00
00101$:
	ld	a,-2 (ix)
	sub	a,#0x08
	ld	a,-1 (ix)
	sbc	a,#0x00
	jp	NC,00105$
;carwar.c:1631: LMMC(x, y + j, 8, 1, (u16)&game.bitToByte[g_CharTable[chr * 8 + j] * 8], VDP_OP_AND);
	ld	hl,#0x09af + _game
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
	ld	hl,#0x0002 + 0x09af + _game
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
	ld	hl,#_g_CharTable
	add	hl,de
	ld	l, (hl)
	ld	h,#0x00
	add	hl,hl
	add	hl,hl
	add	hl,hl
	ld	a,#<(0x017c + _game)
	add	a,l
	ld	c,a
	ld	a,#>(0x017c + _game)
	adc	a,h
	ld	h, a
	ld	l, c
	ld	a,(hl)
	ld	hl,#0x0008 + 0x09af + _game
	ld	(hl),a
	inc	hl
	inc	hl
	ld	(hl),#0xB1
	ld	l,#<(0x09af + _game)
	ld	h,#>(0x09af + _game)
	push	de
	push	hl
	call	_VPDCommand36
	pop	af
	pop	de
	ld	hl,#_g_CharTable
	add	hl,de
	ld	l, (hl)
	ld	h,#0x00
	add	hl,hl
	add	hl,hl
	add	hl,hl
	ld	a,#<(0x017c + _game)
	add	a,l
	ld	c,a
	ld	a,#>(0x017c + _game)
	adc	a,h
	ld	h, a
	ld	l, c
	push	hl
	call	_VPDCommandLoop
	pop	af
;carwar.c:1629: for(j=0; j<8; j++)
	inc	-2 (ix)
	jp	NZ,00101$
	inc	-1 (ix)
	jp	00101$
00105$:
	ld	sp,ix
	pop	ix
	ret
_DrawCharacter_end::
;carwar.c:1635: void DrawText(u16 x, u16 y, const char* text, u8 color)
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
;carwar.c:1638: u16 curX = x;
	ld	a,4 (ix)
	ld	-4 (ix),a
	ld	a,5 (ix)
	ld	-3 (ix),a
;carwar.c:1639: u16 curY = y;
	ld	l,6 (ix)
	ld	h,7 (ix)
;carwar.c:1640: while(text[textIdx] != 0)
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
;carwar.c:1642: if(text[textIdx] == '\n')
	ld	c,a
	or	a,a
	jr	Z,00109$
	sub	a,#0x0A
	jr	NZ,00104$
;carwar.c:1644: curX = x;
	ld	a,4 (ix)
	ld	-4 (ix),a
	ld	a,5 (ix)
	ld	-3 (ix),a
;carwar.c:1645: curY += LINE_SPACE;
	ld	hl,#0x000A
	add	hl,de
	ex	de,hl
	jr	00105$
00104$:
;carwar.c:1649: if(text[textIdx] != ' ')
;carwar.c:1651: DrawCharacter(curX, curY, text[textIdx] - '0', color);
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
;carwar.c:1652: sprtIdx++;
	inc	-2 (ix)
00102$:
;carwar.c:1654: curX += 8;
	ld	a,-4 (ix)
	add	a,#0x08
	ld	-4 (ix),a
	ld	a,-3 (ix)
	adc	a,#0x00
	ld	-3 (ix),a
00105$:
;carwar.c:1656: textIdx++;
	inc	-1 (ix)
	jr	00106$
00109$:
	ld	sp,ix
	pop	ix
	ret
_DrawText_end::
;carwar.c:1671: void CopyCropped16(u8 posX, u16 posY, u8 sizeX, u8 sizeY, u8 num, u8 mod8, u16 addr)
;	---------------------------------
; Function CopyCropped16
; ---------------------------------
_CopyCropped16_start::
_CopyCropped16:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-11
	add	hl,sp
	ld	sp,hl
;carwar.c:1676: for(i=0; i<num; i++)
	ld	-1 (ix),#0x00
00104$:
	ld	a,-1 (ix)
	sub	a,9 (ix)
	jp	NC,00108$
;carwar.c:1678: oY = ((u8*)addr)[0];
	ld	l,11 (ix)
	ld	h,12 (ix)
	ld	a,(hl)
;carwar.c:1679: oX = oY >> 4;
	ld	-3 (ix), a
	srl	a
	srl	a
	srl	a
	srl	a
	ld	-2 (ix),a
;carwar.c:1680: oY &= 0x0F;
	ld	a,-3 (ix)
	and	a,#0x0F
	ld	-3 (ix),a
;carwar.c:1681: dY = ((u8*)addr)[1];
	ex	de,hl
	inc	de
	ld	a,(de)
;carwar.c:1682: dX = dY >> 4;
	ld	-5 (ix), a
	srl	a
	srl	a
	srl	a
	srl	a
	ld	-4 (ix),a
;carwar.c:1683: dY &= 0x0F;
	ld	a,-5 (ix)
	and	a,#0x0F
	ld	-5 (ix),a
;carwar.c:1684: addr += 2;
	ld	a,11 (ix)
	add	a,#0x02
	ld	11 (ix),a
	ld	a,12 (ix)
	adc	a,#0x00
	ld	12 (ix),a
;carwar.c:1685: if(mod8 == 0)
	xor	a,a
	or	a,10 (ix)
	jp	NZ,00102$
;carwar.c:1686: RAMtoVRAM(posX + (i * sizeX) + oX, posY + oY, dX, dY, addr);
	ld	d,-5 (ix)
	ld	b,#0x00
	ld	a,-4 (ix)
	ld	-7 (ix),a
	ld	-6 (ix),#0x00
	ld	l,-3 (ix)
	ld	h,#0x00
	ld	a,5 (ix)
	add	a,l
	ld	-9 (ix),a
	ld	a,6 (ix)
	adc	a,h
	ld	-8 (ix),a
	ld	a,4 (ix)
	ld	-11 (ix),a
	ld	-10 (ix),#0x00
	ld	a, b
	push	de
	ld	e,7 (ix)
	ld	h,-1 (ix)
	ld	l,#0x00
	ld	d,l
	ld	b,#0x08
00114$:
	add	hl,hl
	jr	NC,00115$
	add	hl,de
00115$:
	djnz	00114$
	pop	de
	ld	b, a
	ld	c,l
	ld	e,h
	ld	a,-11 (ix)
	add	a,c
	ld	c,a
	ld	a,-10 (ix)
	adc	a,e
	ld	e,a
	ld	l,-2 (ix)
	ld	h,#0x00
	ld	a,c
	add	a,l
	ld	c,a
	ld	a,e
	adc	a,h
	ld	e,a
	ld	l,11 (ix)
	ld	h,12 (ix)
	push	hl
	ld	l,d
	ld	h,b
	push	hl
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	push	hl
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	ld	l,c
	ld	h,e
	push	hl
	call	_RAMtoVRAM
	ld	hl,#0x000A
	add	hl,sp
	ld	sp,hl
	jp	00103$
00102$:
;carwar.c:1688: RAMtoVRAM(posX + Modulo2(i, 8) * sizeX + oX, posY + sizeY * (i / 8) + oY, dX, dY, addr);
	ld	c,-5 (ix)
	ld	b,#0x00
	ld	a,-4 (ix)
	ld	-11 (ix),a
	ld	-10 (ix),#0x00
	ld	e,-1 (ix)
	srl	e
	srl	e
	srl	e
	ld	a, b
	ld	h,8 (ix)
	ld	l,#0x00
	ld	d,l
	ld	b,#0x08
00116$:
	add	hl,hl
	jr	NC,00117$
	add	hl,de
00117$:
	djnz	00116$
	ld	b, a
	ex	de,hl
	ld	a,5 (ix)
	add	a,e
	ld	e,a
	ld	a,6 (ix)
	adc	a,d
	ld	d,a
	ld	l,-3 (ix)
	ld	h,#0x00
	add	hl,de
	ld	-9 (ix),l
	ld	-8 (ix),h
	ld	a,4 (ix)
	ld	-7 (ix),a
	ld	-6 (ix),#0x00
	ld	a,-1 (ix)
	and	a,#0x07
	ld	l,a
	ld	a, b
	ld	e,7 (ix)
	ld	h,l
	ld	l,#0x00
	ld	d,l
	ld	b,#0x08
00118$:
	add	hl,hl
	jr	NC,00119$
	add	hl,de
00119$:
	djnz	00118$
	ld	b, a
	ex	de,hl
	ld	a,-7 (ix)
	add	a,e
	ld	e,a
	ld	a,-6 (ix)
	adc	a,d
	ld	d,a
	ld	l,-2 (ix)
	ld	h,#0x00
	add	hl,de
	ex	de,hl
	ld	l,11 (ix)
	ld	h,12 (ix)
	push	hl
	push	bc
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	push	hl
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	push	de
	call	_RAMtoVRAM
	ld	hl,#0x000A
	add	hl,sp
	ld	sp,hl
00103$:
;carwar.c:1689: addr += dX * dY;
	ld	e,-5 (ix)
	ld	h,-4 (ix)
	ld	l,#0x00
	ld	d,l
	ld	b,#0x08
00120$:
	add	hl,hl
	jr	NC,00121$
	add	hl,de
00121$:
	djnz	00120$
	ld	c,l
	ld	b,h
	ld	a,11 (ix)
	add	a,c
	ld	11 (ix),a
	ld	a,12 (ix)
	adc	a,b
	ld	12 (ix),a
;carwar.c:1676: for(i=0; i<num; i++)
	inc	-1 (ix)
	jp	00104$
00108$:
	ld	sp,ix
	pop	ix
	ret
_CopyCropped16_end::
;carwar.c:1693: void VBlankInterrupt()
;	---------------------------------
; Function VBlankInterrupt
; ---------------------------------
_VBlankInterrupt_start::
_VBlankInterrupt:
;carwar.c:1716: }
	ret
_VBlankInterrupt_end::
;carwar.c:1722: void StartGame(i8 value)
;	---------------------------------
; Function StartGame
; ---------------------------------
_StartGame_start::
_StartGame:
	push	ix
	ld	ix,#0
	add	ix,sp
;carwar.c:1724: game.track = value;
	ld	a,4 (ix)
	ld	(#0x0006 + _game),a
;carwar.c:1725: game.state = StateStartGame;
	ld	hl,#0x017a + _game
	ld	(hl),#<(_StateStartGame)
	inc	hl
	ld	(hl),#>(_StateStartGame)
	pop	ix
	ret
_StartGame_end::
;carwar.c:1729: void SelectPlayer(i8 value)
;	---------------------------------
; Function SelectPlayer
; ---------------------------------
_SelectPlayer_start::
_SelectPlayer:
	push	ix
	ld	ix,#0
	add	ix,sp
;carwar.c:1731: game.playerNum = value;
	ld	a,4 (ix)
	ld	(#0x0109 + _game),a
	pop	ix
	ret
_SelectPlayer_end::
;carwar.c:1735: void SelectRule(i8 value)
;	---------------------------------
; Function SelectRule
; ---------------------------------
_SelectRule_start::
_SelectRule:
	push	ix
	ld	ix,#0
	add	ix,sp
;carwar.c:1737: game.rule = value;
	ld	a,4 (ix)
	ld	(#0x0004 + _game),a
	pop	ix
	ret
_SelectRule_end::
	.area _CODE
	.area _CABS
