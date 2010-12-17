/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Lua script class
 * @file           script.cpp
 * @package        noe
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

// noe
#include <noe/script.h>
#include <noe/debug.h>
#include <noe/window.h>

namespace noe
{

//-----------------------------------------------------------------------------
/// Default Lua libraries list
const luaL_reg Script::DefaultLibs[] =
{
	{ LUA_COLIBNAME,   luaopen_base },
	{ LUA_TABLIBNAME,  luaopen_table },
	{ LUA_IOLIBNAME,   luaopen_io },
	{ LUA_OSLIBNAME,   luaopen_os },
	{ LUA_STRLIBNAME,  luaopen_string },
	{ LUA_MATHLIBNAME, luaopen_math },
	{ LUA_DBLIBNAME,   luaopen_debug },
	{ LUA_LOADLIBNAME, luaopen_package },
	{ NULL,            NULL }
};

//-----------------------------------------------------------------------------
/// Don't load any Lua library
const luaL_reg Script::NoLibs[] = { { NULL, NULL } };


//-----------------------------------------------------------------------------
//
// LuaC extension
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
/**
 * Load Lua library list
 * @param          L                   Lua state pointer.
 * @param          lib                 Lua library list pointer.
 */
LUALIB_API void luaL_addlibs(lua_State *L, const luaL_Reg * lib)
{
	for(; lib && lib->func; lib++) 
	{
		lua_pushcfunction(L, lib->func);
		lua_pushstring(L, lib->name);
		lua_call(L, 1, 0);
	}
}


//-----------------------------------------------------------------------------
//
// Script class member function implementation
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
/**
 * Constructor.
 * Open Lua state and load default libraries.
 * @param          lib                 Lua library list pointer.
 */
Script::Script(const luaL_reg* libs)
{ 
	m_State = lua_open(); 
	luaL_addlibs(m_State, libs);
	
	// Register custom functions
	lua_register(m_State, "GetScreenWidth",  GetScreenWidth);
	lua_register(m_State, "GetScreenHeight", GetScreenHeight);
}

//-----------------------------------------------------------------------------
/**
 * Destructor
 */
Script::~Script()
{ 
	lua_close(m_State); 
}

//-----------------------------------------------------------------------------
/**
 * Load a script
 * @param          filename            The script file to load.
 */
BOOL Script::Load(const c8* filename)
{ 
	return luaL_loadfile(m_State, filename) == 0;
}

//-----------------------------------------------------------------------------
/** 
 * Run a script
 */
void Script::Run()
{ 
	lua_call(m_State, 0, 0); 
}


//-----------------------------------------------------------------------------
//
// Template function implementation
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
/**
 * Get global variable.
 * @param          name                The name of global variable.
 * @return                             The global variable value.
 */
template<> i8 Script::GetGlobal<i8>(const c8* name)
{
	DBG_CODE(i32 top = lua_gettop(m_State));
	lua_getglobal(m_State, name);
	DBG_ASSERT(lua_gettop(m_State) == top + 1);
	DBG_ASSERT(lua_isnumber(m_State, -1));
	i8 ret = scast<i8>(lua_tonumber(m_State, -1));
	lua_pop(m_State, 1);
	return ret;
}

//-----------------------------------------------------------------------------
/**
 * Get global variable.
 * @param          name                The name of global variable.
 * @return                             The global variable value.
 */
template<> i16 Script::GetGlobal<i16>(const c8* name)
{
	DBG_CODE(i32 top = lua_gettop(m_State));
	lua_getglobal(m_State, name);
	DBG_ASSERT(lua_gettop(m_State) == top + 1);
	DBG_ASSERT(lua_isnumber(m_State, -1));
	i16 ret = scast<i16>(lua_tonumber(m_State, -1));
	lua_pop(m_State, 1);
	return ret;
}

//-----------------------------------------------------------------------------
/**
 * Get global variable.
 * @param          name                The name of global variable.
 * @return                             The global variable value.
 */
template<> i32 Script::GetGlobal<i32>(const c8* name)
{
	DBG_CODE(i32 top = lua_gettop(m_State));
	lua_getglobal(m_State, name);
	DBG_ASSERT(lua_gettop(m_State) == top + 1);
	DBG_ASSERT(lua_isnumber(m_State, -1));
	i32 ret = scast<i32>(lua_tonumber(m_State, -1));
	lua_pop(m_State, 1);
	return ret;
}

//-----------------------------------------------------------------------------
/**
 * Get global variable.
 * @param          name                The name of global variable.
 * @return                             The global variable value.
 */
template<> i64 Script::GetGlobal<i64>(const c8* name)
{
	DBG_CODE(i32 top = lua_gettop(m_State));
	lua_getglobal(m_State, name);
	DBG_ASSERT(lua_gettop(m_State) == top + 1);
	lua_isnumber(m_State, -1);
	i64 ret = scast<i64>(lua_tonumber(m_State, -1));
	lua_pop(m_State, 1);
	return ret;
}

//-----------------------------------------------------------------------------
/**
 * Get global variable.
 * @param          name                The name of global variable.
 * @return                             The global variable value.
 */
template<> f32 Script::GetGlobal<f32>(const c8* name)
{
	DBG_CODE(i32 top = lua_gettop(m_State));
	lua_getglobal(m_State, name);
	DBG_ASSERT(lua_gettop(m_State) == top + 1);
	DBG_ASSERT(lua_isnumber(m_State, -1));
	f32 ret = scast<f32>(lua_tonumber(m_State, -1));
	lua_pop(m_State, 1);
	return ret;
}

//-----------------------------------------------------------------------------
/**
 * Get global variable.
 * @param          name                The name of global variable.
 * @return                             The global variable value.
 */
template<> f64 Script::GetGlobal<f64>(const c8* name)
{
	DBG_CODE(i32 top = lua_gettop(m_State));
	lua_getglobal(m_State, name);
	DBG_ASSERT(lua_gettop(m_State) == top + 1);
	DBG_ASSERT(lua_isnumber(m_State, -1));
	f64 ret = scast<f64>(lua_tonumber(m_State, -1));
	lua_pop(m_State, 1);
	return ret;
}

//-----------------------------------------------------------------------------
/**
 * Get global variable.
 * @param          name                The name of global variable.
 * @return                             The global variable value.
 */
template<> BOOL Script::GetGlobal<BOOL>(const c8* name)
{
	DBG_CODE(i32 top = lua_gettop(m_State));
	lua_getglobal(m_State, name);
	DBG_ASSERT(lua_gettop(m_State) == top + 1);
	DBG_ASSERT(lua_isboolean(m_State, -1));
	BOOL ret = lua_toboolean(m_State, -1);
	lua_pop(m_State, 1);
	return ret;
}

//-----------------------------------------------------------------------------
/**
 * Get global variable.
 * @param          name                The name of global variable.
 * @return                             The global variable value.
 */
template<> const c8* Script::GetGlobal<const c8*>(const c8* name)
{
	DBG_CODE(i32 top = lua_gettop(m_State));
	lua_getglobal(m_State, name);
	DBG_ASSERT(lua_gettop(m_State) == top + 1);
	DBG_ASSERT(lua_isstring(m_State, -1));
	const c8* ret = lua_tostring(m_State, -1);
	lua_pop(m_State, 1);
	return ret;
}

//-----------------------------------------------------------------------------
//
// Functions usable in lua
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
/**
 * Get the screen width.
 * @param          state               Lua state pointer.
 * @return                             Number of returned value(s).
 */
int GetScreenWidth(lua_State* state)
{
	i32 w = Window::GetScreenWidth();
	lua_pushnumber(state, w);
	return 1; // number of returned value(s)
}

//-----------------------------------------------------------------------------
/**
 * Get the screen height.
 * @param          state               Lua state pointer.
 * @return                             Number of returned value(s).
 */
int GetScreenHeight(lua_State* state)
{
	i32 h = Window::GetScreenHeight();
	lua_pushnumber(state, h);
	return 1; // number of returned value(s)
}

}; // Namespace noe.