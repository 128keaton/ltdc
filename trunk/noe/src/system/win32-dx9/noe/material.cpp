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
#include <noe/material.h>
#include <noe/effect/effect.h>

namespace noe
{

//-----------------------------------------------------------------------------
/**
 * Default constructor
 */
Material::Material() : INITIALIZER_LIST 
{ 
	Initialize(); 
	ResetTexture(); 
}

//-----------------------------------------------------------------------------
/**
 * Constructor material and add the given texture
 * @param          tex                 Pointer to a texture interface.
 */
Material::Material(Texture* tex) : INITIALIZER_LIST 
{ 
	Initialize(); 
	ResetTexture(); 
	SetTexture(0, tex); 
}

//-----------------------------------------------------------------------------
/**
 * Initialize default parameters.
 */
void Material::Initialize() 
{
	ZeroMemory(&m_Data, sizeof(m_Data));
	SetDiffuse(1.0f, 1.0f, 1.0f, 1.0f);	// mul
	SetAmbient(1.0f, 1.0f, 1.0f);		// mul
	SetSpecular(1.0f, 1.0f, 1.0f);		// mul
	SetEmissive(0.0f, 0.0f, 0.0f);		// add
	SetPower(100.0f);
	SetBlendMode(BLEND_NO);
	SetCullMode(CULL_NONE);
	SetFillMode(FILL_SOLID);
	SetZBias(0);
	SetZWrite(TRUE);
	SetSpecularEnable(FALSE);
}

//-----------------------------------------------------------------------------
/**
 * Set the material texture.
 * @param          tex                 Pointer to the texture to set.
 */
void Material::SetTexture(Texture* tex/*=NULL*/)
{ 
	SetTexture(0, tex); 
}

//-----------------------------------------------------------------------------
/**
 * Set the material texture at a given stage.
 * @param          stage               Stage where set the texture (between 0 and noe::Material::NUM_MAX-1).
 * @param          tex                 Pointer to the texture to set.
 */
void Material::SetTexture(u32 stage, Texture* tex/*=NULL*/)
{
	DBG_ASSERT(stage < NUM_MAX);

	if(m_TexNum < (stage + 1))
		m_TexNum = scast<u16>(stage + 1);

	m_Texture[stage] = tex;
}

//-----------------------------------------------------------------------------
/**
 * Add a texture into the list.
 * @param          tex                 Pointer to the texture to set.
 * @return         The stage where the texture was added.
 */
i32 Material::AddTexture(Texture* tex/*=NULL*/)
{
	DBG_ASSERT(m_TexNum < NUM_MAX);

	m_Texture[m_TexNum] = tex;
	return m_TexNum++;
}

//-----------------------------------------------------------------------------
/**
 * Reset the texture list.
 */
void Material::ResetTexture()
{
	ZeroMemory(m_Texture, sizeof(m_Texture));
	m_TexNum = 0;
}

//-----------------------------------------------------------------------------
/**
 * Set the number of texture.
 * @warning This function don't reset pointer into the list
 * @param          num                 Number of texture into the material
 */
void Material::SetTextureNumber(i32 num) 
{
	m_TexNum = scast<u16>(num);
}

//-----------------------------------------------------------------------------
/**
 * Get the number of texture.
 * @return         Number of texture into the material
 */
i32 Material::GetTextureNumber() const 
{ 
	return m_TexNum; 
}

//-----------------------------------------------------------------------------
/**
 * Get a given texture interface.
 * @param          stage               The given texture stage (default: 0, first).
 * @return         Pointer to texture interface.
 */
Texture* Material::GetTexture(i32 stage/*=0*/) // read/write
{ 
	DBG_ASSERT(stage < NUM_MAX);
	
	return m_Texture[stage]; 
}

//-----------------------------------------------------------------------------
/**
 * Get a given texture interface.
 * @param          stage               The given texture stage (default: 0, first).
 * @return         Pointer to texture interface.
 */
const Texture* Material::GetTexture(i32 stage/*=0*/) const // read only
{ 
	DBG_ASSERT(stage < NUM_MAX);

	return m_Texture[stage]; 
}

//-----------------------------------------------------------------------------
/**
 * Apply texture data to the rendering process
 */
void Material::Render() const
{
	// Set culling mode
	RenderDevice->SetRenderState(D3DRS_CULLMODE, m_CullMode);
	RenderDevice->SetRenderState(D3DRS_FILLMODE, m_FillMode);
	RenderDevice->SetRenderState(D3DRS_DEPTHBIAS, m_ZBias);
	RenderDevice->SetRenderState(D3DRS_ZWRITEENABLE, m_ZWrite);

	// Set alpha blendin mode
	if(m_BlendMode >= 0)
	{
		RenderDevice->SetRenderState(D3DRS_ALPHABLENDENABLE, TRUE);
		RenderDevice->SetRenderState(D3DRS_BLENDOP,          s_BlendModes[m_BlendMode].opp);
		RenderDevice->SetRenderState(D3DRS_SRCBLEND,         s_BlendModes[m_BlendMode].src);
		RenderDevice->SetRenderState(D3DRS_DESTBLEND,        s_BlendModes[m_BlendMode].dst);
	}
	else
	{
		RenderDevice->SetRenderState(D3DRS_ALPHABLENDENABLE, FALSE);
	}
}

}; // namespace noe