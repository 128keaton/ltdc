/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Model manager
 * @file           model.h
 * @package        noe
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

#pragma once

// std
#include <vector>
#include <sstream>
// boost
#include <boost/scoped_array.hpp>
// dx9
#include <d3d9.h>
// noe
#include <noe/noe.h>
#include <noe/shader.h>
#include <noe/render.h>
#include <noe/material.h>
#include <noe/math/vector4.h>
#include <noe/math/matrix4.h>

namespace noe
{
	
typedef IDirect3DVertexBuffer9 VertexBufferInterface; ///< Vertex-buffer interface
typedef IDirect3DIndexBuffer9  IndexBufferInterface;  ///< Index-buffer interface

//-----------------------------------------------------------------------------
// Primitive types.
enum PRIM_TYPE
{
	PRIM_UNKNOW         = -1,
	PRIM_POINT_LIST     = D3DPT_POINTLIST,
	PRIM_LINE_LIST      = D3DPT_LINELIST,
	PRIM_LINE_STRIP     = D3DPT_LINESTRIP,
	PRIM_TRIANGLE_LIST  = D3DPT_TRIANGLELIST,
	PRIM_TRIANGLE_STRIP = D3DPT_TRIANGLESTRIP,
	PRIM_TRIANGLE_FAN   = D3DPT_TRIANGLEFAN,
};

//-----------------------------------------------------------------------------
/**
 * 3D fragments class.
 */
class Primitive
{
	friend class Renderer; // allow Model class to access private functions
	friend class Mesh;

protected:

	PRIM_TYPE              m_Type;         ///< Primitive type
	s32                    m_Number;       ///< Number of elements into the primitive
	VertexBufferInterface* m_VertexBuffer; ///< Vertex-buffer interface
	IndexBufferInterface*  m_IndexBuffer;  ///< Index-buffer interface
	Shader*                m_Shader;       ///< Primitive's shader

//internal:

	virtual VertexBufferInterface* GetVertexBuffer() const { return m_VertexBuffer; } ///< Get the vertex-buffer interface.
	virtual VertexBufferInterface* &GetVertexBuffer()      { return m_VertexBuffer; } ///< Get the vertex-buffer interface.
	virtual IndexBufferInterface*  GetIndexBuffer()  const { return m_IndexBuffer; } ///< Get the index-buffer interface.
	virtual IndexBufferInterface*  &GetIndexBuffer()       { return m_IndexBuffer; } ///< Get the index-buffer interface.

public:

	/// Default constructor
	Primitive() : m_Type(PRIM_UNKNOW), m_Number(NULL), m_VertexBuffer(NULL), m_IndexBuffer(NULL), m_Shader(NULL) {}

	/**
	 * Destructor.
	 * Release the created data (if any).
	 */
	~Primitive()
	{
		if(m_VertexBuffer)
			m_VertexBuffer->Release();

		if(m_IndexBuffer)
			m_IndexBuffer->Release();
	}

	/// Lock vertex-buffer
	template<typename T> T* RequestVertex()
	{
		RenderDevice->SetStreamSource(0, NULL, 0, 0);
		T* pVertices;
		if(FAILED(m_VertexBuffer->Lock(0, 0, rcast<void**>(&pVertices), 0)))
			return NULL;
		return pVertices;
	}

	/// Unlock vertex-buffer
	void SubmitVertex()
	{
		m_VertexBuffer->Unlock();
	}

	virtual       PRIM_TYPE &GetType()         { return m_Type; } ///< Get primitive type
	virtual const PRIM_TYPE  GetType()   const { return m_Type; } ///< Get primitive type
	virtual       s32       &GetNumber()       { return m_Number; } ///< Get primitive number
	virtual const s32        GetNumber() const { return m_Number; } ///< Get primitive number
	virtual       Shader*   &GetShader()       { return m_Shader; } ///< Get primitive shader
	virtual const Shader*    GetShader() const { return m_Shader; } ///< Get primitive shader
};

//-----------------------------------------------------------------------------
// Primitive information structure. @see noe::Mesh::Create function.
struct PrimitiveInput
{
	PRIM_TYPE type;    ///< type of the primitive
	Shader*   shader;  ///< shader of the fragment
	i32*      indices; ///< indices list
	i32       number;  ///< number of indices
};
	
//-----------------------------------------------------------------------------
/**
 * Mesh class.
 */
class Mesh
{
protected:

	s32                    m_VertexNumber; ///< Number of vetex into the mesh
	std::vector<Primitive> m_Primitives; ///< Primitives list

public:

	/// Default constructor.
	Mesh() : m_VertexNumber(-1) {} ///< Default constructor

	// Create mesh
	virtual BOOL Create(PTR vb, s32 vn, PRIM_TYPE pt, Shader* shader);
	virtual BOOL Create(PTR vb, i32 vn, const PrimitiveInput* ib, i32 ibn);

	// Update mesh data
	virtual BOOL UpdateVertices(PTR vb, i32 vn);

	virtual       s32 GetVertexNumber() const { return m_VertexNumber; } ///< Get the vertex number
	virtual       s32 GetVertexSize(i32 id = 0) const { return m_Primitives[id].GetShader()->GetVertexFormat().Size(); } ///< Get the vertex data size
	virtual       i32 GetPrimitiveNumber() const { return scast<i32>(m_Primitives.size()); } ///< Get the primitive number

	virtual       Primitive &GetPrimitive(i32 id = 0) { return m_Primitives[id]; } ///< Get the n-th primitive interface
	virtual const Primitive &GetPrimitive(i32 id = 0) const { return m_Primitives[id]; } ///< Get the n-th primitive interface

	virtual       PRIM_TYPE GetType(i32 id = 0)   const { return m_Primitives[id].GetType(); } ///< Get the n-th primitive type
	virtual       s32       GetNumber(i32 id = 0) const { return m_Primitives[id].GetNumber(); } ///< Get the n-th primitive number
	virtual const Shader*   GetShader(i32 id = 0) const { return m_Primitives[id].GetShader(); } ///< Get the n-th primitive shader
	virtual       BOOL      UseIndexBuffer()   const { return m_Primitives[0].GetIndexBuffer() != NULL; } ///< Tell if the n-th primitive is using index-buffer

	/// Lock n-th primitive vertex-buffer
	template<typename T> T* RequestVertex(i32 id = 0)
	{
		return m_Primitives[id].RequestVertex<T>();
	}

	/// Unlock n-th primitive vertex-buffer
	void SubmitVertex(i32 id = 0)
	{
		m_Primitives[id].SubmitVertex();
	}

//internal:

	virtual VertexBufferInterface* GetVertexBuffer(i32 id = 0) const { return m_Primitives[id].GetVertexBuffer(); } ///< Get the n-th primitive vertex-buffer interface.
	virtual VertexBufferInterface* &GetVertexBuffer(i32 id = 0)      { return m_Primitives[id].GetVertexBuffer(); } ///< Get the n-th primitive vertex-buffer interface.
	virtual IndexBufferInterface*  GetIndexBuffer(i32 id = 0)  const { return m_Primitives[id].GetIndexBuffer(); } ///< Get the n-th primitive index-buffer interface.
	virtual IndexBufferInterface*  &GetIndexBuffer(i32 id = 0)       { return m_Primitives[id].GetIndexBuffer(); } ///< Get the n-th primitive index-buffer interface.
};

//-----------------------------------------------------------------------------
/**
 * Material group class.
 */
class MaterialGroup
{

protected:

	Material* material; ///< Pointer to the group's material.
	std::vector<Mesh*> m_Meshs; ///< list of fragments into this group.

public:

	/// Initializer list constructor.
	MaterialGroup() : material(NULL) {} 

	virtual void SetMaterial(Material* mat) { material = mat; } ///< Set the group's material.
	virtual Material* GetMaterial() const { return material; } ///< Get the group's material.

	virtual void AddMesh(Mesh* mesh) { m_Meshs.push_back(mesh); } ///< Add a primitive to the group.
	virtual s32 GetNumber() const { return scast<s32>(m_Meshs.size()); } ///< Get the total number of primitive.
	virtual Mesh* GetMesh(s32 id) const { return m_Meshs[id]; } ///< Get the pointer to the id'th primitive.
};

//-----------------------------------------------------------------------------
/**
 * Model's class.
 */
class Model: public DrawProc
{
protected:

	DoubleBuffer<Matrix4>       m_LocalWorld;      ///< Local-World transformation matrix.
	DoubleBuffer<Vector4>       m_Position;        ///< Model position.
	DoubleBuffer<Vector4>       m_Scale;           ///< Scale matrix.
	std::vector<MaterialGroup*> m_MaterialGroup;   ///< List of material-group of the model.
	std::vector<Mesh>           m_CreatedMesh;     ///< List of created meshs.
	std::vector<MaterialGroup>  m_CreatedMatGroup; ///< List of created material's groups.
	Sphere                      m_BoundSphere;     ///< Model bounding sphere (used for world clipping).
	union
	{
		u32 value;
		struct
		{
			u32 active      : 1; ///< Object activation flag.
			u32 cast_shadow : 1; ///< Object cast shadow. @test All object cast shadow.
		};
	} m_Flag;                    ///< Texture flags.

public:

	/// Default constructor.
	Model()
	{
		m_Flag.value = 0;
		SetActive(TRUE);
		m_LocalWorld.GetUpdate().Identity();
		m_LocalWorld.GetRender().Identity();
		m_Position.GetUpdate() = Vector4::Zero();
		m_Position.GetRender() = Vector4::Zero();
		m_Scale.GetUpdate() = Vector4::One();
		m_Scale.GetRender() = Vector4::One();
		SetBoundSphere(Vector3::Zero(), 0.0f);
	}

	/// Default destructor.
	~Model() {}

	virtual void AddMatGroup(MaterialGroup* mat) { m_MaterialGroup.push_back(mat); } ///< Add a material group to the model.
	virtual s32 GetNumber() const { return scast<s32>(m_MaterialGroup.size()); } ///< Get the total number of material group.
	virtual MaterialGroup* GetMaterialGroup(s32 id) const { return m_MaterialGroup[id]; } ///< Get the pointer to the id'th primitive.

	virtual void SetScale(f32 x, f32 y, f32 z) { m_Scale.GetUpdate().Set(x, y, z); }
	virtual void SetScale(f32 s) { m_Scale.GetUpdate().Set(s, s, s); }
	virtual Vector4 &GetScale(i32 N = UPDATE) { return m_Scale.Get(N); } ///< Scale matrix.
	virtual const Vector4 &GetScale(i32 N = UPDATE) const { return m_Scale.Get(N); } ///< Scale matrix.	

	virtual void SetPosition(const Vector4& pos) { m_Position.GetUpdate().Set(pos);  }
	virtual void SetPosition(f32 x, f32 y, f32 z) { m_Position.GetUpdate().Set(x, y, z);  }
	virtual Vector4 &GetPosition(i32 N = UPDATE) { return m_Position.Get(N); } ///< Position vector.
	virtual const Vector4 &GetPosition(i32 N = UPDATE) const { return m_Position.Get(N); } ///< Position vector.	

	virtual Matrix4 &GetLocalWorld(i32 N = UPDATE) { return m_LocalWorld.Get(N); } ///< Local to world's transformation matrix.
	virtual const Matrix4 &GetLocalWorld(i32 N = UPDATE) const { return m_LocalWorld.Get(N); } ///< Local to world's transformation matrix.

	virtual Sphere& GetBoundSphere()       { return m_BoundSphere; } ///< Get the bounding sphere structure
	virtual Sphere  GetBoundSphere() const { return m_BoundSphere; } ///< Get the bounding sphere structure
	virtual void    SetBoundSphere(const Sphere& sph)          { m_BoundSphere.Set(sph); }        ///< Set the bounding sphere structure
	virtual void    SetBoundSphere(const Vector3& pos, f32 r)  { m_BoundSphere.Set(pos, r); }     ///< Set the bounding sphere structure
	virtual void    SetBoundSphere(f32 x, f32 y, f32 z, f32 r) { m_BoundSphere.Set(x, y, z, r); } ///< Set the bounding sphere structure

	virtual void SetActive(BOOL b) { m_Flag.active = b ? 1 : 0; } ///< Tell if the model is active or not.
	virtual BOOL IsActive() const { return m_Flag.active == 1; } ///< Get the 'active' state of the model.

	virtual void SetCastShadow(BOOL b) { m_Flag.cast_shadow = b ? 1 : 0; } ///< Tell if the model is active or not.
	virtual BOOL IsCastShadow() const { return m_Flag.cast_shadow == 1; } ///< Get the 'active' state of the model.

	virtual Model Clone();							// Clone a model an return a copy.
	virtual Mesh* CreateMesh(int n);				// Create local mesh
	virtual MaterialGroup* CreatedMatGroup(int n);	// Create local material group

	virtual void Draw(DrawContext*); // Model rendering process
	virtual void DrawSMAP(DrawContext*); // TEMP backup
	virtual void Synchronize();      // Synchronize double-buffered data

	/// Model creation flag enumeration
	enum MODEL_CREATION_OPTION
	{
		MODEL_DEFAULT    = 0x00000000,
		MODEL_TOP_LEFT   = 0x00000001,
		MODEL_HORIZONTAL = 0x00000002,
	};

	/// Structure useed by Create(std::string str, ...) function
	struct FaceList
	{
		std::vector<i32> indices;
		i32              number;
	};

	/// Mesh auto-generation functions
	void CreatePlane(f32 width, f32 height, Material* mat=NULL, u32 flag=0, u32 color=0xFFFFFFFF, f32 u_max=1.f, f32 v_max=1.f, Shader* shader=&Shader::Default());
	void CreateCube(f32 size, Material* mat=NULL, u32 color=0xFFFFFFFF, f32 u_max=1.f, f32 v_max=1.f, Shader* shader=&Shader::Default());
	void CreateCylinder(f32 radius, f32 height, u32 segments, Material* mat=NULL, u32 color=0xFFFFFFFF, Shader* shader=&Shader::Default());
	void CreateSphere(f32 radius, u32 segments, Material* mat=NULL, u32 color=0xFFFFFFFF, Shader* shader=&Shader::Default());
	void Create(std::string &str, Material* mat=NULL, u32 color=0xFFFFFFFF, Shader* shader=&Shader::Default());
	void Create(const c8* str, Material* mat=NULL, u32 color=0xFFFFFFFF, Shader* shader=&Shader::Default());
};

} // namespace noe