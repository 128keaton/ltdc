#pragma once

//-----------------------------------------------------------------------------
// Compilation switch
#pragma disable_warning 59 // remove "function must return value" warning

//-----------------------------------------------------------------------------
// Boolean
typedef unsigned char BOOL; // 8 bits boolean
#define TRUE  1
#define FALSE 0

// Integer
typedef char i8;            // 8 bits signed integer
typedef unsigned char u8;   // 8 bits unsigned integer
typedef int i16;            // 16 bits signed integer
typedef unsigned int u16;   // 16 bits unsigned integer

// Character
typedef char c8;            // 8 bits character

//-----------------------------------------------------------------------------
// Helper macros
#define numberof(tab) sizeof(tab) / sizeof(tab[0])

#define Abs8(i)  (((u8)(i) & 0x80) ? ~((u8)(i) - 1) : (i))
#define Abs16(i) (((u16)(i) & 0x8000) ? ~((u16)(i) - 1) : (i))

#define POSI(a)    (a)
#define NEGA(a)    ((^a)++)

#define RGB8(r,g,b) (((g) << 5) + ((r) << 2) + (b))
#define Modulo2(a,b) ((a) & ((b) - 1))

#define Merge4(a,b) (((a) & 0xF) << 4 | ((b) & 0xF))