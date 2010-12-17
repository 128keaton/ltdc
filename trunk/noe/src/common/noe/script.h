/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Lua script class
 * @file           script.h
 * @package        noe
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

#pragma once

// lua
extern "C" 
{
#include <lua/lua.h>
#include <lua/lualib.h>
#include <lua/lauxlib.h>
}
// noe
#include <noe/noe.h>

namespace noe
{

//-----------------------------------------------------------------------------
// Functions to present to Lua

/// Get the screen width
int GetScreenWidth(lua_State*);
/// Get the screen height
int GetScreenHeight(lua_State*);

//-----------------------------------------------------------------------------
/**
 * Lua script handling class.
 */
class Script
{
public:

	/// Constructor
	Script(const luaL_reg* libs = DefaultLibs);

	/// Destructor
	~Script();

	/// Load a script
	BOOL Load(const c8* filename);

	/// Run a script
	void Run();

	/// Get a global variable value
	template <typename T> T GetGlobal(const c8* name);

protected:

	lua_State* m_State;                  ///< The Lua state pointer.
	static const luaL_reg DefaultLibs[]; ///< Default library list.
	static const luaL_reg NoLibs[];      ///< Empty library list.
};

}; // Namespace noe.