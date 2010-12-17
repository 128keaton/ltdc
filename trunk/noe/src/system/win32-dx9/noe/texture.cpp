/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Texture manager
 * @file           texture.cpp
 * @package        noe
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

#pragma once

// noe
#include <noe/noe.h>
#include <noe/texture.h>

namespace noe
{

//-----------------------------------------------------------------------------
/**
 * Convert texture format to bits number.
 * @param		format		The inmput format (D3DFMT)
 * @return						The number of bits
 */
u16 Texture::FormatToBpp(u32 format)
{
	switch(format)
	{
		case D3DFMT_D16_LOCKABLE:	return 16;
		case D3DFMT_D32:				return 32;
		case D3DFMT_D15S1:			return 16;
		case D3DFMT_D24S8:			return 32;
		case D3DFMT_D24X8:			return 32;
		case D3DFMT_D24X4S4:			return 32;
		case D3DFMT_D32F_LOCKABLE:	return 32;
		case D3DFMT_D24FS8:			return 32;
		case D3DFMT_D16:				return 16;
		case D3DFMT_VERTEXDATA:		return 0;
		case D3DFMT_INDEX16:			return 16;
		case D3DFMT_INDEX32:			return 32;
		case D3DFMT_DXT1:				return 16;
		case D3DFMT_DXT2:				return 16;
		case D3DFMT_DXT3:				return 16;
		case D3DFMT_DXT4:				return 16;
		case D3DFMT_DXT5:				return 16;
		case D3DFMT_R16F:				return 16;
		case D3DFMT_G16R16F:			return 32;
		case D3DFMT_A16B16G16R16F:	return 64;
		case D3DFMT_R32F:				return 32;
		case D3DFMT_G32R32F:			return 64;
		case D3DFMT_A32B32G32R32F:	return 128;
		case D3DFMT_L6V5U5:			return 16;
		case D3DFMT_X8L8V8U8:		return 32;
		case D3DFMT_A2W10V10U10:	return 32;
		case D3DFMT_V8U8:				return 16;
		case D3DFMT_Q8W8V8U8:		return 32;
		case D3DFMT_V16U16:			return 32;
		case D3DFMT_Q16W16V16U16:	return 64;
		case D3DFMT_CxV8U8:			return 16;
		case D3DFMT_R8G8B8:			return 24;
		case D3DFMT_A8R8G8B8:		return 32;
		case D3DFMT_X8R8G8B8:		return 32;
		case D3DFMT_R5G6B5:			return 16;
		case D3DFMT_X1R5G5B5:		return 16;
		case D3DFMT_A1R5G5B5:		return 16;
		case D3DFMT_A4R4G4B4:		return 16;
		case D3DFMT_R3G3B2:			return 8;
		case D3DFMT_A8:				return 8;
		case D3DFMT_A8R3G3B2:		return 16;
		case D3DFMT_X4R4G4B4:		return 16;
		case D3DFMT_A2B10G10R10:	return 32;
		case D3DFMT_A8B8G8R8:		return 32;
		case D3DFMT_X8B8G8R8:		return 32;
		case D3DFMT_G16R16:			return 32;
		case D3DFMT_A2R10G10B10:	return 32;
		case D3DFMT_A16B16G16R16:	return 64;
		case D3DFMT_A8P8:				return 16;
		case D3DFMT_P8:				return 8;
		case D3DFMT_L8:				return 8;
		case D3DFMT_L16:				return 16;
		case D3DFMT_A8L8:				return 16;
		case D3DFMT_A4L4:				return 8;
	}
	return 0;
}


//-----------------------------------------------------------------------------
/**
 *	Default constructor
 */
Texture::Texture() : INITIALIZER_LIST { m_Flag.value = 0; }

//-----------------------------------------------------------------------------
/**
 *	Data load constructor
 *	@param		data			The texture data to use.
 */
Texture::Texture(const Data *data) : INITIALIZER_LIST { m_Flag.value = 0; Load(data); }

//-----------------------------------------------------------------------------
/**
 * Destructor
 */
Texture::~Texture() 
{
	if(m_Flag.create)
	{
		if(m_D3DTexture) 
			m_D3DTexture->Release(); 
	}
}

//-----------------------------------------------------------------------------
/**
 *	Create texture interface from file
 *	@param		data			The texture data to use.
 *	@return						TRUE if creation succed.
 */
BOOL Texture::Load(const Data* data) 
{
	HRESULT hr = D3DXCreateTextureFromFileInMemoryEx(
		RenderDevice,		// Pointer to an IDirect3DDevice9 interface.
		data->Pointer(),   // Pointer to the file in memory from which to create the texture.
		scast<UINT>(data->Size()),		// Size of the file in memory, in bytes.
		D3DX_DEFAULT,		// Width in pixels.
		D3DX_DEFAULT,		// Height, in pixels.
		D3DX_DEFAULT,		// Number of mip levels requested.
		0,						// Usage.
		D3DFMT_UNKNOWN,	// Pixel format for the texture.
		D3DPOOL_DEFAULT,	// Memory class into which the texture should be placed.
		D3DX_DEFAULT,		// Flags controlling how the image is filtered. 
		D3DX_DEFAULT,		// Flags controlling how the image is filtered.
		0,						// Value to replace with transparent black.
		&m_Info,				// Description of the data in the source image file.
		NULL,					// Pointer to palette.
		&m_D3DTexture );	// pointer to an IDirect3DTexture9 interface.
	
	m_Flag.create = 1;

	return hr == D3D_OK;
}

//-----------------------------------------------------------------------------
/**
 * Set the render paramter for the texture.
 * @param		stage			The stage number (default: 0).
 */
void Texture::Render(u32 stage/*=0*/) const
{
	// Set the texture stage settings
	RenderDevice->SetSamplerState(stage, D3DSAMP_MINFILTER, D3DTEXF_LINEAR);
	RenderDevice->SetSamplerState(stage, D3DSAMP_MAGFILTER, D3DTEXF_LINEAR);
	RenderDevice->SetSamplerState(stage, D3DSAMP_MIPFILTER, D3DTEXF_LINEAR);

	// Set the clamp mode
	RenderDevice->SetSamplerState(stage, D3DSAMP_ADDRESSU, GetTilingU());
	RenderDevice->SetSamplerState(stage, D3DSAMP_ADDRESSV, GetTilingV());

	// Texture
	RenderDevice->SetTexture(stage, m_D3DTexture);
}

} // namespace noe