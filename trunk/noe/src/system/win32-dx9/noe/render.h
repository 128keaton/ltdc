/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Rendering manager
 * @file           render.h
 * @package        noe
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

#pragma once

// std/stl
#include <vector>
#include <iostream>
// boost
#include <boost/scoped_array.hpp>
// dx9
#include <d3d9.h>
// noe
#include <noe/noe.h>
#include <noe/singleton.h>
#include <noe/window.h>
#include <noe/multibuffer.h>
#include <noe/thread.h>
#include <noe/math/matrix4.h>
#include <noe/math/frustum.h>
#include <noe/shader/constant.h>

namespace noe
{

typedef IDirect3DDevice9 DrawDevice;

class Camera;
class Light;
class _Light;
class Texture;
class Shader;
class Material;
class Model;

/**
 *	Draw contex structure.
 *
 * layer pass desc
 * -------------------------------------
 * 0          Initialize rendering
 * 1          Opaque primitives
 *       0    Shadow-map(s) pass
 *       1    Render & shade
 * 2          Transparent primitives
 *       0    Render & shade
 * 3          Finalize rendering
 *
 */
struct DrawContext
{
	i32 layer;
	i32 pass;
};

/// Draw procedure pure-virtual base class
class DrawProc
{ 
public: 
	virtual void Draw(DrawContext*) = 0; 
	virtual void Synchronize() = 0;
};

#define DRAW_PROC(_name) class _name : public Singleton<_name>, public DrawProc { void Draw(DrawContext*); void Synchronize() {} }

DRAW_PROC(DrawClearAll);     ///< Clear the back buffer to a blue color.
DRAW_PROC(DrawClearZBuffer); ///<
DRAW_PROC(DrawBegin);        ///< Begin the scene.
DRAW_PROC(DrawEnd);          ///< End and Present the scene.
DRAW_PROC(DrawInitShader);   ///<
DRAW_PROC(DrawLight);        ///<

/**
 *
 */
class Render: public Singleton<Render>, public noe::Thread
{
friend class Scene;
friend class Model; // @test

public:

	enum LAYERS
	{
		LAYER_INIT,
		LAYER_SMAP,
		LAYER_TRANS,
		LAYER_FINISH,
		LAYER_NUM,
	};

	enum PASS
	{
		PASS_FIRST = 0,

		//LAYER_SMAP
		PASS_SHADOW = 0,
		PASS_SCENE,
	};

	typedef std::vector<DrawProc*> ProcList;

	const Material* LastMaterial;
	const Texture*  LastTexture;
	const Shader*   LastShader;

protected:

	IDirect3D9*     m_D3D;
	DrawDevice*     m_D3DDevice;
	const Matrix4*  m_WorldView; ///< Current world to view's transformation matrix.
	const Matrix4*  m_ViewProj;  ///< Current view to projection's transformation matrix.
	const Frustum*  m_Frustum;  ///< Current view frustrum in world space.
	i32             m_Integer[4];
	Vector4         m_Vector;
	HANDLE          m_EventStart;
	HANDLE          m_EventEnd;
	DrawContext     m_Context;

	Camera*         m_Camera; ///< Current camera pointer
	Light*          m_Light; ///< Current light pointer

	DoubleBuffer<ProcList[LAYER_NUM]> m_DrawProc;

	// Shadow-map
	IDirect3DTexture9* m_ShadowMap;    // Texture to which the shadow map is rendered
	IDirect3DSurface9* m_ShadowDS;     // Depth-stencil buffer for rendering to shadow map
	IDirect3DSurface9* m_DefaultRT;
	IDirect3DSurface9* m_DefaultDS;

	void InitShadowMap();
	void UseShadowMap();

public:

	Render():
		m_D3D(NULL),
		m_D3DDevice(NULL),
		m_WorldView(NULL),
		m_ViewProj(NULL),
		m_EventStart(NULL),
		m_EventEnd(NULL),
		m_ShadowMap(NULL),
		m_ShadowDS(NULL) {}

	~Render() { Release(); }

	DrawDevice* GetDevice() { assert(m_D3DDevice != NULL); return m_D3DDevice; }
	
	void Initialize(); ///< Initialize
	void Release(); ///< Release

	void SetCamera(Camera* cam) { m_Camera = cam; }  ///< Set current camera.
	Camera* GetCamera() { return m_Camera; }         ///< Get current camera.
	void SetLight(Light* light) { m_Light = light; } ///< Set current light.
	Light* GetLight() { return m_Light; }            ///< Get current light.

	void SetWorldView(const Matrix4* mat) { m_WorldView = mat; } ///< Set current world to view's transformation matrix.
	const Matrix4* GetWorldView() { return m_WorldView; } ///< Get current world to view's transformation matrix.
	void SetViewProj(const Matrix4* mat) { m_ViewProj = mat; } ///< Set current view to projection's transformation matrix.
	const Matrix4* GetViewProj() { return m_ViewProj; } ///< Get current view to projection's transformation matrix.
	void SetFrustum(const Frustum* f) { m_Frustum = f; } ///< 
	const Frustum* GetFrustum() { return m_Frustum; } ///< 

	///
	void AddDrawProc(DrawProc* p) { AddDrawProc(LAYER_SMAP, p); }
	void AddDrawProc(i32 layer, DrawProc* p) { m_DrawProc.GetUpdate()[layer].push_back(p); }

	void Wait(BOOL stop = FALSE); /// Wait for render thread completion
	void Process(); /// Process
	void Synchronize(); ///< Process
	void Draw(const Model* model);
	void Run();

	// Macros
	#define VS_MATRIX(a,m)												m_D3DDevice->SetVertexShaderConstantF(a, rcast<const FLOAT*>(&(m)), 4);
	#define VS_VECTOR(a,v)												m_D3DDevice->SetVertexShaderConstantF(a, rcast<const FLOAT*>(&(v)), 1);
	#define VS_FLOAT4(a,x,y,z,w)	m_Vector.Set(x, y, z, w);	m_D3DDevice->SetVertexShaderConstantF(a, rcast<const FLOAT*>(&m_Vector), 1);
	#define VS_FLOAT(a,b)			m_Vector.x = b;				m_D3DDevice->SetVertexShaderConstantF(a, rcast<const FLOAT*>(&m_Vector), 1);
	#define VS_INT(a,b)				m_Integer[0] = b;				m_D3DDevice->SetVertexShaderConstantI(a, rcast<const INT*>(m_Integer), 1);
	#define VS_BOOL(a,b)				m_Integer[0] = b;				m_D3DDevice->SetVertexShaderConstantB(a, rcast<const BOOL*>(m_Integer), 1);
	#define VS_LIGHT(n,l)												m_D3DDevice->SetVertexShaderConstantF(V_LIGHTDATA+(_Light::VECTOR_NUMBER*n), rcast<const FLOAT*>(&(l)), _Light::VECTOR_NUMBER);
	
	#define PS_VECTOR(a,v)												m_D3DDevice->SetPixelShaderConstantF(a, rcast<const FLOAT*>(&(v)), 1);
	#define PS_FLOAT4(a,x,y,z,w)	m_Vector.Set(x, y, z, w);	m_D3DDevice->SetPixelShaderConstantF(a, rcast<const FLOAT*>(&m_Vector), 1);
	#define PS_FLOAT(a,b)			m_Vector.x = b;				m_D3DDevice->SetPixelShaderConstantF(a, rcast<const FLOAT*>(&m_Vector), 1);
	#define PS_INT(a,b)				m_Integer[0] = b;				m_D3DDevice->SetPixelShaderConstantB(a, rcast<const INT*>(m_Integer), 1);
	#define PS_BOOL(a,b)				m_Integer[0] = b;				m_D3DDevice->SetPixelShaderConstantB(a, rcast<const BOOL*>(m_Integer), 1);

	// Set material shader constant. @deprecated Old version used shader-model 3.0
	void _SetSpecularEnable(i32 enable);
	void _SetMaterialDiffuse(f32 r, f32 g, f32 b, f32 a);
	void _SetMaterialDiffuse(const Vector4 &color);
	void _SetMaterialAmbient(f32 r, f32 g, f32 b, f32 a);
	void _SetMaterialAmbient(const Vector4 &color);
	void _SetMaterialSpecular(f32 r, f32 g, f32 b, f32 a);
	void _SetMaterialSpecular(const Vector4 &color);
	void _SetMaterialEmissive(f32 r, f32 g, f32 b, f32 a);
	void _SetMaterialEmissive(const Vector4 &color);
	void _SetMaterialPower(f32 power);
	// Set light shader constant
	void _SetAmbientColor(f32 r, f32 g, f32 b, f32 a);
	void _SetAmbientColor(const Vector4 &color);
	void _SetLight(i32 id, const _Light &light);
	void _SetLightDirIni(i32 i);
	void _SetLightDirNum(i32 n);
	void _SetLightPointIni(i32 i);
	void _SetLightPointNum(i32 n);
	void _SetLightSpotIni(i32 i);
	void _SetLightSpotNum(i32 n);
	// Set fog shader constant
	void _SetFogType(i32 type);
	void _SetFogColor(f32 r, f32 g, f32 b, f32 a);
	void _SetFogColor(const Vector4 &color);
	void _SetFogSetting(f32 a, f32 b, f32 c);
	void _SetFogSetting(const Vector4 &vec);
	void _SetFogRange(i32 enable);
	// Set transformation matrix shader constant
	void _SetMatrixW(const Matrix4 &mat);
	void _SetMatrixWV(const Matrix4 &mat);
	void _SetMatrixWVP(const Matrix4 &mat);
	void _SetMatrixVIT(const Matrix4 &mat);
	void _SetMatrixWVIT(const Matrix4 &mat);
	// Set texture shader constant
	void _SetTextureType(i32 type);
	void _SetTexGenerationType(i32 id, i32 type);
	void _SetUVModifier(i32 id, f32 x, f32 y, f32 z, f32 w);
	void _SetUVModifier(i32 id, const Vector4 &vec);
	void _SetTextureFunction(i32 id, i32 func);
	void _SetTextureNumber(int num);
	// Set tweening shader constant
	void _SetTweenEnable(i32 enable);
	void _SetTweenFactor(f32 factor);

	// Set material shader constant (using shader-model 2.0)
	void SetMatrixWVP(const Matrix4 &mat);
	void SetMatrixWV(const Matrix4 &mat);
	void SetMatrixVLP(const Matrix4 &mat);
	void SetUVModifier(f32 x, f32 y, f32 z, f32 w);
	void SetUVModifier(const Vector4 &vec);
	void SetAmbientColor(f32 r, f32 g, f32 b, f32 a);
	void SetMaterialDiffuse(f32 r, f32 g, f32 b, f32 a);
	void SetMaterialDiffuse(const Vector4 &color);
	void SetLightPosition(f32 x, f32 y, f32 z);
	void SetLightPosition(const Vector4 &vec);
	void SetLightDirection(f32 x, f32 y, f32 z);
	void SetLightDirection(const Vector4 &vec);
	void SetLightDiffuse(f32 r, f32 g, f32 b, f32 a);
	void SetLightCosTheta(f32 x);
};

#define RenderInstance Render::Instance()
#define RenderDevice   Render::Instance().GetDevice()

} // namespace noe