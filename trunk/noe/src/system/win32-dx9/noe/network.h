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

// win32
#include <windows.h>
// noe
#include <noe/noe.h>
#include <noe/singleton.h>

namespace noe
{

/** 
 * Network manager.
 * @todo Implement.
 * @test Connection test.
 */
class Network : Singleton<Network>
{
public:

	Network();
	~Network();

private:

	SOCKET m_Socket; /// @test Socket hanlde
};

}; // namespace noe