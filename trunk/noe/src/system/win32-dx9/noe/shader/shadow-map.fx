/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Shadow-mapping shader
 * @file           shadow-map.fx
 * @package        noe.shader
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

#include "define.h"
#include "constant.h"

//-----------------------------------------------------------------------------
// SHADER CONSTANTS
 
float4x4 matWorldViewProj  : register(c0);  ///< World-View-Projection matrix [WORLDVIEWPROJ]
float4x4 matWorldView      : register(c4);  ///< World-View matrix [WORLDVIEW]
float4x4 matViewLightProj  : register(c8);  ///< View-LightViewProj matrix

float4   vUVModifier       : register(c12); ///< UV modifier parameter (u_offset | v_offset | u_scale  | v_scale)
#define  vUVOffset         vUVModifier.xy
#define  vUVScale          vUVModifier.zw

float4   vMaterialDiffuse  : register(c20); ///< Material diffuse color

float3   vLightPos         : register(c21); ///< Light position in view space
float3   vLightDir         : register(c22); ///< Light direction in view space
float4   vLightDiffuse     : register(c23); ///< Light diffuse color
float4   vLightAmbient     : register(c24); ///< Ambient light
float    fCosTheta         : register(c25); ///< Cosine of theta of the spot light

sampler  samScene          : register(s0);  ///< The scene texture
sampler  samShadow         : register(s1);  ///< The shadow texture

/*texture  txScene;

sampler2D samScene =
sampler_state
{
    Texture = <txScene>;
    MinFilter = Point;
    MagFilter = Linear;
    MipFilter = Linear;
};

texture  txShadow;
sampler2D samShadow =
sampler_state
{
    Texture = <txShadow>;
    MinFilter = Point;
    MagFilter = Point;
    MipFilter = Point;
    AddressU = Clamp;
    AddressV = Clamp;
};
*/

//-----------------------------------------------------------------------------
//
//  ######  ##   ##   #####   #####    #####   ##   ##
// ###      ##   ##  ##   ##  ##  ##  ##   ##  ##   ##
//  #####   #######  #######  ##  ##  ##   ##  ## # ##
//     ###  ##   ##  ##   ##  ##  ##  ##   ##  ### ###
// ######   ##   ##  ##   ##  #####    #####   ##   ##
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
//
// ##   ##   ######
// ##   ##  ###
//  ## ##    #####
//  ## ##       ###
//   ###    ######
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// STRUCTURES

/// Vertex-shader input data
struct VS_SHADOW_IN
{
	float4 Pos    : POSITION;
	float3 Normal : NORMAL;
};

/// Vertex-shader output data
struct VS_SHADOW_OUT
{
	float4 oPos  : POSITION;
	float2 Depth : TEXCOORD0;
};

//-----------------------------------------------------------------------------
/**
 * Process vertex for the shadow map
 */ 
VS_SHADOW_OUT vs_shadow(VS_SHADOW_IN vsin)
{
	VS_SHADOW_OUT vsout = (VS_SHADOW_OUT)0;

	// Compute the projected coordinates
	vsout.oPos = mul(matWorldViewProj, vsin.Pos);

	// Store z and w in our spare texcoord
	vsout.Depth.xy = vsout.oPos.zw;
	
	return vsout;
}

//-----------------------------------------------------------------------------
//
// ######    ######
// ##  ###  ###
// ######    #####
// ##           ###
// ##       ######
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// STRUCTURES

/// Pixel-shader input data
struct PS_SHADOW_IN
{
	float2 Depth : TEXCOORD0;
};

//-----------------------------------------------------------------------------
/**
 * Process pixel for the shadow map
 */
float4 ps_shadow(PS_SHADOW_IN psin): COLOR
{
    // Depth is z / w
    return psin.Depth.x / psin.Depth.y;
}


//-----------------------------------------------------------------------------
//
//  ######   #####   #####  ##   ##  #####
// ###      ##   ##  ##     ###  ##  ##
//  #####   ##       ####   ## # ##  ####
//     ###  ##   ##  ##     ##  ###  ##
// ######    #####   #####  ##   ##  #####
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
//
// ##   ##   ######
// ##   ##  ###
//  ## ##    #####
//  ## ##       ###
//   ###    ######
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// STRUCTURES

/// Vertex-shader input data
struct VS_SCENE_IN
{
	float4 iPos    : POSITION;
	float3 iNormal : NORMAL;
	float4 iColor  : COLOR0;
   float2 iTex    : TEXCOORD0;
};

/// Vertex-shader output data
struct VS_SCENE_OUT
{
   float4 oPos      : POSITION;
   float2 Tex       : TEXCOORD0;
   float4 vPos      : TEXCOORD1;
   float3 vNormal   : TEXCOORD2;
   float4 vPosLight : TEXCOORD3;
};

//---------------------------------------------------------
/**
 * Process vertex for scene
 */
VS_SCENE_OUT vs_scene(VS_SCENE_IN vsin)
{
	VS_SCENE_OUT vsout = (VS_SCENE_OUT)0;

	// Transform position to view space
	vsout.vPos = mul(matWorldView, vsin.iPos);

	// Transform to screen coord
	vsout.oPos = mul(matWorldViewProj, vsin.iPos);

	// Compute view space normal
	vsout.vNormal = mul((float3x3)matWorldView, vsin.iNormal);

	// Propagate texture coord
	//vsout.Tex = vsin.iTex;
	vsout.Tex = vUVOffset + vsin.iTex * vUVScale;

	// Transform the position to light projection space, or the projection space as if the camera is looking out from the spotlight.
	vsout.vPosLight = mul(matViewLightProj, vsout.vPos);

	return vsout;
}


//-----------------------------------------------------------------------------
//
// ######    ######
// ##  ###  ###
// ######    #####
// ##           ###
// ##       ######
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// STRUCTURES

/// Pixel-shader input data
struct PS_SCENE_IN
{
	float2 Tex       : TEXCOORD0;
	float4 vPos      : TEXCOORD1;
	float3 vNormal   : TEXCOORD2;
	float4 vPosLight : TEXCOORD3;
};
	
//-----------------------------------------------------------------------------
/**
 * Process pixel (do per-pixel lighting) for enabled scene
 */
float4 ps_scene(PS_SCENE_IN psin) : COLOR
{
	float4 Diffuse;

	// vLight is the unit vector from the light to this pixel
	float3 vLight = normalize(float3(psin.vPos.xyz - vLightPos));

	// Compute diffuse from the light
	if(dot(vLight, vLightDir) > fCosTheta) // Light must face the pixel (within Theta)
	{
		//transform from RT space to texture space.
		float2 ShadowTexC = 0.5 * psin.vPosLight.xy / psin.vPosLight.w + float2(0.5, 0.5);
		ShadowTexC.y = 1.0f - ShadowTexC.y;

		// transform to texel space
		float2 texelpos = SHADOW_SIZE * ShadowTexC;

		// Determine the lerp amounts           
		float2 lerps = frac(texelpos);

		//read in bilerp stamp, doing the shadow checks
		float sourcevals[4];
		sourcevals[0] = (tex2D(samShadow, ShadowTexC) + SHADOW_EPSILON < psin.vPosLight.z / psin.vPosLight.w)? 0.0f: 1.0f;  
		sourcevals[1] = (tex2D(samShadow, ShadowTexC + float2(1.0/SHADOW_SIZE, 0)) + SHADOW_EPSILON < psin.vPosLight.z / psin.vPosLight.w)? 0.0f: 1.0f;  
		sourcevals[2] = (tex2D(samShadow, ShadowTexC + float2(0, 1.0/SHADOW_SIZE)) + SHADOW_EPSILON < psin.vPosLight.z / psin.vPosLight.w)? 0.0f: 1.0f;  
		sourcevals[3] = (tex2D(samShadow, ShadowTexC + float2(1.0/SHADOW_SIZE, 1.0/SHADOW_SIZE)) + SHADOW_EPSILON < psin.vPosLight.z / psin.vPosLight.w)? 0.0f: 1.0f;  

		// lerp between the shadow values to calculate our light amount
		float LightAmount = lerp(lerp(sourcevals[0], sourcevals[1], lerps.x),
		                    lerp(sourcevals[2], sourcevals[3], lerps.x), lerps.y);
		// Light it
		Diffuse = (saturate(dot(-vLight, normalize(psin.vNormal))) * LightAmount * 
		          (1 - vLightAmbient) + vLightAmbient) * vMaterialDiffuse;
	}
	else
	{
		Diffuse = vLightAmbient * vMaterialDiffuse;
	}

	return tex2D(samScene, psin.Tex) * Diffuse;
}