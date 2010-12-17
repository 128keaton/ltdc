/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Basic shader
 * @file           basic.fx
 * @package        noe.shader
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

#include "define.h"
#include "constant.h"
 
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
// S T R U C T U R E S

struct VS_INPUT
{
	float4 position0 : POSITION0;
	float4 position1 : POSITION1;
	float4 normal0   : NORMAL0;
	float4 normal1   : NORMAL1;
	float4 color0    : COLOR0;
	float2 texcoord0 : TEXCOORD0;
};

struct VS_OUTPUT
{
	float4 position0 : POSITION0;
};


///////////////////////////////////////////////////////////////////////////////
// C O N S T A N T S

// transformation matrices
float4x4 matWorldViewProj : REGISTER_VEC(V_WORLDVIEWPROJ);	// WORLDVIEWPROJ;

///////////////////////////////////////////////////////////////////////////////
// M A I N

VS_OUTPUT vs_main(VS_INPUT vsin)
{
	VS_OUTPUT vsout;

	vsout.position0 = mul(matWorldViewProj, vsin.position0);

	return vsout;
}

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
// M A I N

float4 ps_main() : COLOR0
{
	//return float4(1,1,1,1);
	return float4(0,0,0,0);
}