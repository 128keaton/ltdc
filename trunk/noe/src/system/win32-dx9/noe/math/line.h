/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Line based class
 * @file           line.h
 * @package        noe.math
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

#pragma once

// noe
#include <noe/math.h>
#include <noe/math/vector2.h>
#include <noe/math/vector3.h>

namespace noe
{

class Line2
{
protected:

	Vector2 pos, dir;

public:

	Line2() {}
	Line2(const Vector2 &p, const Vector2 &d) { pos = p; dir = d; }

	const Vector2& Origin()    const { return pos; }
	const Vector2& Direction() const { return dir; }

	Vector2& Origin()    { return pos; }
	Vector2& Direction() { return dir; }

	void Set(const Vector2 &p, const Vector2 &d)  { pos = p; dir = d; }
};

class Ray2 : public Line2
{
public:

	Ray2() {}
	Ray2(const Vector2 &p, const Vector2 &d) { pos = p; dir = d; }
};

class Segment2 : public Line2
{
public:

	Segment2() {}
	Segment2(const Vector2 &p, const Vector2 &d) { pos = p; dir = d; }
};

class Line3
{
protected:

	Vector3 pos, dir;

public:

	Line3() {}
	Line3(const Vector3 &p, const Vector3 &d) { pos = p; dir = d; }

	const Vector3& Origin()    const { return pos; }
	const Vector3& Direction() const { return dir; }

	Vector3& Origin()    { return pos; }
	Vector3& Direction() { return dir; }

	void Set(const Vector3 &p, const Vector3 &d)  { pos = p; dir = d; }
};

class Ray3 : public Line3
{
public:

	Ray3() {}
	Ray3(const Vector3 &p, const Vector3 &d) { pos = p; dir = d; }
};

class Segment3 : public Line3
{
public:

	Segment3() {}
	Segment3(const Vector3 &p, const Vector3 &d) { pos = p; dir = d; }
};

} // namespace noe