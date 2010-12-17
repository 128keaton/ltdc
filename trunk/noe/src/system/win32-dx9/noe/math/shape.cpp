/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Geometric shapes
 * @file           shape.cpp
 * @package        noe.math
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

// noe
#include <noe/noe.h>
#include <noe/math/shape.h>
#include <noe/math/matrix4.h>

namespace noe
{

//---------------------------------------------------------
/**
 * Plane class.
 */
void Plane::Normalize()
{
	f32 mag = 1.0f / sqrt(a * a + b * b + c * c);
	a = a * mag;
	b = b * mag;
	c = c * mag;
	d = d * mag;
}

} // namespace noe