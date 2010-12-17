/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Shader constant 
 * @file           constant.h
 * @package        noe.shader
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

//#pragma once

///////////////////////////////////////////////////////////////////////////////
// D E F I N E S

#define NUM_LIGHTS     5
#define NUM_TEXTURES   4
#define SHADOW_SIZE    512
#define SHADOW_EPSILON 0.000005f //0.00005f

///////////////////////////////////////////////////////////////////////////////
//
// ##   ##   ######
// ##   ##  ###
//  ## ##    #####
//  ## ##       ###
//   ###    ######
//
///////////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////////
// R E G I S T E R   M A P P I N G

// Vector constant register
#define V_WORLDVIEWPROJ		0	// 0-3 ------------ Matrix
#define V_WORLDVIEW			4	// 4-7
#define V_WORLD				8	// 8-11
#define V_WORLDVIEWIT		12	// 12-15
#define V_VIEWIT				16	// 16-19
#define V_VIEWLIGHTPROJ		20	// 20-23
#define V_AMBIENTCOLOR		32  // 32 ------------- Global ambient
#define V_MATERIALDIFFUSE	33	// 33 ------------- Material
#define V_MATERIALAMBIENT	34	// 34
#define V_MATERIALSPECULAR	35	// 35
#define V_MATERIALEMISSIVE	36	// 36
#define V_MATERIALPOWER		37  // 37
#define V_TWEENFACTOR		40	// 40 ------------- Tweening
#define V_FOGTYPE				50	// 50 ------------- Fog
#define V_FOGCOLOR			51	// 51
#define V_FOGSETTING			52  // 52
#define V_UVMODIFIER			60  // 60-64 ------------- UV
#define V_TEXGENTYPE			70	// 70-73 ------------- Texture
#define V_TEXTURENUM			80  // 80
#define V_TEXTYPE				81	// 81
#define V_LIGHTDIRINI		90	// 90 ------------- Light
#define V_LIGHTPOINTINI		91	// 91
#define V_LIGHTSPOTINI		92	// 92
#define V_LIGHTDATA			100 // 100-107 | 108-115 | 116-23 | ...

// Integer constant register
#define I_LIGHTDIRNUM		0
#define I_LIGHTPOINTNUM		1
#define I_LIGHTSPOTNUM		2
#define I_TEXTURENUM			3

// Boolean constant register
#define B_SPECULAR			0	// 0
#define B_TWEENING			1	// 1
#define B_FOGRANGE			2	// 2


///////////////////////////////////////////////////////////////////////////////
//
// ######    ######
// ##  ###  ###
// ######    #####
// ##           ###
// ##       ######
//
///////////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////////
// R E G I S T E R   M A P P I N G

#define V_TEXTURETYPE		0 // 0-3 ------------ Texture type

#define PS_TEXTURETYPE		0	// 0-4
#define PS_TEXTURENUM		10
