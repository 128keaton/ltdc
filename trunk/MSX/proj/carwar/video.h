#pragma sdcc_hash +

//----------------------------------------
// D E F I N E S

#define VDP_DATA #0x98   // VDP data port (VRAM read/write)
#define VDP_ADDR #0x99   // VDP address (write only)
#define VDP_STAT #0x99   // VDP status (read only)
#define VDP_PALT #0x9A   // VDP palette latch (write only)
#define VDP_REGS #0x9B   // VDP register access (write only)

#define PSG_REGS #0xA0   // PSG register write port
#define PSG_DATA #0xA1   // PSG value write port
#define PSG_STAT #0xA2   // PSG value read port

#define PSL_STAT #0xA8   // slot status
#define KBD_STAT #0xA9   // keyboard status
#define GIO_REGS #0xAA   // General IO Register
#define PPI_REGS #0xAB   // PPI register

#define RTC_ADDR #0xB4   // RTC address
#define RTC_DATA #0xB5   // RTC data

#define RG0SAV  #0xF3DF
#define RG1SAV  #0xF3E0
#define RG2SAV  #0xF3E1
#define RG3SAV  #0xF3E2
#define RG4SAV  #0xF3E3
#define RG5SAV  #0xF3E4
#define RG6SAV  #0xF3E5
#define RG7SAV  #0xF3E6
#define RG8SAV  #0xF3E7
#define RG9SAV  #0xF3E8

#define VDP_SX	#32
#define VDP_SX8	#33
#define VDP_SY	#34
#define VDP_SY8	#35
#define VDP_DX	#36
#define VDP_DX8	#37
#define VDP_DY	#38
#define VDP_DY8	#39
#define VDP_NX	#40
#define VDP_NX8	#41
#define VDP_NY	#42
#define VDP_NY8	#43
#define VDP_CLR	#44
#define VDP_ARG	#45
#define VDP_CMD	#46

#define VDP_CMD_HMMC	0xF0
#define VDP_CMD_YMMM	0xE0
#define VDP_CMD_HMMM	0xD0
#define VDP_CMD_HMMV	0xC0
#define VDP_CMD_LMMC 
#define VDP_CMD_LMCM 
#define VDP_CMD_LMMM 
#define VDP_CMD_LMMV 
#define VDP_CMD_LINE 
#define VDP_CMD_SRCH	0x60
#define VDP_CMD_PSET    0x50
#define VDP_CMD_POINT

#define DISP_PAGE	(1 << 5)

#define SPRITE_OFF		0x02
#define SPRITE_ON		0x00

#define SPRITE_MAG		0x01
#define SPRITE_NO_MAG	0x00
#define SPRITE_SIZE_16	0x02
#define SPRITE_SIZE_8	0x00
#define SPRITE_MASK     0xFC // 1111 1100

#define LINES_192		0x00
#define LINES_212		0x80 // 1000 0000
#define LINES_MASK		0x7F // 0111 1111

#define FREQ_50			0x20 // 0000 0010
#define FREQ_60			0x00
#define FREQ_MASK		0xFD // 1111 1101

//----------------------------------------
// M A C R O S

#define VDP_REG(num) #(0x80+num)

#define POSI(a)    (a)
#define NEGA(a)    ((^a)++)

//----------------------------------------
// T Y P E S

typedef struct
{
	u16 DX;  // 36-37
	u16 DY;  // 38-39
	u16 NX;  // 40-41
	u16 NY;  // 42-43
	u8  CLR; // 44
	u8  ARG; // 45
	u8  CMD; // 46
} VdpBuffer36;

typedef struct
{
	u16 SX;  // 32-33
	u16 SY;  // 34-35
	u16 DX;  // 36-37
	u16 DY;  // 38-39
	u16 NX;  // 40-41
	u16 NY;  // 42-43
	u8  CLR; // 44
	u8  ARG; // 45
	u8  CMD; // 46
} VdpBuffer32;

typedef struct
{
	u8 posY;
	u8 posX;
	u8 index; // index in TGS table
	u8 reserved;
} EntryTAS;

//----------------------------------------
// P R O T O T Y P E S

void SetScreen8(u8 lines);
void SetSpriteMode(u8 activate, u8 flag, u16 tgs, u16 tas);
void SetPage8(u8 page);
void DrawPoint8(u8 posX, u8 posY, u8 color);
void DrawLine8(char posX1, char posY1, char posX2, char posY2, char color);
void waitRetrace();
void WaitForVDP();
void WriteToVRAM8(u16 addr, u8 value);
void SetFreq(u8 freq);
void PrintSprite(u8 X, u8 Y, const char* text, u16 colorTab);
void ClearSprite();
void SetSpriteMultiColor(u8 index, u8 X, u8 Y, u8 shape, u16 ram);
void SetSpriteUniColor(u8 index, u8 X, u8 Y, u8 shape, u8 color);
void RAMtoVRAM(u16 dx, u16 dy, u16 nx, u16 ny, u16 ram);
void RAMtoVRAMTrans(u16 dx, u16 dy, u16 nx, u16 ny, u16 ram);
void FillVRAM(u16 dx, u16 dy, u16 nx, u16 ny, u8 color);
void VRAMtoVRAM(u16 sx, u16 sy, u16 dx, u16 dy, u16 nx, u16 ny);
void VRAMtoVRAMTrans(u16 sx, u16 sy, u16 dx, u16 dy, u16 nx, u16 ny);

void VPDCommand32(u16 address);
void VPDCommand36(u16 address);
void VPDCommandLoop(u16 address);