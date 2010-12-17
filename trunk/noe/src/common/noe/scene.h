/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Scene manager
 * @file           scene.h
 * @package        noe
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

#pragma once

// std
#include <vector>
// noe
#include <noe/noe.h>
#include <noe/window.h>
#include <noe/camera.h>
#include <noe/model.h>
#include <noe/font.h>

namespace noe
{

/**
 * World scene class.
 * World partitionning, scene node tree, etc.
 */
class Scene: public Singleton<Scene>
{
private:

	std::vector<Camera*> m_Views;  ///< Scene cameras list 
	std::vector<Model*>  m_Models; ///< Scene models list 
	std::vector<Font*>   m_Fonts;  ///< Scene fonts list 
	std::vector<Light*>  m_Lights; ///< Scene light list. @todo Allow more than light (1 for shadow-map and X for normal lightning).

public:

	/// Initialize scene.
	void Initialize();

	/// Add a camera to the scene. @param cam Camera to add.
	void AddView(Camera* cam)   { m_Views.push_back(cam); }
	/// Add a model to the scene. @param mod Model to add.
	void AddModel(Model* mod)   { m_Models.push_back(mod); }
	/// Add a font to the scene. @param font Font to add.
	void AddFont(Font* font)    { m_Fonts.push_back(font); }
	/// Add a light to the scene. @param light Light to add.
	void AddLight(Light* light) { m_Lights.push_back(light); }

	/// Clear camera list.
	void ClearView()  { m_Views.clear(); }
	/// Clear model list.
	void ClearModel() { m_Models.clear(); }
	/// Clear font list.
	void ClearFont()  { m_Fonts.clear(); }
	/// Clear font list.
	void ClearLight()  { m_Lights.clear(); }

	/// Release scene.
	void Release()
	{
		ClearView();
		ClearModel();
		ClearFont();
		ClearLight();
	}

	/// Render the scene.
	void Render();
	/// Resize the scene.
	void Resize(int width, int height);
};
/// Instance of the Scene singleton
#define SceneInstance Scene::Instance()

}; // namespace noe