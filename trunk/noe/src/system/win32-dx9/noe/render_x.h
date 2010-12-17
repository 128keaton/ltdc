#pragma once

// std/stl
#include <vector>
// boost
#include <boost/scoped_array.hpp>
// dx9
#include <d3d9.h>
// noe
#include <noe/noe.h>
#include <noe/model.h>
#include <noe/light.h>
#include <noe/math/matrix4.h>
#include <noe/math/vector4.h>
#include <noe/shader/constant.h>

namespace noe
{

#define USE_LAST_CHECK 0

typedef std::vector<Light*> LightList;

/**
 * EasyRender main render class.
 * @note Not multi-thread safe.
 */
class Renderer
{
	// members
	static const i32 LIGHTS_MAX = 8;

	const Model*	m_Model;
	Matrix4			m_View;
	Matrix4			m_Projection;
	Light				m_Lights[LIGHTS_MAX];
	u32				m_LightsNum;

	static i32		m_Integer[4];
	static Vector4 m_Vector;
	static Matrix4	m_Matrix;
	static Light	m_Light;

public:

	Renderer() : m_Model(NULL)/*, m_View(NULL), m_Projection(NULL), m_Lights(NULL)*/, m_LightsNum(0) {}
	Renderer(const Model* mod, const Matrix4* view, const Matrix4* proj, LightList* lights)
	{ 
		SetModel(mod); 
		SetView(view); 
		SetProjection(proj);
		SetLights(lights);
	}

	void SetModel(const Model* mod) { m_Model = mod; }
	void SetView(const Matrix4* view) { m_View = *view; }
	void SetProjection(const Matrix4* proj) { m_Projection = *proj; }
	void SetLights(LightList* lights) 
	{ 
		if(lights) 
		{ 
			m_LightsNum = scast<u32>(lights->size());
			//DBG_CHECK(m_LightsNum <= LIGHTS_MAX, "Error: A maximum of %d must be set by render pass. You setted %d lights!", LIGHTS_MAX, m_LightsNum);
			loop(i, scast<i32>(m_LightsNum))
				m_Lights[i] = *(*lights)[i];
		}
		else
			m_LightsNum = 0;
	}

	// Macros
	#define VS_MATRIX(a,m)												RenderDevice->SetVertexShaderConstantF(a, rcast<const FLOAT*>(&(m)), 4);
	#define VS_VECTOR(a,v)												RenderDevice->SetVertexShaderConstantF(a, rcast<const FLOAT*>(&(v)), 1);
	#define VS_FLOAT4(a,x,y,z,w)	m_Vector.Set(x, y, z, w);	RenderDevice->SetVertexShaderConstantF(a, rcast<const FLOAT*>(&m_Vector), 1);
	#define VS_FLOAT(a,b)			m_Vector.x = b;				RenderDevice->SetVertexShaderConstantF(a, rcast<const FLOAT*>(&m_Vector), 1);
	#define VS_INT(a,b)				m_Integer[0] = b;				RenderDevice->SetVertexShaderConstantI(a, rcast<const INT*>(m_Integer), 1);
	#define VS_BOOL(a,b)				m_Integer[0] = b;				RenderDevice->SetVertexShaderConstantB(a, rcast<const BOOL*>(m_Integer), 1);
	#define VS_LIGHT(n,l)												RenderDevice->SetVertexShaderConstantF(V_LIGHTDATA+(Light::VECTOR_NUMBER*n), rcast<const FLOAT*>(&(l)), Light::VECTOR_NUMBER);
	
	#define PS_FLOAT(a,b)			m_Vector.x = b;				RenderDevice->SetPixelShaderConstantF(a, rcast<const FLOAT*>(&m_Vector), 1);
	#define PS_INT(a,b)				m_Integer[0] = b;				RenderDevice->SetPixelShaderConstantB(a, rcast<const INT*>(m_Integer), 1);
	#define PS_BOOL(a,b)				m_Integer[0] = b;				RenderDevice->SetPixelShaderConstantB(a, rcast<const BOOL*>(m_Integer), 1);

	// Vertex shader
	void PushSpecularEnable(i32 enable)                     { VS_BOOL(B_SPECULAR, enable); }
	void PushMaterialDiffuse(f32 r, f32 g, f32 b, f32 a)    { VS_FLOAT4(V_MATERIALDIFFUSE, r, g, b, a); }
	void PushMaterialDiffuse(const Vector4 &color)           { VS_VECTOR(V_MATERIALDIFFUSE, color); }
	void PushMaterialAmbient(f32 r, f32 g, f32 b, f32 a)    { VS_FLOAT4(V_MATERIALAMBIENT, r, g, b, a); }
	void PushMaterialAmbient(const Vector4 &color)           { VS_VECTOR(V_MATERIALAMBIENT, color); }
	void PushMaterialSpecular(f32 r, f32 g, f32 b, f32 a)   { VS_FLOAT4(V_MATERIALSPECULAR, r, g, b, a); }
	void PushMaterialSpecular(const Vector4 &color)          { VS_VECTOR(V_MATERIALSPECULAR, color); }
	void PushMaterialEmissive(f32 r, f32 g, f32 b, f32 a)   { VS_FLOAT4(V_MATERIALEMISSIVE, r, g, b, a); }
	void PushMaterialEmissive(const Vector4 &color)          { VS_VECTOR(V_MATERIALEMISSIVE, color); }
	void PushMaterialPower(f32 power)                       { VS_FLOAT(V_MATERIALPOWER, power); }
	void PushAmbientColor(f32 r, f32 g, f32 b, f32 a)       { VS_FLOAT4(V_AMBIENTCOLOR, r, g, b, a); }
	void PushAmbientColor(const Vector4 &color)              { VS_VECTOR(V_AMBIENTCOLOR, color); }
	void PushTweenEnable(i32 enable)                        { VS_BOOL(B_SPECULAR, enable); }
	void PushTweenFactor(f32 factor)                        { VS_FLOAT(V_TWEENFACTOR, factor); }
	void PushFogType(i32 type)                              { VS_FLOAT(V_FOGTYPE, scast<f32>(type)); }
	void PushFogColor(f32 r, f32 g, f32 b, f32 a)           { VS_FLOAT4(V_FOGCOLOR, r, g, b, a); }
	void PushFogColor(const Vector4 &color)                  { VS_VECTOR(V_FOGCOLOR, color); }
	void PushFogSetting(f32 a, f32 b, f32 c)                { VS_FLOAT4(V_FOGSETTING, a, b, c, 0.f); }
	void PushFogSetting(const Vector4 &vec)                  { VS_VECTOR(V_FOGSETTING, vec); }
	void PushFogRange(i32 enable)                           { VS_BOOL(B_FOGRANGE, enable); }
	
	void PushTextureType(i32 type)                          { VS_FLOAT(V_TEXTYPE, scast<f32>(type)); }
	void PushTexGenerationType(i32 id, i32 type)            { VS_FLOAT(V_TEXGENTYPE+id, scast<f32>(type)); }
	void PushUVModifier(i32 id, f32 x, f32 y, f32 z, f32 w) { VS_FLOAT4(V_UVMODIFIER+id, x, y, z, w); }
	void PushUVModifier(i32 id, const Vector4 &vec)          { VS_VECTOR(V_UVMODIFIER+id, vec); }
	
	void PushLight(i32 id, const Light &light)              { VS_LIGHT(id, light); }
	void PushLightDirIni(i32 i)                             { VS_FLOAT(V_LIGHTDIRINI, scast<f32>(i)); }
	void PushLightDirNum(i32 n)                             { VS_INT(I_LIGHTDIRNUM, n); }
	void PushLightPointIni(i32 i)                           { VS_FLOAT(V_LIGHTPOINTINI, scast<f32>(i)); }
	void PushLightPointNum(i32 n)                           { VS_INT(I_LIGHTPOINTNUM, n); }
	void PushLightSpotIni(i32 i)                            { VS_FLOAT(V_LIGHTSPOTINI, scast<f32>(i)); }
	void PushLightSpotNum(i32 n)                            { VS_INT(I_LIGHTSPOTNUM, n); }

	void PushMatrixW(const Matrix4 &mat)                     { VS_MATRIX(V_WORLD, mat); }
	void PushMatrixWV(const Matrix4 &mat)                    { VS_MATRIX(V_WORLDVIEW, mat); }
	void PushMatrixWVP(const Matrix4 &mat)                   { VS_MATRIX(V_WORLDVIEWPROJ, mat); }
	void PushMatrixVIT(const Matrix4 &mat)                   { VS_MATRIX(V_VIEWIT, mat); }
	void PushMatrixWVIT(const Matrix4 &mat)                  { VS_MATRIX(V_WORLDVIEWIT, mat); }

	// Pixel shader
	void PushTextureFunction(i32 id, i32 func)			    { PS_FLOAT(PS_TEXTURETYPE+id, scast<f32>(func)); }

	// Pixel & Vertex shader
	void PushTextureNumber(int num)						    { VS_FLOAT(V_TEXTURENUM, scast<f32>(num)); PS_FLOAT(PS_TEXTURENUM, scast<f32>(num)); }
						
	void InitShader();
	void Draw();
};

} // namespace noe