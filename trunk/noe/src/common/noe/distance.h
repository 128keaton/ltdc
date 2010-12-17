/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Distance functions
 * @file           distance.h
 * @package        noe
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

#pragma once

// noe
#include <noe/noe.h>
#include <noe/math.h>
#include <noe/math/vector3.h>
#include <noe/math/line.h>
#include <noe/math/shape.h>

namespace noe
{

//-----------------------------------------------------------------------------
// Point <-> Point
//-----------------------------------------------------------------------------

/// Get the squared distance between two 3d points.
f32 SqrDistance     (const Vector3&,   const Vector3&);
/// Get the distance between two 3d points.
f32 Distance        (const Vector3&,   const Vector3&);
/// Get the squared horizontal distance between two 3d points.
f32 SqrDistanceXZ   (const Vector3&,   const Vector3&);
/// Get the horizontal distance between two 3d points.
f32 DistanceXZ      (const Vector3&,   const Vector3&);

//-----------------------------------------------------------------------------
// Point <-> Plane
//-----------------------------------------------------------------------------

/// Get the distance between a 3d point and a plane.
f32 Distance        (const Vector3&,   const Plane&);

//-----------------------------------------------------------------------------
// Point <-> Line
//-----------------------------------------------------------------------------

/// Get the squared distance between a 3d point and a line.
f32 SqrDistance     (const Vector3&,   const Line3&,       f32* param=NULL);
/// Get the distance between a 3d point and a line.
f32 Distance        (const Vector3&,   const Line3&,       f32* param=NULL);
/// Get the horizontal squared distance between a 3d point and a line.
f32 SqrDistanceXZ   (const Vector3&,   const Line3&,       f32* param=NULL);
/// Get the horizontal distance between a 3d point and a line.
f32 DistanceXZ      (const Vector3&,   const Line3&,       f32* param=NULL);

//-----------------------------------------------------------------------------
// Point <-> Ray
//-----------------------------------------------------------------------------

/// Get the squared distance between a 3d point and a ray.
f32 SqrDistance     (const Vector3&,   const Ray3&,        f32* param=NULL);
/// Get the distance between a 3d point and a ray.
f32 Distance        (const Vector3&,   const Ray3&,        f32* param=NULL);

//-----------------------------------------------------------------------------
// Point <-> Segment
//-----------------------------------------------------------------------------

/// Get the squared distance between a 3d point and a segment.
f32 SqrDistance     (const Vector3&,   const Segment3&,    f32* param=NULL);
/// Get the distance between a 3d point and a segment.
f32 Distance        (const Vector3&,   const Segment3&,    f32* param=NULL);
/// Get the horizontal squared distance between a 3d point and a segment.
f32 SqrDistanceXZ   (const Vector3&,   const Segment3&,    f32* param=NULL);
/// Get the horizontal distance between a 3d point and a segment.
f32 DistanceXZ      (const Vector3&,   const Segment3&,    f32* param=NULL);

//-----------------------------------------------------------------------------
// Point <-> Triangle3
//-----------------------------------------------------------------------------

/// Get the squared distance between a 3d point and a triangle.
f32 SqrDistance     (const Vector3&,   const Triangle3&,   f32* ppnt=NULL,     f32* ptri=NULL);
/// Get the distance between a 3d point and a triangle.
f32 Distance        (const Vector3&,   const Triangle3&,   f32* ppnt=NULL,     f32* ptri=NULL);

//-----------------------------------------------------------------------------
// Segment <-> Triangle3
//-----------------------------------------------------------------------------

/// Get the squared distance between a 3d segment and a triangle.
f32 SqrDistance     (const Segment3&,  const Triangle3&,   f32* pseg=NULL,     f32* ptri1=NULL,    f32* ptri2=NULL);
/// Get the distance between a 3d segment and a triangle.
f32 Distance        (const Segment3&,  const Triangle3&,   f32* pseg=NULL,     f32* ptri1=NULL,    f32* ptri2=NULL);

//-----------------------------------------------------------------------------
// Segment <-> Segment
//-----------------------------------------------------------------------------

/// Get the squared distance between two 3d segment.
f32 Distance        (const Segment3&,  const Segment3&,    f32* pseg1=NULL,    f32* pseg2=NULL);
/// Get the distance between two 3d segment.
f32 SqrDistance     (const Segment3&,  const Segment3&,    f32* pseg1=NULL,    f32* pseg2=NULL);

//-----------------------------------------------------------------------------
// Line <-> Segment
//-----------------------------------------------------------------------------

/// Get the squared distance between a 3d line and a segment.
f32 Distance        (const Line3&,      const Segment3&,    f32* pline=NULL,    f32* pseg=NULL);
/// Get the distance between a 3d line and a segment.
f32 SqrDistance     (const Line3&,      const Segment3&,    f32* pline=NULL,    f32* pseg=NULL);

//-----------------------------------------------------------------------------
// Line <-> Line
//-----------------------------------------------------------------------------

/// Get the squared distance between two 3d lines.
f32 Distance        (const Line3&,     const Line3&,        f32* plin1=NULL,    f32* plin2=NULL);
/// Get the distance between two 3d lines.
f32 SqrDistance     (const Line3&,     const Line3&,        f32* plin1=NULL,    f32* plin2=NULL);

} // namespace noe