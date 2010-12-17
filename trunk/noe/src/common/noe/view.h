/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          View clas
 * @file           view.h
 * @package        noe
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

#pragma once

// noe
#include <noe/noe.h>

namespace noe
{

/// View structure. @deprecated
struct View
{
	Matrix4	m_ViewProj; ///< View-projection transformation matrix.
};

}; // Namespace noe.