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
	float3 normal0   : NORMAL0;
	float2 texcoord0 : TEXCOORD0;
};

struct VS_OUTPUT
{
	float4 position0 : POSITION0; // position in projection coordinate
	float4 position1 : TEXCOORD1; // position in view coordinate
	float3 normal0   : TEXCOORD2; // normal in view coordinate
	float4 position2 : TEXCOORD3; // position in light's projection coordinate
	float2 texcoord0 : TEXCOORD0;
};

///////////////////////////////////////////////////////////////////////////////
// C O N S T A N T S

// transformation matrices
float4x4 matWorldViewProj	: register(c0);//REGISTER_VEC(V_WORLDVIEWPROJ);	// WORLDVIEWPROJ;
float4x4 matWorldView		: register(c4);//REGISTER_VEC(V_WORLDVIEW);		// WORLDVIEW;
float4x4 matWorld          : register(c8);//REGISTER_VEC(V_WORLD);         // WORLD;
float4x4 matWorldViewIT    : register(c12);//REGISTER_VEC(V_WORLDVIEWIT);
float4x4 matViewIT         : register(c16);//REGISTER_VEC(V_VIEWIT);
float4x4 matViewLightProj  : register(c20);//REGISTER_VEC(V_VIEWLIGHTPROJ);

// colors
bool     bSpecular         : register(b0);//REGISTER_BOOL(B_SPECULAR);
float3   vAmbientColor     : register(c32);//REGISTER_VEC(V_AMBIENTCOLOR);
float4   vMaterialDiffuse  : register(c33);//REGISTER_VEC(V_MATERIALDIFFUSE);
float3   vMaterialAmbient  : register(c34);//REGISTER_VEC(V_MATERIALAMBIENT);
float3   vMaterialSpecular : register(c35);//REGISTER_VEC(V_MATERIALSPECULAR);
float3   vMaterialEmissive : register(c36);//REGISTER_VEC(V_MATERIALEMISSIVE);
float    fMaterialPower    : register(c37);//REGISTER_VEC(V_MATERIALPOWER);

// tween
bool     bTweening         : register(b1);//REGISTER_BOOL(B_TWEENING);
float    fTweenFactor      : register(c40);//REGISTER_VEC(V_TWEENFACTOR);

//fog
int      iFogType          : register(c50);//REGISTER_VEC(V_FOGTYPE);
float4   vFogColor         : register(c51);//REGISTER_VEC(V_FOGCOLOR);
float3   vFogSetting       : register(c52);//REGISTER_VEC(V_FOGSETTING); // start | end | density
bool     bFogRange         : register(b2);//REGISTER_BOOL(B_FOGRANGE);

// texture
int      iTexType          : register(c81);//REGISTER_VEC(V_TEXTYPE);
int      iTextureNum       : register(i3);//REGISTER_INT(I_TEXTURENUM);//REGISTER_VEC(V_TEXTURENUM);
int      iTexGenType[NUM_TEXTURES] : register(c70);//REGISTER_VEC(V_TEXGENTYPE);
float4   vUVModifier[NUM_TEXTURES] : register(c60);//REGISTER_VEC(V_UVMODIFIER); // u_offset | v_offset | u_scale  | v_scale

///////////////////////////////////////////////////////////////////////////////
// M A I N

VS_OUTPUT vs_main(VS_INPUT vsin)
{
	VS_OUTPUT vsout = (VS_OUTPUT)0;

	// Transform position to view space
	vsout.position1 = mul(vsin.position0, matWorldView);

	// Transform to screen coord
	vsout.position0 = mul(vsin.position0, matWorldViewProj);

	// Compute view space normal
	vsout.normal0 = mul(vsin.normal0, (float3x3)matWorldView);

	// Propagate texture coord
	vsout.texcoord0 = vsin.texcoord0;

	// Transform the position to light projection space, or the projection space 
	// as if the camera is looking out from the spotlight.
	vsout.position2 = mul(vsout.position1, matViewLightProj);

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
	float2 Tex       : TEXCOORD0;
	float4 vPos      : TEXCOORD1;
	float3 vNormal   : TEXCOORD2;
	float4 vPosLight : TEXCOORD3;
};

///////////////////////////////////////////////////////////////////////////////
// C O N S T A N T S

/*texture  g_txScene;
sampler2D g_samScene =
sampler_state
{
    Texture = <g_txScene>;
    MinFilter = Point;
    MagFilter = Linear;
    MipFilter = Linear;
};

texture  g_txShadow;
sampler2D g_samShadow =
sampler_state
{
    Texture = <g_txShadow>;
    MinFilter = Point;
    MagFilter = Point;
    MipFilter = Point;
    AddressU = Clamp;
    AddressV = Clamp;
};*/

sampler  g_samScene      : register(s0);
sampler  g_samShadow     : register(s1);

float4   g_vMaterial     : register(c0);
float3   g_vLightPos     : register(c1);
float3   g_vLightDir     : register(c2);
float4   g_vLightAmbient : register(c3);
float    g_fCosTheta     : register(c4);

///////////////////////////////////////////////////////////////////////////////
// M A I N

float4 ps_main(PS_INPUT psin) : COLOR0
{
    float4 Diffuse;

    // vLight is the unit vector from the light to this pixel
    float3 vLight = normalize(float3(psin.vPos - g_vLightPos));

    // Compute diffuse from the light
    if(dot(vLight, g_vLightDir) > g_fCosTheta) // Light must face the pixel (within Theta)
    {
        // Pixel is in lit area. Find out if it's in shadow using 2x2 percentage closest filtering

        //transform from RT space to texture space.
        float2 ShadowTexC = 0.5 * psin.vPosLight.xy / psin.vPosLight.w + float2(0.5, 0.5);
        ShadowTexC.y = 1.0f - ShadowTexC.y;

        // transform to texel space
        float2 texelpos = SHADOW_SIZE * ShadowTexC;
        
        // Determine the lerp amounts           
        float2 lerps = frac(texelpos);

        //read in bilerp stamp, doing the shadow checks
        float sourcevals[4];
        sourcevals[0] = (tex2D(g_samShadow, ShadowTexC) + SHADOW_EPSILON < psin.vPosLight.z / psin.vPosLight.w)? 0.0f: 1.0f;  
        sourcevals[1] = (tex2D(g_samShadow, ShadowTexC + float2(1.0/SHADOW_SIZE, 0)) + SHADOW_EPSILON < psin.vPosLight.z / psin.vPosLight.w)? 0.0f: 1.0f;  
        sourcevals[2] = (tex2D(g_samShadow, ShadowTexC + float2(0, 1.0/SHADOW_SIZE)) + SHADOW_EPSILON < psin.vPosLight.z / psin.vPosLight.w)? 0.0f: 1.0f;  
        sourcevals[3] = (tex2D(g_samShadow, ShadowTexC + float2(1.0/SHADOW_SIZE, 1.0/SHADOW_SIZE)) + SHADOW_EPSILON < psin.vPosLight.z / psin.vPosLight.w)? 0.0f: 1.0f;  
        
        // lerp between the shadow values to calculate our light amount
        float LightAmount = lerp(lerp(sourcevals[0], sourcevals[1], lerps.x),
                                 lerp(sourcevals[2], sourcevals[3], lerps.x),
                                 lerps.y);
        // Light it
        Diffuse = (saturate(dot(-vLight, normalize(psin.vNormal))) * LightAmount * (1 - g_vLightAmbient) + g_vLightAmbient) * g_vMaterial;
    } 
    else
    {
        Diffuse = g_vLightAmbient * g_vMaterial;
    }

    return tex2D(g_samScene, psin.Tex) * Diffuse;
}