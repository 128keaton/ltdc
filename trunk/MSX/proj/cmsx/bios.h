#pragma once
#include "keyboard.h"

// Bios 
#define CALSLT 0x001C	// CALl SLoT
#define	GTSTCK 0x00D5	// GeT joySTiCK status
#define	GTTRIG 0x00D8	// GeT TRIGger button status
#define	CHGCLR 0x0062	// CHanGe CoLoR
#define	SNSMAT 0x0141	// ScaN Specified row in keyboar MATrix

// SYSTEM VARIABLES
#define FORCLR	#0xF3E9
#define BAKCLR	#0xF3EA
#define BDRCLR	#0xF3EB

// Hook
#define H_KEYI 0xFD9A 
#define H_TIMI 0xFD9F
#define H_CHPU 0xFDA4 
#define H_DSPC 0xFDA9 
//FDAE H.ERAC
//FDB3 H.DSPF
//FDB8 H.ERAF
//FDBD H.TOTE
//FDC2 H.CHGE
//FDC7 H.INIP
//FDCC H.KEYC
//FDD1 H.KYEA
//FDD6 H.NMI
//FDDB H.PINL
//FDE0 H.QINL
//FDE5 H.INLI
//FDEA H.ONGO
//FDEF H.DSKO
//FDF4 H.SETS
//FDF9 H.NAME
//FDFE H.KILL
//FE03 H.IPL
//FE08 H.COPY
//FE0D H.CMD
//FE12 H.DSKF
//FE17 H.DSKI
//FE1C H.ATTR
//FE21 H.LSET
//FE26 H.RSET
//FE2B H.FIEL
//FE30 H.MKI$
//FE35 H.MKS$
//FE3A H.MKD$
//FE3F H.CVI
//FE44 H.CVS
//FE49 H.CVD
//FE4E H.GETP
//FE53 H.SETF
//FE58 H.NOFO
//FE5D H.NULO
//FE62 H.NTFL
//FE67 H.MERG
//FE6C H.SAVE
//FE71 H.BINS
//FE76 H.BINL
//FE7B H.FILE
//FE80 H.DGET
//FE85 H.FILO
//FE8A H.INDS
//FE8F H.RSLF
//FE94 H.SAVD
//FE99 H.LOC
//FE9E H.LOF
//FEA3 H.EOF
//FEAB H.FPOS
//FEAD H.BAKU
//FEB2 H.PARD
//FEB7 H.NODE
//FEBC H.POSD
//FEC1 H.DEVN
//FEC6 H.GEND
//FECB H.RUNC
//FED0 H.CLEA
//FED5 H.LOPD
//FEDA H.STKE
//FEDE H.ISFL
//FEE4 H.OUTD
//FEE9 H.CRDO
//FEEE H.DSKC
//FEF3 H.DOGR
//FEF8 H.PRGE
//FEFD H.ERRP
//FF02 H.ERRF
//FF07 H.READ
//FF0C H.MAIN
//FF11 H.DIRD
//FF16 H.FINI
//FF1B H.FINE
//FF20 H.CRUN
//FF25 H.CRUS
//FF2A H.ISRE
//FF2F H.NTFN
//FF34 H.NOTR
//FF39 H.SNGF
//FF3E H.NEWS
//FF43 H.GONE
//FF48 H.CHRG
//FF4D H.RETU
//FF52 H.RMB
//FF57 H.RMB
//FF5C H.FINP
//FF61 H.TRMN
//FF66 H.FRME
//FF6B H.NTPL
//FF70 H.EVAL
//FF75 H.OKNO
//FF7A H.FING
//FF7F H.ISMI
//FF84 H.WIDTH
//FF89 H.LIST
//FF8E H.BUFL
//FF93 H.FRQI
//FF98 H.SCNE
//FF9D H.FRET
//FFA2 H.PTRG
//FFA7 H.PHYD
//FFAC H.FORM
//FFB1 H.ERRO
//FFB6 H.LPTO
//FFBB H.LPTS
//FFC0 H.SCRE
//FFC5 H.PLAY

// Hook
void SetHook(u16 hook, u16 function);

// Joystick
char Joystick(char n);
char Joytrig(char n);

// Keyboard
u8 GetKeyMatrixLine(u8 n);

// Screen
void SetScreenColor(u8 text, u8 back, u8 border);

// Files
#define FILE(str) "\"" str "\""
void LoadToVRAM(const char* filename, u16 x, u16 y);