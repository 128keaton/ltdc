/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Vector class
 * @file           vector2.h
 * @package        noe.math
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

#pragma once

// dx9
#include <d3dx9math.h>
// noe
#include <noe/math.h>

namespace noe
{

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
class Vector2
{
public:

	union
	{
		struct{ f32 x, y; };
		struct{ f32 u, v; };
	};

	// constructor
	Vector2(){}
	Vector2(f32 _x, f32 _y) { x = _x, y = _y; }
	Vector2(const D3DXVECTOR2 &vec){ x = vec.x, y = vec.y; }
	
	// automatic cast
	operator f32* (){ return (f32 *)&this->x; }
};

} // namespace noe