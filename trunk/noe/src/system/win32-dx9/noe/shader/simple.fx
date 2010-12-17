/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Simple shader
 * @file           simple.fx
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
	float4 color0    : COLOR0; // illumination
	float2 texcoord0 : TEXCOORD;
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
	vsout.color0    = vsin.color0;
	vsout.texcoord0 = vsin.texcoord0;

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
// S T R U C T U R E S

struct PS_INPUT
{
	float4 color0    : COLOR0;
	float2 texcoord0 : TEXCOORD;
};

///////////////////////////////////////////////////////////////////////////////
// C O N S T A N T S

sampler textureSampler : register(s0);

///////////////////////////////////////////////////////////////////////////////
// M A I N

float4 ps_main(PS_INPUT psin) : COLOR0
{
	float4 psout = psin.color0 * tex2D(textureSampler, psin.texcoord0); //++
	return psout;
}