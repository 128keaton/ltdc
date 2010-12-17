/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Module class
 * @file           module.h
 * @package        noe
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

#pragma once

// noe
#include <noe/noe.h>
#include <noe/system.h>

namespace noe
{
	
//-----------------------------------------------------------------------------
/**
 * Module class. 
 * @deprecated
 */
class Module
{
protected:
	
	System* m_System; ///< Pointer to the system class.

public:

	Module(): m_System(NULL) {} ///< Default constructor.
};

}; // Namespace noe.