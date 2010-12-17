/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Shader definition
 * @file           define.fx
 * @package        noe.shader
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

//#pragma once

///////////////////////////////////////////////////////////////////////////////
// M A C R O S

#define REGISTER_VEC(_a)	register(c##_a) // register vector
#define REGISTER_INT(_a)	register(i##_a) // register integer
#define REGISTER_BOOL(_a)	register(b##_a) // register boolean

///////////////////////////////////////////////////////////////////////////////
// D E F I N E S

#define PI						3.14159265358979323846f
#define PIdiv2					(PI*0.5f)
#define COMPILE_TWEENING	false

///////////////////////////////////////////////////////////////////////////////
//
// ##   ##   ####
// ##   ##  ## 
// ##   ##   ####
//  ## ##       ##
//   ###     ####
//
///////////////////////////////////////////////////////////////////////////////

#define LIGHT_TYPE_NONE          0
#define LIGHT_TYPE_POINT         1
#define LIGHT_TYPE_SPOT          2
#define LIGHT_TYPE_DIRECTIONAL   3
#define LIGHT_NUM_TYPES          4

#define FOG_TYPE_NONE            0
#define FOG_TYPE_EXP             1
#define FOG_TYPE_EXP2            2
#define FOG_TYPE_LINEAR          3
#define FOG_NUM_TYPES            4

#define TEX_TYPE_NONE            0
#define TEX_TYPE_CUBEMAP         1
#define TEX_NUM_TYPES            2

#define TEXGEN_TYPE_NONE                          0
#define TEXGEN_TYPE_CAMERASPACENORMAL             1
#define TEXGEN_TYPE_CAMERASPACEPOSITION           2
#define TEXGEN_TYPE_CAMERASPACEREFLECTIONVECTOR   3
#define TEXGEN_NUM_TYPES                          4

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

#define PS_TEX_NO          -1	// Value = 0
#define PS_TEX_DIFFUSE		0	// Value = Texel * Previous
#define PS_TEX_OPACITY		1	// Value = Previous
#define PS_TEX_ADD			2	// Value = Texel + Previous
#define PS_TEX_MODULATE2X	3	// Value = 2 * Texel * Previous
#define PS_TEX_MODULATE4X	4	// Value = 4 * Texel * Previous
#define PS_TEX_ADDSIGNED	5	// Value = (Texel + Previous - 0.5)
#define PS_TEX_SUBTRACT		6	// Value = Previous - Texel
