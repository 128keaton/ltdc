/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Material manager
 * @file           material.cpp
 * @package        noe
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

#pragma once

// noe
#include <noe/noe.h>
#include <noe/render.h>
#include <noe/texture.h>

namespace noe
{

class Effect; ///< The material effect. @see "noe/effect/effect.h"

//-----------------------------------------------------------------------------
/// Blending mode
enum BLEND_MODE
{
	BLEND_UNKNOW = -2,
	BLEND_NO = -1,
	
	BLEND_LINEAR = 0,
	BLEND_NORMAL = BLEND_LINEAR,
	BLEND_ADDITIVE,
	BLEND_SCREEN = BLEND_ADDITIVE,
	BLEND_MULTIPLY,
	BLEND_OVERLAY,
	BLEND_BLEACH,
	BLEND_GHOST,
	BLEND_SATURATE,
	BLEND_COLOR,
	BLEND_INVCOLOR,
};

//-----------------------------------------------------------------------------
/// Culling mode
enum CULL_MODE
{
	CULL_NONE = D3DCULL_NONE,
	CULL_CW   = D3DCULL_CW,
	CULL_CCW  = D3DCULL_CCW,
};

//-----------------------------------------------------------------------------
/// Polygon fill mode
enum FILL_MODE
{
	FILL_POINT     = D3DFILL_POINT,
	FILL_WIREFRAME = D3DFILL_WIREFRAME,
	FILL_SOLID     = D3DFILL_SOLID,
};
	
//-----------------------------------------------------------------------------
/// Blending modes' structure
struct BlendSetting
{
	i32 opp;
	i32 src;
	i32 dst;
};

//-----------------------------------------------------------------------------
/// Blending modes' settings
static const BlendSetting s_BlendModes[] = 
{
	{ D3DBLENDOP_ADD,         D3DBLEND_SRCALPHA,     D3DBLEND_INVSRCALPHA }, // Normal        SA      + D~A
	{ D3DBLENDOP_ADD,         D3DBLEND_SRCALPHA,     D3DBLEND_ONE         }, // Screen        SA      + D
	{ D3DBLENDOP_ADD,         D3DBLEND_SRCALPHA,     D3DBLEND_SRCCOLOR    }, // Multiply      SA      + DS
	{ D3DBLENDOP_ADD,         D3DBLEND_DESTCOLOR,    D3DBLEND_SRCALPHA    }, // Overlay       SD      + DA
	{ D3DBLENDOP_ADD,         D3DBLEND_ONE,          D3DBLEND_SRCALPHA    }, // Bleach        S       + DA
	{ D3DBLENDOP_ADD,         D3DBLEND_INVDESTCOLOR, D3DBLEND_SRCALPHA    }, // Ghost         S~D     + DA
	{ D3DBLENDOP_ADD,         D3DBLEND_DESTCOLOR,    D3DBLEND_SRCCOLOR    }, // Saturate      SD      + DS
	{ D3DBLENDOP_ADD,         D3DBLEND_SRCCOLOR,     D3DBLEND_INVSRCCOLOR }, // Color         Cs * 1  + Cd * ~S
	{ D3DBLENDOP_REVSUBTRACT, D3DBLEND_SRCCOLOR,     D3DBLEND_ONE         }, // Inverse Color Cd * Cs - Cs * 1
};

//-----------------------------------------------------------------------------
/**
 * Material class.
 */
class Material
{
protected:

	static const i32 NUM_MAX = 8; ///< Maximum number of texture per material

	D3DMATERIAL9 m_Data;             ///< Material data. Diffuse, specular, ambient color, etc. @see D3DMATERIAL9
	Texture*     m_Texture[NUM_MAX]; ///< List of material's texture. @todo Use a std::vector to handle a pre-allocated list.
	u16          m_TexNum;           ///< Number of texture. @todo Use a std::vector to handle a pre-allocated list.
	i16          m_BlendMode;        ///< Blending mode. @see noe::BLEND_MODE
	i16          m_CullMode;         ///< Face culling mode. @see noe::BLEND_MODE
	i16          m_FillMode;         ///< Render fill mode. @see noe::CULL_MODE
	i16          m_ZBias;            ///< Z-bias
	BOOL         m_ZWrite;           ///< Z-Buffer write toggle. @todo Use a bit field for all flags
	BOOL         m_SpecularEnable;   ///< Enable specular lightning. @todo Use a bit field for all flags
	Effect*      m_Effect;           ///< Pointer to material's special effect ('fur', etc.)

#undef  INITIALIZER_LIST
#define INITIALIZER_LIST \
	m_TexNum(0), \
	m_BlendMode(BLEND_UNKNOW), \
	m_CullMode(CULL_NONE), \
	m_FillMode(FILL_SOLID), \
	m_ZBias(0), \
	m_ZWrite(TRUE), \
	m_SpecularEnable(FALSE), \
	m_Effect(NULL)

public:

	// Constructor
	Material(); // Default constructor
	Material(Texture* tex); // Constructor material and add the given texture
	
	void Initialize(); // Initialize default parameters.

	// Diffuse color functions
	void SetDiffuse(Vector4 rgba) { m_Data.Diffuse = *rcast<D3DXCOLOR*>(&rgba); } ///< Set diffuse color.
	void SetDiffuse(f32 r, f32 g, f32 b, f32 a) { m_Data.Diffuse.r = r; m_Data.Diffuse.g = g; m_Data.Diffuse.b = b; m_Data.Diffuse.a = a; } ///< Set diffuse color.
	const Vector4 &GetDiffuse() const { return *rcast<const Vector4*>(&m_Data.Diffuse); } ///< Get diffuse color.
	
	// Ambient color functions
	void SetAmbient(Vector4 rgba) { m_Data.Ambient = *rcast<D3DXCOLOR*>(&rgba); } ///< Set ambient color.
	void SetAmbient(f32 r, f32 g, f32 b) { m_Data.Ambient.r = r; m_Data.Ambient.g = g; m_Data.Ambient.b = b; } ///< Set ambient color.
	const Vector4 &GetAmbient() const { return *rcast<const Vector4*>(&m_Data.Ambient); } ///< Get ambient color.
	
	// Specular color functions
	void SetSpecular(Vector4 rgba) { m_Data.Specular = *rcast<D3DXCOLOR*>(&rgba); } ///< Set specular color.
	void SetSpecular(f32 r, f32 g, f32 b) { m_Data.Specular.r = r; m_Data.Specular.g = g; m_Data.Specular.b = b; } ///< Set specular color.
	const Vector4 &GetSpecular() const { return *rcast<const Vector4*>(&m_Data.Specular); } ///< Get specular color.

	// Emissive color functions
	void SetEmissive(Vector4 rgba) { m_Data.Emissive = *rcast<D3DXCOLOR*>(&rgba); } ///< Set emmissive color.
	void SetEmissive(f32 r, f32 g, f32 b) { m_Data.Emissive.r = r; m_Data.Emissive.g = g; m_Data.Emissive.b = b; } ///< Set emmissive color.
	const Vector4 &GetEmissive() const { return *rcast<const Vector4*>(&m_Data.Emissive); } ///< Get emmissive color.

	f32  GetPower() const { return m_Data.Power; } ///< Get the material power. @return power.
	void SetPower(f32 in) { m_Data.Power = in; }   ///< Set the material power. @param in power.

	i16  GetBlendMode() const { return m_BlendMode; } ///< Get the material blending mode. @return blending mode.
	void SetBlendMode(i16 in) { m_BlendMode = in; }	  ///< Set the material blending mode. @param in blending mode.

	i16  GetCullMode() const { return m_CullMode; } ///< Get the material culling mode. @return culling mode.
	void SetCullMode(i16 in) { m_CullMode = in; }	///< Set the material culling mode. @param in culling mode.

	i16  GetFillMode() const { return m_FillMode; } ///< Get the material fill mode. @return fill mode.
	void SetFillMode(i16 in) { m_FillMode = in; }	///< Set the material fill mode. @param in fill mode.

	i16  GetZBias() const { return m_ZBias; } ///< Get the material z-bias. @return z-bias.
	void SetZBias(i16 in) { m_ZBias = in; }	  ///< Set the material z-bias. @param in z-bias.

	BOOL GetZWrite() const { return m_ZWrite; } ///< Get the material z-write mode. @return z-write mode.
	void SetZWrite(BOOL in) { m_ZWrite = in; }	///< Set the material z-write mode. @param in z-write mode.

	BOOL GetSpecularEnable() const { return m_SpecularEnable; } ///< Get the material specular state. @return Specular state.
	void SetSpecularEnable(BOOL in) { m_SpecularEnable = in; }	///< Set the material specular state. @param in Specular state.

	Effect* GetEffect() const { return m_Effect; } ///< Get the material effect. @return Effect pointer.
	void    SetEffect(Effect* e) { m_Effect = e; } ///< Set the material effect. @param e Effect pointer.


	void SetTexture(Texture* tex = NULL);            // Set the material texture.
	void SetTexture(u32 stage, Texture* tex = NULL); // Set the material texture at a given stage.
	i32  AddTexture(Texture* tex = NULL);            // Add a texture into the list.
	void ResetTexture();                             // Reset the texture list.
	void SetTextureNumber(i32 num);                  // Set the number of texture.
	i32  GetTextureNumber() const;                   // Get the number of texture.
	Texture* GetTexture(i32 stage = 0);              // Get a given texture interface.
	const Texture* GetTexture(i32 stage = 0) const;  // Get a given texture interface.

	void Render() const; // Apply texture data to the rendering process

	/// Get the default material
	static Material& Default()
	{
		static Material DefaultMaterial;
		return DefaultMaterial;
	}
};

}; // namespace noe