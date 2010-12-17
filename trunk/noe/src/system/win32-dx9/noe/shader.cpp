/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Shader manager
 * @file           shader.cpp
 * @package        noe
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

// dx9
#include <d3d9.h>
#include <d3d9types.h>
// noe
#include <noe/noe.h>
#include <noe/shader.h>

namespace noe
{

// Static member initialization
PixelShaderInterface*	Shader::DefaultPixelShader  = NULL;
VertexShaderInterface*	Shader::DefaultVertexShader = NULL;
Shader                  Shader::DefaultShader;
Shader                  Shader::BasicShader;

//-----------------------------------------------------------------------------
/**
 * Create vertex format 
 */
BOOL VertexFormat::Create(const D3DVERTEXELEMENT9* ve/* = g_DefaultElements*/)
{
	m_Size = 0;
	if(!ve)
		return FALSE;

	for(i32 i = 0; ve[i].Stream != 0xFF; i++)
	{
		switch(ve[i].Type)
		{
			case D3DDECLTYPE_FLOAT1:
			case D3DDECLTYPE_D3DCOLOR:
			case D3DDECLTYPE_UBYTE4:
			case D3DDECLTYPE_UBYTE4N:
			case D3DDECLTYPE_SHORT2:
			case D3DDECLTYPE_SHORT2N:
			case D3DDECLTYPE_USHORT2N:
			case D3DDECLTYPE_UDEC3:
			case D3DDECLTYPE_DEC3N:
			case D3DDECLTYPE_FLOAT16_2:
				m_Size += 4;
				break;
			case D3DDECLTYPE_FLOAT2:
			case D3DDECLTYPE_SHORT4:
			case D3DDECLTYPE_SHORT4N:
			case D3DDECLTYPE_USHORT4N:
			case D3DDECLTYPE_FLOAT16_4:
				m_Size += 8;
				break;
			case D3DDECLTYPE_FLOAT3:
				m_Size += 12;
				break;
			case D3DDECLTYPE_FLOAT4:
				m_Size += 16;
				break;
			default:
				break;
		}
	}
	HRESULT hr = RenderDevice->CreateVertexDeclaration(ve, &m_VertexDeclaration);
	return hr == S_OK;
}

//-----------------------------------------------------------------------------
/**
 * Create vertex format 
 */
BOOL VertexFormat::Create(s32 num, ...)
{
	D3DVERTEXELEMENT9* ve = new D3DVERTEXELEMENT9[num+1];

	va_list list;
	va_start(list, num);

	// Create the vertex data layout.
	s32 uv=0;
	s32 size=0;
	s32 cnt;
	for(cnt = 0; cnt<num; cnt++)
	{
		ve[cnt].Stream = 0;
		ve[cnt].Offset = scast<u16>(size);
		ve[cnt].Method = D3DDECLMETHOD_DEFAULT;
		switch(va_arg(list, int)) 
		{
			case VF_XYZ32:
				ve[cnt].Type = D3DDECLTYPE_FLOAT3;
				ve[cnt].Usage = D3DDECLUSAGE_POSITION;
				ve[cnt].UsageIndex = 0;
				size += 3 * sizeof(f32);
				break;
			case VF_XYZ16: 
				ve[cnt].Type = D3DDECLTYPE_FLOAT16_4;
				ve[cnt].Usage = D3DDECLUSAGE_POSITION;
				ve[cnt].UsageIndex = 0;
				size += 4 * 2;//sizeof(f16);
				break;
			case VF_XYZW32: 
				ve[cnt].Type = D3DDECLTYPE_FLOAT4;
				ve[cnt].Usage = D3DDECLUSAGE_POSITION;
				ve[cnt].UsageIndex = 0;
				size += 4 * sizeof(f32);
				break;
			case VF_XYZW16: 
				ve[cnt].Type = D3DDECLTYPE_FLOAT16_4;
				ve[cnt].Usage = D3DDECLUSAGE_POSITION;
				ve[cnt].UsageIndex = 0;
				size += 4 * 2;//sizeof(f16);
				break;
			case VF_NORMAL32: 
				ve[cnt].Type = D3DDECLTYPE_FLOAT3;
				ve[cnt].Usage = D3DDECLUSAGE_NORMAL;
				ve[cnt].UsageIndex = 0;
				size += 3 * sizeof(f32);
				break;
			case VF_NORMAL16: 
				ve[cnt].Type = D3DDECLTYPE_FLOAT16_4;
				ve[cnt].Usage = D3DDECLUSAGE_NORMAL;
				ve[cnt].UsageIndex = 0;
				size += 4 * 2;//sizeof(f16);
				break;
			case VF_PSIZE:
				ve[cnt].Type = D3DDECLTYPE_FLOAT1;
				ve[cnt].Usage = D3DDECLUSAGE_PSIZE;
				ve[cnt].UsageIndex = 0;
				size += sizeof(f32);
				break;
			case VF_DIFFUSE: 
				ve[cnt].Type = D3DDECLTYPE_D3DCOLOR;
				ve[cnt].Usage = D3DDECLUSAGE_COLOR;
				ve[cnt].UsageIndex = 0;
				size += sizeof(u32);
				break;
			case VF_SPECULAR: 
				ve[cnt].Type = D3DDECLTYPE_D3DCOLOR;
				ve[cnt].Usage = D3DDECLUSAGE_COLOR;
				ve[cnt].UsageIndex = 1;
				size += sizeof(u32);
				break;
			case VF_TEXCOORD:
				ve[cnt].Type = D3DDECLTYPE_FLOAT2;
				ve[cnt].Usage = D3DDECLUSAGE_TEXCOORD;
				ve[cnt].UsageIndex = scast<u8>(uv++);
				size += 2 * sizeof(f32);
				break;
		}
	}
	va_end(list);

	// Finish the vertex data layout.
	ve[cnt].Stream = 0xFF;
	ve[cnt].Offset = 0;
	ve[cnt].Type = D3DDECLTYPE_UNUSED;
	ve[cnt].Method = 0;
	ve[cnt].Usage = 0;
	ve[cnt].UsageIndex = 0;
	//ve[cnt] = D3DDECL_END();

	m_Size = size;
	HRESULT hr = RenderDevice->CreateVertexDeclaration(ve, &m_VertexDeclaration);

	delete [] ve;
	
	return hr == S_OK;
}

//-----------------------------------------------------------------------------
/**
 * Create vertex shader
 */
BOOL VertexShader::Create(const c8* vs/* = g_DefaultVS*/) 
{ 
	return FALSE;
}

//-----------------------------------------------------------------------------
/**
 * Create vertex shader
 */
BOOL VertexShader::Create(const Data &vs) 
{ 
	HRESULT hr = RenderDevice->CreateVertexShader((DWORD*)vs.Pointer(), &m_VertexShader);
	return(hr == S_OK);
}

//-----------------------------------------------------------------------------
/**
 * Create pixel shader
 */
BOOL PixelShader::Create(const c8* ps /*= g_DefaultPS*/) 
{ 
	return FALSE;
}

//-----------------------------------------------------------------------------
/**
 * Create pixel shader
 */
BOOL PixelShader::Create(const Data &ps) 
{ 
	HRESULT hr = RenderDevice->CreatePixelShader((DWORD*)ps.Pointer(), &m_PixelShader);
	return(hr == S_OK);
}


} // namespace noe