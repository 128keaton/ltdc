/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Window manager
 * @file           window.h
 * @package        noe
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

#pragma once

// win32
#include <windows.h>
#include <winuser.h>
// dx9
#include <d3d9.h>
#include <d3dx9math.h>
// noe
#include <noe/math.h>
#include <noe/window_config.h>
#include <noe/singleton.h>

namespace noe
{

/// Class identifier
#define NOE_REGISTER_CLASS "<<NOE-APPLICATION-CLASS>>"

class Scene;

/**
 * Window manager class
 */
class Window: public Singleton<Window>
{
friend class Render;
friend class Scene;
friend class Input;

private:

	HDC           m_DC;       ///< Private GDI device context
	HWND          m_Handle;   ///< Our window's handle
	HINSTANCE     m_Instance; ///< Instance of the application
	WindowConfig* m_Config;   ///< Window configuration
	
public:

	BOOL keys[256]; ///< List of pressed keys

	/// Window's constructor. Initialize members with default value.
	Window(): m_DC(NULL), m_Handle(NULL), m_Config(NULL) {}
	~Window(); // Destructor

	virtual void Render(); // Render the window.
	virtual void Resize(int width, int height); // Resize the window.

	virtual BOOL Create(WindowConfig* conf); // Create the window
	virtual BOOL Process(); // Process window update
	virtual void Release(); // Release window

	/// Get Window configuration. @return The Window configuration.
	virtual WindowConfig* Config() { return m_Config; }

	/// Get screen width. @return The screen width.
	static i32 GetScreenWidth()  { return GetSystemMetrics(SM_CXSCREEN); }
	/// Get screen height. @return The screen height.
	static i32 GetScreenHeight() { return GetSystemMetrics(SM_CYSCREEN); }
};

/// Window manager instance
#define WindowInstance Window::Instance()

}; // namespace noe