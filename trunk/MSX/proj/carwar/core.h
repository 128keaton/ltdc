#pragma once
#pragma disable_warning 59 // remove "function must return value" warning

#define TRUE  1
#define FALSE 0

typedef char i8;
typedef unsigned char u8;
typedef int i16;
typedef unsigned int u16;
typedef unsigned char BOOL;

#define numberof(tab) sizeof(tab) / sizeof(tab[0])