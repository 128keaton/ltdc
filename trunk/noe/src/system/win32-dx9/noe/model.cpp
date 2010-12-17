/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Model manager
 * @file           model.cpp
 * @package        noe
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

// noe
#include <noe/model.h>
#include <noe/shader.h>
#include <noe/effect/effect.h>
#include <noe/math/frustum.h>

namespace noe {

extern Shader g_SMap_Shadow;
extern Shader g_SMap_Scene;


static const BOOL FRUSTUM_CULLING = TRUE;

//-----------------------------------------------------------------------------
//  ##   ##  #####   ####  ##  ##
//  ### ###  ##     ##     ##  ##
//  ## # ##  ####    ###   ######
//  ##   ##  ##        ##  ##  ##
//  ##   ##  #####  ####   ##  ##

//-----------------------------------------------------------------------------
/**
 * Create a mesh using only a vertex-buffer.
 * @param	vb		pointer to vertex-buffer.
 * @param	vn		number of vertex into the buffer.
 * @param	pt		type of the primitive.
 * @param	shader	shader to use to render the primitive.
 */
BOOL Mesh::Create(PTR vb, s32 vn, PRIM_TYPE pt, noe::Shader* shader)
{
	m_Primitives.resize(1); // default primitive index

	m_VertexNumber = vn;
	
	m_Primitives[0].GetType() = pt;
	m_Primitives[0].GetShader() = shader;

	switch(pt)
	{
		case PRIM_POINT_LIST:     m_Primitives[0].GetNumber() = vn; break;
		case PRIM_LINE_LIST:      m_Primitives[0].GetNumber() = vn/2; break;
		case PRIM_LINE_STRIP:     m_Primitives[0].GetNumber() = vn-1; break;
		case PRIM_TRIANGLE_LIST:  m_Primitives[0].GetNumber() = vn/3; break;
		case PRIM_TRIANGLE_STRIP: m_Primitives[0].GetNumber() = vn-2; break;
		case PRIM_TRIANGLE_FAN:   m_Primitives[0].GetNumber() = vn-2; break;
	}

	if(vb)
	{
		if(FAILED(RenderDevice->CreateVertexBuffer(vn * shader->GetVertexFormat().Size(), D3DUSAGE_WRITEONLY, 
			0L, D3DPOOL_DEFAULT, &m_Primitives[0].GetVertexBuffer(), NULL)))
			return FALSE;

		PTR pVertices;
		if(FAILED(m_Primitives[0].GetVertexBuffer()->Lock(0, 0, &pVertices, 0)))
			return FALSE;

		memcpy(pVertices, vb, vn * shader->GetVertexFormat().Size());

		m_Primitives[0].GetVertexBuffer()->Unlock();
	}
	else
	{
		DBG_ASSERT(m_Primitives[0].GetVertexBuffer() == NULL);
	}

	return TRUE;
}

//-----------------------------------------------------------------------------
/**
 * Create a mesh using a vertex-buffer and a list of fragment indices.
 * Only one vertex-buffer and vertex-format can be use for all fragment
 * @param	vb		pointer to vertex-buffer.
 * @param	vn		number of vertex into the buffer.
 * @param	ib		pointer to index-buffer list.
 * @param	ibn		number of index-buffer.
 */
BOOL Mesh::Create(PTR vb, i32 vn, const PrimitiveInput* ib, i32 ibn)
{
	m_Primitives.resize(ibn);

	m_VertexNumber = vn;

	loop(i, ibn)
	{
		
		m_Primitives[i].GetType() = ib[i].type;
		m_Primitives[i].GetShader() = ib[i].shader;
		i32 in = ib[i].number;

		switch(ib[i].type)
		{
			case PRIM_POINT_LIST:     m_Primitives[i].GetNumber() = in; break;
			case PRIM_LINE_LIST:      m_Primitives[i].GetNumber() = in/2; break;
			case PRIM_LINE_STRIP:     m_Primitives[i].GetNumber() = in-1; break;
			case PRIM_TRIANGLE_LIST:  m_Primitives[i].GetNumber() = in/3; break;
			case PRIM_TRIANGLE_STRIP: m_Primitives[i].GetNumber() = in-2; break;
			case PRIM_TRIANGLE_FAN:   m_Primitives[i].GetNumber() = in-2; break;
		}

		if(FAILED(RenderDevice->CreateIndexBuffer(ib[i].number * sizeof(*ib[i].indices), D3DUSAGE_WRITEONLY, 
			D3DFMT_INDEX32, D3DPOOL_DEFAULT, &m_Primitives[i].GetIndexBuffer(), NULL)))
			return FALSE;

		i32* pIndices;
		if(FAILED(m_Primitives[i].GetIndexBuffer()->Lock(0, 0, rcast<void**>(&pIndices), 0)))
			return FALSE;
		memcpy(pIndices, ib[i].indices, ib[i].number * sizeof(*ib[i].indices));
		m_Primitives[i].GetIndexBuffer()->Unlock();
	}

	// Create vertex buffer and copy data (always using prim[0] and shader[0])
	if(FAILED(RenderDevice->CreateVertexBuffer(vn * ib[0].shader->GetVertexFormat().Size(), D3DUSAGE_WRITEONLY, 
		0L, D3DPOOL_DEFAULT, &m_Primitives[0].GetVertexBuffer(), NULL)))
		return FALSE;
	PTR pVertices;
	if(FAILED(m_Primitives[0].GetVertexBuffer()->Lock(0, 0, &pVertices, 0)))
		return FALSE;
	memcpy(pVertices, vb, vn * ib[0].shader->GetVertexFormat().Size());
	m_Primitives[0].GetVertexBuffer()->Unlock();

	return TRUE;
}

//-----------------------------------------------------------------------------
/**
 * Update vertex-buffer content.
 * @param	vb		pointer to vertex-buffer.
 * @param	vn		number of vertex into the buffer.
 */
BOOL Mesh::UpdateVertices(PTR vb, i32 vn)
{
	DBG_ASSERT(vb != NULL);
	DBG_ASSERT(vn == m_VertexNumber);

	PTR pVertices;
	if(FAILED(m_Primitives[0].GetVertexBuffer()->Lock(0, 0, &pVertices, 0)))
		return FALSE;

	memcpy(pVertices, vb, vn * m_Primitives[0].GetShader()->GetVertexFormat().Size());

	m_Primitives[0].GetVertexBuffer()->Unlock();

	return TRUE;
}

//-----------------------------------------------------------------------------
//  ##   ##   ####   #####   #####  ##
//  ### ###  ##  ##  ##  ##  ##     ##
//  ## # ##  ##  ##  ##  ##  ####   ##
//  ##   ##  ##  ##  ##  ##  ##     ##
//  ##   ##   ####   #####   #####  #####

//-----------------------------------------------------------------------------
/**
 * Clone a model an return a copy.
 * @todo Check this function still valid.
 */
Model Model::Clone() 
{ 
	Model mod; 
	mod.m_LocalWorld = m_LocalWorld;
	mod.m_MaterialGroup.resize(m_MaterialGroup.size());
	loop(i, scast<i32>(m_MaterialGroup.size()))
		mod.m_MaterialGroup[i] = m_MaterialGroup[i];
	return mod;
}

//-----------------------------------------------------------------------------
/**
 * Create local material group
 * @param          n                   Number of material-group to create
 */
MaterialGroup* Model::CreatedMatGroup(int n)
{
	DBG_ASSERT(m_CreatedMatGroup.capacity() == 0); /// @todo Allow create more than one mesh per model
	i32 size = scast<i32>(m_CreatedMatGroup.size());
	m_CreatedMatGroup.resize(size + n);
	return &m_CreatedMatGroup[size];
}

//-----------------------------------------------------------------------------
/**
 * Create local mesh
 * @param          n                   Number of mesh to create
 */
Mesh* Model::CreateMesh(int n)
{
	DBG_ASSERT(m_CreatedMesh.capacity() == 0); /// @todo Allow create more than one mesh per model
	i32 size = scast<i32>(m_CreatedMesh.size());
	m_CreatedMesh.resize(size + n);
	return &m_CreatedMesh[size];
}

//-----------------------------------------------------------------------------
/**
 * Create a plane model
 * @param          width               Plane width
 * @param          height              Plane height
 * @param          mat                 Model material
 * @param          flag                Model creation flag. @see noe::Model::MODEL_CREATION_OPTION
 * @param          color               Model vertex color
 * @param          u_max               Texture U scale
 * @param          v_max               Texture V scale
 * @param          shader              Model shader
 */
void Model::CreatePlane(f32 width, f32 height, Material* mat/*=NULL*/, u32 flag/*=0*/, u32 color/*=0xFFFFFFFF*/, f32 u_max/*=1.f*/, f32 v_max/*=1.f*/, Shader* shader/*=&Shader::Default()*/)
{
	std::vector<DefaultVertex> pVertices(4);

	if(flag & MODEL_TOP_LEFT)
	{
		pVertices[0].position = flag & MODEL_HORIZONTAL ? Vector3(0.0f, 0.0f, 0.0f)    : Vector3(0.0f, -height, 0.0f);
		pVertices[0].normal   = flag & MODEL_HORIZONTAL ? Vector3(0.0f, 1.0f, 0.0f)    : Vector3(0.0f, 0.0f, -1.0f);
		pVertices[0].color    = color;						  
		pVertices[0].tu       = 0.0f;							  
		pVertices[0].tv       = v_max;						  
		pVertices[1].position = flag & MODEL_HORIZONTAL ? Vector3(width, 0.0f, 0.0f)   : Vector3(width, -height, 0.0f);
		pVertices[1].normal   = flag & MODEL_HORIZONTAL ? Vector3(0.0f, 1.0f, 0.0f)    : Vector3(0.0f, 0.0f, -1.0f);
		pVertices[1].color    = color;						  
		pVertices[1].tu       = u_max;						  
		pVertices[1].tv       = v_max;						  
		pVertices[2].position = flag & MODEL_HORIZONTAL ? Vector3(0.0f, 0.0f, height)  : Vector3(0.0f, 0.0f, 0.0f);
		pVertices[2].normal   = flag & MODEL_HORIZONTAL ? Vector3(0.0f, 1.0f, 0.0f)    : Vector3(0.0f, 0.0f, -1.0f);
		pVertices[2].color    = color;						  
		pVertices[2].tu       = 0.0f;							  
		pVertices[2].tv       = 0.0f;							  
		pVertices[3].position = flag & MODEL_HORIZONTAL ? Vector3(width, 0.0f, height) : Vector3(width, 0.0f, 0.0f);
		pVertices[3].normal   = flag & MODEL_HORIZONTAL ? Vector3(0.0f, 1.0f, 0.0f)    : Vector3(0.0f, 0.0f, -1.0f);
		pVertices[3].color    = color;
		pVertices[3].tu       = u_max;
		pVertices[3].tv       = 0.0f;
	}
	else
	{
		width  *= 0.5;
		height *= 0.5;

		pVertices[0].position = flag & MODEL_HORIZONTAL ? Vector3(-width, 0.0f,  height) : Vector3(-width,  height, 0.0f);
		pVertices[0].normal   = flag & MODEL_HORIZONTAL ? Vector3(0.0f, 1.0f, 0.0f)      : Vector3(0.0f, 0.0f, -1.0f);
		pVertices[0].color    = color;
		pVertices[0].tu       = 0.0f;
		pVertices[0].tv       = 0.0f;
		pVertices[1].position = flag & MODEL_HORIZONTAL ? Vector3(width, 0.0f,  height)  : Vector3(width,  height, 0.0f);
		pVertices[1].normal   = flag & MODEL_HORIZONTAL ? Vector3(0.0f, 1.0f, 0.0f)      : Vector3(0.0f, 0.0f, -1.0f);
		pVertices[1].color    = color;
		pVertices[1].tu       = u_max;
		pVertices[1].tv       = 0.0f;
		pVertices[2].position = flag & MODEL_HORIZONTAL ? Vector3(-width, 0.0f, -height) : Vector3(-width, -height, 0.0f);
		pVertices[2].normal   = flag & MODEL_HORIZONTAL ? Vector3(0.0f, 1.0f, 0.0f)      : Vector3(0.0f, 0.0f, -1.0f);
		pVertices[2].color    = color;
		pVertices[2].tu       = 0.0f;
		pVertices[2].tv       = v_max;
		pVertices[3].position = flag & MODEL_HORIZONTAL ? Vector3(width, 0.0f, -height)  : Vector3(width, -height, 0.0f);
		pVertices[3].normal   = flag & MODEL_HORIZONTAL ? Vector3(0.0f, 1.0f, 0.0f)      : Vector3(0.0f, 0.0f, -1.0f);
		pVertices[3].color    = color;
		pVertices[3].tu       = u_max;
		pVertices[3].tv       = v_max;
	}

	Mesh *mesh = CreateMesh(1);
	mesh->Create(&pVertices.front(), 4, PRIM_TRIANGLE_STRIP, shader);

	MaterialGroup *group = CreatedMatGroup(1);

	group->SetMaterial(mat);
	group->AddMesh(mesh);

	AddMatGroup(group);

	Vector3 center = (pVertices[0].position + pVertices[3].position) * 0.5f;
	Vector3 diff   = pVertices[0].position - center;

	SetBoundSphere(center, diff.Length());
}

//-----------------------------------------------------------------------------
/**
 * Create a cube model
 * @param          size                Cube size
 * @param          mat                 Model material
 * @param          color               Model vertex color
 * @param          u_max               Texture U scale
 * @param          v_max               Texture V scale
 * @param          shader              Model shader
 */
void Model::CreateCube(f32 size, Material* mat, u32 color, f32 u_max, f32 v_max, Shader* shader)
{
	f32 halfSize = size * 0.5f;
	std::vector<DefaultVertex> pVertices(8);
	loop(i, 2)
	{
		f32 z   = (i == 0) ? halfSize : -halfSize; // z coordinate
		i32 off = (i == 0) ? 0        : 4; // index offset
		f32 tv  = (i == 0) ? 0.f      : v_max;

		pVertices[0 + off].position = Vector3(-halfSize, -halfSize, z);
		pVertices[0 + off].color    = color;						  
		pVertices[0 + off].tu       = 0.0f;							  
		pVertices[0 + off].tv       = tv;						  
		pVertices[1 + off].position = Vector3(halfSize, -halfSize, z);
		pVertices[1 + off].color    = color;						  
		pVertices[1 + off].tu       = u_max;						  
		pVertices[1 + off].tv       = tv;						  
		pVertices[2 + off].position = Vector3(-halfSize, halfSize, z);
		pVertices[2 + off].color    = color;						  
		pVertices[2 + off].tu       = 0.0f;							  
		pVertices[2 + off].tv       = tv;							  
		pVertices[3 + off].position = Vector3(halfSize, halfSize, z);
		pVertices[3 + off].color    = color;
		pVertices[3 + off].tu       = u_max;
		pVertices[3 + off].tv       = tv;
	}

	loop(i, 8)
	{
		pVertices[i].normal = pVertices[i].position;
		pVertices[i].normal.Normalize();
	}

	i32 indices[] = { 0, 1, 2, 3, 7, 1, 5, 4, 7, 6, 2, 4, 0, 1 };

	PrimitiveInput prim;
	prim.type    = PRIM_TRIANGLE_STRIP;
	prim.shader  = shader;
	prim.indices = indices;
	prim.number  = numberof(indices);

	Mesh *mesh = CreateMesh(1);
	mesh->Create(&pVertices.front(), 8, &prim, 1);

	MaterialGroup *group = CreatedMatGroup(1);

	group->SetMaterial(mat);
	group->AddMesh(mesh);

	AddMatGroup(group);

	Vector3 center = Vector3::Zero(); // compute bounding sphere
	SetBoundSphere(center, sqrtf(halfSize * halfSize * 3));
}

//-----------------------------------------------------------------------------
/**
 * Create a cylinder model
 * @param          radius              Cylinder radius
 * @param          height              Cylinder height
 * @param          segments            Number of segment to simulate circle
 * @param          mat                 Model material
 * @param          color               Model vertex color
 * @param          u_max               Texture U scale
 * @param          v_max               Texture V scale
 * @param          shader              Model shader
 */
void Model::CreateCylinder(f32 radius, f32 height, u32 segments, Material* mat/*=NULL*/, u32 color/*=0xFFFFFFFF*/, Shader* shader/*=&Shader::Default()*/)
{
	std::vector<DefaultVertex> pVertices(segments*2);
	f32 half_height = height * 0.5f;

	u32 cnt(0);
	loop(i, scast<i32>(segments))
	{
		f32 theta = (2*PI*i)/(segments-1);
		pVertices[cnt].position = Vector3(radius*sinf(theta), -half_height, radius*cosf(theta));
		pVertices[cnt].normal   = Vector3(radius*sinf(theta), 0.0f, radius*cosf(theta));
		pVertices[cnt].normal.Normalize();
		pVertices[cnt].color    = color;
		pVertices[cnt].tu       = scast<f32>(i)/scast<f32>(segments-1);
		pVertices[cnt].tv       = 1.0f;
		cnt++;
		pVertices[cnt].position = Vector3(radius*sinf(theta), half_height, radius*cosf(theta));
		pVertices[cnt].normal   = pVertices[cnt-1].normal;
		pVertices[cnt].color    = color;
		pVertices[cnt].tu       = scast<f32>(i)/scast<f32>(segments-1);
		pVertices[cnt].tv       = 0.0f;
		cnt++;
	}

	Mesh *mesh = CreateMesh(1);

	mesh->Create(&pVertices.front(), segments*2, PRIM_TRIANGLE_STRIP, shader);

	MaterialGroup *group = CreatedMatGroup(1);

	group->SetMaterial(mat);
	group->AddMesh(mesh);

	AddMatGroup(group);

	SetBoundSphere(0.0f, half_height, 0.0f, sqrt((half_height * half_height) + (radius * radius)));
}

//-----------------------------------------------------------------------------
/**
 * Create a sphere model
 * @param          radius              Sphere radius
 * @param          segments            Number of segment to simulate circle
 * @param          mat                 Model material
 * @param          color               Model vertex color
 * @param          u_max               Texture U scale
 * @param          v_max               Texture V scale
 * @param          shader              Model shader
 */
void Model::CreateSphere(f32 radius, u32 segments, Material* mat/*=NULL*/, u32 color/*=0xFFFFFFFF*/, Shader* shader/*=&Shader::Default()*/)
{
	u32 half_segments = segments / 2;
	std::vector<DefaultVertex> pVertices(2 * segments * (half_segments + 1));

	loop(i, scast<i32>(segments))
	{
		f32 a = (2.0f*PI*i)/(segments-1); // [0:2*PI]
		f32 b = (2.0f*PI*(i+1))/(segments-1); // [0:2*PI]
		loop(j, scast<i32>(half_segments+1))
		{
			f32 f = PI*j/((half_segments+1)-1); // [0:PI]
			f32 y = cosf(f); // [-1:1]
			f32 s = sinf(f); // [0:1]

			DefaultVertex &v1 = pVertices[2*(half_segments+1)*i + j*2];
			v1.position = Vector3(s*sinf(a), y, s*cosf(a)) * radius;
			v1.normal   = -v1.position;
			v1.normal.Normalize();
			v1.color    = color;
			v1.tu       = scast<f32>(i)/scast<f32>(segments-1);
			v1.tv       = (1.0f - y) * 0.5f;
			
			DefaultVertex &v2 = pVertices[2*(half_segments+1)*i + (j*2+1)];
			v2.position = Vector3(s*sinf(b), y, s*cosf(b)) * radius;
			v2.normal   = -v2.position;
			v2.normal.Normalize();
			v2.color    = color;
			v2.tu       = scast<f32>(i+1)/scast<f32>(segments-1);
			v2.tv       = (1.0f - y) * 0.5f;
		}
	}

	Mesh *mesh = CreateMesh(segments);

	loop(i, scast<i32>(segments))
		mesh[i].Create(&pVertices.front()+i*(2*(half_segments+1)), 2*(half_segments+1), PRIM_TRIANGLE_STRIP, shader);

	MaterialGroup *group = CreatedMatGroup(1);

	group->SetMaterial(mat);
	loop(i, scast<i32>(segments))
		group->AddMesh(&mesh[i]);

	AddMatGroup(group);

	SetBoundSphere(Vector3::Zero(), radius);
}

//-----------------------------------------------------------------------------
/**
 * Create a model from a string
 * @param          str                 String data
 * @param          mat                 Model material
 * @param          color               Model vertex color
 * @param          shader              Model shader
 */
void Model::Create(std::string &str, Material* mat/*=NULL*/, u32 color/*=0xFFFFFFFF*/, Shader* shader/*=&Shader::Default()*/)
{
	Create(str.data(), mat, color, shader);
}

//-----------------------------------------------------------------------------
/**
 * Create a model from a string
 * @param          str                 String data
 * @param          mat                 Model material
 * @param          color               Model vertex color
 * @param          shader              Model shader
 */
void Model::Create(const c8* str, Material* mat/*=NULL*/, u32 color/*=0xFFFFFFFF*/, Shader* shader/*=&Shader::Default()*/)
{
	i32 vertices_num(-1);
	i32 indices_num(-1);
	i32 subsets_num(-1);

	// Create a stream from which to read the binary model data
	std::istringstream data_stream(str, std::istringstream::in);
	
	// Read the number of vertices as a long followed by the vertices themselves
	data_stream >> vertices_num;
	
	std::vector<DefaultVertex> pVertices(vertices_num);

	loop(vi, vertices_num)
	{
		data_stream >> pVertices[vi].position.x >> pVertices[vi].position.y >> pVertices[vi].position.z >> pVertices[vi].normal.x >> pVertices[vi].normal.y >> pVertices[vi].normal.z >> pVertices[vi].tu >> pVertices[vi].tv;
		pVertices[vi].color = color;
		
		//DBG_ASSERT(Abs(pVertices[vi].normal.Length()) < 0.9999f);
		f32 len = pVertices[vi].normal.Length();
		if(len != 1.0f)
		{
			if(len == 0.0f)
				pVertices[vi].normal.Set(0.f, 0.f, 1.f);
			else
				pVertices[vi].normal.Normalize();
		}
	}
	
	// Read the number of subsets as a long followed by the vertices themselves
	data_stream >> subsets_num;

	if(subsets_num <= 0)
		return;

	std::vector<FaceList> pFaces(subsets_num);
	std::vector<PrimitiveInput> priminput(subsets_num);

	loop(si, subsets_num)
	{
		// Read the number of faces as a long followed by the faces themselves
		data_stream >> pFaces[si].number;

		pFaces[si].indices.resize(pFaces[si].number*3);

		loop(fi, pFaces[si].number)
		{
			data_stream >> pFaces[si].indices[fi*3+0] >> pFaces[si].indices[fi*3+1] >> pFaces[si].indices[fi*3+2];
		}

		priminput[si].type    = PRIM_TRIANGLE_LIST;
		priminput[si].shader  = shader;
		priminput[si].indices = &pFaces[si].indices.front();
		priminput[si].number  = pFaces[si].number*3;
	}

	// Create mesh
	Mesh *mesh = CreateMesh(1);

	mesh->Create(&pVertices.front(), vertices_num, &priminput.front(), scast<i32>(priminput.size()));

	MaterialGroup *group = CreatedMatGroup(1);

	group->SetMaterial(mat);
	group->AddMesh(mesh);

	AddMatGroup(group);
}

//-----------------------------------------------------------------------------
/**
 * Model rendering process
 * @param          context             Draw context data.
 * @todo           Convert or remove all Shader Model 3.0 features
 */
void Model::DrawSMAP(DrawContext* context)
{
	if(!IsActive())
		return;

	/*if(context->layer == Render::LAYER_SMAP)
		if(context->pass == Render::PASS_SHADOW)
			if(!m_Flag.cast_shadow)
				return; // skip shadow computation for object that don't cast shadow*/

	// World Matrix4
	Matrix4 matW    = GetLocalWorld(RENDER);
	matW.Right()   *= GetScale(RENDER).x;
	matW.Up()      *= GetScale(RENDER).y;
	matW.Dir()     *= GetScale(RENDER).z;
	matW.GetPosition() = GetPosition(RENDER);
	matW.GetPosition().w = 1.0f;

	// World-view Matrix4
	Matrix4 matWV = matW * (*RenderInstance.GetWorldView());
	
	// World-view-projection Matrix4
	Matrix4 matWVP = matWV * (*RenderInstance.GetViewProj());

	// Frustum culling in view space
	if(FRUSTUM_CULLING)
	{
		Frustum frustrum;
		frustrum.Build(matWVP);
		u32 intersect = frustrum.Intersect(GetBoundSphere());
		if(intersect == Frustum::OUTSIDE)
			return;
	}

	/*// View-inverse-transpose Matrix4
	Matrix4 matVIT = *RenderInstance.GetWorldView();
	matVIT.Inverse();
	matVIT.Transpose();

	// World-view-inverse-transpose Matrix4
	Matrix4 matWVIT = matWV;
	matWVIT.Inverse();
	matWVIT.Transpose();*/

	// Set shader constant transformation matrices
	//RenderInstance._SetMatrixW(matW);	      // World Matrix4
	RenderInstance.SetMatrixWV(matWV);	   // World-view Matrix4
	RenderInstance.SetMatrixWVP(matWVP);	// World-view-projection Matrix4
	//RenderInstance._SetMatrixVIT(matVIT);	// View-inverse-transpose Matrix4
	//RenderInstance._SetMatrixWVIT(matWVIT);	// World-view-inverse-transpose Matrix4

	// for each material-group
	loop(mg, GetNumber())
	{
		const MaterialGroup* material_group = GetMaterialGroup(mg);
		const Material* material = material_group->GetMaterial();
		if(material)
		{
			if(material != RenderInstance.LastMaterial)				
			{
				// set material's render state
				material->Render();

				// set mateiral's shader constant
				//RenderInstance._SetSpecularEnable(material->GetSpecularEnable() ? 1 : 0);
				RenderInstance.SetMaterialDiffuse(material->GetDiffuse());
				//RenderInstance._SetMaterialAmbient(material->GetAmbient());
				//RenderInstance._SetMaterialSpecular(material->GetSpecular());
				//RenderInstance._SetMaterialEmissive(material->GetEmissive());
				//RenderInstance._SetMaterialPower(material->GetPower());

				i32 num = material->GetTextureNumber();
				if(num > NUM_TEXTURES)
					num = NUM_TEXTURES;

				//RenderInstance._SetTextureNumber(num);
				
				loop(i, 1)//num)
				{
					const Texture* texture = material->GetTexture(i);

					if(texture)
					{
						if(texture != RenderInstance.LastTexture)						
						{
							texture->Render(i);

							/*if(!texture->GetMipmap())
								RenderDevice->SetSamplerState(stage, D3DSAMP_MINMIPLEVEL, 0);*/

							// shader stat
							//RenderInstance._SetTexGenerationType(i, texture->GetUVMapping());	// vertex shader
							//RenderInstance._SetUVModifier(i, texture->GetUVModifier());		// vertex shader
							RenderInstance.SetUVModifier(texture->GetUVModifier());
							//RenderInstance._SetTextureFunction(i, texture->GetFunction());		// pixel shader

							RenderInstance.LastTexture = texture;
						}
					}
					else
					{
						//RenderInstance._SetTextureFunction(i, -1);//PS_TEX_NO);
						//RenderDevice->SetTexture(i, NULL);
					}
				}
				for(i32 t=num; t<NUM_TEXTURES; t++)
				{
					//RenderInstance._SetTextureFunction(t, -1);//PS_TEX_NO);
					//RenderDevice->SetTexture(t, NULL);
				}

				RenderInstance.LastMaterial = material;
			}
		}
		/*else
		{
			RenderInstance._SetTextureNumber(0);
		}*/
		loop(p, material_group->GetNumber())
		{
			const Mesh* mesh = material_group->GetMesh(p);
			const Shader* shader = mesh->GetShader();
			//const Shader* shader = NULL;

			if(context->layer == Render::LAYER_SMAP)
			{
				if(context->pass == Render::PASS_SHADOW)
					shader = &g_SMap_Shadow;
				else
					shader = &g_SMap_Scene;
			}

			// Set shader if needed
			if(shader != RenderInstance.LastShader)
			{
				shader->Apply(); // Set VertexFormat, VertexShader & PixelShader

				RenderInstance.LastShader = shader;
			}

			// Set vertex buffer
			RenderDevice->SetStreamSource(0, mesh->GetVertexBuffer(), 0, mesh->GetVertexSize());				

			if(mesh->UseIndexBuffer()) // Render using index-buffer
			{
				loop(ib, mesh->GetPrimitiveNumber())
				{
					RenderDevice->SetIndices(mesh->GetIndexBuffer(ib));
					RenderDevice->DrawIndexedPrimitive((D3DPRIMITIVETYPE)mesh->GetType(ib), 0, 0, mesh->GetVertexNumber(), 0, mesh->GetNumber(ib));
				}
			}
			else // Render without index-buffer
			{
				DBG_ASSERT(mesh->GetPrimitiveNumber() == 1);
				RenderDevice->SetIndices(NULL);
				RenderDevice->DrawPrimitive((D3DPRIMITIVETYPE)mesh->GetType(), 0, mesh->GetNumber());
			}
		}
		if(material)
			if(material->GetEffect())
				material->GetEffect()->Draw(context, material_group);
	}
}

//-----------------------------------------------------------------------------
/**
 * Model rendering process
 * @param          context             Draw context data.
 * @todo           Convert or remove all Shader Model 3.0 features
 */
void Model::Draw(DrawContext* context)
{
	if(!IsActive())
		return;

	/*if(context->layer == Render::LAYER_SMAP)
		if(context->pass == Render::PASS_SHADOW)
			if(!m_Flag.cast_shadow)
				return; // skip shadow computation for object that don't cast shadow*/

	// World Matrix4
	Matrix4 matW    = GetLocalWorld(RENDER);
	matW.Right()   *= GetScale(RENDER).x;
	matW.Up()      *= GetScale(RENDER).y;
	matW.Dir()     *= GetScale(RENDER).z;
	matW.GetPosition() = GetPosition(RENDER);
	matW.GetPosition().w = 1.0f;

	// World-view Matrix4
	Matrix4 matWV = matW * (*RenderInstance.GetWorldView());
	
	// World-view-projection Matrix4
	Matrix4 matWVP = matWV * (*RenderInstance.GetViewProj());

	// Frustum culling in view space
	if(FRUSTUM_CULLING)
	{
		Frustum frustrum;
		frustrum.Build(matWVP);
		u32 intersect = frustrum.Intersect(GetBoundSphere());
		if(intersect == Frustum::OUTSIDE)
			return;
	}

	// View-inverse-transpose Matrix4
	Matrix4 matVIT = *RenderInstance.GetWorldView();
	matVIT.Inverse();
	matVIT.Transpose();

	// World-view-inverse-transpose Matrix4
	Matrix4 matWVIT = matWV;
	matWVIT.Inverse();
	matWVIT.Transpose();

	// Set shader constant transformation matrices
	RenderInstance._SetMatrixW(matW);       // World Matrix4
	RenderInstance._SetMatrixWV(matWV);     // World-view Matrix4
	RenderInstance._SetMatrixWVP(matWVP);   // World-view-projection Matrix4
	RenderInstance._SetMatrixVIT(matVIT);   // View-inverse-transpose Matrix4
	RenderInstance._SetMatrixWVIT(matWVIT); // World-view-inverse-transpose Matrix4

	// for each material-group
	loop(mg, GetNumber())
	{
		const MaterialGroup* material_group = GetMaterialGroup(mg);
		const Material* material = material_group->GetMaterial();
		if(material)
		{
			if(material != RenderInstance.LastMaterial)				
			{
				// set material's render state
				material->Render();

				// set mateiral's shader constant
				RenderInstance._SetSpecularEnable(material->GetSpecularEnable() ? 1 : 0);
				RenderInstance._SetMaterialDiffuse(material->GetDiffuse());
				RenderInstance._SetMaterialAmbient(material->GetAmbient());
				RenderInstance._SetMaterialSpecular(material->GetSpecular());
				RenderInstance._SetMaterialEmissive(material->GetEmissive());
				RenderInstance._SetMaterialPower(material->GetPower());

				i32 num = material->GetTextureNumber();
				if(num > NUM_TEXTURES)
					num = NUM_TEXTURES;

				RenderInstance._SetTextureNumber(num);
				
				loop(i, 1)//num)
				{
					const Texture* texture = material->GetTexture(i);

					if(texture)
					{
						if(texture != RenderInstance.LastTexture)						
						{
							texture->Render(i);

							//if(!texture->GetMipmap())
							//	RenderDevice->SetSamplerState(stage, D3DSAMP_MINMIPLEVEL, 0);

							// shader stat
							RenderInstance._SetTexGenerationType(i, texture->GetUVMapping()); // vertex shader
							RenderInstance._SetUVModifier(i, texture->GetUVModifier());       // vertex shader
							RenderInstance._SetTextureFunction(i, texture->GetFunction());    // pixel shader

							RenderInstance.LastTexture = texture;
						}
					}
					else
					{
						RenderInstance._SetTextureFunction(i, -1);//PS_TEX_NO);
						RenderDevice->SetTexture(i, NULL);
					}
				}
				//for(i32 t=num; t<NUM_TEXTURES; t++)
				//{
				//	RenderInstance._SetTextureFunction(t, -1);//PS_TEX_NO);
				//	RenderDevice->SetTexture(t, NULL);
				//}

				RenderInstance.LastMaterial = material;
			}
		}
		else
		{
			RenderInstance._SetTextureNumber(0);
		}
		loop(p, material_group->GetNumber())
		{
			const Mesh* mesh = material_group->GetMesh(p);
			const Shader* shader = mesh->GetShader();
			//const Shader* shader = NULL;

			if(context->layer == Render::LAYER_SMAP)
			{
				if(context->pass == Render::PASS_SHADOW)
					shader = &g_SMap_Shadow;
				else
					shader = &g_SMap_Scene;
			}

			// Set shader if needed
			if(shader != RenderInstance.LastShader)
			{
				shader->Apply(); // Set VertexFormat, VertexShader & PixelShader

				RenderInstance.LastShader = shader;
			}

			// Set vertex buffer
			RenderDevice->SetStreamSource(0, mesh->GetVertexBuffer(), 0, mesh->GetVertexSize());				

			if(mesh->UseIndexBuffer()) // Render using index-buffer
			{
				loop(ib, mesh->GetPrimitiveNumber())
				{
					RenderDevice->SetIndices(mesh->GetIndexBuffer(ib));
					RenderDevice->DrawIndexedPrimitive((D3DPRIMITIVETYPE)mesh->GetType(ib), 0, 0, mesh->GetVertexNumber(), 0, mesh->GetNumber(ib));
				}
			}
			else // Render without index-buffer
			{
				DBG_ASSERT(mesh->GetPrimitiveNumber() == 1);
				RenderDevice->SetIndices(NULL);
				RenderDevice->DrawPrimitive((D3DPRIMITIVETYPE)mesh->GetType(), 0, mesh->GetNumber());
			}
		}
		if(material)
			if(material->GetEffect())
				material->GetEffect()->Draw(context, material_group);
	}
}

//---------------------------------------------------------
/**
 * Synchronize double-buffered data
 */
void Model::Synchronize()
{
	m_LocalWorld.UpdateToRender();
	m_Position.UpdateToRender();
	m_Scale.UpdateToRender();
}

} // namespace noe