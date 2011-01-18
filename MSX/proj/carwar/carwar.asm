;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.8.0 #5117 (Mar 23 2008) (MINGW32)
; This file was generated Tue Jan 18 01:34:02 2011
;--------------------------------------------------------
	.module carwar
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _g_Screen
	.globl _g_World
	.globl _g_Local
	.globl _g_AngleIndex
	.globl _g_Angle
	.globl _g_Position
	.globl _g_Camera
	.globl _CMD
	.globl _ARG
	.globl _CLR
	.globl _NY
	.globl _NX
	.globl _DY
	.globl _DX
	.globl _SY
	.globl _SX
	.globl _MainLoop
	.globl _SetShortVec
	.globl _TransXZ
	.globl _TransXZIndex
	.globl _Project
	.globl _Update
	.globl _SetScreen8
	.globl _SetPage8
	.globl _DrawPoint8
	.globl _DrawLine
	.globl _DrawLineSimple
	.globl _DrawLine8
	.globl _VPDCommand
	.globl _waitRetrace
	.globl _WaitForVDP
	.globl _Joystick
	.globl _Joytrig
	.globl _GetKeyMatrixLine
	.globl _SetTo50Hz
	.globl _SetTo60Hz
	.globl _WriteToVRAM8
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
_g_slotPort	=	0x00a8
;--------------------------------------------------------
;  ram data
;--------------------------------------------------------
	.area _DATA
_SX::
	.ds 2
_SY::
	.ds 2
_DX::
	.ds 2
_DY::
	.ds 2
_NX::
	.ds 2
_NY::
	.ds 2
_CLR::
	.ds 1
_ARG::
	.ds 1
_CMD::
	.ds 1
_g_Camera::
	.ds 6
_g_Position::
	.ds 6
_g_Angle::
	.ds 1
_g_AngleIndex::
	.ds 1
_g_Local::
	.ds 48
_g_World::
	.ds 48
_g_Screen::
	.ds 48
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
;carwar.c:152: void main(void)
;	genLabel
;	genFunction
;	---------------------------------
; Function main
; ---------------------------------
_main_start::
_main:
;carwar.c:158: _endasm;
;	genInline
	
		 di
		 ld sp, (#0xFC4A)
		 ei
		
;carwar.c:160: g_slotPort = (g_slotPort & 0xCF) | ((g_slotPort & 0x0C) << 2);
;	genAnd
;Z80 AOP_SFR for _g_slotPort banked:0 bc:1 de:0
	in	a,(_g_slotPort)
	and	a,#0xCF
	ld	c,a
;	genAnd
;Z80 AOP_SFR for _g_slotPort banked:0 bc:1 de:0
	in	a,(_g_slotPort)
	and	a,#0x0C
	ld	b,a
;	genLeftShift
	sla	b
	sla	b
;	genOr
;Z80 AOP_SFR for _g_slotPort banked:0 bc:1 de:0
	ld	a,c
	or	a,b
	out	(_g_slotPort),a
;carwar.c:162: MainLoop();
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
;	genLabel
;	genEndFunction
	jp	_MainLoop
_main_end::
;carwar.c:177: void MainLoop()
;	genLabel
;	genFunction
;	---------------------------------
; Function MainLoop
; ---------------------------------
_MainLoop_start::
_MainLoop:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-23
	add	hl,sp
	ld	sp,hl
;carwar.c:179: unsigned char clsScreen8[15] = 
;	genAddrOf
	ld	hl,#0x0008
	add	hl,sp
	ld	c,l
	ld	b,h
;	genArrayInit
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 1 deSending: 0
	push	bc
	ld	l,c
	ld	h,b
	call	__initrleblock
	.db	#-9,#0x00
	.db	6
	.db	0x01, 0xD4, 0x00, 0x00, 0x00, 0xC0
	.db	0
	pop	bc
;carwar.c:183: u8 x = 128, y = 128;
;	genAssign
;	AOP_STK for _MainLoop_x_1_1
	ld	-16(ix),#0x80
;	genAssign
;	AOP_STK for _MainLoop_y_1_1
	ld	-17(ix),#0x80
;carwar.c:190: SetShortVec(&g_Local[0], M2U(1),  M2U(1),  M2U(-1));
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	ld	hl,#0xFFFFFF00
	push	hl
;	genIpush
	ld	hl,#0x0100
	push	hl
;	genIpush
	ld	hl,#0x0100
	push	hl
;	genIpush
	ld	hl,#_g_Local
	push	hl
;	genCall
	call	_SetShortVec
	pop	af
	pop	af
	pop	af
	pop	af
;carwar.c:191: SetShortVec(&g_Local[1], M2U(1),  M2U(-1), M2U(-1));
;	genPlus
;	genPlusIncr
	ld	de,#_g_Local + 6
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	ld	hl,#0xFFFFFF00
	push	hl
;	genIpush
	ld	hl,#0xFFFFFF00
	push	hl
;	genIpush
	ld	hl,#0x0100
	push	hl
;	genIpush
	push	de
;	genCall
	call	_SetShortVec
	pop	af
	pop	af
	pop	af
	pop	af
;carwar.c:192: SetShortVec(&g_Local[2], M2U(-1), M2U(-1), M2U(-1));
;	genPlus
;	genPlusIncr
	ld	de,#_g_Local + 12
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	ld	hl,#0xFFFFFF00
	push	hl
;	genIpush
	ld	hl,#0xFFFFFF00
	push	hl
;	genIpush
	ld	hl,#0xFFFFFF00
	push	hl
;	genIpush
	push	de
;	genCall
	call	_SetShortVec
	pop	af
	pop	af
	pop	af
	pop	af
;carwar.c:193: SetShortVec(&g_Local[3], M2U(-1), M2U(1),  M2U(-1));
;	genPlus
;	genPlusIncr
	ld	de,#_g_Local + 18
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	ld	hl,#0xFFFFFF00
	push	hl
;	genIpush
	ld	hl,#0x0100
	push	hl
;	genIpush
	ld	hl,#0xFFFFFF00
	push	hl
;	genIpush
	push	de
;	genCall
	call	_SetShortVec
	pop	af
	pop	af
	pop	af
	pop	af
;carwar.c:194: SetShortVec(&g_Local[4], M2U(1),  M2U(1),  M2U(1));
;	genPlus
;	genPlusIncr
	ld	de,#_g_Local + 24
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	ld	hl,#0x0100
	push	hl
;	genIpush
	ld	hl,#0x0100
	push	hl
;	genIpush
	ld	hl,#0x0100
	push	hl
;	genIpush
	push	de
;	genCall
	call	_SetShortVec
	pop	af
	pop	af
	pop	af
	pop	af
;carwar.c:195: SetShortVec(&g_Local[5], M2U(1),  M2U(-1), M2U(1));
;	genPlus
;	genPlusIncr
	ld	de,#_g_Local + 30
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	ld	hl,#0x0100
	push	hl
;	genIpush
	ld	hl,#0xFFFFFF00
	push	hl
;	genIpush
	ld	hl,#0x0100
	push	hl
;	genIpush
	push	de
;	genCall
	call	_SetShortVec
	pop	af
	pop	af
	pop	af
	pop	af
;carwar.c:196: SetShortVec(&g_Local[6], M2U(-1), M2U(-1), M2U(1));
;	genPlus
;	genPlusIncr
	ld	de,#_g_Local + 36
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	ld	hl,#0x0100
	push	hl
;	genIpush
	ld	hl,#0xFFFFFF00
	push	hl
;	genIpush
	ld	hl,#0xFFFFFF00
	push	hl
;	genIpush
	push	de
;	genCall
	call	_SetShortVec
	pop	af
	pop	af
	pop	af
	pop	af
;carwar.c:197: SetShortVec(&g_Local[7], M2U(-1), M2U(1),  M2U(1));
;	genPlus
;	genPlusIncr
	ld	de,#_g_Local + 42
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	ld	hl,#0x0100
	push	hl
;	genIpush
	ld	hl,#0x0100
	push	hl
;	genIpush
	ld	hl,#0xFFFFFF00
	push	hl
;	genIpush
	push	de
;	genCall
	call	_SetShortVec
	pop	af
	pop	af
	pop	af
	pop	af
;carwar.c:199: SetShortVec(&g_Camera, M2U(0), M2U(0), M2U(3));
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	ld	hl,#0x0300
	push	hl
;	genIpush
	ld	hl,#0x0000
	push	hl
;	genIpush
	ld	hl,#0x0000
	push	hl
;	genIpush
	ld	hl,#_g_Camera
	push	hl
;	genCall
	call	_SetShortVec
	pop	af
	pop	af
	pop	af
	pop	af
;carwar.c:201: SetShortVec(&g_Position, M2U(0), M2U(0), M2U(0));
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	ld	hl,#0x0000
	push	hl
;	genIpush
	ld	hl,#0x0000
	push	hl
;	genIpush
	ld	hl,#0x0000
	push	hl
;	genIpush
	ld	hl,#_g_Position
	push	hl
;	genCall
	call	_SetShortVec
	pop	af
	pop	af
	pop	af
	pop	af
;carwar.c:203: g_Angle = 30;
;	genAssign
	ld	iy,#_g_Angle
	ld	0(iy),#0x1E
;carwar.c:205: SetTo60Hz();
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_SetTo60Hz
;carwar.c:206: SetScreen8();
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_SetScreen8
;carwar.c:208: VPDCommand((int)&clsScreen8);
;	genAddrOf
	ld	hl,#0x0008
	add	hl,sp
	ld	e,l
	ld	d,h
;	genCast
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	push	de
;	genCall
	call	_VPDCommand
	pop	af
;carwar.c:210: while(bEnd == 0)
;	genLabel
00115$:
;carwar.c:220: addr = x + (y << 8);
;	genCast
;	AOP_STK for _MainLoop_x_1_1
	ld	e,-16(ix)
	ld	d,#0x00
;	genCast
;	AOP_STK for _MainLoop_y_1_1
	ld	b,-17(ix)
;	genLeftShift
	ld	c,b
	ld	b,#0x00
;	genPlus
	ld	a,e
	add	a,b
	ld	b,a
	ld	a,d
	adc	a,c
	ld	c,a
;	genAssign
;	(registers are the same)
;carwar.c:221: WriteToVRAM8(addr, 0x0F);
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	ld	a,#0x0F
	push	af
	inc	sp
;	genIpush
	ld	l,b
	ld	h,c
	push	hl
;	genCall
	call	_WriteToVRAM8
	pop	af
	inc	sp
;carwar.c:224: if((i = Joystick(0) | Joystick(1) | Joystick(2)) != 0)
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	ld	a,#0x00
	push	af
	inc	sp
;	genCall
	call	_Joystick
	ld	c,l
	inc	sp
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 1 deSending: 0
	push	bc
	ld	a,#0x01
	push	af
	inc	sp
;	genCall
	call	_Joystick
	ld	b,l
	inc	sp
	ld	a,b
	pop	bc
;	genOr
	ld	b,a
	or	a,c
	ld	c,a
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 1 deSending: 0
	push	bc
	ld	a,#0x02
	push	af
	inc	sp
;	genCall
	call	_Joystick
	ld	b,l
	inc	sp
	ld	a,b
	pop	bc
;	genOr
	ld	b,a
	or	a,c
;	genCast
	ld	c,a
	rla	
	sbc	a,a
	ld	b,a
;	genAssign
	ld	e,c
	ld	d,b
;	genIfx
	ld	a,c
	or	a,b
	jp	Z,00111$
;carwar.c:226: switch (i)
;	genCmpLt
	ld	a,e
	sub	a,#0x01
	ld	a,d
	sbc	a,#0x00
	jp	M,00111$
;	genCmpGt
	ld	a,#0x08
	sub	a,e
	ld	a,#0x00
	sbc	a,d
	jp	M,00111$
;	genMinus
	ld	a,e
	add	a,#0xFF
	ld	c,a
;	genJumpTab
	push	de
	ld	e,c
	ld	d,#0x00
	ld	hl,#00146$
	add	hl,de
	add	hl,de
	add	hl,de
	pop	de
	jp	(hl)
00146$:
	jp	00101$
	jp	00102$
	jp	00103$
	jp	00104$
	jp	00105$
	jp	00106$
	jp	00107$
	jp	00108$
;carwar.c:228: case 1: y--; break;
;	genLabel
00101$:
;	genMinus
;	AOP_STK for _MainLoop_y_1_1
	dec	-17(ix)
;	genGoto
	jr	00111$
;carwar.c:229: case 2: y--; x++; break;
;	genLabel
00102$:
;	genMinus
;	AOP_STK for _MainLoop_y_1_1
	dec	-17(ix)
;	genPlus
;	AOP_STK for _MainLoop_x_1_1
;	genPlusIncr
	inc	-16(ix)
;	genGoto
	jr	00111$
;carwar.c:230: case 3: x++; break;
;	genLabel
00103$:
;	genPlus
;	AOP_STK for _MainLoop_x_1_1
;	genPlusIncr
	inc	-16(ix)
;	genGoto
	jr	00111$
;carwar.c:231: case 4: y++; x++; break;
;	genLabel
00104$:
;	genPlus
;	AOP_STK for _MainLoop_y_1_1
;	genPlusIncr
	inc	-17(ix)
;	genPlus
;	AOP_STK for _MainLoop_x_1_1
;	genPlusIncr
	inc	-16(ix)
;	genGoto
	jr	00111$
;carwar.c:232: case 5: y++; break;
;	genLabel
00105$:
;	genPlus
;	AOP_STK for _MainLoop_y_1_1
;	genPlusIncr
	inc	-17(ix)
;	genGoto
	jr	00111$
;carwar.c:233: case 6: y++; x--; break;
;	genLabel
00106$:
;	genPlus
;	AOP_STK for _MainLoop_y_1_1
;	genPlusIncr
	inc	-17(ix)
;	genMinus
;	AOP_STK for _MainLoop_x_1_1
	dec	-16(ix)
;	genGoto
	jr	00111$
;carwar.c:234: case 7: x--; break;
;	genLabel
00107$:
;	genMinus
;	AOP_STK for _MainLoop_x_1_1
	dec	-16(ix)
;	genGoto
	jr	00111$
;carwar.c:235: case 8: y--; x--; break;
;	genLabel
00108$:
;	genMinus
;	AOP_STK for _MainLoop_y_1_1
	dec	-17(ix)
;	genMinus
;	AOP_STK for _MainLoop_x_1_1
	dec	-16(ix)
;carwar.c:236: }
;	genLabel
00111$:
;carwar.c:260: g_AngleIndex = g_Angle >> 2;
;	genRightShift
	ld	iy,#_g_Angle
	ld	a,0(iy)
	srl	a
	srl	a
	ld	iy,#_g_AngleIndex
	ld	0(iy),a
;carwar.c:262: g_Angle += 4;
;	genPlus
;	genPlusIncr
	ld	iy,#_g_Angle
	inc	0(iy)
	inc	0(iy)
	inc	0(iy)
	inc	0(iy)
;carwar.c:264: for(i=0; i<10; i++) // rows
;	genAssign
	ld	de,#0x0000
;	genAssign
;	AOP_STK for _MainLoop_i_1_1
	ld	-19(ix),#0x00
	ld	-18(ix),#0x00
;	genLabel
00122$:
;	genCmpLt
;	AOP_STK for _MainLoop_i_1_1
	ld	a,-19(ix)
	sub	a,#0x0A
	ld	a,-18(ix)
	sbc	a,#0x00
	jp	P,00145$
;carwar.c:266: keyLine = GetKeyMatrixLine(i);
;	genCast
;	AOP_STK for _MainLoop_i_1_1
	ld	c,-19(ix)
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	ld	a,c
	push	af
	inc	sp
;	genCall
	call	_GetKeyMatrixLine
	ld	c,l
	inc	sp
;	genAssign
	ld	e,c
;carwar.c:267: for(j=0; j<8; j++) // characters
;	genAssign
;	AOP_STK for _MainLoop_j_1_1
	ld	-21(ix),#0x00
	ld	-20(ix),#0x00
;	genLabel
00118$:
;	genCmpLt
;	AOP_STK for _MainLoop_j_1_1
	ld	a,-21(ix)
	sub	a,#0x08
	ld	a,-20(ix)
	sbc	a,#0x00
	jp	P,00124$
;carwar.c:269: if(keyLine & 1 << j)
;	genLeftShift
;	AOP_STK for _MainLoop_j_1_1
	ld	a,-21(ix)
	inc	a
;	AOP_STK for _MainLoop_sloc0_1_0
	push	af
	ld	-23(ix),#0x01
	ld	-22(ix),#0x00
	pop	af
	jr	00148$
00147$:
	sla	-23(ix)
	rl	-22(ix)
00148$:
	dec	a
	jr	NZ,00147$
;	genCast
	ld	c,e
	ld	b,#0x00
;	genAnd
;	AOP_STK for _MainLoop_sloc0_1_0
	ld	a,c
	and	a,-23(ix)
	ld	c,a
	ld	a,b
	and	a,-22(ix)
;	genIfx
	ld	b,a
	or	a,c
	jr	Z,00113$
;carwar.c:270: DrawPoint8(10 + j, 10 + i, 0);
;	genCast
;	AOP_STK for _MainLoop_i_1_1
	ld	c,-19(ix)
;	genPlus
;	genPlusIncr
	ld	a,c
	add	a,#0x0A
	ld	c,a
;	genCast
;	AOP_STK for _MainLoop_j_1_1
	ld	b,-21(ix)
;	genPlus
;	genPlusIncr
	ld	a,b
	add	a,#0x0A
	ld	b,a
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 1 bcInUse: 0 deSending: 0
	push	de
	ld	a,#0x00
	push	af
	inc	sp
;	genIpush
	ld	a,c
	push	af
	inc	sp
;	genIpush
	push	bc
	inc	sp
;	genCall
	call	_DrawPoint8
	pop	af
	inc	sp
	pop	de
;	genGoto
	jr	00120$
;	genLabel
00113$:
;carwar.c:272: DrawPoint8(10 + j, 10 + i, 255);
;	genCast
;	AOP_STK for _MainLoop_i_1_1
	ld	c,-19(ix)
;	genPlus
;	genPlusIncr
	ld	a,c
	add	a,#0x0A
	ld	c,a
;	genCast
;	AOP_STK for _MainLoop_j_1_1
	ld	b,-21(ix)
;	genPlus
;	genPlusIncr
	ld	a,b
	add	a,#0x0A
	ld	b,a
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 1 bcInUse: 0 deSending: 0
	push	de
	ld	a,#0xFF
	push	af
	inc	sp
;	genIpush
	ld	a,c
	push	af
	inc	sp
;	genIpush
	push	bc
	inc	sp
;	genCall
	call	_DrawPoint8
	pop	af
	inc	sp
	pop	de
;	genLabel
00120$:
;carwar.c:267: for(j=0; j<8; j++) // characters
;	genPlus
;	AOP_STK for _MainLoop_j_1_1
;	genPlusIncr
	inc	-21(ix)
	jr	NZ,00149$
	inc	-20(ix)
00149$:
;	genGoto
	jp	00118$
;	genLabel
00124$:
;carwar.c:264: for(i=0; i<10; i++) // rows
;	genPlus
;	AOP_STK for _MainLoop_i_1_1
;	genPlusIncr
	inc	-19(ix)
	jr	NZ,00150$
	inc	-18(ix)
00150$:
;	genAssign
;	AOP_STK for _MainLoop_i_1_1
	ld	e,-19(ix)
	ld	d,-18(ix)
;	genGoto
	jp	00122$
;	genLabel
00145$:
;	genAssign
;	AOP_STK for _MainLoop_i_1_1
	ld	e,-19(ix)
	ld	d,-18(ix)
;carwar.c:278: for(j=0; j<256; j++) // characters
;	genAssign
;	AOP_STK for _MainLoop_j_1_1
	ld	-21(ix),#0x00
	ld	-20(ix),#0x00
;	genLabel
00126$:
;	genCmpLt
;	AOP_STK for _MainLoop_j_1_1
	ld	a,-21(ix)
	sub	a,#0x00
	ld	a,-20(ix)
	sbc	a,#0x01
	jp	P,00115$
;carwar.c:280: DrawPoint8(j, i, j);
;	genCast
;	AOP_STK for _MainLoop_j_1_1
	ld	c,-21(ix)
;	genCast
	ld	b,e
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 1 bcInUse: 0 deSending: 0
	push	de
	ld	a,c
	push	af
	inc	sp
;	genIpush
	push	bc
	inc	sp
;	genIpush
	ld	a,c
	push	af
	inc	sp
;	genCall
	call	_DrawPoint8
	pop	af
	inc	sp
	pop	de
;carwar.c:278: for(j=0; j<256; j++) // characters
;	genPlus
;	AOP_STK for _MainLoop_j_1_1
;	genPlusIncr
	inc	-21(ix)
	jr	NZ,00151$
	inc	-20(ix)
00151$:
;	genGoto
	jr	00126$
;	genLabel
;	genEndFunction
	ld	sp,ix
	pop	ix
	ret
_MainLoop_end::
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
_g_ProjectionX:
	.dw #0x0100
	.dw #0x0096
	.dw #0x004B
	.dw #0x0032
	.dw #0x0025
	.dw #0x001E
	.dw #0x0019
	.dw #0x0015
	.dw #0x0012
	.dw #0x0010
	.dw #0x000F
	.dw #0x000D
	.dw #0x000C
	.dw #0x000B
	.dw #0x000A
	.dw #0x000A
	.dw #0x0009
	.dw #0x0008
	.dw #0x0008
	.dw #0x0007
	.dw #0x0007
	.dw #0x0007
	.dw #0x0006
	.dw #0x0006
	.dw #0x0006
	.dw #0x0006
	.dw #0x0005
	.dw #0x0005
	.dw #0x0005
	.dw #0x0005
	.dw #0x0005
	.dw #0x0004
	.dw #0x0004
	.dw #0x0004
	.dw #0x0004
	.dw #0x0004
	.dw #0x0004
	.dw #0x0004
	.dw #0x0003
	.dw #0x0003
	.dw #0x0003
	.dw #0x0003
	.dw #0x0003
	.dw #0x0003
	.dw #0x0003
	.dw #0x0003
	.dw #0x0003
	.dw #0x0003
	.dw #0x0003
	.dw #0x0003
	.dw #0x0003
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
_g_ProjectionY:
	.dw #0x0100
	.dw #0x00B5
	.dw #0x005A
	.dw #0x003C
	.dw #0x002D
	.dw #0x0024
	.dw #0x001E
	.dw #0x0019
	.dw #0x0016
	.dw #0x0014
	.dw #0x0012
	.dw #0x0010
	.dw #0x000F
	.dw #0x000D
	.dw #0x000C
	.dw #0x000C
	.dw #0x000B
	.dw #0x000A
	.dw #0x000A
	.dw #0x0009
	.dw #0x0009
	.dw #0x0008
	.dw #0x0008
	.dw #0x0007
	.dw #0x0007
	.dw #0x0007
	.dw #0x0006
	.dw #0x0006
	.dw #0x0006
	.dw #0x0006
	.dw #0x0006
	.dw #0x0005
	.dw #0x0005
	.dw #0x0005
	.dw #0x0005
	.dw #0x0005
	.dw #0x0005
	.dw #0x0004
	.dw #0x0004
	.dw #0x0004
	.dw #0x0004
	.dw #0x0004
	.dw #0x0004
	.dw #0x0004
	.dw #0x0004
	.dw #0x0004
	.dw #0x0003
	.dw #0x0003
	.dw #0x0003
	.dw #0x0003
	.dw #0x0003
	.dw #0x0003
	.dw #0x0003
	.dw #0x0003
	.dw #0x0003
	.dw #0x0003
	.dw #0x0003
	.dw #0x0003
	.dw #0x0003
	.dw #0x0003
	.dw #0x0003
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0002
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
;carwar.c:299: void SetShortVec(ShortVec* ret, i16 x, i16 y, i16 z)
;	genLabel
;	genFunction
;	---------------------------------
; Function SetShortVec
; ---------------------------------
_SetShortVec_start::
_SetShortVec:
	push	ix
	ld	ix,#0
	add	ix,sp
;carwar.c:301: ret->x = x;
;	genAssign
;	AOP_STK for 
	ld	c,4(ix)
	ld	b,5(ix)
;	genAssign (pointer)
;	AOP_STK for 
;	isBitvar = 0
	ld	l,c
	ld	h,b
	ld	a,6(ix)
	ld	(hl),a
	inc	hl
	ld	a,7(ix)
	ld	(hl),a
;carwar.c:302: ret->y = y;
;	genPlus
;	genPlusIncr
	ld	e,c
	ld	d,b
	inc	de
	inc	de
;	genAssign (pointer)
;	AOP_STK for 
;	isBitvar = 0
	ld	l,e
	ld	h,d
	ld	a,8(ix)
	ld	(hl),a
	inc	hl
	ld	a,9(ix)
	ld	(hl),a
;carwar.c:303: ret->z = z;
;	genPlus
;	genPlusIncr
	inc	bc
	inc	bc
	inc	bc
	inc	bc
;	genAssign (pointer)
;	AOP_STK for 
;	isBitvar = 0
	ld	l,c
	ld	h,b
	ld	a,10(ix)
	ld	(hl),a
	inc	hl
	ld	a,11(ix)
	ld	(hl),a
;	genLabel
;	genEndFunction
	pop	ix
	ret
_SetShortVec_end::
;carwar.c:309: void TransXZ(ShortVec* ret, const ShortVec* vec, u8 g_Angle, const ShortVec* pos)
;	genLabel
;	genFunction
;	---------------------------------
; Function TransXZ
; ---------------------------------
_TransXZ_start::
_TransXZ:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-13
	add	hl,sp
	ld	sp,hl
;carwar.c:311: g_Angle >>= 2; 
;	genRightShift
;	AOP_STK for 
	ld	a,8(ix)
	srl	a
	srl	a
	ld	8(ix),a
;carwar.c:312: ret->x = UxU(vec->x, g_Cosinus[g_Angle]) - UxU(vec->z, g_Sinus[g_Angle]);
;	genAssign
;	AOP_STK for 
	ld	c,4(ix)
	ld	b,5(ix)
;	genAssign
;	AOP_STK for 
;	AOP_STK for _TransXZ_sloc0_1_0
	ld	a,6(ix)
	ld	-2(ix),a
	ld	a,7(ix)
	ld	-1(ix),a
;	genPointerGet
;	AOP_STK for _TransXZ_sloc0_1_0
	ld	l,-2(ix)
	ld	h,-1(ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
;	genRightShift
;	AOP_STK for _TransXZ_sloc1_1_0
	ld	-4(ix),e
	ld	-3(ix),d
	sra	-3(ix)
	rr	-4(ix)
	sra	-3(ix)
	rr	-4(ix)
	sra	-3(ix)
	rr	-4(ix)
	sra	-3(ix)
	rr	-4(ix)
;	genLeftShift
;	AOP_STK for 
;	AOP_STK for _TransXZ_sloc2_1_0
	ld	a,8(ix)
	add	a,a
;	genPlus
;	AOP_STK for _TransXZ_sloc2_1_0
	ld	-5(ix), a
	add	a,#<_g_Cosinus
	ld	d,a
	ld	a,#>_g_Cosinus
	adc	a,#0x00
	ld	e,a
;	genPointerGet
	ld	l,d
	ld	h,e
	ld	d,(hl)
	inc	hl
	ld	e,(hl)
;	genRightShift
;	AOP_STK for _TransXZ_sloc3_1_0
	ld	-7(ix),d
	ld	-6(ix),e
	sra	-6(ix)
	rr	-7(ix)
	sra	-6(ix)
	rr	-7(ix)
	sra	-6(ix)
	rr	-7(ix)
	sra	-6(ix)
	rr	-7(ix)
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 1 deSending: 0
	push	bc
;	AOP_STK for _TransXZ_sloc3_1_0
	ld	l,-7(ix)
	ld	h,-6(ix)
	push	hl
;	genIpush
;	AOP_STK for _TransXZ_sloc1_1_0
	ld	l,-4(ix)
	ld	h,-3(ix)
	push	hl
;	genCall
	call	__mulint_rrx_s
;	AOP_STK for _TransXZ_sloc4_1_0
	ld	-8(ix),h
	ld	-9(ix),l
	pop	af
	pop	af
	pop	bc
;	genPlus
;	AOP_STK for _TransXZ_sloc0_1_0
;	genPlusIncr
	ld	a,-2(ix)
	add	a,#0x04
	ld	e,a
	ld	a,-1(ix)
	adc	a,#0x00
	ld	d,a
;	genPointerGet
	ld	l,e
	ld	h,d
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
;	genRightShift
;	AOP_STK for _TransXZ_sloc5_1_0
	ld	-11(ix),e
	ld	-10(ix),d
	sra	-10(ix)
	rr	-11(ix)
	sra	-10(ix)
	rr	-11(ix)
	sra	-10(ix)
	rr	-11(ix)
	sra	-10(ix)
	rr	-11(ix)
;	genPlus
;	AOP_STK for _TransXZ_sloc2_1_0
	ld	a,#<_g_Sinus
	add	a,-5(ix)
	ld	e,a
	ld	a,#>_g_Sinus
	adc	a,#0x00
	ld	d,a
;	genPointerGet
	ld	l,e
	ld	h,d
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
;	genRightShift
;	AOP_STK for _TransXZ_sloc6_1_0
	ld	-13(ix),e
	ld	-12(ix),d
	sra	-12(ix)
	rr	-13(ix)
	sra	-12(ix)
	rr	-13(ix)
	sra	-12(ix)
	rr	-13(ix)
	sra	-12(ix)
	rr	-13(ix)
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 1 deSending: 0
	push	bc
;	AOP_STK for _TransXZ_sloc6_1_0
	ld	l,-13(ix)
	ld	h,-12(ix)
	push	hl
;	genIpush
;	AOP_STK for _TransXZ_sloc5_1_0
	ld	l,-11(ix)
	ld	h,-10(ix)
	push	hl
;	genCall
	call	__mulint_rrx_s
	ld	d,h
	ld	e,l
	pop	af
	pop	af
	pop	bc
;	genMinus
;	AOP_STK for _TransXZ_sloc4_1_0
	ld	a,-9(ix)
	sub	a,e
	ld	e,a
	ld	a,-8(ix)
	sbc	a,d
	ld	d,a
;	genAssign (pointer)
;	isBitvar = 0
	ld	l,c
	ld	h,b
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:313: ret->y = vec->y + pos->y;
;	genPlus
;	AOP_STK for _TransXZ_sloc4_1_0
;	genPlusIncr
	ld	a,c
	add	a,#0x02
	ld	-9(ix),a
	ld	a,b
	adc	a,#0x00
	ld	-8(ix),a
;	genPlus
;	AOP_STK for _TransXZ_sloc0_1_0
;	genPlusIncr
	ld	e,-2(ix)
	ld	d,-1(ix)
	inc	de
	inc	de
;	genPointerGet
;	AOP_STK for _TransXZ_sloc0_1_0
	ld	l,e
	ld	h,d
	ld	a,(hl)
	ld	-2(ix),a
	inc	hl
	ld	a,(hl)
	ld	-1(ix),a
;	genAssign
;	AOP_STK for 
	ld	e,9(ix)
	ld	d,10(ix)
;	genPlus
;	genPlusIncr
	inc	de
	inc	de
;	genPointerGet
	ld	l,e
	ld	h,d
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
;	genPlus
;	AOP_STK for _TransXZ_sloc0_1_0
	ld	a,-2(ix)
	add	a,e
	ld	e,a
	ld	a,-1(ix)
	adc	a,d
	ld	d,a
;	genAssign (pointer)
;	AOP_STK for _TransXZ_sloc4_1_0
;	isBitvar = 0
	ld	l,-9(ix)
	ld	h,-8(ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:314: ret->z = UxU(vec->x, g_Sinus[g_Angle]) + UxU(vec->z, g_Cosinus[g_Angle]);
;	genPlus
;	genPlusIncr
	inc	bc
	inc	bc
	inc	bc
	inc	bc
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 1 deSending: 0
	push	bc
;	AOP_STK for _TransXZ_sloc6_1_0
	ld	l,-13(ix)
	ld	h,-12(ix)
	push	hl
;	genIpush
;	AOP_STK for _TransXZ_sloc1_1_0
	ld	l,-4(ix)
	ld	h,-3(ix)
	push	hl
;	genCall
	call	__mulint_rrx_s
;	AOP_STK for _TransXZ_sloc6_1_0
	ld	-12(ix),h
	ld	-13(ix),l
	pop	af
	pop	af
	pop	bc
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 1 deSending: 0
	push	bc
;	AOP_STK for _TransXZ_sloc3_1_0
	ld	l,-7(ix)
	ld	h,-6(ix)
	push	hl
;	genIpush
;	AOP_STK for _TransXZ_sloc5_1_0
	ld	l,-11(ix)
	ld	h,-10(ix)
	push	hl
;	genCall
	call	__mulint_rrx_s
	ld	d,h
	ld	e,l
	pop	af
	pop	af
	pop	bc
;	genPlus
;	AOP_STK for _TransXZ_sloc6_1_0
	ld	a,-13(ix)
	add	a,e
	ld	e,a
	ld	a,-12(ix)
	adc	a,d
	ld	d,a
;	genAssign (pointer)
;	isBitvar = 0
	ld	l,c
	ld	h,b
	ld	(hl),e
	inc	hl
	ld	(hl),d
;	genLabel
;	genEndFunction
	ld	sp,ix
	pop	ix
	ret
_TransXZ_end::
;carwar.c:320: void TransXZIndex(i8 i)
;	genLabel
;	genFunction
;	---------------------------------
; Function TransXZIndex
; ---------------------------------
_TransXZIndex_start::
_TransXZIndex:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-13
	add	hl,sp
	ld	sp,hl
;carwar.c:322: g_World[i].x = UxU(g_Local[i].x, g_Cosinus[g_AngleIndex]) - UxU(g_Local[i].z, g_Sinus[g_AngleIndex]) + g_Position.x;
;	genMult
;	AOP_STK for 
	ld	a,4(ix)
	ld	e,a
	add	a,a
	add	a,e
	add	a,a
;	genPlus
;	AOP_STK for _TransXZIndex_sloc0_1_0
	ld	c, a
	add	a,#<_g_World
	ld	-2(ix),a
	ld	a,#>_g_World
	adc	a,#0x00
	ld	-1(ix),a
;	genPlus
	ld	a,#<_g_Local
	add	a,c
	ld	b,a
	ld	a,#>_g_Local
	adc	a,#0x00
	ld	e,a
;	genPointerGet
	ld	l,b
	ld	h,e
	ld	b,(hl)
	inc	hl
	ld	e,(hl)
;	genRightShift
;	AOP_STK for _TransXZIndex_sloc1_1_0
	ld	-4(ix),b
	ld	-3(ix),e
	sra	-3(ix)
	rr	-4(ix)
	sra	-3(ix)
	rr	-4(ix)
	sra	-3(ix)
	rr	-4(ix)
	sra	-3(ix)
	rr	-4(ix)
;	genLeftShift
;	AOP_STK for _TransXZIndex_sloc2_1_0
	ld	iy,#_g_AngleIndex
	ld	a,0(iy)
	add	a,a
;	genPlus
;	AOP_STK for _TransXZIndex_sloc2_1_0
	ld	-5(ix), a
	add	a,#<_g_Cosinus
	ld	b,a
	ld	a,#>_g_Cosinus
	adc	a,#0x00
	ld	e,a
;	genPointerGet
	ld	l,b
	ld	h,e
	ld	b,(hl)
	inc	hl
	ld	e,(hl)
;	genRightShift
;	AOP_STK for _TransXZIndex_sloc3_1_0
	ld	-7(ix),b
	ld	-6(ix),e
	sra	-6(ix)
	rr	-7(ix)
	sra	-6(ix)
	rr	-7(ix)
	sra	-6(ix)
	rr	-7(ix)
	sra	-6(ix)
	rr	-7(ix)
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 1 deSending: 0
	push	bc
;	AOP_STK for _TransXZIndex_sloc3_1_0
	ld	l,-7(ix)
	ld	h,-6(ix)
	push	hl
;	genIpush
;	AOP_STK for _TransXZIndex_sloc1_1_0
	ld	l,-4(ix)
	ld	h,-3(ix)
	push	hl
;	genCall
	call	__mulint_rrx_s
;	AOP_STK for _TransXZIndex_sloc1_1_0
	ld	-3(ix),h
	ld	-4(ix),l
	pop	af
	pop	af
	pop	bc
;	genPlus
;	AOP_STK for _TransXZIndex_sloc4_1_0
	ld	a,#<_g_Local
	add	a,c
	ld	-9(ix),a
	ld	a,#>_g_Local
	adc	a,#0x00
	ld	-8(ix),a
;	genPlus
;	AOP_STK for _TransXZIndex_sloc4_1_0
;	genPlusIncr
	ld	a,-9(ix)
	add	a,#0x04
	ld	d,a
	ld	a,-8(ix)
	adc	a,#0x00
	ld	b,a
;	genPointerGet
	ld	l,d
	ld	h,b
	ld	d,(hl)
	inc	hl
	ld	b,(hl)
;	genRightShift
;	AOP_STK for _TransXZIndex_sloc5_1_0
	ld	-11(ix),d
	ld	-10(ix),b
	sra	-10(ix)
	rr	-11(ix)
	sra	-10(ix)
	rr	-11(ix)
	sra	-10(ix)
	rr	-11(ix)
	sra	-10(ix)
	rr	-11(ix)
;	genPlus
;	AOP_STK for _TransXZIndex_sloc2_1_0
	ld	a,#<_g_Sinus
	add	a,-5(ix)
	ld	e,a
	ld	a,#>_g_Sinus
	adc	a,#0x00
	ld	b,a
;	genPointerGet
	ld	l,e
	ld	h,b
	ld	e,(hl)
	inc	hl
	ld	b,(hl)
;	genRightShift
;	AOP_STK for _TransXZIndex_sloc6_1_0
	ld	-13(ix),e
	ld	-12(ix),b
	sra	-12(ix)
	rr	-13(ix)
	sra	-12(ix)
	rr	-13(ix)
	sra	-12(ix)
	rr	-13(ix)
	sra	-12(ix)
	rr	-13(ix)
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 1 deSending: 0
	push	bc
;	AOP_STK for _TransXZIndex_sloc6_1_0
	ld	l,-13(ix)
	ld	h,-12(ix)
	push	hl
;	genIpush
;	AOP_STK for _TransXZIndex_sloc5_1_0
	ld	l,-11(ix)
	ld	h,-10(ix)
	push	hl
;	genCall
	call	__mulint_rrx_s
	ld	b,h
	ld	d,l
	pop	af
	pop	af
	ld	a,b
	pop	bc
	ld	b,a
;	genMinus
;	AOP_STK for _TransXZIndex_sloc1_1_0
	ld	a,-4(ix)
	sub	a,d
	ld	-4(ix),a
	ld	a,-3(ix)
	sbc	a,b
	ld	-3(ix),a
;	genPointerGet
	ld	hl,#_g_Position
	ld	e,(hl)
	inc	hl
	ld	b,(hl)
;	genPlus
;	AOP_STK for _TransXZIndex_sloc1_1_0
	ld	a,-4(ix)
	add	a,e
	ld	e,a
	ld	a,-3(ix)
	adc	a,b
	ld	b,a
;	genAssign (pointer)
;	AOP_STK for _TransXZIndex_sloc0_1_0
;	isBitvar = 0
	ld	l,-2(ix)
	ld	h,-1(ix)
	ld	(hl),e
	inc	hl
	ld	(hl),b
;carwar.c:323: g_World[i].y = g_Local[i].y + g_Position.y;
;	genPlus
	ld	a,#<_g_World
	add	a,c
	ld	c,a
	ld	a,#>_g_World
	adc	a,#0x00
	ld	b,a
;	genPlus
;	AOP_STK for _TransXZIndex_sloc1_1_0
;	genPlusIncr
	ld	a,c
	add	a,#0x02
	ld	-4(ix),a
	ld	a,b
	adc	a,#0x00
	ld	-3(ix),a
;	genPlus
;	AOP_STK for _TransXZIndex_sloc4_1_0
;	genPlusIncr
	ld	e,-9(ix)
	ld	d,-8(ix)
	inc	de
	inc	de
;	genPointerGet
;	AOP_STK for _TransXZIndex_sloc0_1_0
	ld	l,e
	ld	h,d
	ld	a,(hl)
	ld	-2(ix),a
	inc	hl
	ld	a,(hl)
	ld	-1(ix),a
;	genPlus
;	genPlusIncr
	ld	de,#_g_Position + 2
;	genPointerGet
	ld	l,e
	ld	h,d
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
;	genPlus
;	AOP_STK for _TransXZIndex_sloc0_1_0
	ld	a,-2(ix)
	add	a,e
	ld	e,a
	ld	a,-1(ix)
	adc	a,d
	ld	d,a
;	genAssign (pointer)
;	AOP_STK for _TransXZIndex_sloc1_1_0
;	isBitvar = 0
	ld	l,-4(ix)
	ld	h,-3(ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:324: g_World[i].z = UxU(g_Local[i].x, g_Sinus[g_AngleIndex]) + UxU(g_Local[i].z, g_Cosinus[g_AngleIndex]) + g_Position.z;
;	genPlus
;	genPlusIncr
	inc	bc
	inc	bc
	inc	bc
	inc	bc
;	genPointerGet
;	AOP_STK for _TransXZIndex_sloc4_1_0
	ld	l,-9(ix)
	ld	h,-8(ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
;	genRightShift
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 1 deSending: 0
	push	bc
;	AOP_STK for _TransXZIndex_sloc6_1_0
	ld	l,-13(ix)
	ld	h,-12(ix)
	push	hl
;	genIpush
	push	de
;	genCall
	call	__mulint_rrx_s
;	AOP_STK for _TransXZIndex_sloc6_1_0
	ld	-12(ix),h
	ld	-13(ix),l
	pop	af
	pop	af
	pop	bc
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 1 deSending: 0
	push	bc
;	AOP_STK for _TransXZIndex_sloc3_1_0
	ld	l,-7(ix)
	ld	h,-6(ix)
	push	hl
;	genIpush
;	AOP_STK for _TransXZIndex_sloc5_1_0
	ld	l,-11(ix)
	ld	h,-10(ix)
	push	hl
;	genCall
	call	__mulint_rrx_s
	ld	d,h
	ld	e,l
	pop	af
	pop	af
	pop	bc
;	genPlus
;	AOP_STK for _TransXZIndex_sloc6_1_0
	ld	a,-13(ix)
	add	a,e
	ld	-13(ix),a
	ld	a,-12(ix)
	adc	a,d
	ld	-12(ix),a
;	genPlus
;	genPlusIncr
	ld	de,#_g_Position + 4
;	genPointerGet
	ld	l,e
	ld	h,d
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
;	genPlus
;	AOP_STK for _TransXZIndex_sloc6_1_0
	ld	a,-13(ix)
	add	a,e
	ld	e,a
	ld	a,-12(ix)
	adc	a,d
	ld	d,a
;	genAssign (pointer)
;	isBitvar = 0
	ld	l,c
	ld	h,b
	ld	(hl),e
	inc	hl
	ld	(hl),d
;	genLabel
;	genEndFunction
	ld	sp,ix
	pop	ix
	ret
_TransXZIndex_end::
;carwar.c:330: void Project(ShortVec* ret, const ShortVec* vec, const ShortVec* cam)
;	genLabel
;	genFunction
;	---------------------------------
; Function Project
; ---------------------------------
_Project_start::
_Project:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-8
	add	hl,sp
	ld	sp,hl
;carwar.c:333: ret->z = ((vec->z - cam->z) >> 5);
;	genAssign
;	AOP_STK for 
	ld	c,4(ix)
	ld	b,5(ix)
;	genPlus
;	AOP_STK for _Project_sloc0_1_0
;	genPlusIncr
	ld	a,c
	add	a,#0x04
	ld	-2(ix),a
	ld	a,b
	adc	a,#0x00
	ld	-1(ix),a
;	genAssign
;	AOP_STK for 
;	AOP_STK for _Project_sloc1_1_0
	ld	a,6(ix)
	ld	-4(ix),a
	ld	a,7(ix)
	ld	-3(ix),a
;	genPlus
;	AOP_STK for _Project_sloc1_1_0
;	genPlusIncr
	ld	a,-4(ix)
	add	a,#0x04
	ld	e,a
	ld	a,-3(ix)
	adc	a,#0x00
	ld	d,a
;	genPointerGet
;	AOP_STK for _Project_sloc2_1_0
	ld	l,e
	ld	h,d
	ld	a,(hl)
	ld	-6(ix),a
	inc	hl
	ld	a,(hl)
	ld	-5(ix),a
;	genAssign
;	AOP_STK for 
;	AOP_STK for _Project_sloc3_1_0
	ld	a,8(ix)
	ld	-8(ix),a
	ld	a,9(ix)
	ld	-7(ix),a
;	genPlus
;	AOP_STK for _Project_sloc3_1_0
;	genPlusIncr
	ld	a,-8(ix)
	add	a,#0x04
	ld	e,a
	ld	a,-7(ix)
	adc	a,#0x00
	ld	d,a
;	genPointerGet
	ld	l,e
	ld	h,d
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
;	genMinus
;	AOP_STK for _Project_sloc2_1_0
	ld	a,-6(ix)
	sub	a,e
	ld	e,a
	ld	a,-5(ix)
	sbc	a,d
	ld	d,a
;	genRightShift
;	AOP_STK for _Project_sloc2_1_0
	ld	-6(ix),e
	ld	-5(ix),d
	sra	-5(ix)
	rr	-6(ix)
	sra	-5(ix)
	rr	-6(ix)
	sra	-5(ix)
	rr	-6(ix)
	sra	-5(ix)
	rr	-6(ix)
	sra	-5(ix)
	rr	-6(ix)
;	genAssign (pointer)
;	AOP_STK for _Project_sloc0_1_0
;	AOP_STK for _Project_sloc2_1_0
;	isBitvar = 0
	ld	l,-2(ix)
	ld	h,-1(ix)
	ld	a,-6(ix)
	ld	(hl),a
	inc	hl
	ld	a,-5(ix)
	ld	(hl),a
;carwar.c:334: ret->x = 128 + (vec->x - cam->x) / ret->z;
;	genPointerGet
;	AOP_STK for _Project_sloc1_1_0
;	AOP_STK for _Project_sloc0_1_0
	ld	l,-4(ix)
	ld	h,-3(ix)
	ld	a,(hl)
	ld	-2(ix),a
	inc	hl
	ld	a,(hl)
	ld	-1(ix),a
;	genPointerGet
;	AOP_STK for _Project_sloc3_1_0
	ld	l,-8(ix)
	ld	h,-7(ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
;	genMinus
;	AOP_STK for _Project_sloc0_1_0
	ld	a,-2(ix)
	sub	a,e
	ld	e,a
	ld	a,-1(ix)
	sbc	a,d
	ld	d,a
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 1 deSending: 0
	push	bc
;	AOP_STK for _Project_sloc2_1_0
	ld	l,-6(ix)
	ld	h,-5(ix)
	push	hl
;	genIpush
	push	de
;	genCall
	call	__divsint_rrx_s
	ld	d,h
	ld	e,l
	pop	af
	pop	af
	pop	bc
;	genPlus
;	genPlusIncr
	ld	a,e
	add	a,#0x80
	ld	e,a
	ld	a,d
	adc	a,#0x00
	ld	d,a
;	genAssign (pointer)
;	isBitvar = 0
	ld	l,c
	ld	h,b
	ld	(hl),e
	inc	hl
	ld	(hl),d
;carwar.c:335: ret->y = 106 + (vec->y - cam->y) / ret->z;
;	genPlus
;	genPlusIncr
	inc	bc
	inc	bc
;	genPlus
;	AOP_STK for _Project_sloc1_1_0
;	genPlusIncr
	ld	e,-4(ix)
	ld	d,-3(ix)
	inc	de
	inc	de
;	genPointerGet
;	AOP_STK for _Project_sloc1_1_0
	ld	l,e
	ld	h,d
	ld	a,(hl)
	ld	-4(ix),a
	inc	hl
	ld	a,(hl)
	ld	-3(ix),a
;	genPlus
;	AOP_STK for _Project_sloc3_1_0
;	genPlusIncr
	ld	e,-8(ix)
	ld	d,-7(ix)
	inc	de
	inc	de
;	genPointerGet
	ld	l,e
	ld	h,d
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
;	genMinus
;	AOP_STK for _Project_sloc1_1_0
	ld	a,-4(ix)
	sub	a,e
	ld	e,a
	ld	a,-3(ix)
	sbc	a,d
	ld	d,a
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 1 deSending: 0
	push	bc
;	AOP_STK for _Project_sloc2_1_0
	ld	l,-6(ix)
	ld	h,-5(ix)
	push	hl
;	genIpush
	push	de
;	genCall
	call	__divsint_rrx_s
	ld	d,h
	ld	e,l
	pop	af
	pop	af
	pop	bc
;	genPlus
;	genPlusIncr
	ld	a,e
	add	a,#0x6A
	ld	e,a
	ld	a,d
	adc	a,#0x00
	ld	d,a
;	genAssign (pointer)
;	isBitvar = 0
	ld	l,c
	ld	h,b
	ld	(hl),e
	inc	hl
	ld	(hl),d
;	genLabel
;	genEndFunction
	ld	sp,ix
	pop	ix
	ret
_Project_end::
;carwar.c:354: void Update()
;	genLabel
;	genFunction
;	---------------------------------
; Function Update
; ---------------------------------
_Update_start::
_Update:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-3
	add	hl,sp
	ld	sp,hl
;carwar.c:360: DRAW_LINE(g_Screen[0].x, g_Screen[0].y, g_Screen[1].x, g_Screen[1].y, 0);
;	genPointerGet
	ld	hl,#_g_Screen
	ld	a,(hl)
	ld	iy,#_SX
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 2
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_SY
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 6
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_DX
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 6 + 2
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_DY
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genAssign
	ld	iy,#_CLR
	ld	0(iy),#0x00
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_DrawLineSimple
;carwar.c:361: DRAW_LINE(g_Screen[1].x, g_Screen[1].y, g_Screen[2].x, g_Screen[2].y, 0);
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 6
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_SX
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 6 + 2
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_SY
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 12
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_DX
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 12 + 2
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_DY
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genAssign
	ld	iy,#_CLR
	ld	0(iy),#0x00
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_DrawLineSimple
;carwar.c:362: DRAW_LINE(g_Screen[2].x, g_Screen[2].y, g_Screen[3].x, g_Screen[3].y, 0);
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 12
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_SX
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 12 + 2
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_SY
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 18
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_DX
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 18 + 2
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_DY
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genAssign
	ld	iy,#_CLR
	ld	0(iy),#0x00
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_DrawLineSimple
;carwar.c:363: DRAW_LINE(g_Screen[3].x, g_Screen[3].y, g_Screen[0].x, g_Screen[0].y, 0);
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 18
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_SX
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 18 + 2
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_SY
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPointerGet
	ld	hl,#_g_Screen
	ld	a,(hl)
	ld	iy,#_DX
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 2
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_DY
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genAssign
	ld	iy,#_CLR
	ld	0(iy),#0x00
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_DrawLineSimple
;carwar.c:365: DRAW_LINE(g_Screen[4].x, g_Screen[4].y, g_Screen[5].x, g_Screen[5].y, 0);
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 24
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_SX
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 24 + 2
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_SY
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 30
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_DX
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 30 + 2
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_DY
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genAssign
	ld	iy,#_CLR
	ld	0(iy),#0x00
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_DrawLineSimple
;carwar.c:366: DRAW_LINE(g_Screen[5].x, g_Screen[5].y, g_Screen[6].x, g_Screen[6].y, 0);
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 30
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_SX
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 30 + 2
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_SY
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 36
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_DX
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 36 + 2
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_DY
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genAssign
	ld	iy,#_CLR
	ld	0(iy),#0x00
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_DrawLineSimple
;carwar.c:367: DRAW_LINE(g_Screen[6].x, g_Screen[6].y, g_Screen[7].x, g_Screen[7].y, 0);
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 36
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_SX
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 36 + 2
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_SY
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 42
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_DX
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 42 + 2
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_DY
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genAssign
	ld	iy,#_CLR
	ld	0(iy),#0x00
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_DrawLineSimple
;carwar.c:368: DRAW_LINE(g_Screen[7].x, g_Screen[7].y, g_Screen[4].x, g_Screen[4].y, 0);
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 42
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_SX
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 42 + 2
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_SY
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 24
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_DX
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 24 + 2
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_DY
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genAssign
	ld	iy,#_CLR
	ld	0(iy),#0x00
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_DrawLineSimple
;carwar.c:370: DRAW_LINE(g_Screen[0].x, g_Screen[0].y, g_Screen[4].x, g_Screen[4].y, 0);
;	genPointerGet
	ld	hl,#_g_Screen
	ld	a,(hl)
	ld	iy,#_SX
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 2
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_SY
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 24
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_DX
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 24 + 2
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_DY
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genAssign
	ld	iy,#_CLR
	ld	0(iy),#0x00
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_DrawLineSimple
;carwar.c:371: DRAW_LINE(g_Screen[1].x, g_Screen[1].y, g_Screen[5].x, g_Screen[5].y, 0);
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 6
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_SX
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 6 + 2
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_SY
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 30
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_DX
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 30 + 2
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_DY
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genAssign
	ld	iy,#_CLR
	ld	0(iy),#0x00
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_DrawLineSimple
;carwar.c:372: DRAW_LINE(g_Screen[2].x, g_Screen[2].y, g_Screen[6].x, g_Screen[6].y, 0);
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 12
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_SX
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 12 + 2
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_SY
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 36
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_DX
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 36 + 2
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_DY
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genAssign
	ld	iy,#_CLR
	ld	0(iy),#0x00
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_DrawLineSimple
;carwar.c:373: DRAW_LINE(g_Screen[3].x, g_Screen[3].y, g_Screen[7].x, g_Screen[7].y, 0);
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 18
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_SX
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 18 + 2
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_SY
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 42
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_DX
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 42 + 2
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_DY
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genAssign
	ld	iy,#_CLR
	ld	0(iy),#0x00
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_DrawLineSimple
;carwar.c:375: for(i=0; i<POINT_NUM; i++)
;	genAssign
;	AOP_STK for _Update_i_1_1
	ld	-1(ix),#0x00
;	genAssign
	ld	b,#0x00
;	genLabel
00101$:
;	genCmpLt
;	AOP_STK for _Update_i_1_1
	ld	a,-1(ix)
	sub	a,#0x08
	jp	P,00104$
;carwar.c:378: DrawPoint8(g_Screen[i].x, g_Screen[i].y, 0);
;	genPlus
;	AOP_STK for _Update_sloc0_1_0
	ld	a,#<_g_Screen
	add	a,b
	ld	-3(ix),a
	ld	a,#>_g_Screen
	adc	a,#0x00
	ld	-2(ix),a
;	genPlus
;	AOP_STK for _Update_sloc0_1_0
;	genPlusIncr
	ld	a,-3(ix)
	add	a,#0x02
	ld	c,a
	ld	a,-2(ix)
	adc	a,#0x00
	ld	e,a
;	genPointerGet
	ld	l,c
	ld	h,e
	ld	c,(hl)
	inc	hl
	ld	e,(hl)
;	genCast
;	genPointerGet
;	AOP_STK for _Update_sloc0_1_0
	ld	l,-3(ix)
	ld	h,-2(ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
;	genCast
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 1 deSending: 0
	push	bc
	ld	a,#0x00
	push	af
	inc	sp
;	genIpush
	ld	a,c
	push	af
	inc	sp
;	genIpush
	ld	a,e
	push	af
	inc	sp
;	genCall
	call	_DrawPoint8
	pop	af
	inc	sp
	pop	bc
;carwar.c:382: TransXZIndex(i);
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 1 deSending: 0
	push	bc
;	AOP_STK for _Update_i_1_1
	ld	a,-1(ix)
	push	af
	inc	sp
;	genCall
	call	_TransXZIndex
	inc	sp
	pop	bc
;carwar.c:383: Project(&g_Screen[i], &g_World[i], &g_Camera);
;	genPlus
;	AOP_STK for _Update_sloc0_1_0
	ld	a,#<_g_World
	add	a,b
	ld	-3(ix),a
	ld	a,#>_g_World
	adc	a,#0x00
	ld	-2(ix),a
;	genPlus
	ld	a,#<_g_Screen
	add	a,b
	ld	c,a
	ld	a,#>_g_Screen
	adc	a,#0x00
	ld	e,a
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 1 deSending: 0
	push	bc
	ld	hl,#_g_Camera
	push	hl
;	genIpush
;	AOP_STK for _Update_sloc0_1_0
	ld	l,-3(ix)
	ld	h,-2(ix)
	push	hl
;	genIpush
	ld	l,c
	ld	h,e
	push	hl
;	genCall
	call	_Project
	pop	af
	pop	af
	pop	af
	pop	bc
;carwar.c:386: DrawPoint8(g_Screen[i].x, g_Screen[i].y, 255);
;	genPlus
;	AOP_STK for _Update_sloc0_1_0
	ld	a,#<_g_Screen
	add	a,b
	ld	-3(ix),a
	ld	a,#>_g_Screen
	adc	a,#0x00
	ld	-2(ix),a
;	genPlus
;	AOP_STK for _Update_sloc0_1_0
;	genPlusIncr
	ld	a,-3(ix)
	add	a,#0x02
	ld	c,a
	ld	a,-2(ix)
	adc	a,#0x00
	ld	e,a
;	genPointerGet
	ld	l,c
	ld	h,e
	ld	c,(hl)
	inc	hl
	ld	e,(hl)
;	genCast
;	genPointerGet
;	AOP_STK for _Update_sloc0_1_0
	ld	l,-3(ix)
	ld	h,-2(ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
;	genCast
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 1 deSending: 0
	push	bc
	ld	a,#0xFF
	push	af
	inc	sp
;	genIpush
	ld	a,c
	push	af
	inc	sp
;	genIpush
	ld	a,e
	push	af
	inc	sp
;	genCall
	call	_DrawPoint8
	pop	af
	inc	sp
	pop	bc
;carwar.c:375: for(i=0; i<POINT_NUM; i++)
;	genPlus
;	genPlusIncr
	ld	a,b
	add	a,#0x06
	ld	b,a
;	genPlus
;	AOP_STK for _Update_i_1_1
;	genPlusIncr
	inc	-1(ix)
;	genGoto
	jp	00101$
;	genLabel
00104$:
;carwar.c:389: DRAW_LINE(g_Screen[0].x, g_Screen[0].y, g_Screen[1].x, g_Screen[1].y, 128);
;	genPointerGet
	ld	hl,#_g_Screen
	ld	a,(hl)
	ld	iy,#_SX
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 2
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_SY
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 6
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_DX
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 6 + 2
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_DY
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genAssign
	ld	iy,#_CLR
	ld	0(iy),#0x80
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_DrawLineSimple
;carwar.c:390: DRAW_LINE(g_Screen[1].x, g_Screen[1].y, g_Screen[2].x, g_Screen[2].y, 128);
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 6
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_SX
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 6 + 2
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_SY
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 12
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_DX
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 12 + 2
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_DY
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genAssign
	ld	iy,#_CLR
	ld	0(iy),#0x80
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_DrawLineSimple
;carwar.c:391: DRAW_LINE(g_Screen[2].x, g_Screen[2].y, g_Screen[3].x, g_Screen[3].y, 128);
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 12
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_SX
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 12 + 2
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_SY
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 18
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_DX
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 18 + 2
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_DY
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genAssign
	ld	iy,#_CLR
	ld	0(iy),#0x80
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_DrawLineSimple
;carwar.c:392: DRAW_LINE(g_Screen[3].x, g_Screen[3].y, g_Screen[0].x, g_Screen[0].y, 128);
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 18
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_SX
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 18 + 2
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_SY
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPointerGet
	ld	hl,#_g_Screen
	ld	a,(hl)
	ld	iy,#_DX
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 2
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_DY
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genAssign
	ld	iy,#_CLR
	ld	0(iy),#0x80
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_DrawLineSimple
;carwar.c:394: DRAW_LINE(g_Screen[4].x, g_Screen[4].y, g_Screen[5].x, g_Screen[5].y, 128);
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 24
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_SX
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 24 + 2
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_SY
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 30
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_DX
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 30 + 2
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_DY
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genAssign
	ld	iy,#_CLR
	ld	0(iy),#0x80
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_DrawLineSimple
;carwar.c:395: DRAW_LINE(g_Screen[5].x, g_Screen[5].y, g_Screen[6].x, g_Screen[6].y, 128);
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 30
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_SX
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 30 + 2
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_SY
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 36
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_DX
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 36 + 2
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_DY
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genAssign
	ld	iy,#_CLR
	ld	0(iy),#0x80
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_DrawLineSimple
;carwar.c:396: DRAW_LINE(g_Screen[6].x, g_Screen[6].y, g_Screen[7].x, g_Screen[7].y, 128);
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 36
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_SX
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 36 + 2
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_SY
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 42
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_DX
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 42 + 2
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_DY
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genAssign
	ld	iy,#_CLR
	ld	0(iy),#0x80
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_DrawLineSimple
;carwar.c:397: DRAW_LINE(g_Screen[7].x, g_Screen[7].y, g_Screen[4].x, g_Screen[4].y, 128);
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 42
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_SX
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 42 + 2
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_SY
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 24
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_DX
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 24 + 2
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_DY
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genAssign
	ld	iy,#_CLR
	ld	0(iy),#0x80
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_DrawLineSimple
;carwar.c:399: DRAW_LINE(g_Screen[0].x, g_Screen[0].y, g_Screen[4].x, g_Screen[4].y, 128);
;	genPointerGet
	ld	hl,#_g_Screen
	ld	a,(hl)
	ld	iy,#_SX
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 2
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_SY
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 24
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_DX
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 24 + 2
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_DY
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genAssign
	ld	iy,#_CLR
	ld	0(iy),#0x80
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_DrawLineSimple
;carwar.c:400: DRAW_LINE(g_Screen[1].x, g_Screen[1].y, g_Screen[5].x, g_Screen[5].y, 128);
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 6
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_SX
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 6 + 2
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_SY
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 30
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_DX
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 30 + 2
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_DY
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genAssign
	ld	iy,#_CLR
	ld	0(iy),#0x80
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_DrawLineSimple
;carwar.c:401: DRAW_LINE(g_Screen[2].x, g_Screen[2].y, g_Screen[6].x, g_Screen[6].y, 128);
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 12
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_SX
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 12 + 2
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_SY
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 36
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_DX
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 36 + 2
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_DY
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genAssign
	ld	iy,#_CLR
	ld	0(iy),#0x80
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_DrawLineSimple
;carwar.c:402: DRAW_LINE(g_Screen[3].x, g_Screen[3].y, g_Screen[7].x, g_Screen[7].y, 128);
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 18
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_SX
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 18 + 2
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_SY
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 42
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_DX
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genPlus
;	genPlusIncr
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Screen + 42 + 2
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	a,(hl)
	ld	iy,#_DY
	ld	0(iy),a
	inc	hl
	ld	a,(hl)
	ld	1(iy),a
;	genAssign
	ld	iy,#_CLR
	ld	0(iy),#0x80
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_DrawLineSimple
;	genLabel
;	genEndFunction
	ld	sp,ix
	pop	ix
	ret
_Update_end::
;carwar.c:435: void SetScreen8()
;	genLabel
;	genFunction
;	---------------------------------
; Function SetScreen8
; ---------------------------------
_SetScreen8_start::
_SetScreen8:
;carwar.c:471: _endasm;
;	genInline
	
	
	
	
		 ld a,(#0xF3DF)
		 set #3,a
		 set #2,a
		 set #1,a
		 ld (#0xF3DF),a
	
		 di
	
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
	
		 ei
	
		
;	genLabel
;	genEndFunction
	ret
_SetScreen8_end::
;carwar.c:477: void SetPage8(i8 page)
;	genLabel
;	genFunction
;	---------------------------------
; Function SetPage8
; ---------------------------------
_SetPage8_start::
_SetPage8:
	push	ix
	ld	ix,#0
	add	ix,sp
;carwar.c:491: _endasm;
;	genInline
	
	
		 ld a,4(ix)
		 or #0x1F
		 di
		 out (#0x99),a
		 ld a,#(0x80+2)
		 out (#0x99),a
		 ei
	
		
;	genLabel
;	genEndFunction
	pop	ix
	ret
_SetPage8_end::
;carwar.c:497: void DrawPoint8(char posX, char posY, char color)
;	genLabel
;	genFunction
;	---------------------------------
; Function DrawPoint8
; ---------------------------------
_DrawPoint8_start::
_DrawPoint8:
	push	ix
	ld	ix,#0
	add	ix,sp
;carwar.c:501: WaitForVDP();
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_WaitForVDP
;carwar.c:549: _endasm;
;	genInline
	
	
	
	
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
		 out (#0x99),a
	
		 ei
	
		
;	genLabel
;	genEndFunction
	pop	ix
	ret
_DrawPoint8_end::
;carwar.c:555: void DrawLine(int posX1, int posY1, int posX2, int posY2, char color)
;	genLabel
;	genFunction
;	---------------------------------
; Function DrawLine
; ---------------------------------
_DrawLine_start::
_DrawLine:
	push	ix
	ld	ix,#0
	add	ix,sp
;carwar.c:557: SX  = posX1; 
;	genAssign
;	AOP_STK for 
	ld	a,4(ix)
	ld	iy,#_SX
	ld	0(iy),a
	ld	a,5(ix)
	ld	1(iy),a
;carwar.c:558: SY  = posY1; 
;	genAssign
;	AOP_STK for 
	ld	a,6(ix)
	ld	iy,#_SY
	ld	0(iy),a
	ld	a,7(ix)
	ld	1(iy),a
;carwar.c:559: DX  = posX2; 
;	genAssign
;	AOP_STK for 
	ld	a,8(ix)
	ld	iy,#_DX
	ld	0(iy),a
	ld	a,9(ix)
	ld	1(iy),a
;carwar.c:560: DY  = posY2; 
;	genAssign
;	AOP_STK for 
	ld	a,10(ix)
	ld	iy,#_DY
	ld	0(iy),a
	ld	a,11(ix)
	ld	1(iy),a
;carwar.c:561: CLR = color;
;	genAssign
;	AOP_STK for 
	ld	a,12(ix)
	ld	iy,#_CLR
	ld	0(iy),a
;carwar.c:563: DrawLineSimple();
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
;	genLabel
;	genEndFunction
	pop	ix
	jp	_DrawLineSimple
_DrawLine_end::
;carwar.c:569: void DrawLineSimple()
;	genLabel
;	genFunction
;	---------------------------------
; Function DrawLineSimple
; ---------------------------------
_DrawLineSimple_start::
_DrawLineSimple:
;carwar.c:571: WaitForVDP();
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_WaitForVDP
;carwar.c:643: _endasm;
;	genInline
	
	
;
;
;
;
	
	Do_Line_VDP:
;
		       xor a ;
		       ld hl,(_DY)
		       ld de,(_SY)
		       sbc hl,de ;
	
		       rla ;
		       ld (_ARG),a
	
		       and a ;
		       jp z,DeltaX ;
		       ex de,hl ;
		 ld hl,#0 ;
		       sbc hl,de ;
	
;
	DeltaX:
	push	hl ;
		       xor a ;
		       ld hl,(_DX)
		       ld de,(_SX)
		       sbc hl,de ;
	
		       ld a,(_ARG)
		       rla
		       rla ;
		       ld (_ARG),a
	
		       bit 1,a ;
		       jp z,cpHLDE ;
		       ex de,hl ;
		 ld hl,#0 ;
		       sbc hl,de ;
	
;
	cpHLDE:
	pop	de ;
		       xor a ;
	
		       push hl
		       sbc hl,de ;
		       pop hl
	
		       ld a,(_ARG)
		       rla ;
		       ld (_ARG),a
	
		       bit 0,a ;
		       jp z,DoIt ;
		       ex de,hl ;
	
;
	DoIt:
	ld	(_NX),hl
		       ld (_NY),de
	
		       ld hl,(_SX)
		       ld (_DX),hl
	
		       ld hl,(_SY)
		       ld (_DY),hl
	
		       ld a,#0x70 ;
		       ld (_CMD),a ;
	
		
;carwar.c:645: VPDCommand((int)&SX);
;	genCast
	ld	c,#<_SX
	ld	b,#>_SX
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	push	bc
;	genCall
	call	_VPDCommand
	pop	af
;	genLabel
;	genEndFunction
	ret
_DrawLineSimple_end::
;carwar.c:651: void DrawLine8(char posX1, char posY1, char posX2, char posY2, char color)
;	genLabel
;	genFunction
;	---------------------------------
; Function DrawLine8
; ---------------------------------
_DrawLine8_start::
_DrawLine8:
	push	ix
	ld	ix,#0
	add	ix,sp
;carwar.c:655: WaitForVDP();
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
;	genLabel
;	genEndFunction
	pop	ix
	jp	_WaitForVDP
_DrawLine8_end::
;carwar.c:789: void VPDCommand(int address)
;	genLabel
;	genFunction
;	---------------------------------
; Function VPDCommand
; ---------------------------------
_VPDCommand_start::
_VPDCommand:
	push	ix
	ld	ix,#0
	add	ix,sp
;carwar.c:793: WaitForVDP();
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_WaitForVDP
;carwar.c:824: _endasm;
;	genInline
	
	
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
	
		
;	genLabel
;	genEndFunction
	pop	ix
	ret
_VPDCommand_end::
;carwar.c:830: void waitRetrace()
;	genLabel
;	genFunction
;	---------------------------------
; Function waitRetrace
; ---------------------------------
_waitRetrace_start::
_waitRetrace:
;carwar.c:842: _endasm;
;	genInline
	
	
		 di
	 WAIT_RETRACE:
		 in a,(0x99)
		 and #0x80
		 cp #0
		 jr z, WAIT_RETRACE
		 ei
	
		
;	genLabel
;	genEndFunction
	ret
_waitRetrace_end::
;carwar.c:848: void WaitForVDP()
;	genLabel
;	genFunction
;	---------------------------------
; Function WaitForVDP
; ---------------------------------
_WaitForVDP_start::
_WaitForVDP:
;carwar.c:869: _endasm;
;	genInline
	
	
	
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
		 out (#0x99),a
		 ei
	
		
;	genLabel
;	genEndFunction
	ret
_WaitForVDP_end::
;carwar.c:873: char Joystick(char n)
;	genLabel
;	genFunction
;	---------------------------------
; Function Joystick
; ---------------------------------
_Joystick_start::
_Joystick:
	push	ix
	ld	ix,#0
	add	ix,sp
;carwar.c:880: _endasm;
;	genInline
	
		 ld a,4(ix)
		 call 0x00d5
		 ld l,a
		
;	genLabel
;	genEndFunction
	pop	ix
	ret
_Joystick_end::
;carwar.c:884: char Joytrig(char n)
;	genLabel
;	genFunction
;	---------------------------------
; Function Joytrig
; ---------------------------------
_Joytrig_start::
_Joytrig:
	push	ix
	ld	ix,#0
	add	ix,sp
;carwar.c:892: _endasm;
;	genInline
	
		 ld a,4(ix)
		 call 0x00d8
		 ld h,#0x00
		 ld l,a
		
;	genLabel
;	genEndFunction
	pop	ix
	ret
_Joytrig_end::
;carwar.c:896: u8 GetKeyMatrixLine(u8 n)
;	genLabel
;	genFunction
;	---------------------------------
; Function GetKeyMatrixLine
; ---------------------------------
_GetKeyMatrixLine_start::
_GetKeyMatrixLine:
	push	ix
	ld	ix,#0
	add	ix,sp
;carwar.c:903: _endasm;
;	genInline
	
		 ld a,4(ix)
		 call 0x0141
		 ld l,a
		
;	genLabel
;	genEndFunction
	pop	ix
	ret
_GetKeyMatrixLine_end::
;carwar.c:906: void SetTo50Hz()
;	genLabel
;	genFunction
;	---------------------------------
; Function SetTo50Hz
; ---------------------------------
_SetTo50Hz_start::
_SetTo50Hz:
;carwar.c:908: WaitForVDP();
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_WaitForVDP
;carwar.c:920: _endasm;
;	genInline
	
	
		 ld a,#2
		 di
		 out (#0x99),a ;
	
		 ld a,#(0x80+9)
		 out (#0x99),a ;
	
		 ei
		
;	genLabel
;	genEndFunction
	ret
_SetTo50Hz_end::
;carwar.c:923: void SetTo60Hz()
;	genLabel
;	genFunction
;	---------------------------------
; Function SetTo60Hz
; ---------------------------------
_SetTo60Hz_start::
_SetTo60Hz:
;carwar.c:925: WaitForVDP();
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_WaitForVDP
;carwar.c:937: _endasm;
;	genInline
	
	
		 ld a,#0
		 di
		 out (#0x99),a ;
	
		 ld a,#(0x80+9)
		 out (#0x99),a ;
	
		 ei
		
;	genLabel
;	genEndFunction
	ret
_SetTo60Hz_end::
;carwar.c:943: void WriteToVRAM8(i16 addr, u8 value)
;	genLabel
;	genFunction
;	---------------------------------
; Function WriteToVRAM8
; ---------------------------------
_WriteToVRAM8_start::
_WriteToVRAM8:
	push	ix
	ld	ix,#0
	add	ix,sp
;carwar.c:947: WaitForVDP();
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_WaitForVDP
;carwar.c:978: _endasm;
;	genInline
	
		 ;
		 ld a,5(ix) ;
		 and #0xC0 ;
		       rra
		       rra
		       rra
		       rra
		       rra
		       rra
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
		 out (#0x98),a
	
		 ei
		
;	genLabel
;	genEndFunction
	pop	ix
	ret
_WriteToVRAM8_end::
	.area _CODE
	.area _CABS
