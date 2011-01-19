;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.8.0 #5117 (Mar 23 2008) (MINGW32)
; This file was generated Thu Jan 20 00:22:20 2011
;--------------------------------------------------------
	.module carwar
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _g_Sprite
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
	.globl _HMMC
	.globl _SetupHMMC
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
_g_Sprite::
	.ds 64
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
;carwar.c:176: u8 g_Sprite[8*8] =
;	genArrayInit
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	ld	hl,#_g_Sprite
	call	__initrleblock
	.db	#-9,#0xFF
	.db	46
	.db	0x64, 0x00, 0x00, 0x00, 0x00, 0xC8, 0xFF, 0xFF
	.db	0x00, 0x64, 0x00, 0x00, 0xC8, 0x00, 0xFF, 0xFF
	.db	0x00, 0x00, 0x64, 0xC8, 0x00, 0x00, 0xFF, 0xFF
	.db	0x00, 0x00, 0xC8, 0x64, 0x00, 0x00, 0xFF, 0xFF
	.db	0x00, 0xC8, 0x00, 0x00, 0x64, 0x00, 0xFF, 0xFF
	.db	0xC8, 0x00, 0x00, 0x00, 0x00, 0x64
	.db	#-9,#0xFF
	.db	0
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;carwar.c:155: void main(void)
;	genLabel
;	genFunction
;	---------------------------------
; Function main
; ---------------------------------
_main_start::
_main:
;carwar.c:161: _endasm;
;	genInline
	
		 di
		 ld sp, (#0xFC4A)
		 ei
		
;carwar.c:163: g_slotPort = (g_slotPort & 0xCF) | ((g_slotPort & 0x0C) << 2);
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
;carwar.c:165: MainLoop();
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
;	genLabel
;	genEndFunction
	jp	_MainLoop
_main_end::
;carwar.c:191: void MainLoop()
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
;carwar.c:193: u8 clsScreen8[15] = 
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
;carwar.c:198: u8 x = 128, y = 128;
;	genAssign
;	AOP_STK for _MainLoop_x_1_1
	ld	-16(ix),#0x80
;	genAssign
;	AOP_STK for _MainLoop_y_1_1
	ld	-17(ix),#0x80
;carwar.c:220: SetTo60Hz();
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_SetTo60Hz
;carwar.c:221: SetScreen8();
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_SetScreen8
;carwar.c:224: HMMC(0, 100, 100, 8, 8, (u16)&g_Sprite);
;	genCast
	ld	e,#<_g_Sprite
	ld	d,#>_g_Sprite
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	push	de
;	genIpush
	ld	hl,#0x0808
	push	hl
;	genIpush
	ld	hl,#0x6464
	push	hl
;	genIpush
	ld	a,#0x00
	push	af
	inc	sp
;	genCall
	call	_HMMC
	pop	af
	pop	af
	pop	af
	inc	sp
;carwar.c:226: VPDCommand((int)&clsScreen8);
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
;carwar.c:228: while(bEnd == 0)
;	genLabel
00115$:
;carwar.c:238: addr = x + (y << 8);
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
;carwar.c:239: WriteToVRAM8(addr, 0x0F);
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
;carwar.c:242: if((i = Joystick(0) | Joystick(1) | Joystick(2)) != 0)
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
;carwar.c:244: switch (i)
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
;carwar.c:246: case 1: y--; break;
;	genLabel
00101$:
;	genMinus
;	AOP_STK for _MainLoop_y_1_1
	dec	-17(ix)
;	genGoto
	jr	00111$
;carwar.c:247: case 2: y--; x++; break;
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
;carwar.c:248: case 3: x++; break;
;	genLabel
00103$:
;	genPlus
;	AOP_STK for _MainLoop_x_1_1
;	genPlusIncr
	inc	-16(ix)
;	genGoto
	jr	00111$
;carwar.c:249: case 4: y++; x++; break;
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
;carwar.c:250: case 5: y++; break;
;	genLabel
00105$:
;	genPlus
;	AOP_STK for _MainLoop_y_1_1
;	genPlusIncr
	inc	-17(ix)
;	genGoto
	jr	00111$
;carwar.c:251: case 6: y++; x--; break;
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
;carwar.c:252: case 7: x--; break;
;	genLabel
00107$:
;	genMinus
;	AOP_STK for _MainLoop_x_1_1
	dec	-16(ix)
;	genGoto
	jr	00111$
;carwar.c:253: case 8: y--; x--; break;
;	genLabel
00108$:
;	genMinus
;	AOP_STK for _MainLoop_y_1_1
	dec	-17(ix)
;	genMinus
;	AOP_STK for _MainLoop_x_1_1
	dec	-16(ix)
;carwar.c:254: }
;	genLabel
00111$:
;carwar.c:282: for(i=0; i<10; i++) // rows
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
;carwar.c:284: keyLine = GetKeyMatrixLine(i);
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
;carwar.c:285: for(j=0; j<8; j++) // characters
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
;carwar.c:287: if(keyLine & 1 << j)
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
;carwar.c:288: DrawPoint8(10 + j, 10 + i, 0);
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
;carwar.c:290: DrawPoint8(10 + j, 10 + i, 255);
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
;carwar.c:285: for(j=0; j<8; j++) // characters
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
;carwar.c:282: for(i=0; i<10; i++) // rows
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
;carwar.c:296: for(j=0; j<256; j++) // characters
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
;carwar.c:298: DrawPoint8(j, i, j);
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
;carwar.c:296: for(j=0; j<256; j++) // characters
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
;carwar.c:453: void SetScreen8()
;	genLabel
;	genFunction
;	---------------------------------
; Function SetScreen8
; ---------------------------------
_SetScreen8_start::
_SetScreen8:
;carwar.c:489: _endasm;
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
;carwar.c:495: void SetPage8(i8 page)
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
;carwar.c:509: _endasm;
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
;carwar.c:515: void DrawPoint8(char posX, char posY, char color)
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
;carwar.c:519: WaitForVDP();
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_WaitForVDP
;carwar.c:567: _endasm;
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
;carwar.c:573: void DrawLine(int posX1, int posY1, int posX2, int posY2, char color)
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
;carwar.c:575: SX  = posX1; 
;	genAssign
;	AOP_STK for 
	ld	a,4(ix)
	ld	iy,#_SX
	ld	0(iy),a
	ld	a,5(ix)
	ld	1(iy),a
;carwar.c:576: SY  = posY1; 
;	genAssign
;	AOP_STK for 
	ld	a,6(ix)
	ld	iy,#_SY
	ld	0(iy),a
	ld	a,7(ix)
	ld	1(iy),a
;carwar.c:577: DX  = posX2; 
;	genAssign
;	AOP_STK for 
	ld	a,8(ix)
	ld	iy,#_DX
	ld	0(iy),a
	ld	a,9(ix)
	ld	1(iy),a
;carwar.c:578: DY  = posY2; 
;	genAssign
;	AOP_STK for 
	ld	a,10(ix)
	ld	iy,#_DY
	ld	0(iy),a
	ld	a,11(ix)
	ld	1(iy),a
;carwar.c:579: CLR = color;
;	genAssign
;	AOP_STK for 
	ld	a,12(ix)
	ld	iy,#_CLR
	ld	0(iy),a
;carwar.c:581: DrawLineSimple();
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
;	genLabel
;	genEndFunction
	pop	ix
	jp	_DrawLineSimple
_DrawLine_end::
;carwar.c:587: void DrawLineSimple()
;	genLabel
;	genFunction
;	---------------------------------
; Function DrawLineSimple
; ---------------------------------
_DrawLineSimple_start::
_DrawLineSimple:
;carwar.c:589: WaitForVDP();
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_WaitForVDP
;carwar.c:661: _endasm;
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
	
		
;carwar.c:663: VPDCommand((int)&SX);
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
;carwar.c:669: void DrawLine8(char posX1, char posY1, char posX2, char posY2, char color)
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
;carwar.c:673: WaitForVDP();
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
;	genLabel
;	genEndFunction
	pop	ix
	jp	_WaitForVDP
_DrawLine8_end::
;carwar.c:807: void VPDCommand(int address)
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
;carwar.c:811: WaitForVDP();
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_WaitForVDP
;carwar.c:842: _endasm;
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
;carwar.c:848: void waitRetrace()
;	genLabel
;	genFunction
;	---------------------------------
; Function waitRetrace
; ---------------------------------
_waitRetrace_start::
_waitRetrace:
;carwar.c:860: _endasm;
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
;carwar.c:866: void WaitForVDP()
;	genLabel
;	genFunction
;	---------------------------------
; Function WaitForVDP
; ---------------------------------
_WaitForVDP_start::
_WaitForVDP:
;carwar.c:887: _endasm;
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
;carwar.c:891: char Joystick(char n)
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
;carwar.c:898: _endasm;
;	genInline
	
		 ld a,4(ix)
		 call 0x00d5
		 ld l,a
		
;	genLabel
;	genEndFunction
	pop	ix
	ret
_Joystick_end::
;carwar.c:902: char Joytrig(char n)
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
;carwar.c:910: _endasm;
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
;carwar.c:914: u8 GetKeyMatrixLine(u8 n)
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
;carwar.c:921: _endasm;
;	genInline
	
		 ld a,4(ix)
		 call 0x0141
		 ld l,a
		
;	genLabel
;	genEndFunction
	pop	ix
	ret
_GetKeyMatrixLine_end::
;carwar.c:924: void SetTo50Hz()
;	genLabel
;	genFunction
;	---------------------------------
; Function SetTo50Hz
; ---------------------------------
_SetTo50Hz_start::
_SetTo50Hz:
;carwar.c:926: WaitForVDP();
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_WaitForVDP
;carwar.c:938: _endasm;
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
;carwar.c:941: void SetTo60Hz()
;	genLabel
;	genFunction
;	---------------------------------
; Function SetTo60Hz
; ---------------------------------
_SetTo60Hz_start::
_SetTo60Hz:
;carwar.c:943: WaitForVDP();
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_WaitForVDP
;carwar.c:955: _endasm;
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
;carwar.c:961: void WriteToVRAM8(i16 addr, u8 value)
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
;carwar.c:965: WaitForVDP();
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_WaitForVDP
;carwar.c:992: _endasm;
;	genInline
	
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
		 out (#0x98),a
	
		 ei
		
;	genLabel
;	genEndFunction
	pop	ix
	ret
_WriteToVRAM8_end::
;carwar.c:1099: void HMMC(u8 page, u8 dx, u8 dy, u8 nx, u8 ny, u16 ram)
;	genLabel
;	genFunction
;	---------------------------------
; Function HMMC
; ---------------------------------
_HMMC_start::
_HMMC:
	push	ix
	ld	ix,#0
	add	ix,sp
;carwar.c:1103: DX = dx;
;	genCast
;	AOP_STK for 
	ld	a,5(ix)
	ld	iy,#_DX
	ld	0(iy),a
	ld	1(iy),#0x00
;carwar.c:1104: DY = dy /*+ (page * 512)*/;
;	genCast
;	AOP_STK for 
	ld	a,6(ix)
	ld	iy,#_DY
	ld	0(iy),a
	ld	1(iy),#0x00
;carwar.c:1105: NX = nx;
;	genCast
;	AOP_STK for 
	ld	a,7(ix)
	ld	iy,#_NX
	ld	0(iy),a
	ld	1(iy),#0x00
;carwar.c:1106: NY = ny;
;	genCast
;	AOP_STK for 
	ld	a,8(ix)
	ld	iy,#_NY
	ld	0(iy),a
	ld	1(iy),#0x00
;carwar.c:1107: CLR = ((u8*)ram)[0];
;	genCast
;	AOP_STK for 
	ld	c,9(ix)
	ld	b,10(ix)
;	genPointerGet
	ld	a,(bc)
	ld	iy,#_CLR
	ld	0(iy),a
;carwar.c:1108: ARG = 0;
;	genAssign
	ld	iy,#_ARG
	ld	0(iy),#0x00
;carwar.c:1109: CMD = 0xF0;
;	genAssign
	ld	iy,#_CMD
	ld	0(iy),#0xF0
;carwar.c:1110: SetupHMMC(/*(int)&DX*/);
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
;	genLabel
;	genEndFunction
	pop	ix
	jp	_SetupHMMC
_HMMC_end::
;carwar.c:1130: void SetupHMMC(/*u16 address*/)
;	genLabel
;	genFunction
;	---------------------------------
; Function SetupHMMC
; ---------------------------------
_SetupHMMC_start::
_SetupHMMC:
;carwar.c:1134: WaitForVDP();
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_WaitForVDP
;carwar.c:1161: _endasm;
;	genInline
	
	
		 ;
		 ;
		 ld hl,(_DX)
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
	
		
;	genLabel
;	genEndFunction
	ret
_SetupHMMC_end::
	.area _CODE
	.area _CABS
