/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Light manager
 * @file           light.h
 * @package        noe
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

#pragma once

// std
#include <boost/scoped_array.hpp>
// std
#include <d3d9types.h>
// noe
#include <noe/noe.h>
#include <noe/singleton.h>
#include <noe/camera.h>
#include <noe/math/vector4.h>

namespace noe
{

//-----------------------------------------------------------------------------
/**
 * Light types enumeration
 * @deprecated Used for Shader Model 3.0 lights
 */
enum LIGHT_TYPES
{
	LIGHT_TYPE_POINT       = D3DLIGHT_POINT,
	LIGHT_TYPE_SPOT        = D3DLIGHT_SPOT,
	LIGHT_TYPE_DIRECTIONAL = D3DLIGHT_DIRECTIONAL,
};

//-----------------------------------------------------------------------------
/**
 * Light class
 */
class Light: public DrawProc
{
	Matrix4 m_View;   // View matrix for shadow map
	Matrix4 m_Proj;   // Projection matrix for shadow map

public:

	/**
	 * Apply light data.
	 * @todo The light manipulation must be bring to the application. This is only a test.
	 * @param         context             Draw context. <i>Not used.</i>
	 */
	virtual void Draw(DrawContext* context)
	{
		// Set light projection matrix
		f32 fLightFov = PI_2;
		m_Proj.PerspectiveFovLH(fLightFov, 1, 0.01f, 100.0f);

		// Update light view vectors
		Vector4 eye(0.0f, 15.0f, 10.0f, 1.0f);
		static f32 z(-0.5f);
/*		static f32 dt(0.001f);
		z += dt;
		if(z > 0.5f) dt *= -1.0f;
		if(z < -0.5f) dt *= -1.0f;*/
		Vector4 dir(0.0f, -1.0f, z, 0.0f);

		// Update light view matrix
		Vector4 target = eye + dir;
		m_View.LookAtLH(rcast<Vector3*>(&eye), rcast<Vector3*>(&target), &Vector3::Up());

		// Set light view and projection matrix
		RenderInstance.SetWorldView(&m_View);
		RenderInstance.SetViewProj(&m_Proj);

		Matrix4 VLP;
		VLP = RenderInstance.GetCamera()->WorldView(RENDER);
		VLP.Inverse();
		VLP.Multiply(&m_View);
		VLP.Multiply(&m_Proj);
		RenderInstance.SetMatrixVLP(VLP);

		eye.Transform(RenderInstance.GetCamera()->WorldView(RENDER)); // Light position in camera view space
		dir.Transform(RenderInstance.GetCamera()->WorldView(RENDER)); // Light direction in camera view space

		/// Set light information
		RenderInstance.SetLightPosition(eye);
		RenderInstance.SetLightDirection(dir);
		RenderInstance.SetLightDiffuse(1.0f, 1.0f, 1.0f, 1.0f);
		RenderInstance.SetLightCosTheta(cosf(fLightFov / 2.0f));
	}

	/// Synchronize double buffer data. @todo Create double-buffered data and implement this function to synchronize update/render data.
	virtual void Synchronize() {}
};

//-----------------------------------------------------------------------------
/**
 * _Light class
 * @deprecated Used for Shader Model 3.0 lights
 */
class _Light: public DrawProc
{
protected:

	// ---- Sender data - Start ----
	Vector4 m_Diffuse;		// D3DLIGHT9::Diffuse
	Vector4 m_Specular;		// D3DLIGHT9::Specular
	Vector4 m_Ambient;		// D3DLIGHT9::Ambient
	Vector4 m_Position;		// D3DLIGHT9::Position
	Vector4 m_Direction;	// D3DLIGHT9::Direction
	Vector4 m_Attenuation;	// D3DLIGHT9::Attenuation0 | D3DLIGHT9::Attenuation1 | D3DLIGHT9::Attenuation2 | D3DLIGHT9::Range
	Vector4 m_Spot;			// D3DLIGHT9::Theta | D3DLIGHT9::Phi | D3DLIGHT9::Falloff | --
	// ---- Sender data - End ----
	int    m_Type;

public:
	
	static const int VECTOR_NUMBER = 1; ///< Maximum number of light. @deprecated Currently, only one light can used for shadow-mapping

public:

	void SetType(i32 type) { m_Type = type; } ///< Set light type. @param type The light type.
	i32 GetType() { return m_Type; }          ///< Get light type. @return The light type.

	// diffuse color
	void SetDiffuse(const Vector4 &color) { m_Diffuse = color; }     ///< Set the light diffuse color. @param color The color to set
	void SetDiffuse(f32 r, f32 g, f32 b) { m_Diffuse.Set(r, g, b); } ///< Set the light diffuse color. @param r The red element of the color. @param g The green element of the color. @param b The blue element of the color. 
	const Vector4 &GetDiffuse() const { return m_Diffuse; }          ///< Get the diffuse light color. @return The diffuse light color
	
	// specular color
	void SetSpecular(const Vector4 &color) { m_Specular = color; }     ///< Set the light specular color. @param color The color to set
	void SetSpecular(f32 r, f32 g, f32 b) { m_Specular.Set(r, g, b); } ///< Set the light specular color. @param r The red element of the color. @param g The green element of the color. @param b The blue element of the color. 
	const Vector4 &GetSpecular() const { return m_Specular; }		   ///< Get the specular light color. @return The specular light color
																	   
	// ambiant color												   
	void SetAmbient(const Vector4 &color) { m_Ambient = color; }	 ///< Set the light ambiant color. @param color The color to set
	void SetAmbient(f32 r, f32 g, f32 b) { m_Ambient.Set(r, g, b); } ///< Set the light ambiant color. @param r The red element of the color. @param g The green element of the color. @param b The blue element of the color. 
	const Vector4 &GetAmbient() const { return m_Ambient; }			 ///< Get the ambiant light color. @return The ambiant light color
																	   
	// position vector												   
	void SetPosition(const Vector4 &pos) { m_Position = pos; }		   ///< Set the light position. @param pos The light position
	void SetPosition(f32 x, f32 y, f32 z) { m_Position.Set(x, y, z); } ///< Set the light position. @param x The <tt>x</tt> component of the position. @param y The <tt>y</tt> component of the position. @param z The <tt>z</tt> component of the position.
	const Vector4 &GetPosition() const { return m_Position; }		   ///< Get the diffuse light color. @return The diffuse light color
																	   
	// direction vector
	void SetDirection(const Vector4 &pos) { m_Direction = pos; }	     ///< Set the light direction. @param pos The light direction
	void SetDirection(f32 x, f32 y, f32 z) { m_Direction.Set(x, y, z); } ///< Set the light direction. @param x The <tt>x</tt> component of the direction. @param y The <tt>y</tt> component of the direction. @param z The <tt>z</tt> component of the direction.
	const Vector4 &GetDirection() const { return m_Direction; }			 ///< Get the diffuse light color. @return The diffuse light color

	// power range
	void SetRange(f32 range) { m_Attenuation.w = range; } ///< Set light range. @param range The light range.
	f32 GetRange() const { return m_Attenuation.w; }      ///< Get light range. @return The light range.

	// power attenuation
	void SetAttenuation(const Vector4 &att) { m_Attenuation = att; } ///< Set light attenuation factors. @param att The attenuation factors.
	void SetAttenuation(f32 a0, f32 a1, f32 a2) { m_Attenuation.Set(a0, a1, a2); } ///< Set light attenuation factors. 
	void SetAttenuation(f32 a0, f32 a1, f32 a2, f32 range) { m_Attenuation.Set(a0, a1, a2, range); } ///< Set light attenuation factors. 
	const Vector4 &GetAttenuation() const { return m_Attenuation; } ///< Get light attenuation factors. @return The attenuation factors.

	// falloff
	void SetFalloff(f32 falloff) { m_Spot.z = falloff; } ///< Set light fallout factor. @param range The light fallout factor.
	f32 GetFalloff() const { return m_Spot.z; }			 ///< Get light fallout factor. @return The light fallout factor.	
	
	// spot
	void SetSpot(const Vector4 &spot) { m_Spot= spot; } ///< Set light spot paramters. @param spot The light spot paramters.
	void SetSpot(f32 theta, f32 phi, f32 falloff) { m_Spot.Set(theta, phi, falloff); } ///< Set light spot paramters. 
	const Vector4 &GetSpot() const { return m_Spot; } ///< Get light spot paramters. @return The light spot paramters.

	// Draw
	virtual void Draw(DrawContext*) {} ///< Apply light data. @todo Implement
	virtual void Synchronize() {}      ///< Synchronize double buffer data. @todo Implement
};

//-----------------------------------------------------------------------------
/**
 * Light manager class
 * @deprecated Used for Shader Model 3.0 lights
 */
class LightManager : public Singleton<LightManager>
{
	std::vector<_Light*> m_List; ///< Light list

public:

	void Add(_Light* light) { m_List.push_back(light); } ///< Add a light to the list. @param light The pointer to the light to be added.
	void Flush() { m_List.resize(0); } ///< Flush the light list.
};


} // namespace noe