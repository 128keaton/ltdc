/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Fur effect
 * @file           fur.h
 * @package        noe.effect
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

#pragma once

// std
#include <vector>
// DirectX
#include <d3d9.h>
#include <d3dx9.h>
// noe
#include <noe/noe.h>
#include <noe/singleton.h>
#include <noe/color.h>
#include <noe/render.h>
#include <noe/model.h>
#include <noe/effect/effect.h>

namespace noe
{

/**
 * Fur effect class
 */
class FurEffect : public Effect
{
public:

	/// Fur effect configuration
	struct Config
	{
		i16   layers;  ///< layers number
		i16   texture; ///< textures number
		i32   density; ///< texture density
		f32   length;  ///< fur length
		f32   min_per; ///<
		i16   width;   ///< texture width
		i16   height;  ///< texture height
		f32   scale_u; ///< texture U scale
		f32   scale_v; ///< texture V scale
		Color color;   ///< Fur color
		Color color2;  ///< Fur color

		Config(): layers(10), 
		          texture(0), // mean 'equal to layers'
					 density(1000),
		          length(0.25f),
		          min_per(0.5f), 
		          width(128), 
		          height(128), 
		          scale_u(10.0f), 
		          scale_v(10.0f), 
		          color(0xFFFFFFFF), 
		          color2(0xFFFFFFFF) {}

		static Config& Default() { static Config DefaultConfig; return DefaultConfig; }
	};

	FurEffect(); // Constructor
	~FurEffect(); // Destructor

	void Create(const Config* config = &Config::Default()); // Create textures and initialize effect
	void Release(); // Release effect

	/// Set the layer number. @param num The layer number.
	void SetLayerNumber(i16 num) { m_Config.layers = num; }
	/// Get the layer number. @return The layer number.
	i16  GetLayerNumber() const  { return m_Config.layers; }

	void Draw(DrawContext* context, const MaterialGroup* group); // Draw process

protected:

	std::vector<IDirect3DTexture9*> m_Textures; ///< Texture list.
	Shader m_Shader; ///< Fur effect shader interface
	Config m_Config; ///< Fur effect parameters

	void SetMatrixW(const Matrix4& mat);   // Set the View-World transformation matrix.
	void SetMatrixWVP(const Matrix4& mat); // Set the View-World-Proj transformation matrix.
	void SetParam(f32 layer);              // Set Fur effect paramters.
	void SetLightDir(const Vector4& dir);  // Set light direction.

	IDirect3DTexture9* GetTexture(f32 layer) const; // Get texture interface
};

} // namespace noe
