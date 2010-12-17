/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Frustum manager class
 * @file           frustum.h
 * @package        noe.math
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

#pragma once

// noe
#include <noe/noe.h>
#include <noe/math/shape.h>
#include <noe/math/vector3.h>

namespace noe
{

class Matrix4;

//---------------------------------------------------------
/**
 * Frustum class.
 */
struct Frustum
{
	enum
	{
		INSIDE           = 0,
		OUTSIDE          = 1,
		INTERSECT        = 2, // if there is any intersection, the intersected planes are flaged as bellow
		INTERSECT_BACK   = 0x04,
		INTERSECT_FRONT  = 0x08,
		INTERSECT_RIGHT  = 0x10,
		INTERSECT_LEFT   = 0x20,
		INTERSECT_TOP    = 0x40,
		INTERSECT_BOTTOM = 0x80,
	};

	Plane planes[6];

	// Builf frustum from a mterix.
	void Build(const Matrix4& m, BOOL norm = TRUE);

	// Normalize the frustum
	void Normalize();

	u32 Intersect(const Sphere& s) const;
};


} // namespace noe