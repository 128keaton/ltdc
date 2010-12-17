/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Scene manager
 * @file           scene.cpp
 * @package        noe
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

// noe
#include <noe/noe.h>
#include <noe/math.h>
#include <noe/font.h>
#include <noe/render.h>
#include <noe/scene.h>
#include <noe/system.h>

namespace noe
{

//-----------------------------------------------------------------------------
/**
 * Initialize scene.
 */
void Scene::Initialize()
{
	DBG_PRINTL("noe.Scene.Initialize");

	noe::Timer::Initialize();
};

//-----------------------------------------------------------------------------
/**
 * Resize the scene.
 * @param          width               Screen width. 
 * @param          height              Screen height.
 */
void Scene::Resize(int width, int height)
{
	// Calculate the aspect ratio of the window
	m_Views[0]->SetAspect(scast<f32>(width)/scast<f32>(height));
}

//-----------------------------------------------------------------------------
/**
 * Add the render procedure into the draw queue.
 */
void Scene::Render()
{
	// Build draw process list
	RenderInstance.AddDrawProc(0, &DrawClearAll::Instance());
	RenderInstance.AddDrawProc(0, &DrawBegin::Instance());
	RenderInstance.AddDrawProc(0, &DrawInitShader::Instance());
	RenderInstance.AddDrawProc(0, &DrawLight::Instance());

	/*if(m_Lights.size() > 0)
		RenderInstance.AddDrawProc(0, &m_Lights[0]);*/

	for(std::vector<Camera*>::iterator iview = m_Views.begin(); iview != m_Views.end(); iview++)
	{
		// Add camera's draw callback
		RenderInstance.AddDrawProc(0, (*iview));

		// Add model's draw callback
		for(std::vector<Model*>::iterator imod = m_Models.begin(); imod != m_Models.end(); imod++)
		{
			if((*imod)->IsCastShadow())
				RenderInstance.AddDrawProc(1, (*imod));
			else
				RenderInstance.AddDrawProc(3, (*imod));
		}
	}

	RenderInstance.AddDrawProc(2, &DrawClearZBuffer::Instance());	

	// Fonts
	loop(i, scast<i32>(m_Fonts.size()))
		RenderInstance.AddDrawProc(3, m_Fonts[i]);

	RenderInstance.AddDrawProc(3, &DrawEnd::Instance());

	// Wait for the render process end and swap the double-buffer index.
	RenderInstance.Wait();

	Timer::Update();
}	

}; // namespace noe