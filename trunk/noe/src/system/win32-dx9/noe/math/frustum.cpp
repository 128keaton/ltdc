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
 
// noe
#include <noe/noe.h>
#include <noe/math/frustum.h>
#include <noe/math/matrix4.h>
#include <noe/distance.h>

namespace noe
{

//---------------------------------------------------------
/**
	* Builf frustum from a mterix.
	* @param		m		The input matrix.
	* If <tt>m</tt> is the 'Projection' matrix, the frustum is in 'View' space.
	* If <tt>m</tt> is the 'ViewProj' matrix, the frustum is in 'World' space.
	* If <tt>m</tt> is the 'WorldViewProj' matrix, the frustum is in 'Object' space.
	*/
void Frustum::Build(const Matrix4& m, BOOL norm)
{
	// Left clipping plane
	planes[0].a = m._14 + m._11;
	planes[0].b = m._24 + m._21;
	planes[0].c = m._34 + m._31;
	planes[0].d = m._44 + m._41;

	// Right clipping plane
	planes[1].a = m._14 - m._11;
	planes[1].b = m._24 - m._21;
	planes[1].c = m._34 - m._31;
	planes[1].d = m._44 - m._41;

	// Top clipping plane
	planes[2].a = m._14 - m._12;
	planes[2].b = m._24 - m._22;
	planes[2].c = m._34 - m._32;
	planes[2].d = m._44 - m._42;

	// Bottom clipping plane
	planes[3].a = m._14 + m._12;
	planes[3].b = m._24 + m._22;
	planes[3].c = m._34 + m._32;
	planes[3].d = m._44 + m._42;

	// Near clipping plane
	planes[4].a = m._13;
	planes[4].b = m._23;
	planes[4].c = m._33;
	planes[4].d = m._43;

	// Far clipping plane
	planes[5].a = m._14 - m._13;
	planes[5].b = m._24 - m._23;
	planes[5].c = m._34 - m._33;
	planes[5].d = m._44 - m._43;

	if(norm)
		Normalize();
}

//---------------------------------------------------------
/**
 * Normalize the frustum's plane equations
 */
void Frustum::Normalize()
{
	planes[0].Normalize();
	planes[1].Normalize();
	planes[2].Normalize();
	planes[3].Normalize();
	planes[4].Normalize();
	planes[5].Normalize();
}
                  
//---------------------------------------------------------
/**
 *
 */
u32 Frustum::Intersect(const Sphere& s) const
{
	loop(i, 6)
	{
		f32 dist = Distance(s.center, planes[i]);
		if(dist < -s.radius)
         return OUTSIDE;
		else if(dist <= s.radius)
         return INTERSECT;
	}
	return INSIDE;
}

} // namespace noe