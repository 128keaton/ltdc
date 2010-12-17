/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Texture manager
 * @file           texture.h
 * @package        noe
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

#pragma once

// dx9
#include <d3d9.h>
#include <d3dx9tex.h>
// noe
#include <noe/noe.h>
#include <noe/data.h>
#include <noe/render.h>
#include <noe/math/vector4.h>

namespace noe
{

typedef IDirect3DTexture9 TextureInterface;
typedef D3DXIMAGE_INFO    TextureInfo;

//-----------------------------------------------------------------------------
/**
 * Texture base class.
 */
class BaseTexture
{
protected:

public:

	BaseTexture() {}

	virtual BOOL Load(const Data* data) = 0;
	virtual BOOL Save() = 0;
	
	virtual u32 GetWidth()  const = 0;
	virtual u32 GetHeight() const = 0;
	virtual u32 GetBPP()    const = 0;
};

enum TILING_MODE
{
	TILING_WRAP						= D3DTADDRESS_WRAP, // Tile the texture at every integer junction. For example, for u values between 0 and 3, the texture is repeated three times; no mirroring is performed.
	TILING_MIRROR					= D3DTADDRESS_MIRROR, // Similar to TILING_MIRROR, except that the texture is flipped at every integer junction. For u values between 0 and 1, for example, the texture is addressed normally; between 1 and 2, the texture is flipped (mirrored); between 2 and 3, the texture is normal again, and so on.
	TILING_CLAMP					= D3DTADDRESS_CLAMP, // Texture coordinates outside the range [0.0, 1.0] are set to the texture color at 0.0 or 1.0, respectively.
	TILING_BORDER					= D3DTADDRESS_BORDER, // Texture coordinates outside the range [0.0, 1.0] are set to the border color.
	TILING_MIRRORONCE				= D3DTADDRESS_MIRRORONCE,

	TILING_MODE_NUM,
	TILING_DEFAULT					= TILING_WRAP,
};

enum TEX_FUNCTION
{
	TEX_DIFFUSE				= 0, //PS_TEX_DIFFUSE,
	TEX_OPACITY				= 1, //PS_TEX_OPACITY,
	TEX_ADD					= 2, //PS_TEX_ADD,
	TEX_MODULATE2X			= 3, //PS_TEX_MODULATE2X,
	TEX_MODULATE4X			= 4, //PS_TEX_MODULATE4X,
	TEX_ADDSIGNED			= 5, //PS_TEX_ADDSIGNED,
	TEX_SUBTRACT			= 6, //PS_TEX_SUBTRACT,
	
	TEX_FUNCTION_NUM,
	TEX_FUNCTION_DEFAULT	= TEX_DIFFUSE,
};

enum MAPPING_MODE
{
	MAPPING_NONE						= 0, //TEXGEN_TYPE_NONE,
	MAPPING_UV							= MAPPING_NONE,
	MAPPING_CAMERASPACEPOSITION			= 1, //TEXGEN_TYPE_CAMERASPACEPOSITION,
	MAPPING_CAMERASPACENORMAL			= 2, //TEXGEN_TYPE_CAMERASPACENORMAL,
	MAPPING_CAMERASPACEREFLECTIONVECTOR	= 3, //TEXGEN_TYPE_CAMERASPACEREFLECTIONVECTOR,
	
	MAPPING_MODE_NUM,
	MAPPING_DEFAULT						= MAPPING_NONE,
};

//-----------------------------------------------------------------------------
/**
 * Texture class.
 */
class Texture : public BaseTexture
{
protected:

	TextureInterface* m_D3DTexture; ///< Texture interface
	TextureInfo       m_Info;       ///< Texture information
	Vector4           m_Modifier;   ///< UV offset and scale (u_offset | v_offset | u_scale | v_scale).
	u8                m_TilingU;    ///< U tiling value.
	u8                m_TilingV;    ///< V tiling value.
	u16               m_UVMapping;  ///< UV mapping mode (@see noe::MAPPING_MODE).
	u16               m_Function;   ///< Texture function (@see noe::TEX_FUNCTION).
	union
	{
		u32 value;
		struct
		{
			u32 create : 1;
			u32 no_mipmap : 1;
		};
	} m_Flag;                       ///< Texture flags.

	u16 FormatToBpp(u32 format);    ///< Convert texture format to bits number.

#define INITIALIZER_LIST \
	m_D3DTexture(NULL), \
	m_Modifier(0.0f, 0.0f, 1.0f, 1.0f), \
	m_TilingU(TILING_DEFAULT), \
	m_TilingV(TILING_DEFAULT), \
	m_UVMapping(TEX_FUNCTION_DEFAULT), \
	m_Function(MAPPING_DEFAULT)

public:

	Texture();
	Texture(const Data* data);
	~Texture();

	void SetOffset(f32 u, f32 v) { m_Modifier.x = u; m_Modifier.y = v; } ///< Set UV offset values.
	void SetScale(f32 u, f32 v) { m_Modifier.z = u; m_Modifier.w = v; }  ///< Set UV scale values.
	const f32* GetOffset() const { return &m_Modifier.x; }               ///< Get UV offset values.
	const f32* GetScale() const { return &m_Modifier.z; }                ///< get UV sacle values.
	const Vector4 &GetUVModifier() const { return m_Modifier; }          ///< Get UV offset and scale values.

	void SetTiling(u32 ut, u32 vt) { m_TilingU = scast<u8>(ut); m_TilingV = scast<u8>(vt); } ///< Set UV tiling mode.
	u32  GetTilingU() const { return m_TilingU; } ///< Get U tiling mode.
	u32  GetTilingV() const { return m_TilingV; } ///< Get V tiling mode.

	void SetUVMapping(u16 in) { m_UVMapping = in; }   ///< Set UV mapping mode.
	u16  GetUVMapping() const { return m_UVMapping; } ///< Get UV mapping mode.

	void SetMipmap(BOOL b) { m_Flag.no_mipmap = b ? 0 : 1; } ///< Set mipmap mode.
	BOOL GetMipmap() const { return m_Flag.no_mipmap == 0; } ///< Get mipmap mode.

	void SetFunction(u16 in) { m_Function = in; }   ///< Set texture function.
	u16 GetFunction() const { return  m_Function; } ///< Get texture function.

	BOOL Load(const Data* data);  ///< Initialize texture interface from data in memory.
	BOOL Save() { return FALSE; } ///< Save texture. <i>Not yet implemented.</i>

	u32 GetWidth()  const { return m_Info.Width; }  ///< Get texture width (texture must beeing initialized first).
	u32 GetHeight() const { return m_Info.Height; } ///< Get texture height (texture must beeing initialized first).
	u32 GetBPP()    const { return m_Info.Depth; }  ///< Get texture depth (bpp) (texture must beeing initialized first).

void SetInterface(TextureInterface* t) { DBG_ASSERT(!m_Flag.create); m_D3DTexture = t; }

	virtual void Render(u32 stage=0) const;
};

}; // namespace noe