/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Vector class
 * @file           vector4.cpp
 * @package        noe.math
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

// noe
#include <noe/noe.h>
#include <noe/math.h>
#include <noe/math/vector4.h>
#include <noe/math/matrix4.h>

namespace noe
{

void Vector4::Transform(const Matrix4& mat)
{ 
	Vector4 ret;
	D3DXVec4Transform(rcast<D3DXVECTOR4*>(&ret), rcast<const D3DXVECTOR4*>(this), rcast<const D3DXMATRIX*>(&mat));
	*this = ret;
}

} // namespace noe