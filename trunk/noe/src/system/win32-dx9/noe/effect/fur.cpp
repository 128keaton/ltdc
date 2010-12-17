/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Fur effect
 * @file           fur.cpp
 * @package        noe.effect
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

// std
#include <iostream>
// DirectX
#include <d3d9.h>
#include <d3dx9.h>
// noe
#include <noe/noe.h>
#include <noe/math.h>
#include <noe/render.h>
#include <noe/color.h>
#include <noe/effect/fur.h>

namespace noe
{

//-----------------------------------------------------------------------------
/** 
 * Constructor
 */
FurEffect::FurEffect()
{
	File pso("noe/shader/fur.pso");
	File vso("noe/shader/fur.vso");
	m_Shader.Create(vso, pso, g_DefaultElements);
}

//-----------------------------------------------------------------------------
/** 
 * Destructor
 */
FurEffect::~FurEffect()
{
	Release();
}

//-----------------------------------------------------------------------------
/**
 * Release effect
 */
void FurEffect::Release()
{
	loop(layer, scast<i32>(m_Textures.size()))
		m_Textures[layer]->Release();
	m_Textures.clear();
}

/// Data acces helper macro
#define DATA(layer, x, y) data[(m_Config.width*m_Config.width*(layer)) + (m_Config.width*(y)) + (x)]

//-----------------------------------------------------------------------------
/**
 * Create textures and initialize effect
 * @param          config              Pointer to the effect configuration data
 */
void FurEffect::Create(const Config* config)
{
	DBG_ASSERT(config != NULL);

	m_Config = *config;

	if(!m_Config.texture)
		m_Config.texture = m_Config.layers;

	// Create data table and initialize all data with alpha 0%
	Color clear_color = m_Config.color;
	clear_color.a = 0;
	std::vector<Color> data(m_Config.texture * m_Config.width * m_Config.width, clear_color);

	// This is slightly different than above, we now do it so that
	// as we move to the outer layers, we have less and less strands of hair
	loop(layer, m_Config.texture)
	{	
		f32 length = 1.0f - scast<f32>(layer) / scast<f32>(m_Config.texture); // 0.0f to 1.0f
		i32 density = scast<i32>(scast<f32>(m_Config.density) * 6.0f * length);
		f32 scale = Max(length, 0.9f);
		srand(28382);
		loop(i, m_Config.density)
		{
			i32 x = Random(m_Config.width);
			i32 y = Random(m_Config.width);

			Color c;
			c.r = Random(m_Config.color.r, m_Config.color2.r);
			c.g = Random(m_Config.color.g, m_Config.color2.g);
			c.b = Random(m_Config.color.b, m_Config.color2.b);
			
			DATA(layer, x, y).a = scast<u8>(255.0f * length);
			DATA(layer, x, y).r = scast<u8>(scast<f32>(c.r) * scale);
			DATA(layer, x, y).g = scast<u8>(scast<f32>(c.g) * scale);
			DATA(layer, x, y).b = scast<u8>(scast<f32>(c.b) * scale);
		}
	}

	// Create all the textures
	m_Textures.resize(m_Config.texture, NULL);
	loop(layer, m_Config.texture)
	{
		HRESULT hr = D3DXCreateTexture(
			RenderDevice,
			m_Config.width,
			m_Config.width,
			1,
			0,
			D3DFMT_A8R8G8B8,
			D3DPOOL_MANAGED,
			&m_Textures[layer]
		);

		// Initialize texture's data
		D3DLOCKED_RECT d3dlr;
		hr = m_Textures[layer]->LockRect(0, &d3dlr, NULL, D3DLOCK_DISCARD);
		memcpy(d3dlr.pBits, &DATA(layer, 0, 0), sizeof(DWORD) * m_Config.width * m_Config.width);
		m_Textures[layer]->UnlockRect (0);
	}
}

//-----------------------------------------------------------------------------
/**
 * Get texture interface
 * @param          layer               Virtual layer number (between 0 and 1).
 * @return         DirectX texture interface.
 */
IDirect3DTexture9* FurEffect::GetTexture(f32 layer) const
{
	i32 temp = (i32)floor(m_Config.texture * Max(0.0f, Min(0.9999f, layer)));

	return m_Textures[temp];
}

//-----------------------------------------------------------------------------
/**
 * Set the View-World transformation matrix.
 * @param          mat                 View-World transformation matrix.
 * @deprecated     Not used.
 */
void FurEffect::SetMatrixW(const Matrix4& mat)
{ 
	RenderDevice->SetVertexShaderConstantF(V_WORLD, rcast<const FLOAT*>(&(mat)), 4);
}

//-----------------------------------------------------------------------------
/**
 * Set the View-World-Proj transformation matrix.
 * @param          mat                 View-World-Proj transformation matrix.
 * @deprecated     Not used.
 */
void FurEffect::SetMatrixWVP(const Matrix4& mat) 
{ 
	RenderDevice->SetVertexShaderConstantF(V_WORLDVIEWPROJ, rcast<const FLOAT*>(&(mat)), 4);
}

//-----------------------------------------------------------------------------
/**
 * Set Fur effect paramters.
 * @param          layer               Virtual layer number (between 0 and 1).
 */
void FurEffect::SetParam(f32 layer) 
{ 
	Vector4 v;
	v.x = m_Config.scale_u;
	v.y = m_Config.scale_v;
	v.z = m_Config.length;
	v.w = layer;
	RenderDevice->SetVertexShaderConstantF(20, rcast<const FLOAT*>(&(v)), 1);
	RenderDevice->SetPixelShaderConstantF (20, rcast<const FLOAT*>(&(v)), 1);
}

//-----------------------------------------------------------------------------
/**
 * Set light direction.
 * @param          dir                 Light direction
 * @deprecated     Not used.
 */
void FurEffect::SetLightDir(const Vector4& dir) 
{ 
	RenderDevice->SetPixelShaderConstantF(21, rcast<const FLOAT*>(&(dir)), 1);
	Vector4 v(0.3f, 0.3f, 0.3f, 0.0f);
	RenderDevice->SetPixelShaderConstantF(22, rcast<const FLOAT*>(&(v)), 1);
}

//-----------------------------------------------------------------------------
/**
 * Draw process
 * @param          context             Draw context pointer
 * @param          group               Material-group pointer
 */
void FurEffect::Draw(DrawContext* context, const MaterialGroup* group)
{			   
	if(context->layer == Render::LAYER_SMAP)
		if(context->pass == Render::PASS_SHADOW)
			return; // don't cast shadow

	RenderDevice->SetRenderState(D3DRS_ALPHABLENDENABLE, TRUE);
	RenderDevice->SetRenderState(D3DRS_BLENDOP,          D3DBLENDOP_ADD);
	RenderDevice->SetRenderState(D3DRS_SRCBLEND,         D3DBLEND_SRCALPHA);//D3DBLEND_ONE);
	RenderDevice->SetRenderState(D3DRS_DESTBLEND,        D3DBLEND_INVSRCALPHA);

	RenderDevice->SetRenderState(D3DRS_ALPHATESTENABLE,  TRUE);
	RenderDevice->SetRenderState(D3DRS_ALPHAREF,         0x0F);
	RenderDevice->SetRenderState(D3DRS_ALPHAFUNC,        D3DCMP_GREATER);

	RenderDevice->SetRenderState(D3DRS_ZWRITEENABLE,     FALSE);

	RenderDevice->SetSamplerState(0, D3DSAMP_MINFILTER, D3DTEXF_LINEAR);
	RenderDevice->SetSamplerState(0, D3DSAMP_MAGFILTER, D3DTEXF_LINEAR);
	RenderDevice->SetSamplerState(0, D3DSAMP_MIPFILTER, D3DTEXF_LINEAR);

	/*Vector3 dir(0.5f, 1.0f, -1.0f);
	dir.Normalize();
	SetLightDir(dir);*/

	// Set shader if needed
	m_Shader.Apply(); // Set VertexFormat, VertexShader & PixelShader

	TextureInterface *tex, *last_tex = NULL;

	loop(i, m_Config.layers)
	{
		f32 layer = scast<f32>(i+1) / scast<f32>(m_Config.layers);

		// Set variables in the shader
		SetParam(layer);

		// Check for texture change
		tex = GetTexture(layer);
		if(tex != last_tex)
		{
			RenderDevice->SetTexture(0, tex);
			last_tex = tex;
		}

		// Mesh
		loop(p, group->GetNumber())
		{
			const Mesh* mesh = group->GetMesh(p);

			// Set vertex buffer
			RenderDevice->SetStreamSource(0, mesh->GetVertexBuffer(), 0, mesh->GetVertexSize());				

			if(mesh->UseIndexBuffer()) // Render using index-buffer
			{
				loop(ib, mesh->GetPrimitiveNumber())
				{
					RenderDevice->SetIndices(mesh->GetIndexBuffer(ib));
					RenderDevice->DrawIndexedPrimitive((D3DPRIMITIVETYPE)mesh->GetType(ib), 0, 0, 0, 0, mesh->GetNumber(ib));
				}
			}
			else // Render without index-buffer
			{
				DBG_ASSERT(mesh->GetPrimitiveNumber() == 1);
				RenderDevice->SetIndices(NULL);
				RenderDevice->DrawPrimitive((D3DPRIMITIVETYPE)mesh->GetType(), 0, mesh->GetNumber());
			}
		}
	}

	RenderInstance.LastTexture = NULL; // reset last tecture backup
	RenderInstance.LastShader  = NULL;
	RenderInstance.LastMaterial = NULL;
}




} // namespace noe