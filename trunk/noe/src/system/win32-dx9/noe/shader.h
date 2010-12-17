/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Shader manager
 * @file           shader.h
 * @package        noe
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

#pragma once

// dx9
#include <d3d9.h>
// noe
#include <noe/noe.h>
#include <noe/debug.h>
#include <noe/file.h>
#include <noe/render.h>
#include <noe/math/vector3.h>

namespace noe
{

/// Vertex format.
enum VERTEX_FORMAT
{
	VF_XYZ,                  ///< Position of an untransformed vertex. f32[3]
	VF_XYZ32 = VF_XYZ,
	VF_XYZ16,                ///< Position of an untransformed vertex. f16[3]
	VF_XYZRHW,               ///< Position of a transformed vertex. f32[4]
	VF_XYZW,                 ///< Transformed and clipped vertex. f32[4]
	VF_XYZW32 = VF_XYZW,
	VF_XYZW16,               ///< Transformed and clipped vertex. f16[4]
	VF_NORMAL,               ///< Vertex normal vector. f32[3]
	VF_NORMAL32 = VF_NORMAL,
	VF_NORMAL16,             ///< Vertex normal vector. f16[3]
	VF_PSIZE,                ///< Point size f32
	VF_DIFFUSE,              ///< Diffuse color component. u32
	VF_SPECULAR,             ///< Specular color component. u32
	VF_TEXCOORD,             ///< Texture coordinate. f32[2]
	
	VF_FORCE_32BITS = 0x7FFFFFFF,
};

class Shader;
class Render;

/// Default vertex shader.
static const c8* g_DefaultVS = NULL;

/// Default pixel shader.
static const c8* g_DefaultPS = NULL;

// Type definition
typedef D3DVERTEXELEMENT9           VertexElement;				///< Vertex element
typedef IDirect3DVertexDeclaration9 VertexDeclarationInterface; ///< Vertex declaration interface
typedef IDirect3DVertexShader9      VertexShaderInterface;      ///< Vertex shader interface
typedef IDirect3DPixelShader9       PixelShaderInterface;       ///< Pixel shader interface

/// Default vertex element descriptor.
const VertexElement g_DefaultElements[] =
{
	{ 0,  0, D3DDECLTYPE_FLOAT3,   D3DDECLMETHOD_DEFAULT,  D3DDECLUSAGE_POSITION, 0 },
	{ 0, 12, D3DDECLTYPE_FLOAT3,   D3DDECLMETHOD_DEFAULT,  D3DDECLUSAGE_NORMAL,   0 },
	{ 0, 24, D3DDECLTYPE_D3DCOLOR, D3DDECLMETHOD_DEFAULT,  D3DDECLUSAGE_COLOR,    0 },
	{ 0, 28, D3DDECLTYPE_FLOAT2,   D3DDECLMETHOD_DEFAULT,  D3DDECLUSAGE_TEXCOORD, 0 },
	D3DDECL_END()
};

/// Simple vertex element descriptor.
const VertexElement g_SimpleElements[] =
{
	{ 0,  0, D3DDECLTYPE_FLOAT3,   D3DDECLMETHOD_DEFAULT,  D3DDECLUSAGE_POSITION, 0 },
	{ 0, 12, D3DDECLTYPE_D3DCOLOR, D3DDECLMETHOD_DEFAULT,  D3DDECLUSAGE_COLOR,    0 },
	{ 0, 16, D3DDECLTYPE_FLOAT2,   D3DDECLMETHOD_DEFAULT,  D3DDECLUSAGE_TEXCOORD, 0 },
	D3DDECL_END()
};

/// Basic vertex element descriptor.
const VertexElement g_BasicElements[] =
{
	{ 0,  0, D3DDECLTYPE_FLOAT3,   D3DDECLMETHOD_DEFAULT,  D3DDECLUSAGE_POSITION, 0 },
	D3DDECL_END()
};


/// Default vertex element list.
#define SHADER_FORMAT 4, VF_XYZ, VF_NORMAL, VF_DIFFUSE, VF_TEXCOORD


/// Default vertex structure
struct DefaultVertex
{
	Vector3  position; ///< The transformed position for the vertex.
	Vector3  normal;   ///< The vertex normal (for lightning).
	u32      color;    ///< The vertex color.
	f32      tu, tv;   ///< The texture coordinates.
};

/// Simple vertex structure
struct SimpleVertex
{
	Vector3  position; ///< The transformed position for the vertex.
	u32      color;    ///< The vertex color.
	f32      tu, tv;   ///< The texture coordinates.
};

/// Basic vertex structure
struct BasicVertex
{
	Vector3  position; ///< The transformed position for the vertex.
};

//-------------------------------------------------------------------------------------
/**
 * Vertex format class.
 */
class VertexFormat
{
	friend class Effect;
	friend class Shader;
	friend class Render;

private:

	i32                         m_Size; ///< Size of a vertex in bytes
	VertexDeclarationInterface*	m_VertexDeclaration; ///< 頂点形式

protected:

	VertexDeclarationInterface* GetInterface() const { return m_VertexDeclaration; } ///< Get interface

	virtual BOOL Create(const VertexElement* ve = g_DefaultElements); ///< Create vertex format 

public:

	/// Default constructor
	VertexFormat() : m_Size(-1), m_VertexDeclaration(NULL) {}
	
	/// Destructor
	~VertexFormat() 
	{ 
		if(m_VertexDeclaration) 
			m_VertexDeclaration->Release(); 
	}

	virtual i32 Size() const { return m_Size; } ///< Get vertex data size

	virtual BOOL Create(s32 num, ...); ///< Create vertex format from element list
};

	
//-------------------------------------------------------------------------------------
/**
 * Vertex shader class.
 */
class VertexShader
{
	friend class Shader;
	friend class Render;

private:

	VertexShaderInterface* m_VertexShader; ///< 頂点シェーダ

protected:

	VertexShaderInterface* GetInterface() const { return m_VertexShader; } ///< Get ineterface

public:

	VertexShader() : m_VertexShader(NULL) {}                            ///< Constructor
	VertexShader(const c8* vs) : m_VertexShader(NULL) { Create(vs); }   ///< Constructor from text
	VertexShader(const Data &vs) : m_VertexShader(NULL) { Create(vs); } ///< Constructor from data in memory

	/// Destructor
	~VertexShader() 
	{ 
		if(m_VertexShader) 
			m_VertexShader->Release(); 
	}

	virtual BOOL Create(const c8* vs = g_DefaultVS); ///< Create from text
	virtual BOOL Create(const Data &vs);             ///< Create from data in memory
	virtual BOOL Create(VertexShaderInterface* vs) { m_VertexShader = vs; return (vs != NULL); } ///< Create from interface
};


//-------------------------------------------------------------------------------------
/**
 * Pixel shader class.
 */
class PixelShader
{
	friend class Shader;
	friend class Render;

private:

	PixelShaderInterface* m_PixelShader; ///< ピクセル シェーダ

protected:

	PixelShaderInterface* GetInterface() const { return  m_PixelShader; } ///< Get ineterface

public:

	PixelShader() : m_PixelShader(NULL) {}                            ///< Constructor
	PixelShader(const c8* ps) : m_PixelShader(NULL) { Create(ps); }   ///< Constructor from text
	PixelShader(const Data &ps) : m_PixelShader(NULL) { Create(ps); } ///< Constructor from data in memory
	
	/// Destructor
	~PixelShader() 
	{ 
		if(m_PixelShader) 
			m_PixelShader->Release(); 
	}

	virtual BOOL Create(const c8* ps = g_DefaultPS); ///< Create from text
	virtual BOOL Create(const Data &ps);             ///< Create from data in memory
	virtual BOOL Create(PixelShaderInterface* ps) { m_PixelShader = ps; return (ps != NULL); } ///< Create from instance
};


//-------------------------------------------------------------------------------------
/**
 * Shader handler class.
 */
class Shader
{
	friend class Render;

private:

	VertexFormat	m_VertexFormat;	///< 頂点形式
	VertexShader	m_VertexShader;	///< 頂点シェーダ
	PixelShader		m_PixelShader;	///< ピクセルシェーダ

	static PixelShaderInterface*	DefaultPixelShader;  ///< Default pixel shader
	static VertexShaderInterface*	DefaultVertexShader; ///< Default vertex shader
	static Shader                   DefaultShader;       ///< Default shader
	static Shader                   BasicShader;         ///< Basic shader

public:
	
	Shader() {}	///< Default constructor.
	Shader(const char* vs, const char* ps, const VertexElement* ve) { Create(vs, ps, ve); } ///< Constructor from text.
	Shader(const Data &vs, const Data &ps, const VertexElement* ve) { Create(vs, ps, ve); } ///< Constructor from data in memory.
	Shader(VertexShaderInterface* vs, PixelShaderInterface* ps, const VertexElement* ve) { Create(vs, ps, ve); } ///< Constructor from interface.

	// Get interfaces
	virtual       VertexFormat& GetVertexFormat()       { return m_VertexFormat; }	///< Get vertex format interface
	virtual const VertexFormat& GetVertexFormat() const { return m_VertexFormat; }	///< Get vertex format interface
	virtual       VertexShader& GetVertexShader()       { return m_VertexShader; }	///< Get vertex shader interface
	virtual const VertexShader& GetVertexShader() const { return m_VertexShader; }	///< Get vertex shader interface
	virtual       PixelShader&  GetPixelShader()        { return m_PixelShader; }	///< Get pixel shader interface
	virtual const PixelShader&  GetPixelShader()  const { return m_PixelShader; }	///< Get pixel shader interface

	/// Create shader from data in memory
	virtual void Create(const Data &vs, const Data &ps, s32 num, ...)
	{
		va_list list;
		va_start(list, num);
		m_VertexFormat.Create(num, list);
		va_end(list);
		m_VertexShader.Create(vs);
		m_PixelShader.Create(ps);
	}

	/// Create shader from data into strings
	virtual void Create(const char* vs, const char* ps, const VertexElement* ve)
	{
		m_VertexFormat.Create(ve);
		m_VertexShader.Create(vs);
		m_PixelShader.Create(ps);
	}

	/// Create shader from data in memory
	virtual void Create(const Data &vs, const Data &ps, const VertexElement* ve)
	{
		m_VertexFormat.Create(ve);
		m_VertexShader.Create(vs);
		m_PixelShader.Create(ps);
	}

	/// Create shader from interface pointer
	virtual void Create(VertexShaderInterface* vs, PixelShaderInterface* ps, const VertexElement* ve)
	{
		m_VertexFormat.Create(ve);
		m_VertexShader.Create(vs);
		m_PixelShader.Create(ps);
	}

	/// Begin the shader  
	virtual void Apply() const
	{ 
		HRESULT hr;
		hr = RenderDevice->SetVertexDeclaration(m_VertexFormat.GetInterface());
		hr = RenderDevice->SetVertexShader(m_VertexShader.GetInterface());
		hr = RenderDevice->SetPixelShader(m_PixelShader.GetInterface());
	}

	/// Initialize default shader from application
	static void DefaultInit(void* vs, void* ps)
	{
		DBG_ASSERT(vs != NULL);
		DBG_ASSERT(ps != NULL);

		DefaultVertexShader = rcast<VertexShaderInterface*>(vs);
		DefaultPixelShader  = rcast<PixelShaderInterface*>(ps);
		DefaultShader.Create(DefaultVertexShader, DefaultPixelShader, g_DefaultElements);
	}

	/// Get the default shader instance
	static Shader& Default()
	{
		// if default shader not initialized by application, initialize it!
		if(DefaultShader.m_VertexShader.m_VertexShader == NULL)
		{
			File pso("noe/shader/default.pso");
			File vso("noe/shader/default.vso");
			DefaultShader.Create(vso, pso, g_DefaultElements);
		}

		return DefaultShader;
	}

	/// Get the default shader instance
	static Shader& Basic()
	{
		// if default shader not initialized by application, initialize it!
		if(BasicShader.m_VertexShader.m_VertexShader == NULL)
		{
			File pso("noe/shader/basic.pso");
			File vso("noe/shader/basic.vso");
			BasicShader.Create(vso, pso, g_BasicElements);
		}

		return BasicShader;
	}
};


}; // namespace noe