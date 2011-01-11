
/*
 * pic18f8680.h - PIC18F8680 Device Library Header
 *
 * This file is part of the GNU PIC Library.
 *
 * January, 2004
 * The GNU PIC Library is maintained by,
 * 	Vangelis Rokas <vrokas@otenet.gr>
 *
 * $Id: pic18f8680.h 3765 2005-05-18 20:32:06Z tecodev $
 *
 */

#ifndef __PIC18F8680_H__
#define __PIC18F8680_H__

extern __sfr __at (0xf00) RXF0SIDH;
extern __sfr __at (0xf01) RXF0SIDL;
typedef union {
	struct {
		unsigned EID16:1;
		unsigned EID17:1;
		unsigned :1;
		unsigned EXIDE:1;
		unsigned :1;
		unsigned SID0:1;
		unsigned SID1:1;
		unsigned SID2:1;
	};
} __RXF0SIDLbits_t;

extern volatile __RXF0SIDLbits_t __at (0xf01) RXF0SIDLbits;

extern __sfr __at (0xf02) RXF0EIDH;
extern __sfr __at (0xf03) RXF0EIDL;
extern __sfr __at (0xf04) RXF1SIDH;
extern __sfr __at (0xf05) RXF1SIDL;
typedef union {
	struct {
		unsigned EID16:1;
		unsigned EID17:1;
		unsigned :1;
		unsigned EXIDE:1;
		unsigned :1;
		unsigned SID0:1;
		unsigned SID1:1;
		unsigned SID2:1;
	};
} __RXF1SIDLbits_t;

extern volatile __RXF1SIDLbits_t __at (0xf05) RXF1SIDLbits;

extern __sfr __at (0xf06) RXF1EIDH;
extern __sfr __at (0xf07) RXF1EIDL;
extern __sfr __at (0xf08) RXF2SIDH;
extern __sfr __at (0xf09) RXF2SIDL;
extern __sfr __at (0xf0a) RXF2EIDH;
extern __sfr __at (0xf0b) RXF2EIDL;
typedef union {
	struct {
		unsigned EID16:1;
		unsigned EID17:1;
		unsigned :1;
		unsigned EXIDE:1;
		unsigned :1;
		unsigned SID0:1;
		unsigned SID1:1;
		unsigned SID2:1;
	};
} __RXF2EIDLbits_t;

extern volatile __RXF2EIDLbits_t __at (0xf0b) RXF2EIDLbits;

extern __sfr __at (0xf0c) RXF3SIDH;
extern __sfr __at (0xf0d) RXF3SIDL;
typedef union {
	struct {
		unsigned EID16:1;
		unsigned EID17:1;
		unsigned :1;
		unsigned EXIDE:1;
		unsigned :1;
		unsigned SID0:1;
		unsigned SID1:1;
		unsigned SID2:1;
	};
} __RXF3SIDLbits_t;

extern volatile __RXF3SIDLbits_t __at (0xf0d) RXF3SIDLbits;

extern __sfr __at (0xf0e) RXF3EIDH;
extern __sfr __at (0xf0f) RXF3EIDL;
extern __sfr __at (0xf10) RXF4SIDH;
extern __sfr __at (0xf11) RXF4SIDL;
typedef union {
	struct {
		unsigned EID16:1;
		unsigned EID17:1;
		unsigned :1;
		unsigned EXIDE:1;
		unsigned :1;
		unsigned SID0:1;
		unsigned SID1:1;
		unsigned SID2:1;
	};
} __RXF4SIDLbits_t;

extern volatile __RXF4SIDLbits_t __at (0xf11) RXF4SIDLbits;

extern __sfr __at (0xf12) RXF4EIDH;
extern __sfr __at (0xf13) RXF4EIDL;
extern __sfr __at (0xf14) RXF5SIDH;
extern __sfr __at (0xf15) RXF5SIDL;
typedef union {
	struct {
		unsigned EID16:1;
		unsigned EID17:1;
		unsigned :1;
		unsigned EXIDE:1;
		unsigned :1;
		unsigned SID0:1;
		unsigned SID1:1;
		unsigned SID2:1;
	};
} __RXF5SIDLbits_t;

extern volatile __RXF5SIDLbits_t __at (0xf15) RXF5SIDLbits;

extern __sfr __at (0xf16) RXF5EIDH;
extern __sfr __at (0xf17) RXF5EIDL;
extern __sfr __at (0xf18) RXM0SIDH;
extern __sfr __at (0xf19) RXM0SIDL;
typedef union {
	struct {
		unsigned EID16:1;
		unsigned EID17:1;
		unsigned :1;
		unsigned :1;
		unsigned :1;
		unsigned SID0:1;
		unsigned SID1:1;
		unsigned SID2:1;
	};
} __RXM0SIDLbits_t;

extern volatile __RXM0SIDLbits_t __at (0xf19) RXM0SIDLbits;

extern __sfr __at (0xf1a) RXM0EIDH;
extern __sfr __at (0xf1b) RXM0EIDL;
extern __sfr __at (0xf1c) RXM1SIDH;
extern __sfr __at (0xf1d) RXM1SIDL;
typedef union {
	struct {
		unsigned EID16:1;
		unsigned EID17:1;
		unsigned :1;
		unsigned :1;
		unsigned :1;
		unsigned SID0:1;
		unsigned SID1:1;
		unsigned SID2:1;
	};
} __RXM1SIDLbits_t;

extern volatile __RXM1SIDLbits_t __at (0xf1d) RXM1SIDLbits;

extern __sfr __at (0xf1e) RXM1EIDH;
extern __sfr __at (0xf1f) RXM1EIDL;
extern __sfr __at (0xf20) TXB2CON;
typedef union {
	struct {
		unsigned TXPRI0:1;
		unsigned TXPRI1:1;
		unsigned :1;
		unsigned TXREQ:1;
		unsigned TXERR:1;
		unsigned TXLARB:1;
		unsigned TXABT:1;
		unsigned :1;
	};
} __TXB2CONbits_t;

extern volatile __TXB2CONbits_t __at (0xf20) TXB2CONbits;

extern __sfr __at (0xf21) TXB2SIDH;
extern __sfr __at (0xf22) TXB2SIDL;
typedef union {
	struct {
		unsigned EID16:1;
		unsigned EID17:1;
		unsigned :1;
		unsigned EXID:1;
		unsigned SRR:1;
		unsigned SID0:1;
		unsigned SID1:1;
		unsigned SID2:1;
	};
} __TXB2SIDLbits_t;

extern volatile __TXB2SIDLbits_t __at (0xf22) TXB2SIDLbits;

extern __sfr __at (0xf23) TXB2EIDH;
extern __sfr __at (0xf24) TXB2EIDL;
extern __sfr __at (0xf25) TXB2DLC;
typedef union {
	struct {
		unsigned DLC0:1;
		unsigned DLC1:1;
		unsigned DLC2:1;
		unsigned DLC3:1;
		unsigned :1;
		unsigned :1;
		unsigned RTR:1;
		unsigned :1;
	};
} __TXB2DLCbits_t;

extern volatile __TXB2DLCbits_t __at (0xf25) TXB2DLCbits;

extern __sfr __at (0xf26) TXB2D0;
extern __sfr __at (0xf27) TXB2D1;
extern __sfr __at (0xf28) TXB2D2;
extern __sfr __at (0xf29) TXB2D3;
extern __sfr __at (0xf2a) TXB2D4;
extern __sfr __at (0xf2b) TXB2D5;
extern __sfr __at (0xf2c) TXB2D6;
extern __sfr __at (0xf2d) TXB2D7;
extern __sfr __at (0xf2e) CANSTATRO3;
extern __sfr __at (0xf30) TXB1CON;
typedef union {
	struct {
		unsigned TXPRI0:1;
		unsigned TXPRI1:1;
		unsigned :1;
		unsigned TXREQ:1;
		unsigned TXERR:1;
		unsigned TXLARB:1;
		unsigned TXABT:1;
		unsigned :1;
	};
} __TXB1CONbits_t;

extern volatile __TXB1CONbits_t __at (0xf30) TXB1CONbits;

extern __sfr __at (0xf31) TXB1SIDH;
extern __sfr __at (0xf32) TXB1SIDL;
typedef union {
	struct {
		unsigned EID16:1;
		unsigned EID17:1;
		unsigned :1;
		unsigned EXID:1;
		unsigned SRR:1;
		unsigned SID0:1;
		unsigned SID1:1;
		unsigned SID2:1;
	};
} __TXB1SIDLbits_t;

extern volatile __TXB1SIDLbits_t __at (0xf32) TXB1SIDLbits;

extern __sfr __at (0xf33) TXB1EIDH;
extern __sfr __at (0xf34) TXB1EIDL;
extern __sfr __at (0xf35) TXB1DLC;
typedef union {
	struct {
		unsigned DLC0:1;
		unsigned DLC1:1;
		unsigned DLC2:1;
		unsigned DLC3:1;
		unsigned :1;
		unsigned :1;
		unsigned RTR:1;
		unsigned :1;
	};
} __TXB1DLCbits_t;

extern volatile __TXB1DLCbits_t __at (0xf35) TXB1DLCbits;

extern __sfr __at (0xf36) TXB1D0;
extern __sfr __at (0xf37) TXB1D1;
extern __sfr __at (0xf38) TXB1D2;
extern __sfr __at (0xf39) TXB1D3;
extern __sfr __at (0xf3a) TXB1D4;
extern __sfr __at (0xf3b) TXB1D5;
extern __sfr __at (0xf3c) TXB1D6;
extern __sfr __at (0xf3d) TXB1D7;
extern __sfr __at (0xf3e) CANSTATRO2;
extern __sfr __at (0xf40) TXB0CON;
typedef union {
	struct {
		unsigned TXPRI0:1;
		unsigned TXPRI1:1;
		unsigned :1;
		unsigned TXREQ:1;
		unsigned TXERR:1;
		unsigned TXLARB:1;
		unsigned TXABT:1;
		unsigned :1;
	};
} __TXB0CONbits_t;

extern volatile __TXB0CONbits_t __at (0xf40) TXB0CONbits;

extern __sfr __at (0xf41) TXB0SIDH;
extern __sfr __at (0xf42) TXB0SIDL;
extern __sfr __at (0xf43) TXB0EIDH;
extern __sfr __at (0xf44) TXB0EIDL;
extern __sfr __at (0xf45) TXB0DLC;
typedef union {
	struct {
		unsigned DLC0:1;
		unsigned DLC1:1;
		unsigned DLC2:1;
		unsigned DLC3:1;
		unsigned :1;
		unsigned :1;
		unsigned RTR:1;
		unsigned :1;
	};
} __TXB0DLCbits_t;

extern volatile __TXB0DLCbits_t __at (0xf45) TXB0DLCbits;

extern __sfr __at (0xf46) TXB0D0;
extern __sfr __at (0xf47) TXB0D1;
extern __sfr __at (0xf48) TXB0D2;
extern __sfr __at (0xf49) TXB0D3;
extern __sfr __at (0xf4a) TXB0D4;
extern __sfr __at (0xf4b) TXB0D5;
extern __sfr __at (0xf4c) TXB0D6;
extern __sfr __at (0xf4d) TXB0D7;
extern __sfr __at (0xf4e) CANSTATRO1;
extern __sfr __at (0xf50) RXB1CON;
typedef union {
	struct {
		unsigned :1;
		unsigned FILHIT1:1;
		unsigned FILHIT2:1;
		unsigned RXRTRRO:1;
		unsigned :1;
		unsigned RXM0:1;
		unsigned RXM1:1;
		unsigned RXFUL:1;
	};
} __RXB1CONbits_t;

extern volatile __RXB1CONbits_t __at (0xf50) RXB1CONbits;

extern __sfr __at (0xf51) RXB1SIDH;
extern __sfr __at (0xf52) RXB1SIDL;
typedef union {
	struct {
		unsigned EID16:1;
		unsigned EID17:1;
		unsigned :1;
		unsigned EXID:1;
		unsigned SRR:1;
		unsigned SID0:1;
		unsigned SID1:1;
		unsigned SID2:1;
	};
} __RXB1SIDLbits_t;

extern volatile __RXB1SIDLbits_t __at (0xf52) RXB1SIDLbits;

extern __sfr __at (0xf53) RXB1EIDH;
extern __sfr __at (0xf54) RXB1EIDL;
extern __sfr __at (0xf55) RXB1DLC;
typedef union {
	struct {
		unsigned DLC0:1;
		unsigned DLC1:1;
		unsigned DLC2:1;
		unsigned DLC3:1;
		unsigned RESB0:1;
		unsigned RESB1:1;
		unsigned RTR:1;
		unsigned :1;
	};
} __RXB1DLCbits_t;

extern volatile __RXB1DLCbits_t __at (0xf55) RXB1DLCbits;

extern __sfr __at (0xf56) RXB1D0;
extern __sfr __at (0xf57) RXB1D1;
extern __sfr __at (0xf58) RXB1D2;
extern __sfr __at (0xf59) RXB1D3;
extern __sfr __at (0xf5a) RXB1D4;
extern __sfr __at (0xf5b) RXB1D5;
extern __sfr __at (0xf5c) RXB1D6;
extern __sfr __at (0xf5d) RXB1D7;
extern __sfr __at (0xf5e) CANSTATRO0;
extern __sfr __at (0xf60) RXB0CON;
typedef union {
	struct {
		unsigned FILHIT0:1;
		unsigned JTOFF:1;
		unsigned RX0DBEN:1;
		unsigned RXRTRRO:1;
		unsigned :1;
		unsigned RXM0:1;
		unsigned RXM1:1;
		unsigned RXFUL:1;
	};
} __RXB0CONbits_t;

extern volatile __RXB0CONbits_t __at (0xf60) RXB0CONbits;

extern __sfr __at (0xf61) RXB0SIDH;
extern __sfr __at (0xf62) RXB0SIDL;
typedef union {
	struct {
		unsigned EID16:1;
		unsigned EID17:1;
		unsigned :1;
		unsigned EXID:1;
		unsigned SRR:1;
		unsigned SID0:1;
		unsigned SID1:1;
		unsigned SID2:1;
	};
} __RXB0SIDLbits_t;

extern volatile __RXB0SIDLbits_t __at (0xf62) RXB0SIDLbits;

extern __sfr __at (0xf63) RXB0EIDH;
extern __sfr __at (0xf64) RXB0EIDL;
extern __sfr __at (0xf65) RXB0DLC;
extern __sfr __at (0xf66) RXB0D0;
extern __sfr __at (0xf67) RXB0D1;
extern __sfr __at (0xf68) RXB0D2;
extern __sfr __at (0xf69) RXB0D3;
extern __sfr __at (0xf6a) RXB0D4;
extern __sfr __at (0xf6b) RXB0D5;
extern __sfr __at (0xf6c) RXB0D6;
extern __sfr __at (0xf6d) RXB0D7;
extern __sfr __at (0xf6e) CANSTAT;
typedef union {
	struct {
		unsigned :1;
		unsigned ICODE0:1;
		unsigned ICODE1:1;
		unsigned ICODE2:1;
		unsigned :1;
		unsigned OPMODE0:1;
		unsigned OPMODE1:1;
		unsigned OPMODE2:1;
	};
} __CANSTATbits_t;

extern volatile __CANSTATbits_t __at (0xf6e) CANSTATbits;

extern __sfr __at (0xf6f) CANCON;
typedef union {
	struct {
		unsigned :1;
		unsigned WIN0:1;
		unsigned WIN1:1;
		unsigned WIN2:1;
		unsigned ABAT:1;
		unsigned REQOP0:1;
		unsigned REQOP1:1;
		unsigned REQOP2:1;
	};
} __CANCONbits_t;

extern volatile __CANCONbits_t __at (0xf6f) CANCONbits;

extern __sfr __at (0xf70) BRGCON1;
typedef union {
	struct {
		unsigned BRP0:1;
		unsigned BRP1:1;
		unsigned BRP2:1;
		unsigned BRP3:1;
		unsigned BRP4:1;
		unsigned BRP5:1;
		unsigned SJW0:1;
		unsigned SJW1:1;
	};
} __BRGCON1bits_t;

extern volatile __BRGCON1bits_t __at (0xf70) BRGCON1bits;

extern __sfr __at (0xf71) BRGCON2;
typedef union {
	struct {
		unsigned PRSEG0:1;
		unsigned PRSEG1:1;
		unsigned PRSEG2:1;
		unsigned SEG1PH0:1;
		unsigned SEG1PH1:1;
		unsigned SEG1PH2:1;
		unsigned SAM:1;
		unsigned SEG2PHTS:1;
	};
} __BRGCON2bits_t;

extern volatile __BRGCON2bits_t __at (0xf71) BRGCON2bits;

extern __sfr __at (0xf72) BRGCON3;
typedef union {
	struct {
		unsigned SEG2PH0:1;
		unsigned SEG2PH1:1;
		unsigned SEG2PH2:1;
		unsigned :1;
		unsigned :1;
		unsigned :1;
		unsigned WAKFIL:1;
		unsigned :1;
	};
} __BRGCON3bits_t;

extern volatile __BRGCON3bits_t __at (0xf72) BRGCON3bits;

extern __sfr __at (0xf73) CIOCON;
typedef union {
	struct {
		unsigned :1;
		unsigned :1;
		unsigned :1;
		unsigned :1;
		unsigned CANCAP:1;
		unsigned ENDRHI:1;
		unsigned TX1EN:1;
		unsigned TX1SRC:1;
	};
} __CIOCONbits_t;

extern volatile __CIOCONbits_t __at (0xf73) CIOCONbits;

extern __sfr __at (0xf74) COMSTAT;
typedef union {
	struct {
		unsigned EWARN:1;
		unsigned RXWARN:1;
		unsigned TXWARN:1;
		unsigned RXBP:1;
		unsigned TXBP:1;
		unsigned TXBO:1;
		unsigned RX1OVFL:1;
		unsigned RX0OVFL:1;
	};
} __COMSTATbits_t;

extern volatile __COMSTATbits_t __at (0xf74) COMSTATbits;

extern __sfr __at (0xf75) RXERRCNT;
typedef union {
	struct {
		unsigned REC0:1;
		unsigned REC1:1;
		unsigned REC2:1;
		unsigned REC3:1;
		unsigned REC4:1;
		unsigned REC5:1;
		unsigned REC6:1;
		unsigned REC7:1;
	};
} __RXERRCNTbits_t;

extern volatile __RXERRCNTbits_t __at (0xf75) RXERRCNTbits;

extern __sfr __at (0xf76) TXERRCNT;
typedef union {
	struct {
		unsigned TEC0:1;
		unsigned TEC1:1;
		unsigned TEC2:1;
		unsigned TEC3:1;
		unsigned TEC4:1;
		unsigned TEC5:1;
		unsigned TEC6:1;
		unsigned TEC7:1;
	};
} __TXERRCNTbits_t;

extern volatile __TXERRCNTbits_t __at (0xf76) TXERRCNTbits;

extern __sfr __at (0xf80) PORTA;
typedef union {
	struct {
		unsigned RA0:1;
		unsigned RA1:1;
		unsigned RA2:1;
		unsigned RA3:1;
		unsigned RA4:1;
		unsigned RA5:1;
		unsigned RA6:1;
		unsigned :1;
	};

	struct {
		unsigned AN0:1;
		unsigned AN1:1;
		unsigned AN2:1;
		unsigned AN3:1;
		unsigned :1;
		unsigned AN4:1;
		unsigned OSC2:1;
		unsigned :1;
	};

	struct {
		unsigned :1;
		unsigned :1;
		unsigned VREFM:1;
		unsigned VREFP:1;
		unsigned T0CKI:1;
		unsigned SS:1;
		unsigned CLK0:1;
		unsigned :1;
	};

	struct {
		unsigned :1;
		unsigned :1;
		unsigned :1;
		unsigned :1;
		unsigned :1;
		unsigned LVDIN:1;
		unsigned :1;
		unsigned :1;
	};
} __PORTAbits_t;

extern volatile __PORTAbits_t __at (0xf80) PORTAbits;

extern __sfr __at (0xf81) PORTB;
typedef union {
	struct {
		unsigned RB0:1;
		unsigned RB1:1;
		unsigned RB2:1;
		unsigned RB3:1;
		unsigned RB4:1;
		unsigned RB5:1;
		unsigned RB6:1;
		unsigned RB7:1;
	};

	struct {
		unsigned INT0:1;
		unsigned INT1:1;
		unsigned INT2:1;
		unsigned INT3:1;
		unsigned :1;
		unsigned :1;
		unsigned :1;
		unsigned :1;
	};
} __PORTBbits_t;

extern volatile __PORTBbits_t __at (0xf81) PORTBbits;

extern __sfr __at (0xf82) PORTC;
typedef union {
	struct {
		unsigned RC0:1;
		unsigned RC1:1;
		unsigned RC2:1;
		unsigned RC3:1;
		unsigned RC4:1;
		unsigned RC5:1;
		unsigned RC6:1;
		unsigned RC7:1;
	};

	struct {
		unsigned T1OSO:1;
		unsigned T1OSI:1;
		unsigned :1;
		unsigned SCK:1;
		unsigned SDI:1;
		unsigned SDO:1;
		unsigned TX:1;
		unsigned RX:1;
	};

	struct {
		unsigned T1CKI:1;
		unsigned CCP2:1;
		unsigned CCP1:1;
		unsigned SCL:1;
		unsigned SDA:1;
		unsigned :1;
		unsigned CK:1;
		unsigned DT:1;
	};
} __PORTCbits_t;

extern volatile __PORTCbits_t __at (0xf82) PORTCbits;

extern __sfr __at (0xf83) PORTD;
typedef union {
	struct {
		unsigned RD0:1;
		unsigned RD1:1;
		unsigned RD2:1;
		unsigned RD3:1;
		unsigned RD4:1;
		unsigned RD5:1;
		unsigned RD6:1;
		unsigned RD7:1;
	};

	struct {
		unsigned AD0:1;
		unsigned AD1:1;
		unsigned AD2:1;
		unsigned AD3:1;
		unsigned AD4:1;
		unsigned AD5:1;
		unsigned AD6:1;
		unsigned AD7:1;
	};
} __PORTDbits_t;

extern volatile __PORTDbits_t __at (0xf83) PORTDbits;

extern __sfr __at (0xf84) PORTE;
typedef union {
	struct {
		unsigned RE0:1;
		unsigned RE1:1;
		unsigned RE2:1;
		unsigned RE3:1;
		unsigned RE4:1;
		unsigned RE5:1;
		unsigned RE6:1;
		unsigned RE7:1;
	};

	struct {
		unsigned ALE:1;
		unsigned OE:1;
		unsigned WRL:1;
		unsigned WRH:1;
		unsigned :1;
		unsigned :1;
		unsigned :1;
		unsigned CCP2:1;
	};

	struct {
		unsigned AN5:1;
		unsigned :1;
		unsigned :1;
		unsigned :1;
		unsigned :1;
		unsigned :1;
		unsigned :1;
		unsigned :1;
	};
} __PORTEbits_t;

extern volatile __PORTEbits_t __at (0xf84) PORTEbits;

extern __sfr __at (0xf85) PORTF;
typedef union {
	struct {
		unsigned RF0:1;
		unsigned RF1:1;
		unsigned RF2:1;
		unsigned RF3:1;
		unsigned RF4:1;
		unsigned RF5:1;
		unsigned RF6:1;
		unsigned RF7:1;
	};
} __PORTFbits_t;

extern volatile __PORTFbits_t __at (0xf85) PORTFbits;

extern __sfr __at (0xf86) PORTG;
typedef union {
	struct {
		unsigned RG0:1;
		unsigned RG1:1;
		unsigned RG2:1;
		unsigned RG3:1;
		unsigned RG4:1;
		unsigned :1;
		unsigned :1;
		unsigned :1;
	};
} __PORTGbits_t;

extern volatile __PORTGbits_t __at (0xf86) PORTGbits;

extern __sfr __at (0xf87) PORTH;
typedef union {
	struct {
		unsigned RH0:1;
		unsigned RH1:1;
		unsigned RH2:1;
		unsigned RH3:1;
		unsigned RH4:1;
		unsigned RH5:1;
		unsigned RH6:1;
		unsigned RH7:1;
	};
} __PORTHbits_t;

extern volatile __PORTHbits_t __at (0xf87) PORTHbits;

extern __sfr __at (0xf88) PORTJ;
typedef union {
	struct {
		unsigned RJ0:1;
		unsigned RJ1:1;
		unsigned RJ2:1;
		unsigned RJ3:1;
		unsigned RJ4:1;
		unsigned RJ5:1;
		unsigned RJ6:1;
		unsigned RJ7:1;
	};
} __PORTJbits_t;

extern volatile __PORTJbits_t __at (0xf88) PORTJbits;

extern __sfr __at (0xf89) LATA;
typedef union {
	struct {
		unsigned LATA0:1;
		unsigned LATA1:1;
		unsigned LATA2:1;
		unsigned LATA3:1;
		unsigned LATA4:1;
		unsigned LATA5:1;
		unsigned LATA6:1;
		unsigned :1;
	};
} __LATAbits_t;

extern volatile __LATAbits_t __at (0xf89) LATAbits;

extern __sfr __at (0xf8a) LATB;
typedef union {
	struct {
		unsigned LATB0:1;
		unsigned LATB1:1;
		unsigned LATB2:1;
		unsigned LATB3:1;
		unsigned LATB4:1;
		unsigned LATB5:1;
		unsigned LATB6:1;
		unsigned LATB7:1;
	};
} __LATBbits_t;

extern volatile __LATBbits_t __at (0xf8a) LATBbits;

extern __sfr __at (0xf8b) LATC;
typedef union {
	struct {
		unsigned LATC0:1;
		unsigned LATC1:1;
		unsigned LATC2:1;
		unsigned LATC3:1;
		unsigned LATC4:1;
		unsigned LATC5:1;
		unsigned LATC6:1;
		unsigned LATC7:1;
	};
} __LATCbits_t;

extern volatile __LATCbits_t __at (0xf8b) LATCbits;

extern __sfr __at (0xf8c) LATD;
typedef union {
	struct {
		unsigned LATD0:1;
		unsigned LATD1:1;
		unsigned LATD2:1;
		unsigned LATD3:1;
		unsigned LATD4:1;
		unsigned LATD5:1;
		unsigned LATD6:1;
		unsigned LATD7:1;
	};
} __LATDbits_t;

extern volatile __LATDbits_t __at (0xf8c) LATDbits;

extern __sfr __at (0xf8d) LATE;
typedef union {
	struct {
		unsigned LATE0:1;
		unsigned LATE1:1;
		unsigned LATE2:1;
		unsigned LATE3:1;
		unsigned LATE4:1;
		unsigned LATE5:1;
		unsigned LATE6:1;
		unsigned LATE7:1;
	};
} __LATEbits_t;

extern volatile __LATEbits_t __at (0xf8d) LATEbits;

extern __sfr __at (0xf8e) LATF;
typedef union {
	struct {
		unsigned LATF0:1;
		unsigned LATF1:1;
		unsigned LATF2:1;
		unsigned LATF3:1;
		unsigned LATF4:1;
		unsigned LATF5:1;
		unsigned LATF6:1;
		unsigned LATF7:1;
	};
} __LATFbits_t;

extern volatile __LATFbits_t __at (0xf8e) LATFbits;

extern __sfr __at (0xf8f) LATG;
typedef union {
	struct {
		unsigned LATG0:1;
		unsigned LATG1:1;
		unsigned LATG2:1;
		unsigned LATG3:1;
		unsigned LATG4:1;
		unsigned :1;
		unsigned :1;
		unsigned :1;
	};
} __LATGbits_t;

extern volatile __LATGbits_t __at (0xf8f) LATGbits;

extern __sfr __at (0xf90) LATH;
typedef union {
	struct {
		unsigned LATH0:1;
		unsigned LATH1:1;
		unsigned LATH2:1;
		unsigned LATH3:1;
		unsigned LATH4:1;
		unsigned LATH5:1;
		unsigned LATH6:1;
		unsigned LATH7:1;
	};
} __LATHbits_t;

extern volatile __LATHbits_t __at (0xf90) LATHbits;

extern __sfr __at (0xf91) LATJ;
typedef union {
	struct {
		unsigned LATJ0:1;
		unsigned LATJ1:1;
		unsigned LATJ2:1;
		unsigned LATJ3:1;
		unsigned LATJ4:1;
		unsigned LATJ5:1;
		unsigned LATJ6:1;
		unsigned LATJ7:1;
	};
} __LATJbits_t;

extern volatile __LATJbits_t __at (0xf91) LATJbits;

extern __sfr __at (0xf92) TRISA;
typedef union {
	struct {
		unsigned TRISA0:1;
		unsigned TRISA1:1;
		unsigned TRISA2:1;
		unsigned TRISA3:1;
		unsigned TRISA4:1;
		unsigned TRISA5:1;
		unsigned TRISA6:1;
		unsigned :1;
	};
} __TRISAbits_t;

extern volatile __TRISAbits_t __at (0xf92) TRISAbits;

extern __sfr __at (0xf93) TRISB;
typedef union {
	struct {
		unsigned TRISB0:1;
		unsigned TRISB1:1;
		unsigned TRISB2:1;
		unsigned TRISB3:1;
		unsigned TRISB4:1;
		unsigned TRISB5:1;
		unsigned TRISB6:1;
		unsigned TRISB7:1;
	};
} __TRISBbits_t;

extern volatile __TRISBbits_t __at (0xf93) TRISBbits;

extern __sfr __at (0xf94) TRISC;
typedef union {
	struct {
		unsigned TRISC0:1;
		unsigned TRISC1:1;
		unsigned TRISC2:1;
		unsigned TRISC3:1;
		unsigned TRISC4:1;
		unsigned TRISC5:1;
		unsigned TRISC6:1;
		unsigned TRISC7:1;
	};
} __TRISCbits_t;

extern volatile __TRISCbits_t __at (0xf94) TRISCbits;

extern __sfr __at (0xf95) TRISD;
typedef union {
	struct {
		unsigned TRISD0:1;
		unsigned TRISD1:1;
		unsigned TRISD2:1;
		unsigned TRISD3:1;
		unsigned TRISD4:1;
		unsigned TRISD5:1;
		unsigned TRISD6:1;
		unsigned TRISD7:1;
	};
} __TRISDbits_t;

extern volatile __TRISDbits_t __at (0xf95) TRISDbits;

extern __sfr __at (0xf96) TRISE;
typedef union {
	struct {
		unsigned TRISE0:1;
		unsigned TRISE1:1;
		unsigned TRISE2:1;
		unsigned TRISE3:1;
		unsigned TRISE4:1;
		unsigned TRISE5:1;
		unsigned TRISE6:1;
		unsigned TRISE7:1;
	};
} __TRISEbits_t;

extern volatile __TRISEbits_t __at (0xf96) TRISEbits;

extern __sfr __at (0xf97) TRISF;
typedef union {
	struct {
		unsigned TRISF0:1;
		unsigned TRISF1:1;
		unsigned TRISF2:1;
		unsigned TRISF3:1;
		unsigned TRISF4:1;
		unsigned TRISF5:1;
		unsigned TRISF6:1;
		unsigned TRISF7:1;
	};
} __TRISFbits_t;

extern volatile __TRISFbits_t __at (0xf97) TRISFbits;

extern __sfr __at (0xf98) TRISG;
typedef union {
	struct {
		unsigned TRISG0:1;
		unsigned TRISG1:1;
		unsigned TRISG2:1;
		unsigned TRISG3:1;
		unsigned TRISG4:1;
		unsigned :1;
		unsigned :1;
		unsigned :1;
	};
} __TRISGbits_t;

extern volatile __TRISGbits_t __at (0xf98) TRISGbits;

extern __sfr __at (0xf99) TRISH;
typedef union {
	struct {
		unsigned TRISH0:1;
		unsigned TRISH1:1;
		unsigned TRISH2:1;
		unsigned TRISH3:1;
		unsigned TRISH4:1;
		unsigned TRISH5:1;
		unsigned TRISH6:1;
		unsigned TRISH7:1;
	};
} __TRISHbits_t;

extern volatile __TRISHbits_t __at (0xf99) TRISHbits;

extern __sfr __at (0xf9a) TRISJ;
typedef union {
	struct {
		unsigned TRISJ0:1;
		unsigned TRISJ1:1;
		unsigned TRISJ2:1;
		unsigned TRISJ3:1;
		unsigned TRISJ4:1;
		unsigned TRISJ5:1;
		unsigned TRISJ6:1;
		unsigned TRISJ7:1;
	};
} __TRISJbits_t;

extern volatile __TRISJbits_t __at (0xf9a) TRISJbits;

extern __sfr __at (0xf9c) MEMCON;
typedef union {
	struct {
		unsigned WM0:1;
		unsigned WM1:1;
		unsigned :1;
		unsigned :1;
		unsigned WAIT0:1;
		unsigned WAIT1:1;
		unsigned :1;
		unsigned EBDIS:1;
	};
} __MEMCONbits_t;

extern volatile __MEMCONbits_t __at (0xf9c) MEMCONbits;

extern __sfr __at (0xf9d) PIE1;
typedef union {
	struct {
		unsigned TMR1IE:1;
		unsigned TMR2IE:1;
		unsigned CCP1IE:1;
		unsigned SSPIE:1;
		unsigned TXIE:1;
		unsigned RCIE:1;
		unsigned ADIE:1;
		unsigned PSPIE:1;
	};
} __PIE1bits_t;

extern volatile __PIE1bits_t __at (0xf9d) PIE1bits;

extern __sfr __at (0xf9e) PIR1;
typedef union {
	struct {
		unsigned TMR1IF:1;
		unsigned TMR2IF:1;
		unsigned CCP1IF:1;
		unsigned SSPIF:1;
		unsigned TXIF:1;
		unsigned RCIF:1;
		unsigned ADIF:1;
		unsigned PSPIF:1;
	};
} __PIR1bits_t;

extern volatile __PIR1bits_t __at (0xf9e) PIR1bits;

extern __sfr __at (0xf9f) IPR1;
typedef union {
	struct {
		unsigned TMR1IP:1;
		unsigned TMR2IP:1;
		unsigned CCP1IP:1;
		unsigned SSPIP:1;
		unsigned TXIP:1;
		unsigned RCIP:1;
		unsigned ADIP:1;
		unsigned PSPIP:1;
	};
} __IPR1bits_t;

extern volatile __IPR1bits_t __at (0xf9f) IPR1bits;

extern __sfr __at (0xfa0) PIE2;
typedef union {
	struct {
		unsigned CCP2IE:1;
		unsigned TMR3IE:1;
		unsigned LVDIE:1;
		unsigned BCLIE:1;
		unsigned EEIE:1;
		unsigned :1;
		unsigned CMIE:1;
		unsigned :1;
	};
} __PIE2bits_t;

extern volatile __PIE2bits_t __at (0xfa0) PIE2bits;

extern __sfr __at (0xfa1) PIR2;
typedef union {
	struct {
		unsigned CCP2IF:1;
		unsigned TMR3IF:1;
		unsigned LVDIF:1;
		unsigned BCLIF:1;
		unsigned EEIF:1;
		unsigned :1;
		unsigned CMIF:1;
		unsigned :1;
	};
} __PIR2bits_t;

extern volatile __PIR2bits_t __at (0xfa1) PIR2bits;

extern __sfr __at (0xfa2) IPR2;
typedef union {
	struct {
		unsigned CCP2IP:1;
		unsigned TMR3IP:1;
		unsigned LVDIP:1;
		unsigned BCLIP:1;
		unsigned EEIP:1;
		unsigned :1;
		unsigned CMIP:1;
		unsigned :1;
	};
} __IPR2bits_t;

extern volatile __IPR2bits_t __at (0xfa2) IPR2bits;

extern __sfr __at (0xfa3) PIE3;
typedef union {
	struct {
		unsigned RX0IE:1;
		unsigned RX1IE:1;
		unsigned TX0IE:1;
		unsigned TX1IE:1;
		unsigned TX2IE:1;
		unsigned ERRIE:1;
		unsigned WAKIE:1;
		unsigned IVRE:1;
	};
} __PIE3bits_t;

extern volatile __PIE3bits_t __at (0xfa3) PIE3bits;

extern __sfr __at (0xfa4) PIR3;
typedef union {
	struct {
		unsigned RX0IF:1;
		unsigned RX1IF:1;
		unsigned TX0IF:1;
		unsigned TX1IF:1;
		unsigned TX2IF:1;
		unsigned ERRIF:1;
		unsigned WAKIF:1;
		unsigned IVRF:1;
	};
} __PIR3bits_t;

extern volatile __PIR3bits_t __at (0xfa4) PIR3bits;

extern __sfr __at (0xfa5) IPR3;
typedef union {
	struct {
		unsigned RX0IP:1;
		unsigned RX1IP:1;
		unsigned TX0IP:1;
		unsigned TX1IP:1;
		unsigned TX2IP:1;
		unsigned ERRIP:1;
		unsigned WAKIP:1;
		unsigned IVRP:1;
	};
} __IPR3bits_t;

extern volatile __IPR3bits_t __at (0xfa5) IPR3bits;

extern __sfr __at (0xfa6) EECON1;
typedef union {
	struct {
		unsigned RD:1;
		unsigned WR:1;
		unsigned WREN:1;
		unsigned WRERR:1;
		unsigned FREE:1;
		unsigned :1;
		unsigned CFGS:1;
		unsigned EEPGD:1;
	};
} __EECON1bits_t;

extern volatile __EECON1bits_t __at (0xfa6) EECON1bits;

extern __sfr __at (0xfa7) EECON2;
extern __sfr __at (0xfa8) EEDATA;
extern __sfr __at (0xfa9) EEADR;
extern __sfr __at (0xfaa) EEADRH;
extern __sfr __at (0xfab) RCSTA;
typedef union {
	struct {
		unsigned RX9D:1;
		unsigned OERR:1;
		unsigned FERR:1;
		unsigned ADDEN:1;
		unsigned CREN:1;
		unsigned SREN:1;
		unsigned RX9:1;
		unsigned SPEN:1;
	};
} __RCSTAbits_t;

extern volatile __RCSTAbits_t __at (0xfab) RCSTAbits;

extern __sfr __at (0xfac) TXSTA;
typedef union {
	struct {
		unsigned TX9D:1;
		unsigned TRMT:1;
		unsigned BRGH:1;
		unsigned :1;
		unsigned SYNC:1;
		unsigned TXEN:1;
		unsigned TX9:1;
		unsigned CSRC:1;
	};
} __TXSTAbits_t;

extern volatile __TXSTAbits_t __at (0xfac) TXSTAbits;

extern __sfr __at (0xfad) TXREG;
extern __sfr __at (0xfae) RCREG;
extern __sfr __at (0xfaf) SPBRG;
extern __sfr __at (0xfb0) PSPCON;
typedef union {
	struct {
		unsigned :1;
		unsigned :1;
		unsigned :1;
		unsigned :1;
		unsigned PSPMODE:1;
		unsigned IBOV:1;
		unsigned OBF:1;
		unsigned IBF:1;
	};
} __PSPCONbits_t;

extern volatile __PSPCONbits_t __at (0xfb0) PSPCONbits;

extern __sfr __at (0xfb1) T3CON;
typedef union {
	struct {
		unsigned TMR3ON:1;
		unsigned TMR3CS:1;
		unsigned T3SYNC:1;
		unsigned T3CCP1:1;
		unsigned T3CKPS0:1;
		unsigned T3CKPS1:1;
		unsigned T3CCP2:1;
		unsigned RD16:1;
	};
} __T3CONbits_t;

extern volatile __T3CONbits_t __at (0xfb1) T3CONbits;

extern __sfr __at (0xfb2) TMR3L;
extern __sfr __at (0xfb3) TMR3H;
extern __sfr __at (0xfb4) CMCON;
typedef union {
	struct {
		unsigned CM0:1;
		unsigned CM1:1;
		unsigned CM2:1;
		unsigned CIS:1;
		unsigned C1INV:1;
		unsigned C2INV:1;
		unsigned C1OUT:1;
		unsigned C2OUT:1;
	};
} __CMCONbits_t;

extern volatile __CMCONbits_t __at (0xfb4) CMCONbits;

extern __sfr __at (0xfb5) CVRCON;
typedef union {
	struct {
		unsigned CVR0:1;
		unsigned CVR1:1;
		unsigned CVR2:1;
		unsigned CVR3:1;
		unsigned CVREF:1;
		unsigned CVRR:1;
		unsigned CVROE:1;
		unsigned CVREN:1;
	};
} __CVRCONbits_t;

extern volatile __CVRCONbits_t __at (0xfb5) CVRCONbits;

extern __sfr __at (0xfb6) ECCPAS;
typedef union {
	struct {
		unsigned PSSBD0:1;
		unsigned PSSBD1:1;
		unsigned PSSAC0:1;
		unsigned PSSAC1:1;
		unsigned ECCPAS0:1;
		unsigned ECCPAS1:1;
		unsigned ECCPAS2:1;
		unsigned ECCPASE:1;
	};
} __ECCPASbits_t;

extern volatile __ECCPASbits_t __at (0xfb6) ECCPASbits;

extern __sfr __at (0xfb7) ECCP1DEL;
typedef union {
	struct {
		unsigned EPDC0:1;
		unsigned EPDC1:1;
		unsigned EPDC2:1;
		unsigned EPDC3:1;
		unsigned EPDC4:1;
		unsigned EPDC5:1;
		unsigned EPDC6:1;
		unsigned EPDC7:1;
	};
} __ECCP1DELbits_t;

extern volatile __ECCP1DELbits_t __at (0xfb7) ECCP1DELbits;

extern __sfr __at (0xfba) ECCP1CON;
typedef union {
	struct {
		unsigned ECCP1M0:1;
		unsigned ECCP1M1:1;
		unsigned ECCP1M2:1;
		unsigned ECCP1M3:1;
		unsigned EDC1B0:1;
		unsigned EDC1B1:1;
		unsigned EPWM1M0:1;
		unsigned EPWM1M1:1;
	};
} __ECCP1CONbits_t;

extern volatile __ECCP1CONbits_t __at (0xfba) ECCP1CONbits;

extern __sfr __at (0xfba) CCP2CON;
typedef union {
	struct {
		unsigned CCP2M0:1;
		unsigned CCP2M1:1;
		unsigned CCP2M2:1;
		unsigned CCP2M3:1;
		unsigned DCCP2Y:1;
		unsigned DCCP2X:1;
		unsigned :1;
		unsigned :1;
	};
} __CCP2CONbits_t;

extern volatile __CCP2CONbits_t __at (0xfba) CCP2CONbits;

extern __sfr __at (0xfbb) ECCPR1L;
extern __sfr __at (0xfbb) CCPR2L;
extern __sfr __at (0xfbc) ECCPR1H;
extern __sfr __at (0xfbc) CCPR2H;
extern __sfr __at (0xfc0) ADCON2;
typedef union {
	struct {
		unsigned ADCS0:1;
		unsigned ADCS1:1;
		unsigned ADCS2:1;
		unsigned :1;
		unsigned :1;
		unsigned :1;
		unsigned :1;
		unsigned ADFM:1;
	};
} __ADCON2bits_t;

extern volatile __ADCON2bits_t __at (0xfc0) ADCON2bits;

extern __sfr __at (0xfc1) ADCON1;
typedef union {
	struct {
		unsigned PCFG0:1;
		unsigned PCFG1:1;
		unsigned PCFG2:1;
		unsigned PCFG3:1;
		unsigned VCFG0:1;
		unsigned VCFG1:1;
		unsigned :1;
		unsigned :1;
	};
} __ADCON1bits_t;

extern volatile __ADCON1bits_t __at (0xfc1) ADCON1bits;

extern __sfr __at (0xfc2) ADCON0;
typedef union {
	struct {
		unsigned ADON:1;
		unsigned GO:1;
		unsigned CHS0:1;
		unsigned CHS1:1;
		unsigned CHS2:1;
		unsigned CHS3:1;
		unsigned :1;
		unsigned :1;
	};
} __ADCON0bits_t;

extern volatile __ADCON0bits_t __at (0xfc2) ADCON0bits;

extern __sfr __at (0xfc3) ADRESL;
extern __sfr __at (0xfc4) ADRESH;
extern __sfr __at (0xfc5) SSPCON2;
typedef union {
	struct {
		unsigned SEN:1;
		unsigned RSEN:1;
		unsigned PEN:1;
		unsigned RCEN:1;
		unsigned ACKEN:1;
		unsigned ACKDT:1;
		unsigned ACKSTAT:1;
		unsigned GCEN:1;
	};
} __SSPCON2bits_t;

extern volatile __SSPCON2bits_t __at (0xfc5) SSPCON2bits;

extern __sfr __at (0xfc6) SSPCON1;
typedef union {
	struct {
		unsigned SSPM0:1;
		unsigned SSPM1:1;
		unsigned SSPM2:1;
		unsigned SSPM3:1;
		unsigned CKP:1;
		unsigned SSPEN:1;
		unsigned SSPOV:1;
		unsigned WCOL:1;
	};
} __SSPCON1bits_t;

extern volatile __SSPCON1bits_t __at (0xfc6) SSPCON1bits;

extern __sfr __at (0xfc7) SSPSTAT;
typedef union {
	struct {
		unsigned BF:1;
		unsigned UA:1;
		unsigned R_W:1;
		unsigned S:1;
		unsigned P:1;
		unsigned D_A:1;
		unsigned CKE:1;
		unsigned SMP:1;
	};
} __SSPSTATbits_t;

extern volatile __SSPSTATbits_t __at (0xfc7) SSPSTATbits;

extern __sfr __at (0xfc8) SSPADD;
extern __sfr __at (0xfc9) SSPBUF;
extern __sfr __at (0xfca) T2CON;
typedef union {
	struct {
		unsigned T2CKPS0:1;
		unsigned T2CKPS1:1;
		unsigned TMR2ON:1;
		unsigned TOUTPS0:1;
		unsigned TOUTPS1:1;
		unsigned TOUTPS2:1;
		unsigned TOUTPS3:1;
		unsigned :1;
	};
} __T2CONbits_t;

extern volatile __T2CONbits_t __at (0xfca) T2CONbits;

extern __sfr __at (0xfcb) PR2;
extern __sfr __at (0xfcc) TMR2;
extern __sfr __at (0xfcd) T1CON;
typedef union {
	struct {
		unsigned TMR1ON:1;
		unsigned TMR1CS:1;
		unsigned NOT_T1SYNC:1;
		unsigned T1OSCEN:1;
		unsigned T1CKPS0:1;
		unsigned T1CKPS1:1;
		unsigned :1;
		unsigned RD16:1;
	};
} __T1CONbits_t;

extern volatile __T1CONbits_t __at (0xfcd) T1CONbits;

extern __sfr __at (0xfce) TMR1L;
extern __sfr __at (0xfcf) TMR1H;
extern __sfr __at (0xfd0) RCON;
typedef union {
	struct {
		unsigned BOR:1;
		unsigned POR:1;
		unsigned PD:1;
		unsigned TO:1;
		unsigned RI:1;
		unsigned :1;
		unsigned :1;
		unsigned IPEN:1;
	};
} __RCONbits_t;

extern volatile __RCONbits_t __at (0xfd0) RCONbits;

extern __sfr __at (0xfd1) WDTCON;
typedef union {
	struct {
		unsigned SWDTEN:1;
		unsigned :1;
		unsigned :1;
		unsigned :1;
		unsigned :1;
		unsigned :1;
		unsigned :1;
		unsigned :1;
	};

	struct {
		unsigned SWDTE:1;
		unsigned :1;
		unsigned :1;
		unsigned :1;
		unsigned :1;
		unsigned :1;
		unsigned :1;
		unsigned :1;
	};
} __WDTCONbits_t;

extern volatile __WDTCONbits_t __at (0xfd1) WDTCONbits;

extern __sfr __at (0xfd2) LVDCON;
typedef union {
	struct {
		unsigned LVDL0:1;
		unsigned LVDL1:1;
		unsigned LVDL2:1;
		unsigned LVDL3:1;
		unsigned LVDEN:1;
		unsigned VRST:1;
		unsigned :1;
		unsigned :1;
	};

	struct {
		unsigned LVV0:1;
		unsigned LVV1:1;
		unsigned LVV2:1;
		unsigned LVV3:1;
		unsigned :1;
		unsigned BGST:1;
		unsigned :1;
		unsigned :1;
	};
} __LVDCONbits_t;

extern volatile __LVDCONbits_t __at (0xfd2) LVDCONbits;

extern __sfr __at (0xfd3) OSCCON;
typedef union {
	struct {
		unsigned SCS:1;
		unsigned :1;
		unsigned :1;
		unsigned :1;
		unsigned :1;
		unsigned :1;
		unsigned :1;
		unsigned :1;
	};
} __OSCCONbits_t;

extern volatile __OSCCONbits_t __at (0xfd3) OSCCONbits;

extern __sfr __at (0xfd5) T0CON;
extern __sfr __at (0xfd6) TMR0L;
extern __sfr __at (0xfd7) TMR0H;
extern __sfr __at (0xfd8) STATUS;
typedef union {
	struct {
		unsigned C:1;
		unsigned DC:1;
		unsigned Z:1;
		unsigned OV:1;
		unsigned N:1;
		unsigned :1;
		unsigned :1;
		unsigned :1;
	};
} __STATUSbits_t;

extern volatile __STATUSbits_t __at (0xfd8) STATUSbits;

extern __sfr __at (0xfd9) FSR2L;
extern __sfr __at (0xfda) FSR2H;
extern __sfr __at (0xfdb) PLUSW2;
extern __sfr __at (0xfdc) PREINC2;
extern __sfr __at (0xfdd) POSTDEC2;
extern __sfr __at (0xfde) POSTINC2;
extern __sfr __at (0xfdf) INDF2;
extern __sfr __at (0xfe0) BSR;
extern __sfr __at (0xfe1) FSR1L;
extern __sfr __at (0xfe2) FSR1H;
extern __sfr __at (0xfe3) PLUSW1;
extern __sfr __at (0xfe4) PREINC1;
extern __sfr __at (0xfe5) POSTDEC1;
extern __sfr __at (0xfe6) POSTINC1;
extern __sfr __at (0xfe7) INDF1;
extern __sfr __at (0xfe8) WREG;
extern __sfr __at (0xfe9) FSR0L;
extern __sfr __at (0xfea) FSR0H;
extern __sfr __at (0xfeb) PLUSW0;
extern __sfr __at (0xfec) PREINC0;
extern __sfr __at (0xfed) POSTDEC0;
extern __sfr __at (0xfee) POSTINC0;
extern __sfr __at (0xfef) INDF0;
extern __sfr __at (0xff0) INTCON3;
typedef union {
	struct {
		unsigned INT1F:1;
		unsigned INT2F:1;
		unsigned INT3F:1;
		unsigned INT1E:1;
		unsigned INT2E:1;
		unsigned INT3E:1;
		unsigned INT1P:1;
		unsigned INT2P:1;
	};

	struct {
		unsigned INT1IF:1;
		unsigned INT2IF:1;
		unsigned INT3IF:1;
		unsigned INT1IE:1;
		unsigned INT2IE:1;
		unsigned INT3IE:1;
		unsigned INT1IP:1;
		unsigned INT2IP:1;
	};
} __INTCON3bits_t;

extern volatile __INTCON3bits_t __at (0xff0) INTCON3bits;

extern __sfr __at (0xff1) INTCON2;
typedef union {
	struct {
		unsigned RBIP:1;
		unsigned INT3P:1;
		unsigned T0IP:1;
		unsigned INTEDG3:1;
		unsigned INTEDG2:1;
		unsigned INTEDG1:1;
		unsigned INTEDG0:1;
		unsigned RBPU:1;
	};
} __INTCON2bits_t;

extern volatile __INTCON2bits_t __at (0xff1) INTCON2bits;

extern __sfr __at (0xff2) INTCON;
typedef union {
	struct {
		unsigned RBIF:1;
		unsigned INT0F:1;
		unsigned T0IF:1;
		unsigned RBIE:1;
		unsigned INT0E:1;
		unsigned T0IE:1;
		unsigned PEIE:1;
		unsigned GIE:1;
	};
} __INTCONbits_t;

extern volatile __INTCONbits_t __at (0xff2) INTCONbits;

extern __sfr __at (0xff3) PRODL;
extern __sfr __at (0xff4) PRODH;
extern __sfr __at (0xff5) TABLAT;
extern __sfr __at (0xff6) TBLPTRL;
extern __sfr __at (0xff7) TBLPTRH;
extern __sfr __at (0xff8) TBLPTRU;
extern __sfr __at (0xff9) PCL;
extern __sfr __at (0xffa) PCLATH;
extern __sfr __at (0xffb) PCLATU;
extern __sfr __at (0xffc) STKPTR;
typedef union {
	struct {
		unsigned STKPTR0:1;
		unsigned STKPTR1:1;
		unsigned STKPTR2:1;
		unsigned STKPTR3:1;
		unsigned STKPTR4:1;
		unsigned :1;
		unsigned STKUNF:1;
		unsigned STKFUL:1;
	};
} __STKPTRbits_t;

extern volatile __STKPTRbits_t __at (0xffc) STKPTRbits;

extern __sfr __at (0xffd) TOSL;
extern __sfr __at (0xffe) TOSH;
extern __sfr __at (0xfff) TOSU;


/* Configuration registers locations */
#define __CONFIG1H	0x300001
#define __CONFIG2L	0x300002
#define __CONFIG2H	0x300003
#define __CONFIG3L	0x300004
#define __CONFIG3H	0x300005
#define __CONFIG4L	0x300006
#define __CONFIG5L	0x300008
#define __CONFIG5H	0x300009
#define __CONFIG6L	0x30000A
#define __CONFIG6H	0x30000B
#define __CONFIG7L	0x30000C
#define __CONFIG7H	0x30000D



/* Oscillator 1H options */
#define _OSC_RC_CLKOUT_1H	0xFF	/* RC-CLKOUT on RA6 */
#define _OSC_HS_SOFTWARE_1H	0xFE	/* HS-Software enabled PLL */
#define _OSC_EC_CLKOUT_Software_nabld_PLL_1H	0xFD	/* EC-CLKOUT on RA6,Software_enabled_PLL */
#define _OSC_EC_CLKOUT_PLL_enabld_frq_4xFosc1_1H	0xFC	/* EC-CLKOUT on RA6,PLL_enabled_freq_4xFosc1 */
#define _OSC_EXT_Port_on_RA6_1H	0xF7	/* EXT RC-Port_on_RA6 */
#define _OSC_HS_PLL_1H	0xF6	/* HS-PLL enabled freq=4xFosc1 */
#define _OSC_EC_PORT_1H	0xF5	/* EC-Port on RA6 */
#define _OSC_EC_CLKOUT__1H	0xF4	/* EC-CLKOUT on RA6 */
#define _OSC_EXT_CLKOUT_on_RA6_1H	0xF3	/* EXT RC-CLKOUT_on_RA6 */
#define _OSC_HS_1H	0xF2	/* HS */
#define _OSC_XT_1H	0xF1	/* XT */
#define _OSC_LP_1H	0xF0	/* LP */

/* Low Power System Clock Timer1 Enable 1H options */
#define _OSCSEN_ON_1H	0xDF	/* Enabled */
#define _OSCSEN_OFF_1H	0xFF	/* Disabled */

/* Power Up Timer 2L options */
#define _PUT_OFF_2L	0xFF	/* Disabled */
#define _PUT_ON_2L	0xFE	/* Enabled */

/* Brown Out Detect 2L options */
#define _BODEN_ON_2L	0xFF	/* Enabled */
#define _BODEN_OFF_2L	0xFD	/* Disabled */

/* Brown Out Voltage 2L options */
#define _BODENV_2_0V_2L	0xFF	/* 2.0V */
#define _BODENV_2_7V_2L	0xFB	/* 2.7V */
#define _BODENV_4_2V_2L	0xF7	/* 4.2V */
#define _BODENV_4_5V_2L	0xF3	/* 4.5V */

/* Watchdog Timer 2H options */
#define _WDT_ON_2H	0xFF	/* Enabled */
#define _WDT_DISABLED_CONTROLLED_2H	0xFE	/* Disabled-Controlled by SWDTEN bit */

/* Watchdog Postscaler 2H options */
#define _WDTPS_1_32768_2H	0xFF	/* 1:32768 */
#define _WDTPS_1_16384_2H	0xFD	/* 1:16384 */
#define _WDTPS_1_8192_2H	0xFB	/* 1:8192 */
#define _WDTPS_1_4096_2H	0xF9	/* 1:4096 */
#define _WDTPS_1_2048_2H	0xF7	/* 1:2048 */
#define _WDTPS_1_1024_2H	0xF5	/* 1:1024 */
#define _WDTPS_1_512_2H	0xF3	/* 1:512 */
#define _WDTPS_1_256_2H	0xF1	/* 1:256 */
#define _WDTPS_1_128_2H	0xEF	/* 1:128 */
#define _WDTPS_1_64_2H	0xED	/* 1:64 */
#define _WDTPS_1_32_2H	0xEB	/* 1:32 */
#define _WDTPS_1_16_2H	0xE9	/* 1:16 */
#define _WDTPS_1_8_2H	0xE7	/* 1:8 */
#define _WDTPS_1_4_2H	0xE5	/* 1:4 */
#define _WDTPS_1_2_2H	0xE3	/* 1:2 */
#define _WDTPS_1_1_2H	0xE1	/* 1:1 */

/* Processor Mode 3L options */
#define _PMODE_MICROCONTROLLER_3L	0xFF	/* Microcontroller */
#define _PMODE_MICROPROCESSOR__3L	0xFE	/* Microprocessor */
#define _PMODE_MICROPROCESSOR_w_Boot_3L	0xFD	/* Microprocessor w_Boot */
#define _PMODE_EXT_3L	0xFC	/* Ext Microcontroller */

/* External Bus Wait 3L options */
#define _WAIT_OFF_3L	0xFF	/* Disabled */
#define _WAIT_ON_3L	0x7F	/* Enabled */

/* CCP2 Mux 3H options */
#define _CCP2MUX_RC1_3H	0xFF	/* RC1 */
#define _CCP2MUX_RB3_3H	0xFE	/* RB3 */

/* ECCP Mux 3H options */
#define _ECCPMX_ECCP1_E6E3_3H	0xFF	/* ECCP1 and ECCP6 are muxed onto RE6 through RE3 */
#define _ECCPMX_ECCP1_H7H4_3H	0xFD	/* ECCP1 and ECCP6 are muxed onto RH7 through RH4 */

/* MCLR enable 3H options */
#define _MCLRE_MCLR_Enabled_RE3_Disabled_3H	0xFF	/* MCLR Enabled_RE3_Disabled */
#define _MCLRE_MCLR_Disabled_RE3_Enabled_3H	0x7F	/* MCLR Disabled__RE3_Enabled */

/* Stack Overflow Reset 4L options */
#define _STVR_ON_4L	0xFF	/* Enabled */
#define _STVR_OFF_4L	0xFE	/* Disabled */

/* Low Voltage Program 4L options */
#define _LVP_ON_4L	0xFF	/* Enabled */
#define _LVP_OFF_4L	0xFB	/* Disabled */

/* Background Debug 4L options */
#define _BACKBUG_OFF_4L	0xFF	/* Disabled */
#define _BACKBUG_ON_4L	0x7F	/* Enabled */

/* Code Protect 000800-0003FFF 5L options */
#define _CP_0_OFF_5L	0xFF	/* Disabled */
#define _CP_0_ON_5L	0xFE	/* Enabled */

/* Code Protect 0004000-007FFF 5L options */
#define _CP_1_OFF_5L	0xFF	/* Disabled */
#define _CP_1_ON_5L	0xFD	/* Enabled */

/* Code Protect 008000-00BFFF 5L options */
#define _CP_2_OFF_5L	0xFF	/* Disabled */
#define _CP_2_ON_5L	0xFB	/* Enabled */

/* Code Protect 00C000F-00FFFF 5L options */
#define _CP_3_OFF_5L	0xFF	/* Disabled */
#define _CP_3_ON_5L	0xF7	/* Enabled */

/* Data EE Read Protect 5H options */
#define _CPD_OFF_5H	0xFF	/* Disabled */
#define _CPD_ON_5H	0x7F	/* Enabled */

/* Code Protect Boot 5H options */
#define _CPB_OFF_5H	0xFF	/* Disabled */
#define _CPB_ON_5H	0xBF	/* Enabled */

/* Table Write Protect 00800-003FFF 6L options */
#define _WRT_0_OFF_6L	0xFF	/* Disabled */
#define _WRT_0_ON_6L	0xFE	/* Enabled */

/* Table Write Protect 004000-007FFF 6L options */
#define _WRT_1_OFF_6L	0xFF	/* Disabled */
#define _WRT_1_ON_6L	0xFD	/* Enabled */

/* Table Write Protect 08000-0BFFF 6L options */
#define _WRT_2_OFF_6L	0xFF	/* Disabled */
#define _WRT_2_ON_6L	0xFB	/* Enabled */

/* Table Write Protect 0C000-0FFFF 6L options */
#define _WRT_3_OFF_6L	0xFF	/* Disabled */
#define _WRT_3_ON_6L	0xF7	/* Enabled */

/* Data EE Write Protect 6H options */
#define _WRTD_OFF_6H	0xFF	/* Disabled */
#define _WRTD_ON_6H	0x7F	/* Enabled */

/* Table Write Protect Boot 6H options */
#define _WRTB_OFF_6H	0xFF	/* Disabled */
#define _WRTB_ON_6H	0xBF	/* Enabled */

/* Config. Write Protect 6H options */
#define _WRTC_OFF_6H	0xFF	/* Disabled */
#define _WRTC_ON_6H	0xDF	/* Enabled */

/* Table Read Protect 00800-003FFF 7L options */
#define _EBTR_0_OFF_7L	0xFF	/* Disabled */
#define _EBTR_0_ON_7L	0xFE	/* Enabled */

/* Table Read Protect 004000-07FFF 7L options */
#define _EBTR_1_OFF_7L	0xFF	/* Disabled */
#define _EBTR_1_ON_7L	0xFD	/* Enabled */

/* Table Read Protect 08000-0BFFF 7L options */
#define _EBTR_2_OFF_7L	0xFF	/* Disabled */
#define _EBTR_2_ON_7L	0xFB	/* Enabled */

/* Table Read Protect 0C000-0FFFF 7L options */
#define _EBTR_3_OFF_7L	0xFF	/* Disabled */
#define _EBTR_3_ON_7L	0xF7	/* Enabled */

/* Table Read Protect Boot 7H options */
#define _EBTRB_OFF_7H	0xFF	/* Disabled */
#define _EBTRB_ON_7H	0xBF	/* Enabled */


/* Device ID locations */
#define __IDLOC0	0x200000
#define __IDLOC1	0x200001
#define __IDLOC2	0x200002
#define __IDLOC3	0x200003
#define __IDLOC4	0x200004
#define __IDLOC5	0x200005
#define __IDLOC6	0x200006
#define __IDLOC7	0x200007


#endif
