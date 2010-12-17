/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Default shader
 * @file           default.fx
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
	float2 texcoord0[NUM_TEXTURES] : TEXCOORD;
};

struct LIGHT_DATA // 7 registers
{
	/* 0 */ float3 vDiffuse;
	/* 1 */ float3 vSpecular;
	/* 2 */ float3 vAmbient;
	/* 3 */ float3 vPos;
	/* 4 */ float3 vDir;
	/* 5 */ float4 vAttenuation; // 1 | D | D^2 | range
	/* 6 */ float3 vSpot; // cos(theta/2) | cos(phi/2) | falloff
};

struct COLOR_TRIPLET
{
	float3 Ambient  : COLOR0;
	float3 Diffuse  : COLOR1;
	float3 Specular : COLOR2;
};

///////////////////////////////////////////////////////////////////////////////
// C O N S T A N T S

// transformation matrices
float4x4 matWorldViewProj  : REGISTER_VEC(V_WORLDVIEWPROJ); // WORLDVIEWPROJ;
float4x4 matWorldView      : REGISTER_VEC(V_WORLDVIEW);     // WORLDVIEW;
float4x4 matWorld          : REGISTER_VEC(V_WORLD);         // WORLD;
float4x4 matWorldViewIT    : REGISTER_VEC(V_WORLDVIEWIT);
float4x4 matViewIT         : REGISTER_VEC(V_VIEWIT);

// colors
bool     bSpecular         : REGISTER_BOOL(B_SPECULAR);
float3   vAmbientColor     : REGISTER_VEC(V_AMBIENTCOLOR);
float4   vMaterialDiffuse  : REGISTER_VEC(V_MATERIALDIFFUSE);
float3   vMaterialAmbient  : REGISTER_VEC(V_MATERIALAMBIENT);
float3   vMaterialSpecular : REGISTER_VEC(V_MATERIALSPECULAR);
float3   vMaterialEmissive : REGISTER_VEC(V_MATERIALEMISSIVE);
float    fMaterialPower    : REGISTER_VEC(V_MATERIALPOWER);

// tween
bool     bTweening         : REGISTER_BOOL(B_TWEENING);
float    fTweenFactor      : REGISTER_VEC(V_TWEENFACTOR);

//fog
int      iFogType          : REGISTER_VEC(V_FOGTYPE);
float4   vFogColor         : REGISTER_VEC(V_FOGCOLOR);
float3   vFogSetting       : REGISTER_VEC(V_FOGSETTING); // start | end | density
bool     bFogRange         : REGISTER_BOOL(B_FOGRANGE);

// texture
int      iTexType          : REGISTER_VEC(V_TEXTYPE);
int      iTextureNum       : REGISTER_INT(I_TEXTURENUM);//REGISTER_VEC(V_TEXTURENUM);
int      iTexGenType[NUM_TEXTURES] : REGISTER_VEC(V_TEXGENTYPE);
float4   vUVModifier[NUM_TEXTURES] : REGISTER_VEC(V_UVMODIFIER); // u_offset | v_offset | u_scale  | v_scale

// light
int      iLightDirIni      : REGISTER_VEC(V_LIGHTDIRINI);
int      iLightDirNum      : REGISTER_INT(I_LIGHTDIRNUM);
int      iLightPointIni    : REGISTER_VEC(V_LIGHTPOINTINI);
int      iLightPointNum    : REGISTER_INT(I_LIGHTPOINTNUM);
int      iLightSpotIni     : REGISTER_VEC(V_LIGHTSPOTINI);
int      iLightSpotNum     : REGISTER_INT(I_LIGHTSPOTNUM);


shared LIGHT_DATA lights[NUM_LIGHTS] : REGISTER_VEC(V_LIGHTDATA);

///////////////////////////////////////////////////////////////////////////////
// H E L P   F U N C T I O N S

/**
 *
 */
float4 ProcessFog(float3 P)
{
	float d = 0;
	if(bFogRange)
		d = length(P);
	else
		d = P.z;

	float4 fog = (iFogType == FOG_TYPE_NONE)   * 1.f
	           + (iFogType == FOG_TYPE_EXP)    * vFogColor / exp(d * vFogSetting.z)
	           + (iFogType == FOG_TYPE_EXP2)   * vFogColor / exp(pow(d * vFogSetting.z, 2))
	           + (iFogType == FOG_TYPE_LINEAR) * vFogColor * saturate((vFogSetting.y - d)/(vFogSetting.y - vFogSetting.x));
	           
	return fog;
}

/**
 * Directional light computation
 */
COLOR_TRIPLET ProcessDirLight(float3 N, float3 V, int i)
{
	COLOR_TRIPLET Out;
	float3 L = -normalize(lights[i].vDir);
	float NdotL = dot(N, L);
	Out.Ambient = lights[i].vAmbient;
	Out.Diffuse = 0;
	Out.Specular = 0;
	if(NdotL > 0.f)
	{
		//compute diffuse color
		Out.Diffuse = NdotL * lights[i].vDiffuse * vMaterialDiffuse.xyz;

		//add specular component
		if(bSpecular)
		{
			float3 H = normalize(L + V);   //half vector
			//float3 H = normalize(L + float3(0,0,-1));   //half vector
			Out.Specular = pow(max(0, dot(H, N)), fMaterialPower) * lights[i].vSpecular;
		}
	}   
	return Out;
}

/**
 * Point light computation
 */
COLOR_TRIPLET ProcessPointLight(float4 vPosition, float3 N, float3 V, int i)
{
   float3 L = mul((float3x3)matViewIT, normalize((lights[i].vPos-(float3)mul(matWorld,vPosition))));
   COLOR_TRIPLET Out;
   float NdotL = dot(N, L);
   Out.Ambient = lights[i].vAmbient;
   Out.Diffuse = 0;
   Out.Specular = 0;
   float fAtten = 1.f;
   if(NdotL >= 0.f)
   {
      //compute diffuse color
      Out.Diffuse = NdotL * lights[i].vDiffuse;

      //add specular component
      if(bSpecular)
      {
         float3 H = normalize(L + V);   //half vector
         Out.Specular = pow(max(0, dot(H, N)), fMaterialPower) * lights[i].vSpecular;
      }

      float LD = length(lights[i].vPos-(float3)mul(matWorld,vPosition));
      if(LD > lights[i].vAttenuation.w)
      {
         fAtten = 0.f;
      }
      else
      {
         fAtten *= 1.f/(lights[i].vAttenuation.x + lights[i].vAttenuation.y*LD + lights[i].vAttenuation.z*LD*LD);
      }
      Out.Diffuse *= fAtten;
      Out.Specular *= fAtten;
   }
   return Out;
}

/**
 * Spot light computation
 */
COLOR_TRIPLET ProcessSpotLight(float4 vPosition, float3 N, float3 V, int i)
{
   float3 L = mul((float3x3)matViewIT, normalize((lights[i].vPos-(float3)mul(matWorld,vPosition))));
   COLOR_TRIPLET Out;
   float NdotL = dot(N, L);
   Out.Diffuse = lights[i].vAmbient;
   Out.Specular = 0;
   float fAttenSpot = 1.f;
   if(NdotL >= 0.f)
   {
      //compute diffuse color
      Out.Diffuse += NdotL * lights[i].vDiffuse;

      //add specular component
      if(bSpecular)
      {
         float3 H = normalize(L + V);   //half vector
         Out.Specular = pow(max(0, dot(H, N)), fMaterialPower) * lights[i].vSpecular;
      }

      float LD = length(lights[i].vPos-(float3)mul(matWorld,vPosition));
      if(LD > lights[i].vAttenuation.w)
      {
         fAttenSpot = 0.f;
      }
      else
      {
         fAttenSpot *= 1.f/(lights[i].vAttenuation.x + lights[i].vAttenuation.y*LD + lights[i].vAttenuation.z*LD*LD);
      }

      //spot cone computation
      float3 L2 = mul((float3x3)matViewIT, -normalize(lights[i].vDir));
      float rho = dot(L, L2);
      fAttenSpot *= pow(saturate((rho - lights[i].vSpot.y)/(lights[i].vSpot.x - lights[i].vSpot.y)), lights[i].vSpot.z);

      Out.Diffuse *= fAttenSpot;
      Out.Specular *= fAttenSpot;
   }
   return Out;
}

///////////////////////////////////////////////////////////////////////////////
// M A I N

VS_OUTPUT vs_main(VS_INPUT vsin)
{
	VS_OUTPUT vsout = (VS_OUTPUT)0;

#if COMPILE_TWEENING
	if(bTweening)
	{
		vsin.position0 = (1.f-fTweenFactor) * vsin.position0          + fTweenFactor * vsin.position1;
		vsin.normal0   = (1.f-fTweenFactor) * normalize(vsin.normal0) + fTweenFactor * normalize(vsin.normal1);
	}
#endif

	vsin.normal0 = normalize(vsin.normal0);
	vsout.position0	= mul(matWorldViewProj, vsin.position0);

	float3 P = mul(matWorldView, vsin.position0).xyz;           // position in view space
	float3 N = normalize(mul((float3x3)matWorldViewIT, vsin.normal0.xyz)); // normal in view space
	float3 V = -normalize(P);								// viewer

	// texture coordinate computation
	//for(int i = 0; i < NUM_TEXTURES; i++)
	//for(int i = 0; i < iTextureNum; i++)
	for(int i = 0; i < 1; i++)
	{
		vsout.texcoord0[i] = (iTexGenType[i] == TEXGEN_TYPE_NONE)                        * vsin.texcoord0
		                   + (iTexGenType[i] == TEXGEN_TYPE_CAMERASPACEPOSITION)         * (float2(-0.5f, -0.5f) + float2(1.0f, -1.0f) * normalize(P).xy)
		                   + (iTexGenType[i] == TEXGEN_TYPE_CAMERASPACENORMAL)           * (float2(-0.5f, -0.5f) + float2(0.25f, -0.25f) * mul((float3x3)matWorldView, vsin.normal0.xyz).xy) //(N * 0.5f)
		                   + (iTexGenType[i] == TEXGEN_TYPE_CAMERASPACEREFLECTIONVECTOR) * (float2(0.5f, 0.f) + float2(-1.0f, -1.0f) * dot(V,N) * (N - V).xy);
		vsout.texcoord0[i] = vUVModifier[i].xy + vsout.texcoord0[i] * vUVModifier[i].zw;
	}

	//light computation
	float3 sumAmbient  = 0;
	float3 sumDiffuse  = 0;
	float3 sumSpecular = 0;

	//directional lights
	//for(int i = 0; i < iLightDirNum; i++)
	for(int j = 0; j < 1; j++)
	{
		COLOR_TRIPLET light = ProcessDirLight(N, V, j+iLightDirIni);
		
		sumAmbient  += light.Ambient;
		sumDiffuse  += light.Diffuse;
		sumSpecular += light.Specular;
	}
/*
	//point lights
	if(iLightPointNum > 0)
	{
	for(int i = 0; i < iLightPointNum; i++)
	{
		COLOR_TRIPLET light = ProcessPointLight(vsin.position0, N, V, i+iLightPointIni);
		sumAmbient  += light.Ambient;
		sumDiffuse  += light.Diffuse;
		sumSpecular += light.Specular;
	}
	}
/*
	//spot lights
	for(int i = 0; i < iLightSpotNum; i++)
	{
		COLOR_TRIPLET ColOut = ProcessSpotLight(vsin.position0, N, V, i+iLightSpotIni);
		vsout.color0 += ColOut.Diffuse;
		vsout.color1 += ColOut.Specular;
	}
*/
	// illumination
	float3 illumination;
	illumination =  vMaterialAmbient * (vAmbientColor + sumAmbient);	// ambient light
	illumination += sumDiffuse;											// diffuse light
	illumination += vMaterialEmissive;									// emissive light

	//saturate
	illumination =  min(1, illumination);

	// specular light
	illumination += vMaterialSpecular * sumSpecular;

	// transparency
	vsout.color0 = vMaterialDiffuse;//float4(illumination, vMaterialDiffuse.w);

	//float4 fog = ProcessFog(P);

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
	float2 texcoord0[NUM_TEXTURES] : TEXCOORD;
};

///////////////////////////////////////////////////////////////////////////////
// C O N S T A N T S

sampler textureSampler : register(s0);

///////////////////////////////////////////////////////////////////////////////
// M A I N

float4 ps_main(PS_INPUT psin) : COLOR0
{
	float4 psout = psin.color0 * tex2D(textureSampler, psin.texcoord0[0]); //++
	return psout;
}