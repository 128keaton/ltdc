;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.8.0 #5117 (Mar 23 2008) (MINGW32)
; This file was generated Tue Jan 11 00:27:20 2011
;--------------------------------------------------------
	.module test
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
	.globl _WriteToVRAM
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
;test.c:145: void main(void)
;	genLabel
;	genFunction
;	---------------------------------
; Function main
; ---------------------------------
_main_start::
_main:
;test.c:151: _endasm;
;	genInline
	
		 di
		 ld sp, (#0xFC4A)
		 ei
		
;test.c:153: g_slotPort = (g_slotPort & 0xCF) | ((g_slotPort & 0x0C) << 2);
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
;test.c:155: MainLoop();
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
;	genLabel
;	genEndFunction
	jp	_MainLoop
_main_end::
;test.c:164: void MainLoop()
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
	ld	hl,#-24
	add	hl,sp
	ld	sp,hl
;test.c:166: unsigned char clsScreen8[15] = 
;	genAddrOf
	ld	hl,#0x0009
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
;test.c:170: u8 x = 128, y = 96;
;	genAssign
;	AOP_STK for _MainLoop_x_1_1
	ld	-16(ix),#0x80
;	genAssign
;	AOP_STK for _MainLoop_y_1_1
	ld	-17(ix),#0x60
;test.c:177: SetShortVec(&g_Local[0], M2U(1),  M2U(1),  M2U(-1));
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
;test.c:178: SetShortVec(&g_Local[1], M2U(1),  M2U(-1), M2U(-1));
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
;test.c:179: SetShortVec(&g_Local[2], M2U(-1), M2U(-1), M2U(-1));
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
;test.c:180: SetShortVec(&g_Local[3], M2U(-1), M2U(1),  M2U(-1));
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
;test.c:181: SetShortVec(&g_Local[4], M2U(1),  M2U(1),  M2U(1));
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
;test.c:182: SetShortVec(&g_Local[5], M2U(1),  M2U(-1), M2U(1));
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
;test.c:183: SetShortVec(&g_Local[6], M2U(-1), M2U(-1), M2U(1));
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
;test.c:184: SetShortVec(&g_Local[7], M2U(-1), M2U(1),  M2U(1));
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
;test.c:186: SetShortVec(&g_Camera, M2U(0), M2U(0), M2U(3));
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
;test.c:188: SetShortVec(&g_Position, M2U(0), M2U(0), M2U(0));
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
;test.c:190: g_Angle = 30;
;	genAssign
	ld	iy,#_g_Angle
	ld	0(iy),#0x1E
;test.c:192: SetScreen8();
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_SetScreen8
;test.c:194: VPDCommand((int)&clsScreen8);
;	genAddrOf
	ld	hl,#0x0009
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
;test.c:196: while(bEnd == 0)
;	genLabel
00111$:
;test.c:198: DrawPoint8(x,     y - 1, 0);
;	genMinus
;	AOP_STK for _MainLoop_y_1_1
	ld	a,-17(ix)
	add	a,#0xFF
	ld	e,a
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 1 bcInUse: 0 deSending: 0
	push	de
	ld	a,#0x00
	push	af
	inc	sp
;	genIpush
	ld	a,e
	push	af
	inc	sp
;	genIpush
;	AOP_STK for _MainLoop_x_1_1
	ld	a,-16(ix)
	push	af
	inc	sp
;	genCall
	call	_DrawPoint8
	pop	af
	inc	sp
	pop	de
;test.c:199: DrawPoint8(x + 1, y,     0);
;	genPlus
;	AOP_STK for _MainLoop_x_1_1
;	genPlusIncr
	ld	d,-16(ix)
	inc	d
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 1 bcInUse: 0 deSending: 0
	push	de
	ld	a,#0x00
	push	af
	inc	sp
;	genIpush
;	AOP_STK for _MainLoop_y_1_1
	ld	a,-17(ix)
	push	af
	inc	sp
;	genIpush
	push	de
	inc	sp
;	genCall
	call	_DrawPoint8
	pop	af
	inc	sp
	pop	de
;test.c:200: DrawPoint8(x - 1, y,     0);
;	genMinus
;	AOP_STK for _MainLoop_x_1_1
	ld	a,-16(ix)
	add	a,#0xFF
	ld	b,a
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 1 bcInUse: 0 deSending: 0
	push	de
	ld	a,#0x00
	push	af
	inc	sp
;	genIpush
;	AOP_STK for _MainLoop_y_1_1
	ld	a,-17(ix)
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
;test.c:201: DrawPoint8(x,     y + 1, 0);
;	genPlus
;	AOP_STK for _MainLoop_y_1_1
;	AOP_STK for _MainLoop_sloc0_1_0
;	genPlusIncr
	ld	a,-17(ix)
	add	a,#0x01
	ld	-20(ix),a
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 1 bcInUse: 0 deSending: 0
	push	de
	ld	a,#0x00
	push	af
	inc	sp
;	genIpush
;	AOP_STK for _MainLoop_sloc0_1_0
	ld	a,-20(ix)
	push	af
	inc	sp
;	genIpush
;	AOP_STK for _MainLoop_x_1_1
	ld	a,-16(ix)
	push	af
	inc	sp
;	genCall
	call	_DrawPoint8
	pop	af
	inc	sp
	pop	de
;test.c:206: addr = x + (y * 256);
;	genCast
;	AOP_STK for _MainLoop_x_1_1
;	AOP_STK for _MainLoop_sloc1_1_0
	ld	a,-16(ix)
	ld	-22(ix),a
	ld	-21(ix),#0x00
;	genCast
;	AOP_STK for _MainLoop_y_1_1
	ld	c,-17(ix)
;	genLeftShift
	ld	b,c
	ld	c,#0x00
;	genPlus
;	AOP_STK for _MainLoop_sloc1_1_0
	ld	a,-22(ix)
	add	a,c
	ld	c,a
	ld	a,-21(ix)
	adc	a,b
	ld	b,a
;	genAssign
;	(registers are the same)
;test.c:207: WriteToVRAM(addr, 0x0F);
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 1 bcInUse: 0 deSending: 0
	push	de
	ld	a,#0x0F
	push	af
	inc	sp
;	genIpush
	push	bc
;	genCall
	call	_WriteToVRAM
	pop	af
	inc	sp
	pop	de
;test.c:209: x++;
;	genAssign
;	(registers are the same)
;	genAssign
;	AOP_STK for _MainLoop_x_1_1
	ld	-16(ix),d
;test.c:210: if((i = Joystick(0) | Joystick(1) | Joystick(2)) != 0)
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 1 bcInUse: 0 deSending: 0
	push	de
	ld	a,#0x00
	push	af
	inc	sp
;	genCall
	call	_Joystick
	ld	c,l
	inc	sp
	pop	de
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 1 bcInUse: 1 deSending: 0
	push	bc
	push	de
	ld	a,#0x01
	push	af
	inc	sp
;	genCall
	call	_Joystick
	ld	b,l
	inc	sp
	pop	de
	ld	a,b
	pop	bc
;	genOr
	ld	b,a
	or	a,c
	ld	c,a
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 1 bcInUse: 1 deSending: 0
	push	bc
	push	de
	ld	a,#0x02
	push	af
	inc	sp
;	genCall
	call	_Joystick
	ld	b,l
	inc	sp
	pop	de
	ld	a,b
	pop	bc
;	genOr
	ld	b,a
	or	a,c
	ld	c,a
;	genAssign
	ld	b,c
;	genIfx
	xor	a,a
	or	a,c
	jp	Z,00107$
;test.c:212: switch (i)
;	genCmpEq
; genCmpEq: left 1, right 1, result 0
	ld	a,b
	sub	a,#0x01
	jr	Z,00101$
;	genCmpEq
; genCmpEq: left 1, right 1, result 0
	ld	a,b
	sub	a,#0x03
	jr	Z,00102$
;	genCmpEq
; genCmpEq: left 1, right 1, result 0
	ld	a,b
	sub	a,#0x05
	jr	Z,00103$
;	genCmpEq
; genCmpEq: left 1, right 1, result 0
	ld	a,b
	sub	a,#0x07
	jp	Z,00104$
;	genGoto
	jp	00107$
;test.c:214: case 1: // ↑
;	genLabel
00101$:
;test.c:215: y--;
;	genAssign
;	(registers are the same)
;	genAssign
;	AOP_STK for _MainLoop_y_1_1
	ld	-17(ix),e
;test.c:216: g_Position.y -= 10;
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Position + 2
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
;	genMinus
	ld	a,e
	add	a,#0xF6
	ld	e,a
	ld	a,d
	adc	a,#0xFF
	ld	d,a
;	genAssign (pointer)
;	isBitvar = 0
	ld	l,c
	ld	h,b
	ld	(hl),e
	inc	hl
	ld	(hl),d
;test.c:217: break;
;	genGoto
	jp	00107$
;test.c:218: case 3: // →
;	genLabel
00102$:
;test.c:219: g_Position.x += 10;
;	genPointerGet
	ld	hl,#_g_Position
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;	genPlus
;	genPlusIncr
	ld	a,c
	add	a,#0x0A
	ld	c,a
	ld	a,b
	adc	a,#0x00
	ld	b,a
;	genAssign (pointer)
;	isBitvar = 0
	dec	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
;test.c:220: break;
;	genGoto
	jr	00107$
;test.c:221: case 5: // ↓
;	genLabel
00103$:
;test.c:222: y++;
;	genAssign
;	AOP_STK for _MainLoop_sloc0_1_0
	ld	c,-20(ix)
;	genAssign
;	AOP_STK for _MainLoop_y_1_1
	ld	-17(ix),c
;test.c:223: g_Position.y += 10;
;	genPlus
;	genPlusIncr
	ld	bc,#_g_Position + 2
;	genPointerGet
	ld	l,c
	ld	h,b
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
;	genPlus
;	genPlusIncr
	ld	a,e
	add	a,#0x0A
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
;test.c:224: break;
;	genGoto
	jr	00107$
;test.c:225: case 7: // ←
;	genLabel
00104$:
;test.c:226: g_Position.x -= 10;
;	genPointerGet
	ld	hl,#_g_Position
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;	genMinus
	ld	a,c
	add	a,#0xF6
	ld	c,a
	ld	a,b
	adc	a,#0xFF
	ld	b,a
;	genAssign (pointer)
;	isBitvar = 0
	dec	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
;test.c:228: }
;	genLabel
00107$:
;test.c:231: DrawPoint8(x,     y - 1, 255);
;	genMinus
;	AOP_STK for _MainLoop_y_1_1
	ld	a,-17(ix)
	add	a,#0xFF
	ld	c,a
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	ld	a,#0xFF
	push	af
	inc	sp
;	genIpush
	ld	a,c
	push	af
	inc	sp
;	genIpush
;	AOP_STK for _MainLoop_x_1_1
	ld	a,-16(ix)
	push	af
	inc	sp
;	genCall
	call	_DrawPoint8
	pop	af
	inc	sp
;test.c:232: DrawPoint8(x + 1, y,     255);
;	genPlus
;	AOP_STK for _MainLoop_x_1_1
;	genPlusIncr
	ld	c,-16(ix)
	inc	c
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	ld	a,#0xFF
	push	af
	inc	sp
;	genIpush
;	AOP_STK for _MainLoop_y_1_1
	ld	a,-17(ix)
	push	af
	inc	sp
;	genIpush
	ld	a,c
	push	af
	inc	sp
;	genCall
	call	_DrawPoint8
	pop	af
	inc	sp
;test.c:233: DrawPoint8(x - 1, y,     255);
;	genMinus
;	AOP_STK for _MainLoop_x_1_1
	ld	a,-16(ix)
	add	a,#0xFF
	ld	c,a
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	ld	a,#0xFF
	push	af
	inc	sp
;	genIpush
;	AOP_STK for _MainLoop_y_1_1
	ld	a,-17(ix)
	push	af
	inc	sp
;	genIpush
	ld	a,c
	push	af
	inc	sp
;	genCall
	call	_DrawPoint8
	pop	af
	inc	sp
;test.c:234: DrawPoint8(x,     y + 1, 255);
;	genPlus
;	AOP_STK for _MainLoop_y_1_1
;	genPlusIncr
	ld	c,-17(ix)
	inc	c
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	ld	a,#0xFF
	push	af
	inc	sp
;	genIpush
	ld	a,c
	push	af
	inc	sp
;	genIpush
;	AOP_STK for _MainLoop_x_1_1
	ld	a,-16(ix)
	push	af
	inc	sp
;	genCall
	call	_DrawPoint8
	pop	af
	inc	sp
;test.c:236: g_AngleIndex = g_Angle >> 2;
;	genRightShift
	ld	iy,#_g_Angle
	ld	a,0(iy)
	srl	a
	srl	a
	ld	iy,#_g_AngleIndex
	ld	0(iy),a
;test.c:238: g_Angle += 4;
;	genPlus
;	genPlusIncr
	ld	iy,#_g_Angle
	inc	0(iy)
	inc	0(iy)
	inc	0(iy)
	inc	0(iy)
;test.c:240: for(i=0; i<10; i++) // rows
;	genAssign
;	AOP_STK for _MainLoop_i_1_1
	ld	-18(ix),#0x00
;	genLabel
00118$:
;	genCmpLt
;	AOP_STK for _MainLoop_i_1_1
	ld	a,-18(ix)
	sub	a,#0x0A
	jp	P,00111$
;test.c:242: keyLine = GetKeyMatrixLine(i);
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
;	AOP_STK for _MainLoop_i_1_1
	ld	a,-18(ix)
	push	af
	inc	sp
;	genCall
	call	_GetKeyMatrixLine
	ld	b,l
	inc	sp
;	genAssign
;	(registers are the same)
;test.c:243: for(j=0; j<8; j++) // characters
;	genPlus
;	AOP_STK for _MainLoop_i_1_1
;	genPlusIncr
	ld	a,-18(ix)
	add	a,#0x0A
	ld	e,a
;	genAssign
;	AOP_STK for _MainLoop_sloc1_1_0
	ld	-22(ix),e
;	genAssign
;	AOP_STK for _MainLoop_j_1_1
	ld	-19(ix),#0x00
;	genLabel
00114$:
;	genCmpLt
;	AOP_STK for _MainLoop_j_1_1
	ld	a,-19(ix)
	sub	a,#0x08
	jp	P,00120$
;test.c:245: if(keyLine & 1 << j)
;	genLeftShift
;	AOP_STK for _MainLoop_j_1_1
	ld	a,-19(ix)
	inc	a
;	AOP_STK for _MainLoop_sloc2_1_0
	push	af
	ld	-24(ix),#0x01
	ld	-23(ix),#0x00
	pop	af
	jr	00142$
00141$:
	sla	-24(ix)
	rl	-23(ix)
00142$:
	dec	a
	jr	NZ,00141$
;	genCast
	ld	d,b
	ld	c,#0x00
;	genAnd
;	AOP_STK for _MainLoop_sloc2_1_0
	ld	a,d
	and	a,-24(ix)
	ld	d,a
	ld	a,c
	and	a,-23(ix)
;	genIfx
	ld	c,a
	or	a,d
	jr	Z,00109$
;test.c:246: DrawPoint8(10 + j, 10 + i, 0);
;	genPlus
;	AOP_STK for _MainLoop_j_1_1
;	genPlusIncr
	ld	a,-19(ix)
	add	a,#0x0A
	ld	c,a
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 1 bcInUse: 1 deSending: 0
	push	bc
	push	de
	ld	a,#0x00
	push	af
	inc	sp
;	genIpush
;	AOP_STK for _MainLoop_sloc1_1_0
	ld	a,-22(ix)
	push	af
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
	pop	bc
;	genGoto
	jr	00116$
;	genLabel
00109$:
;test.c:248: DrawPoint8(10 + j, 10 + i, 255);
;	genPlus
;	AOP_STK for _MainLoop_j_1_1
;	genPlusIncr
	ld	a,-19(ix)
	add	a,#0x0A
	ld	c,a
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 1 bcInUse: 1 deSending: 0
	push	bc
	push	de
	ld	a,#0xFF
	push	af
	inc	sp
;	genIpush
	ld	a,e
	push	af
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
	pop	bc
;	genLabel
00116$:
;test.c:243: for(j=0; j<8; j++) // characters
;	genPlus
;	AOP_STK for _MainLoop_j_1_1
;	genPlusIncr
	inc	-19(ix)
;	genGoto
	jp	00114$
;	genLabel
00120$:
;test.c:240: for(i=0; i<10; i++) // rows
;	genPlus
;	AOP_STK for _MainLoop_i_1_1
;	genPlusIncr
	inc	-18(ix)
;	genGoto
	jp	00118$
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
;test.c:267: void SetShortVec(ShortVec* ret, i16 x, i16 y, i16 z)
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
;test.c:269: ret->x = x;
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
;test.c:270: ret->y = y;
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
;test.c:271: ret->z = z;
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
;test.c:277: void TransXZ(ShortVec* ret, const ShortVec* vec, u8 g_Angle, const ShortVec* pos)
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
;test.c:279: g_Angle >>= 2; 
;	genRightShift
;	AOP_STK for 
	ld	a,8(ix)
	srl	a
	srl	a
	ld	8(ix),a
;test.c:280: ret->x = UxU(vec->x, g_Cosinus[g_Angle]) - UxU(vec->z, g_Sinus[g_Angle]);
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
;test.c:281: ret->y = vec->y + pos->y;
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
;test.c:282: ret->z = UxU(vec->x, g_Sinus[g_Angle]) + UxU(vec->z, g_Cosinus[g_Angle]);
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
;test.c:288: void TransXZIndex(i8 i)
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
;test.c:290: g_World[i].x = UxU(g_Local[i].x, g_Cosinus[g_AngleIndex]) - UxU(g_Local[i].z, g_Sinus[g_AngleIndex]) + g_Position.x;
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
;test.c:291: g_World[i].y = g_Local[i].y + g_Position.y;
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
;test.c:292: g_World[i].z = UxU(g_Local[i].x, g_Sinus[g_AngleIndex]) + UxU(g_Local[i].z, g_Cosinus[g_AngleIndex]) + g_Position.z;
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
;test.c:298: void Project(ShortVec* ret, const ShortVec* vec, const ShortVec* cam)
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
;test.c:301: ret->z = ((vec->z - cam->z) >> 5);
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
;test.c:302: ret->x = 128 + (vec->x - cam->x) / ret->z;
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
;test.c:303: ret->y = 106 + (vec->y - cam->y) / ret->z;
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
;test.c:322: void Update()
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
;test.c:328: DRAW_LINE(g_Screen[0].x, g_Screen[0].y, g_Screen[1].x, g_Screen[1].y, 0);
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
;test.c:329: DRAW_LINE(g_Screen[1].x, g_Screen[1].y, g_Screen[2].x, g_Screen[2].y, 0);
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
;test.c:330: DRAW_LINE(g_Screen[2].x, g_Screen[2].y, g_Screen[3].x, g_Screen[3].y, 0);
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
;test.c:331: DRAW_LINE(g_Screen[3].x, g_Screen[3].y, g_Screen[0].x, g_Screen[0].y, 0);
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
;test.c:333: DRAW_LINE(g_Screen[4].x, g_Screen[4].y, g_Screen[5].x, g_Screen[5].y, 0);
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
;test.c:334: DRAW_LINE(g_Screen[5].x, g_Screen[5].y, g_Screen[6].x, g_Screen[6].y, 0);
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
;test.c:335: DRAW_LINE(g_Screen[6].x, g_Screen[6].y, g_Screen[7].x, g_Screen[7].y, 0);
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
;test.c:336: DRAW_LINE(g_Screen[7].x, g_Screen[7].y, g_Screen[4].x, g_Screen[4].y, 0);
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
;test.c:338: DRAW_LINE(g_Screen[0].x, g_Screen[0].y, g_Screen[4].x, g_Screen[4].y, 0);
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
;test.c:339: DRAW_LINE(g_Screen[1].x, g_Screen[1].y, g_Screen[5].x, g_Screen[5].y, 0);
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
;test.c:340: DRAW_LINE(g_Screen[2].x, g_Screen[2].y, g_Screen[6].x, g_Screen[6].y, 0);
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
;test.c:341: DRAW_LINE(g_Screen[3].x, g_Screen[3].y, g_Screen[7].x, g_Screen[7].y, 0);
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
;test.c:343: for(i=0; i<POINT_NUM; i++)
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
;test.c:346: DrawPoint8(g_Screen[i].x, g_Screen[i].y, 0);
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
;test.c:350: TransXZIndex(i);
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
;test.c:351: Project(&g_Screen[i], &g_World[i], &g_Camera);
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
;test.c:354: DrawPoint8(g_Screen[i].x, g_Screen[i].y, 255);
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
;test.c:343: for(i=0; i<POINT_NUM; i++)
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
;test.c:357: DRAW_LINE(g_Screen[0].x, g_Screen[0].y, g_Screen[1].x, g_Screen[1].y, 128);
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
;test.c:358: DRAW_LINE(g_Screen[1].x, g_Screen[1].y, g_Screen[2].x, g_Screen[2].y, 128);
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
;test.c:359: DRAW_LINE(g_Screen[2].x, g_Screen[2].y, g_Screen[3].x, g_Screen[3].y, 128);
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
;test.c:360: DRAW_LINE(g_Screen[3].x, g_Screen[3].y, g_Screen[0].x, g_Screen[0].y, 128);
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
;test.c:362: DRAW_LINE(g_Screen[4].x, g_Screen[4].y, g_Screen[5].x, g_Screen[5].y, 128);
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
;test.c:363: DRAW_LINE(g_Screen[5].x, g_Screen[5].y, g_Screen[6].x, g_Screen[6].y, 128);
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
;test.c:364: DRAW_LINE(g_Screen[6].x, g_Screen[6].y, g_Screen[7].x, g_Screen[7].y, 128);
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
;test.c:365: DRAW_LINE(g_Screen[7].x, g_Screen[7].y, g_Screen[4].x, g_Screen[4].y, 128);
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
;test.c:367: DRAW_LINE(g_Screen[0].x, g_Screen[0].y, g_Screen[4].x, g_Screen[4].y, 128);
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
;test.c:368: DRAW_LINE(g_Screen[1].x, g_Screen[1].y, g_Screen[5].x, g_Screen[5].y, 128);
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
;test.c:369: DRAW_LINE(g_Screen[2].x, g_Screen[2].y, g_Screen[6].x, g_Screen[6].y, 128);
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
;test.c:370: DRAW_LINE(g_Screen[3].x, g_Screen[3].y, g_Screen[7].x, g_Screen[7].y, 128);
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
;test.c:403: void SetScreen8()
;	genLabel
;	genFunction
;	---------------------------------
; Function SetScreen8
; ---------------------------------
_SetScreen8_start::
_SetScreen8:
;test.c:439: _endasm;
;	genInline
	
	
	
	
		 ld a,(#0xF3DF)
		 set #3,a
		 set #2,a
		 set #1,a
		 ld (#0xF3DF),a
	
		 di
	
		 out (#0x99),a
		 ld a,#0x80+#0
		 out (#0x99),a
	
	
		 ld a,(#0xF3E0)
		 res #4,a
		 res #3,a
		 ld (#0xF3E0),a
	
		 out (#0x99),a
		 ld a,#0x80+#1
		 out (#0x99),a
	
	
		 ld a,#0x1F
		 out (#0x99),a
		 ld a,#0x80+2
		 out (#0x99),a
	
		 ei
	
		
;	genLabel
;	genEndFunction
	ret
_SetScreen8_end::
;test.c:445: void SetPage8(i8 page)
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
;test.c:459: _endasm;
;	genInline
	
	
		 ld a,4(ix)
		 or #0x1F
		 di
		 out (#0x99),a
		 ld a,#0x80+2
		 out (#0x99),a
		 ei
	
		
;	genLabel
;	genEndFunction
	pop	ix
	ret
_SetPage8_end::
;test.c:465: void DrawPoint8(char posX, char posY, char color)
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
;test.c:469: WaitForVDP();
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_WaitForVDP
;test.c:517: _endasm;
;	genInline
	
	
	
	
		 ld a,4(ix)
		 di
		 out (#0x99),a
		 ld a,#0x80+#36
		 out (#0x99),a
	
		 xor a
		 out (#0x99),a
		 ld a,#0x80+#37
		 out (#0x99),a
	
	
		 ld a,5(ix)
		 out (#0x99),a
		 ld a,#0x80+#38
		 out (#0x99),a
	
		 xor a
		 out (#0x99),a
		 ld a,#0x80+#39
		 out (#0x99),a
	
	
		 ld a,6(ix)
		 out (#0x99),a
		 ld a,#0x80+#44
		 out (#0x99),a
	
	
		 xor a
		 out (#0x99),a
		 ld a,#0x80+#45
		 out (#0x99),a
	
	
		 ld a,#0x50
		 out (#0x99),a
		 ld a,#0x80+#46
		 out (#0x99),a
	
		 ei
	
		
;	genLabel
;	genEndFunction
	pop	ix
	ret
_DrawPoint8_end::
;test.c:523: void DrawLine(int posX1, int posY1, int posX2, int posY2, char color)
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
;test.c:525: SX  = posX1; 
;	genAssign
;	AOP_STK for 
	ld	a,4(ix)
	ld	iy,#_SX
	ld	0(iy),a
	ld	a,5(ix)
	ld	1(iy),a
;test.c:526: SY  = posY1; 
;	genAssign
;	AOP_STK for 
	ld	a,6(ix)
	ld	iy,#_SY
	ld	0(iy),a
	ld	a,7(ix)
	ld	1(iy),a
;test.c:527: DX  = posX2; 
;	genAssign
;	AOP_STK for 
	ld	a,8(ix)
	ld	iy,#_DX
	ld	0(iy),a
	ld	a,9(ix)
	ld	1(iy),a
;test.c:528: DY  = posY2; 
;	genAssign
;	AOP_STK for 
	ld	a,10(ix)
	ld	iy,#_DY
	ld	0(iy),a
	ld	a,11(ix)
	ld	1(iy),a
;test.c:529: CLR = color;
;	genAssign
;	AOP_STK for 
	ld	a,12(ix)
	ld	iy,#_CLR
	ld	0(iy),a
;test.c:531: DrawLineSimple();
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
;	genLabel
;	genEndFunction
	pop	ix
	jp	_DrawLineSimple
_DrawLine_end::
;test.c:537: void DrawLineSimple()
;	genLabel
;	genFunction
;	---------------------------------
; Function DrawLineSimple
; ---------------------------------
_DrawLineSimple_start::
_DrawLineSimple:
;test.c:539: WaitForVDP();
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_WaitForVDP
;test.c:611: _endasm;
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
	
		
;test.c:613: VPDCommand((int)&SX);
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
;test.c:619: void DrawLine8(char posX1, char posY1, char posX2, char posY2, char color)
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
;test.c:623: WaitForVDP();
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
;	genLabel
;	genEndFunction
	pop	ix
	jp	_WaitForVDP
_DrawLine8_end::
;test.c:757: void VPDCommand(int address)
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
;test.c:761: WaitForVDP();
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_WaitForVDP
;test.c:792: _endasm;
;	genInline
	
	
		 ld l,4(ix)
		 ld h,5(ix)
	
	
		 ld a,#32
		 di
		 out (#0x99),a
		 ld a,#0x80+#17
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
;test.c:798: void waitRetrace()
;	genLabel
;	genFunction
;	---------------------------------
; Function waitRetrace
; ---------------------------------
_waitRetrace_start::
_waitRetrace:
;test.c:810: _endasm;
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
;test.c:816: void WaitForVDP()
;	genLabel
;	genFunction
;	---------------------------------
; Function WaitForVDP
; ---------------------------------
_WaitForVDP_start::
_WaitForVDP:
;test.c:837: _endasm;
;	genInline
	
	
	
		 ld a,#2
		 di
		 out (#0x99),a
		 ld a,#0x80+#15
		 out (#0x99),a
	 WAIT_VDP:
		 nop
		 in a,(#0x99)
		 rra
		 jr c,WAIT_VDP
		 xor a
		 out (#0x99),a
		 ld a,#0x80+#15
		 out (#0x99),a
		 ei
	
		
;	genLabel
;	genEndFunction
	ret
_WaitForVDP_end::
;test.c:841: char Joystick(char n)
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
;test.c:848: _endasm;
;	genInline
	
		 ld a,4(ix)
		 call 0x00d5
		 ld l,a
		
;	genLabel
;	genEndFunction
	pop	ix
	ret
_Joystick_end::
;test.c:852: char Joytrig(char n)
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
;test.c:860: _endasm;
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
;test.c:864: u8 GetKeyMatrixLine(u8 n)
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
;test.c:871: _endasm;
;	genInline
	
		 ld a,4(ix)
		 call 0x0141
		 ld l,a
		
;	genLabel
;	genEndFunction
	pop	ix
	ret
_GetKeyMatrixLine_end::
;test.c:877: void WriteToVRAM(i16 addr, u8 value)
;	genLabel
;	genFunction
;	---------------------------------
; Function WriteToVRAM
; ---------------------------------
_WriteToVRAM_start::
_WriteToVRAM:
	push	ix
	ld	ix,#0
	add	ix,sp
;test.c:881: WaitForVDP();
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_WaitForVDP
;test.c:906: _endasm;
;	genInline
	
		 di
	
		 ;
		 xor a
		 out (#0x99),a
		 ld a,#0x80+#14
		 out (#0x99),a
	
		 ;
		 ld a,4(ix)
		 out (#0x99),a
	
		 ld a,5(ix)
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
_WriteToVRAM_end::
	.area _CODE
	.area _CABS
