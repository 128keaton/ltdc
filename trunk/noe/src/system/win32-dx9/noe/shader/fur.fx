/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Fur effect shader
 * @file           fur.fx
 * @package        noe.shader
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

#include "define.h"
#include "constant.h"

//-----------------------------------------------------------------------------
// S T R U C T U R E S

struct VS_INPUT
{
    float4 position : POSITION;
    float4 normal   : NORMAL;
    float4 color    : COLOR0;
    float4 texcoord : TEXCOORD0;
};

struct VS_OUTPUT 
{
    float4 position  : POSITION;    
    float4 texcoord0 : TEXCOORD0; // fur alpha
    float4 texcoord1 : TEXCOORD1; // fur offset / interfur shadowing
    float3 normal    : TEXCOORD2;
};

//-----------------------------------------------------------------------------
// C O N S T A N T S

/*sampler TextureSampler = sampler_state 
{
    texture = <FurTexture>;
    AddressU  = WRAP;        
    AddressV  = WRAP;
    AddressW  = WRAP;
    MIPFILTER = LINEAR;
    MINFILTER = LINEAR;
    MAGFILTER = LINEAR;
};*/

sampler TextureSampler : register(s0);

// transformation matrices
float4x4 matWorldViewProj	: register(c0);//REGISTER_VEC(V_WORLDVIEWPROJ);	// WORLDVIEWPROJ;
float4x4 matWorldView		: register(c4);//REGISTER_VEC(V_WORLDVIEW);		// WORLDVIEW;
float4x4 matWorld          : register(c8);//REGISTER_VEC(V_WORLD);         // WORLD;
float4x4 matWorldViewIT    : register(c12);//REGISTER_VEC(V_WORLDVIEWIT);
float4x4 matViewIT         : register(c16);//REGISTER_VEC(V_VIEWIT);

float4   vecFurParam : register(c20);
#define  fUVScale      vecFurParam.xy
#define  fLength       vecFurParam.z
#define  fLayer        vecFurParam.w
float4   vecLightDir : register(c21);
float4   vecAmbient  : register(c22);

//-----------------------------------------------------------------------------
// S O L I D


//-----------------------------------------------------------------------------
/**
 *
 */
VS_OUTPUT vs_main_solid(VS_INPUT vsin) 
{
	VS_OUTPUT vsout = (VS_OUTPUT)0;

	float3 P = vsin.position.xyz + (vsin.normal.xyz * (fLength * fLayer));
	float3 normal = normalize(mul(matWorld, vsin.normal)).xyz;

	vsout.texcoord0.xy = vsin.texcoord.xy * fUVScale;
	vsout.position  = mul(matWorldViewProj, float4(P, 1.0f));
	vsout.normal    = normal;

	return vsout;
}


//-----------------------------------------------------------------------------
/**
 *
 */
float4 ps_main_solid(VS_OUTPUT psin): COLOR
{
	float4 sample = tex2D(TextureSampler,  psin.texcoord0.xy);

	// skip invisible texel	
	//if(sample.w)
	{
		// rgb
		//sample.xyz = (vecAmbient.xyz * sample.xyz) + sample.xyz * dot(vecLightDir, psin.normal);
/*
		// alpha
		float f = fLayer / sample.w;
		clamp(f, 0.0f, 1.0f);
		sample.w = 1.0f - f;//fLayer;//*/
	}
	
	return sample;
}


//-----------------------------------------------------------------------------
// S H A D O W

//-----------------------------------------------------------------------------
/**
 *
 */
VS_OUTPUT vs_main_shadow(VS_INPUT vsin) 
{
	VS_OUTPUT vsout = (VS_OUTPUT)0;

	float3 P = vsin.position.xyz + (vsin.normal.xyz * (fLength * fLayer));
	float4 normal = mul(vsin.normal, matWorld);

	float4 znormal = 1 - dot(normal, float4(0,0,1,0));

	vsout.texcoord0.xy = vsin.texcoord.xy * fUVScale;
	vsout.texcoord1.xy = vsin.texcoord.xy * fUVScale + znormal.xy * 0.0051;

	vsout.position = mul(float4(P, 1.0f), matWorldViewProj);
	vsout.normal = normal.xyz;
	return vsout;
}


//-----------------------------------------------------------------------------
/**
 *
 */
float4 ps_main_shadow(VS_OUTPUT psin): COLOR
{
	float4 furcolr        =  tex2D(TextureSampler, psin.texcoord0.xy);
	float4 furcolr_offset =  tex2D(TextureSampler, psin.texcoord1.xy);

	float4 color = furcolr_offset - furcolr;

	float4 fcolor = color;
	fcolor.a = color.a;

	// Y is the luma, and contains most of the information of the image
	float4 Y    = float4(0.299, 0.587, 0.114, 0.0f);
	fcolor  = dot(Y, fcolor); // grey output

	return fcolor;
}

/*
technique Fur	        
{   
    pass Shells
    {		
		VertexShader = compile vs_1_1 vs_main_solid();
		PixelShader  = compile ps_1_3 ps_main_solid();
		AlphaBlendEnable = true;   
		SrcBlend = one;
		DestBlend = INVSRCALPHA;
		CullMode = None;
    }
    
    pass Shadows
    {		
		VertexShader = compile vs_1_1 vs_main_shadow();
		PixelShader  = compile ps_1_3 ps_main_shadow();
		AlphaBlendEnable = true;
		SrcBlend = srcalpha;
		DestBlend = invsrcalpha;
		CullMode = None;
    }
    
}// End technique Fur

*/