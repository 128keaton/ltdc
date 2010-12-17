/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Geometric shapes
 * @file           shape.h
 * @package        noe.math
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

#pragma once

// noe
#include <noe/math.h>
#include <noe/math/line.h>

namespace noe
{

class Matrix4;

//---------------------------------------------------------
/**
 * Plane class.
 */
struct Plane: public D3DXPLANE
{
	//f32 a, b, c, d;

public:
	void Normalize();
};

//---------------------------------------------------------
/**
 * 3D triangle class.
 */
class Triangle3
{
	Vector3 pos, edge1, edge2;

public:

	Vector3& Origin() { return pos; }
	Vector3& Edge1()	{ return edge1; }
	Vector3& Edge2()	{ return edge2; }
	
	const Vector3& Origin() const { return pos; }
	const Vector3& Edge1()	const { return edge1; }
	const Vector3& Edge2()	const { return edge2; }
};

//---------------------------------------------------------
/**
 * 3D sphere class.
 */
struct Sphere
{
	Vector3 center;
	f32     radius;

	Sphere() {}
	Sphere(const Sphere& s) { *this = s; }
	Sphere(const Vector3& c, f32 r): center(c), radius(r) {}
	Sphere(f32 x, f32 y, f32 z, f32 r): center(x, y, z), radius(r) {}

	void Set(const Sphere& s)            { *this = s; }
	void Set(const Vector3& c, f32 r)    { center = c; radius = r; }
	void Set(f32 x, f32 y, f32 z, f32 r) { center.Set(x, y, z); radius = r; }
};

//---------------------------------------------------------
/**
 * 3D cylinder class.
 */
class Cylinder3: public Segment3
{
public:
	f32     radius;
};

//---------------------------------------------------------
/**
 * Column class (vertical cylinder).
 */
class Column3: public Sphere
{
public:
	f32 height;
};

//---------------------------------------------------------
/**
 * 3D box class.
 */
class Box
{
public:
	Vector3 corner[8];
};

//---------------------------------------------------------
/**
 * 3D axe-aligned box class.
 */
class AABox
{
public:
	Vector3 corner[2]; // min / max
};

} // namespace noe