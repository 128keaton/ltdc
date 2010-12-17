/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Vector class
 * @file           vector4.h
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
#include <noe/math/vector2.h>
#include <noe/math/vector3.h>

namespace noe
{

class Vector4;
class Matrix4;
extern const Vector4 v4_zero;
extern const Vector4 v4_up;
extern const Vector4 v4_dir;
extern const Vector4 v4_right;

class Vector4 : public D3DXVECTOR4
{
public:

	// constructor
	Vector4(){}
	Vector4(f32 _x, f32 _y, f32 _z, f32 _w)  : D3DXVECTOR4(_x, _y, _z, _w) {}
	Vector4(const D3DXVECTOR4 &v)            : D3DXVECTOR4(v) {}
	Vector4(const Vector4 &v)                : D3DXVECTOR4(v) {}
	Vector4(const Vector3 &v, f32 _w = 0.0f) : D3DXVECTOR4(v.x, v.y, v.z, _w) {}

	// automatic cast
	operator f32* (){ return (f32 *)&this->x; }
	operator Vector2 &(){ return *(Vector2 *)this; }
	operator Vector3 &(){ return *(Vector3 *)this; }
   operator Vector3XZ& () { return *(Vector3XZ *)this; }

	const Vector4 &operator =  (const Vector3 &v) { x = v.x; y = v.y; z = v.z; w = 0.0f; return *this; }
	const Vector4 &operator += (const Vector3 &v) { D3DXVec3Add((Vector3*)this,(Vector3*)this,&v); return *this; }
	const Vector4 &operator += (const Vector4 &v) { D3DXVec4Add(this, this, &v); return *this; }

	void Normalize() { D3DXVec4Normalize(this,this); }
	f32 Length() { return D3DXVec4Length(this); }
	f32 SqrLength() { return D3DXVec4LengthSq(this); }
	void RotateX(f32) {}
	void RotateY(f32) {}
	void RotateZ(f32) {}
	inline void Copy(const Vector3 &vec) { x = vec.x, y = vec.y, z = vec.z, w = 1.0f; }
	inline void CopyNormal(const Vector3 &vec) { x = vec.x, y = vec.y, z = vec.z, w = 0.0f; }
	inline void Clear(void) { x = y = z = w = 0; }
	inline const f32 *GetF32Top(void) const { return reinterpret_cast<const f32 *>(this);}
	inline void Set(const Vector4& vec) { *this = vec; }
	inline void Set(f32 vx, f32 vy, f32 vz) { x = vx, y = vy, z = vz, w = 1.0f; }
	inline void Set(f32 vx, f32 vy, f32 vz, f32 vw) { x = vx, y = vy, z = vz, w = vw; }

	// TODO: use static data
	static const Vector4 &Zero()  
	{ 
		static const Vector4 v4_zero(0.0f, 0.0f, 0.0f, 0.0f);
		return v4_zero; 
	}

	static const Vector4 &One()  
	{ 
		static const Vector4 v4_one(1.0f, 1.0f, 1.0f, 1.0f);
		return v4_one; 
	}

	static const Vector4 &Up()    
	{ 
		static const Vector4 v4_up(0.0f, 1.0f, 0.0f, 0.0f);
		return v4_up; 
	}

	static const Vector4 &Dir()   
	{ 
		static const Vector4 v4_dir(0.0f, 0.0f, 1.0f, 0.0f);
		return v4_dir; 
	}

	static const Vector4 &Right() 
	{ 
		static const Vector4 v4_right(1.0f, 0.0f, 0.0f, 0.0f);
		return v4_right; 
	}

	static Vector4 &Default() 
	{ 
		static Vector4 v4_default;
		return v4_default; 
	}

	void Transform(const Matrix4& mat);
};

class Vector4XZ : public Vector4
{
};

} // namespace noe