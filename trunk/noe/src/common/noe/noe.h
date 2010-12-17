/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2008 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Basic type declaration
 * @file           noe.h
 * @package        noe
 * @date           2006/10/06
 * @version        0.1
 * @author         Guillaume Blanchard
 */

#pragma once

// std
#include <wchar.h>

//-----------------------------------------------------------------------------
//
// Basic variables types
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// integer types
typedef char               i8;  ///<  8 bits integer
typedef short              i16; ///< 16 bits integer
typedef long               i32; ///< 32 bits integer
typedef _int64             i64; ///< 64 bits integer

//-----------------------------------------------------------------------------
// unsigned integer types
typedef unsigned char      u8;  ///<  8 bits unsigned integer
typedef unsigned short     u16; ///< 16 bits unsigned integer
typedef unsigned long      u32; ///< 32 bits unsigned integer
typedef unsigned _int64    u64; ///< 64 bits unsigned integer

//-----------------------------------------------------------------------------
// signed integer types
typedef signed char        s8;	///<  8 bits signed integer
typedef signed short       s16;	///< 16 bits signed integer
typedef signed long        s32;	///< 32 bits signed integer
typedef signed _int64      s64;	///< 64 bits signed integer

//-----------------------------------------------------------------------------
// float types
typedef float              f32; ///< 32 bits floating-point
typedef double             f64; ///< 64 bits floating-point

//-----------------------------------------------------------------------------
// character types
typedef char               c8;	///<  8 bits character
typedef wchar_t            c16;	///< 16 bits character

typedef void*              PTR;
typedef int                BOOL;

//-----------------------------------------------------------------------------
//
// Helper macros & defines
//
//-----------------------------------------------------------------------------

/// loop macro
#define loop(_idx, _max) for(i32 (_idx)=0; (_idx)<(_max); (_idx)++)
#define numberof(_tab) sizeof(_tab) / sizeof(_tab[0])

/// casting template shortcuts
#define scast static_cast
#define rcast reinterpret_cast
#define dcast dynamic_cast
#define ccast const_cast

// Standard constants
#undef  FALSE
#define FALSE   0
#undef  TRUE
#define TRUE    1
#undef  NULL
#define NULL    0

#define NONE					(-1)

/// default includes
#include <noe/debug.h>

namespace noe
{
}; // namespace noe
