/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Vector class
 * @file           vector3.h
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

namespace noe
{
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
class Vector3;
class Vector3XZ;
class Vector4;

/**
 * Prototypes.
 */
Vector3 operator +  (const Vector3 &a, const Vector3 &b);
Vector3 operator -  (const Vector3 &a, const Vector3 &b);
Vector3 operator *  (const Vector3 &a, const f32 &b);
Vector3 operator *  (f32  const &a,    const Vector3 &b);
Vector3 operator /  (const Vector3 &a, const f32 &b);
Vector3 operator ^  (const Vector3 &a, const Vector3 &b);
f32     operator *  (const Vector3 &a, const Vector3 &b);
BOOL    operator == (const Vector3 &a, const Vector3 &b);
BOOL    operator != (const Vector3 &a, const Vector3 &b);

Vector3 BaryCentric(const Vector3 &v1, const Vector3 &v2, const Vector3 &v3, f32 f, f32 g);
Vector3 CatmullRom(const Vector3 &v1, const Vector3 &v2, const Vector3 &v3, const Vector3 &v4, f32 s);
Vector3 Hermite(const Vector3 &v1, const Vector3 &t1, const Vector3 &v2, const Vector3 &t2, f32 s);
Vector3 Lerp(const Vector3 &v1, const Vector3 &v2, f32 s);

/**
 *
 *  O   O  OOOOO   OOO   OOOOO   OOO   OOOO    OOO   
 *  O   O  O      O   O    O    O   O  O   O  O   O  
 *  O   O  OOOO   O        O    O   O  OOOO     OO   
 *   O O   O      O   O    O    O   O  O   O  O   O  
 *    O    OOOOO   OOO     O     OOO   O   O   OOO   
 *
 */

class Vector3 : public D3DXVECTOR3
{
public:

	// constructor
	Vector3(){};
	Vector3(const f32* v)           : D3DXVECTOR3(v) {}
	Vector3(f32 vx, f32 vy, f32 vz) : D3DXVECTOR3(vx, vy, vz) {}
	Vector3(const Vector3 &v)       : D3DXVECTOR3(v) {}
	Vector3(const Vector4 &v);

	// automatic cast
	operator f32* () { return (f32 *)&this->x; }
	operator const f32* const () { return (f32 *)&this->x; }
	operator Vector2& () { return *(Vector2 *)this; }
	operator const Vector2& () const { return *(Vector2 *)this; }
	operator Vector3XZ& () { return *(Vector3XZ *)this; }
	operator const Vector3XZ& () const { return *(Vector3XZ *)this; }    
   
	// assignment operators
	const Vector3 &operator =  (const Vector4 &v);
	const Vector3 &operator += (const Vector3 &v) { D3DXVec3Add(this, this, &v); return *this; }
	const Vector3 &operator += (const Vector4 &v) { D3DXVec3Add(this, this, rcast<const D3DXVECTOR3*>(&v)); return *this; }
	const Vector3 &operator -= (const Vector3 &v) { D3DXVec3Subtract(this, this, &v); return *this; }
	const Vector3 &operator -= (const Vector4 &v) { D3DXVec3Subtract(this, this, rcast<const D3DXVECTOR3*>(&v)); return *this; }
	const Vector3 &operator *= (f32 f) { D3DXVec3Scale(this, this, f); return *this; }
	const Vector3 &operator /= (f32 f) { D3DXVec3Scale(this, this, 1.0f/f); return *this; }

	// unary operators
    Vector3 operator + () const { return Vector3(*this); }
    Vector3 operator - () const { return Vector3(-x, -y, -z); }

	//
	void Add(const Vector3 &v) { (*this) += v; }
	void Add(f32 vx, f32 vy, f32 vz) { x += vx, y += vy, z += vz; }
	void Sub(const Vector3 &v) { (*this) -= v; }
	void Sub(f32 vx, f32 vy, f32 vz) { x -= vx, y -= vy, z -= vz; }
	void Scale(f32 f) { (*this) *= f; }
	f32 Dot(const Vector3 &v) { return (*this) * v; }
	Vector3 Cross(const Vector3 &v) { return (*this) ^ v; }

	void Normalize() { D3DXVec3Normalize(this, this); }	
	f32 Length() const { return D3DXVec3Length((const D3DXVECTOR3 *)this); }
	f32 SqrLength() const { return D3DXVec3LengthSq((const D3DXVECTOR3 *)this); }

	void Clear(void) { x = y = z = 0; }
	void Set(f32 vx, f32 vy, f32 vz) { x = vx, y = vy, z = vz; }

	Vector3XZ& GetXZ() { return *(Vector3XZ *)this; }
	const Vector3XZ& GetXZ() const { return *(Vector3XZ *)this; }    

	// static operators
	static const Vector3 &Up()    
	{ 
		static const Vector3 v3_up(0.0f, 1.0f, 0.0f);
		return v3_up; 
	}

	static const Vector3 &Dir()   
	{ 
		static const Vector3 v3_dir(0.0f, 0.0f, 1.0f);
		return v3_dir; 
	}

	static const Vector3 &Right() 
	{ 
		static const Vector3 v3_right(1.0f, 0.0f, 0.0f);
		return v3_right; 
	}

	static const Vector3 &Zero()  
	{ 
		static const Vector3 v3_zero(0.0f, 0.0f, 0.0f);
		return v3_zero; 
	}

	static Vector3 &Default() 
	{ 
		static Vector3 v3_default;
		return v3_default; 
	}

	/*void Transform(const Matrix& mat)
	{
		Vector4 ret;
		D3DXVec3Transform(rcast<D3DXVECTOR4*>(&ret), rcast<const D3DXVECTOR3*>(this), rcast<const D3DXMATRIX*>(&mat));
		*this = ret;
	}*/
};

/*
FLOAT D3DXVec3Length(const D3DXVECTOR3 *pV)
FLOAT D3DXVec3LengthSq(const D3DXVECTOR3 *pV)
FLOAT D3DXVec3Dot(const D3DXVECTOR3 *pV1, const D3DXVECTOR3 *pV2)
D3DXVECTOR3* D3DXVec3Cross(D3DXVECTOR3 *pOut, const D3DXVECTOR3 *pV1, const D3DXVECTOR3 *pV2)
D3DXVECTOR3* D3DXVec3Add(D3DXVECTOR3 *pOut, const D3DXVECTOR3 *pV1, const D3DXVECTOR3 *pV2)
D3DXVECTOR3* D3DXVec3Subtract(D3DXVECTOR3 *pOut, const D3DXVECTOR3 *pV1, const D3DXVECTOR3 *pV2)
D3DXVECTOR3* D3DXVec3Minimize(D3DXVECTOR3 *pOut, const D3DXVECTOR3 *pV1, const D3DXVECTOR3 *pV2)
D3DXVECTOR3* D3DXVec3Maximize(D3DXVECTOR3 *pOut, const D3DXVECTOR3 *pV1, const D3DXVECTOR3 *pV2)
D3DXVECTOR3* D3DXVec3Scale(D3DXVECTOR3 *pOut, const D3DXVECTOR3 *pV, FLOAT s)
D3DXVECTOR3* D3DXVec3Lerp(D3DXVECTOR3 *pOut, const D3DXVECTOR3 *pV1, const D3DXVECTOR3 *pV2, FLOAT s)
D3DXVECTOR3* D3DXVec3Normalize(D3DXVECTOR3 *pOut, const D3DXVECTOR3 *pV);
D3DXVECTOR3* D3DXVec3Hermite(D3DXVECTOR3 *pOut, const D3DXVECTOR3 *pV1, const D3DXVECTOR3 *pT1, const D3DXVECTOR3 *pV2, const D3DXVECTOR3 *pT2, FLOAT s);
D3DXVECTOR3* D3DXVec3CatmullRom(D3DXVECTOR3 *pOut, const D3DXVECTOR3 *pV0, const D3DXVECTOR3 *pV1, const D3DXVECTOR3 *pV2, const D3DXVECTOR3 *pV3, FLOAT s);
D3DXVECTOR3* D3DXVec3BaryCentric(D3DXVECTOR3 *pOut, const D3DXVECTOR3 *pV1, const D3DXVECTOR3 *pV2, const D3DXVECTOR3 *pV3, FLOAT f, FLOAT g);
D3DXVECTOR4* D3DXVec3Transform(D3DXVECTOR4 *pOut, const D3DXVECTOR3 *pV, const D3DXMATRIX *pM);
D3DXVECTOR3* D3DXVec3TransformCoord(D3DXVECTOR3 *pOut, const D3DXVECTOR3 *pV, const D3DXMATRIX *pM);
D3DXVECTOR3* D3DXVec3TransformNormal(D3DXVECTOR3 *pOut, const D3DXVECTOR3 *pV, const D3DXMATRIX *pM);
D3DXVECTOR4* D3DXVec3TransformArray(D3DXVECTOR4 *pOut, UINT OutStride, const D3DXVECTOR3 *pV, UINT VStride, const D3DXMATRIX *pM, UINT n);
D3DXVECTOR3* D3DXVec3TransformCoordArray(D3DXVECTOR3 *pOut, UINT OutStride, const D3DXVECTOR3 *pV, UINT VStride, const D3DXMATRIX *pM, UINT n);
D3DXVECTOR3* D3DXVec3TransformNormalArray(D3DXVECTOR3 *pOut, UINT OutStride, const D3DXVECTOR3 *pV, UINT VStride, const D3DXMATRIX *pM, UINT n);
D3DXVECTOR3* D3DXVec3Project(D3DXVECTOR3 *pOut, const D3DXVECTOR3 *pV, const D3DVIEWPORT9 *pViewport, const D3DXMATRIX *pProjection, const D3DXMATRIX *pView, const D3DXMATRIX *pWorld);
D3DXVECTOR3* D3DXVec3Unproject(D3DXVECTOR3 *pOut, const D3DXVECTOR3 *pV, const D3DVIEWPORT9 *pViewport, const D3DXMATRIX *pProjection, const D3DXMATRIX *pView, const D3DXMATRIX *pWorld);
D3DXVECTOR3* D3DXVec3ProjectArray(D3DXVECTOR3 *pOut, UINT OutStride,const D3DXVECTOR3 *pV, UINT VStride,const D3DVIEWPORT9 *pViewport, const D3DXMATRIX *pProjection, const D3DXMATRIX *pView, const D3DXMATRIX *pWorld, UINT n);
D3DXVECTOR3* D3DXVec3UnprojectArray(D3DXVECTOR3 *pOut, UINT OutStride, const D3DXVECTOR3 *pV, UINT VStride, const D3DVIEWPORT9 *pViewport, const D3DXMATRIX *pProjection, const D3DXMATRIX *pView, const D3DXMATRIX *pWorld, UINT n);
*/

/**
 *
 *  O   O  OOOOO   OOO   OOOOO   OOO   OOOO    OOO   O   O  OOOOO 
 *  O   O  O      O   O    O    O   O  O   O  O   O   O O      O  
 *  O   O  OOOO   O        O    O   O  OOOO     OO     O      O   
 *   O O   O      O   O    O    O   O  O   O  O   O   O O    O    
 *    O    OOOOO   OOO     O     OOO   O   O   OOO   O   O  OOOOO 
 * 
 */


class Vector3XZ : public Vector3
{
	public:

	//-----------------------------------------------------------------------------
	// S E T   F U N C T I O N S
	//-----------------------------------------------------------------------------
	Vector3XZ() {}                                          // Default constructor, defined for template classes
	Vector3XZ(const f32& a, const f32& c);                // Construct a vector with 3 given inputs 
	Vector3XZ(const Vector3XZ& v);                    // Construct a vector with vector input

	void Set(const f32& a, const f32& c);                     // Reassign a vector without making a temporary structure
	void Set(const Vector3XZ& in);                        // Set a vector with an other vector
	void Set(f32* v);                                         // Set a vector with an other vector
	void Scale(const f32& in);                                // Scale this vector
	void Scale(const f32& x, const f32& z);                   // Scale this vector
	void Clear();               			                    // Clear a vector (set all param to 0)
	void Add(const Vector3XZ &v);                         // Add a vector to this
	void Add(const f32 &x, const f32 &z);                     // Add a vector to this
	void Sub(const Vector3XZ &v);                         // Substract a vector to this
	void sub(const f32 &a, const f32 &c);                     // Substract a vector to this
	void Rotate(f32 angle);                                     // Construct a vector using spherical coordinates
	void Normalize();                                           // Normalizes a vector (makes it's length one)

	Vector3XZ& operator += (const Vector3XZ& v);          // Accumulative addition of two vectors
	Vector3XZ& operator -= (const Vector3XZ& v);          // Accumulative subtraction of two vectors
	Vector3XZ& operator *= (const f32& v);                  // Accumulative multiplication of a vector by a scalar
	Vector3XZ& operator /= (const f32& v);                  // Accumulative division of a vector by a scalar

	//-----------------------------------------------------------------------------
	// G E T   F U N C T I O N S
	//-----------------------------------------------------------------------------
	BOOL IsEqual(const Vector3XZ &v) const;                 // Return TRUE is v is "equal" to this
	f32  Length() const;                                        // Return the magnitude of a vector
	f32  SqrLength() const;                                 // The length of the vector squared (to avoid the sqrt())
	f32  Dot(const Vector3XZ &v) const;              // Compute the dot product
	Vector3XZ Cross(const Vector3XZ &v) const;     // Get the croos product resulting vector
	Vector3XZ Normalized() const;                             // returns a Normalized version of this

	Vector3XZ  operator - () const;                           // Plain old negation

	operator f32* () const { return (f32*)&x; }                 // Automatic casting
	operator Vector3& () const { return *(Vector3*)this; }    // Automatic casting
}; 

Vector3XZ operator +  (const Vector3XZ &a, const Vector3XZ &b);
Vector3XZ operator -  (const Vector3XZ &a, const Vector3XZ &b);
Vector3XZ operator *  (const Vector3XZ &a, const f32 &b);
Vector3XZ operator *  (f32  const &a,      const Vector3XZ &b);
Vector3XZ operator /  (const Vector3XZ &a, const f32 &b);
Vector3XZ operator ^  (const Vector3XZ &a, const Vector3XZ &b);
f32       operator *  (const Vector3XZ &a, const Vector3XZ &b);
BOOL      operator == (const Vector3XZ &a, const Vector3XZ &b);
BOOL      operator != (const Vector3XZ &a, const Vector3XZ &b);



} // namespace noe