/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Vector class
 * @file           vector3.cpp
 * @package        noe.math
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

// noe
#include <noe/noe.h>
#include <noe/math.h>
#include <noe/math/vector3.h>
#include <noe/math/vector4.h>

namespace noe
{

/**
 * Constants.
 */
const f32 g_Tolerance = 1e-06f;

/**
 *
 *  O   O  OOOOO   OOO   OOOOO   OOO   OOOO    OOO   
 *  O   O  O      O   O    O    O   O  O   O  O   O  
 *  O   O  OOOO   O        O    O   O  OOOO     OO   
 *   O O   O      O   O    O    O   O  O   O  O   O  
 *    O    OOOOO   OOO     O     OOO   O   O   OOO   
 *
 */

/**
 * Default constructor.
 * @param	v		Input.
 */
Vector3::Vector3(const Vector4 &v)
{
	x = v.x, y = v.y, z = v.z;
}


/**
 * Default constructor.
 * @param	v		Input.
 */
const Vector3& Vector3::operator = (const Vector4 &v) 
{ 
	x = v.x, y = v.y, z = v.z; 
	return *this;  
}


/**
 * Adds two vectors together.
 * @param	v1		First vector.
 * @param	v2		Second vector.
 * @return			The sum of two vectors.
 */
Vector3 operator + (const Vector3 &v1, const Vector3 &v2)
{
	Vector3 ret;
	return *(Vector3*)D3DXVec3Add(rcast<D3DXVECTOR3*>(&ret), rcast<const D3DXVECTOR3*>(&v1), rcast<const D3DXVECTOR3*>(&v2));
/*	return Vector3
	(
		a.x + b.x,
		a.y + b.y,
		a.z + b.z
	);*/
}; 
 

/**
 * Subtracts two vectors together.
 * @param	v1		First vector.
 * @param	v2		Second vector.
 * @return			The difference of two vectors.
 */
Vector3 operator - (const Vector3 &a, const Vector3 &b)
{
	Vector3 ret;
	return *(Vector3*)D3DXVec3Subtract(&ret, &a, &b);
	/*return Vector3
	(
		a.x - b.x,
		a.y - b.y,
		a.z - b.z
	);*/
}; 


/**
 * Scales a vector by a scalar.
 * @param	v		Vector.
 * @param	f		Scalar.
 * @return			Scaled vector.
*/
Vector3 operator * (const Vector3 &v, const f32 &f)
{
	Vector3 ret;
	return *(Vector3*)D3DXVec3Scale(&ret, &v, f);
/*	return Vector3
	(
		a.x * b,
		a.y * b,
		a.z * b
	);*/
}; 


/**
 * Scales a vector by a scalar.
 * @param	f		Scalar.
 * @param	v		Vector.
 * @return			Scaled vector.
 */
Vector3 operator * (const f32 &f, const Vector3 &v)
{
	Vector3 ret;
	return *(Vector3*)D3DXVec3Scale(&ret, &v, f);
/*	return Vector3
	(
		a * b.x,
		a * b.y,
		a * b.z
	);*/
}; 


/**
 * Divides a vector by a scalar.
 * @param	v		Vector.
 * @param	f		Scalar.
 * @return			Scaled vector.
 */
Vector3 operator / (const Vector3 &v, const f32 &f)
{
	Vector3 ret;
	return *(Vector3*)D3DXVec3Scale(&ret, &v, 1.0f / f);
	/*f32 inv = 1.0f / b;
	return Vector3
	(
		a.x * inv,
		a.y * inv,
		a.z * inv
	);*/
}; 


/**
 * Performs a vector cross product.
 * @param	v1		First vector.
 * @param	v2		Second vector.
 * @return			Resulting vector.
 */
Vector3 operator ^ (const Vector3 &v1, const Vector3 &v2)
{
	Vector3 ret; 
	return *(Vector3*)D3DXVec3Cross(&ret, &v1, &v2);
/*	return Vector3
	(
		(a.y * b.z - a.z * b.y),
		(a.z * b.x - a.x * b.z),
		(a.x * b.y - a.y * b.x)
	);*/
} 


/**
 * Performs a vector dot product : ret = a dot b.
 * @param	v1		First vector.
 * @param	v2		Second vector.
 * @return			Dot prodict.
 */
f32 operator * (const Vector3 &v1, const Vector3 &v2)
{
	return D3DXVec3Dot(&v1, &v2);
	//return a.x * b.x + a.y * b.y + a.z * b.z;
} 

/**
 * Vector Equality, epsilon used due to numerical imprecision.
 */
BOOL operator == (const Vector3 &a, const Vector3 &b)
{
	if(Abs(a.x - b.x) < g_Tolerance)
		if(Abs(a.y - b.y) < g_Tolerance)
			if(Abs(a.z - b.z) < g_Tolerance)
				return TRUE;

    return FALSE;
};

/**
 * Vector Inequality.
 */
BOOL operator != (const Vector3 &a, const Vector3 &b)
{
    return !(a == b);
};

/**
 * Returns a point in Barycentric coordinates, using the specified 3-D vectors.
 */
Vector3 BaryCentric(const Vector3 &v1, const Vector3 &v2, const Vector3 &v3, f32 f, f32 g)
{
	Vector3 ret;
	return *(Vector3*)D3DXVec3BaryCentric(&ret, &v1, &v2, &v3, f, g);
}

/**
 * Performs a Catmull-Rom interpolation, using the specified 3-D vectors.
 */
Vector3 CatmullRom(const Vector3 &v1, const Vector3 &v2, const Vector3 &v3, const Vector3 &v4, f32 s)
{
	Vector3 ret;
	return *(Vector3*)D3DXVec3CatmullRom(&ret, &v1, &v2, &v3, &v4, s);
}

/**
 * Performs a Hermite spline interpolation, using the specified 3-D vectors.
 */
Vector3 Hermite(const Vector3 &v1, const Vector3 &t1, const Vector3 &v2, const Vector3 &t2, f32 s)
{
	Vector3 ret;
	return *(Vector3*)D3DXVec3Hermite(&ret, &v1, &t1, &v2, &t2, s);
}

/**
 * Performs a linear interpolation between two 3-D vectors.
 */
Vector3 Lerp(const Vector3 &v1, const Vector3 &v2, f32 s)
{
	Vector3 ret;
	return *(Vector3*)D3DXVec3Lerp(&ret, &v1, &v2, s);
}


/**
 *
 *  O   O  OOOOO   OOO   OOOOO   OOO   OOOO    OOO   O   O  OOOOO 
 *  O   O  O      O   O    O    O   O  O   O  O   O   O O      O  
 *  O   O  OOOO   O        O    O   O  OOOO     OO     O      O   
 *   O O   O      O   O    O    O   O  O   O  O   O   O O    O    
 *    O    OOOOO   OOO     O     OOO   O   O   OOO   O   O  OOOOO 
 * 
 */

//-----------------------------------------------------------------------------
//
// S E T   F U N C T I O N S
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// Constructor
//-----------------------------------------------------------------------------
Vector3XZ::Vector3XZ(const f32& a, const f32& c)
{
	x = a; z = c;
}

//-----------------------------------------------------------------------------
// Constructor
//-----------------------------------------------------------------------------
Vector3XZ::Vector3XZ(const Vector3XZ& v)
{
	(*this) = v;
}

//-----------------------------------------------------------------------------
// Reassign a vector without making a temporary structure
//-----------------------------------------------------------------------------
void Vector3XZ::Set(const f32& a, const f32& c)
{
	x = a; z = c;
}

//-----------------------------------------------------------------------------
// Set a vector with an other vector
//-----------------------------------------------------------------------------
void Vector3XZ::Set(const Vector3XZ& v)
{
	(*this) = v;
}

//-----------------------------------------------------------------------------
// Set a vector with an other vector
//-----------------------------------------------------------------------------
void Vector3XZ::Set(f32* v)
{
	x = v[0]; z = v[2];
}

//-----------------------------------------------------------------------------
// Scale this vector
//-----------------------------------------------------------------------------
void Vector3XZ::Scale(const f32& in)
{
	(*this) *= in;
}

//-----------------------------------------------------------------------------
// Scale this vector
//-----------------------------------------------------------------------------
void Vector3XZ::Scale(const f32& sx, const f32& sz)
{
    x *= sx;
    z *= sz;
}

//-----------------------------------------------------------------------------
// Clear a vector (set all param to 0)
//-----------------------------------------------------------------------------
void Vector3XZ::Clear()
{ 
    x = z = 0; 
}
    
//-----------------------------------------------------------------------------
// Add a vector to this
//-----------------------------------------------------------------------------
void Vector3XZ::Add(const Vector3XZ &v)
{
    (*this) += v;
}

//-----------------------------------------------------------------------------
// Add a vector to this
//-----------------------------------------------------------------------------
void Vector3XZ::Add(const f32 &a, const f32 &c)
{
    x += a; z += c;
}

//-----------------------------------------------------------------------------
// Substract a vector to this
//-----------------------------------------------------------------------------
void Vector3XZ::Sub(const Vector3XZ &v)
{
    (*this) -= v;
}
	
//-----------------------------------------------------------------------------
// Substract a vector to this
//-----------------------------------------------------------------------------
void Vector3XZ::sub(const f32 &a, const f32 &c)
{
    x -= a; z -= c;
}

//-----------------------------------------------------------------------------
// Rotate a vector on XZ plane
//-----------------------------------------------------------------------------
void Vector3XZ::Rotate(f32 angle)
{
    f32 a =  cosf(angle)*x + sinf(angle)*z;
    f32 b = -sinf(angle)*x + cosf(angle)*z;
    x = a;
    z = b;
}

//-----------------------------------------------------------------------------
// Normalizes a vector (makes it's length one)
//-----------------------------------------------------------------------------
void Vector3XZ::Normalize()
{
    (*this) /= Length();
}

//-----------------------------------------------------------------------------
// Accumulative addition of two vectors
//-----------------------------------------------------------------------------
Vector3XZ& Vector3XZ::operator += (const Vector3XZ& v)
{
	x += v.x;   
	z += v.z;
	return (*this); // This is so we can chain operations together
}

//-----------------------------------------------------------------------------
// Accumulative subtraction of two vectors
//-----------------------------------------------------------------------------
Vector3XZ& Vector3XZ::operator -= (const Vector3XZ& v)
{
	x -= v.x;   
	z -= v.z;
	return (*this); // This is so we can chain operations together
}

//-----------------------------------------------------------------------------
// Accumulative multiplication of a vector by a scalar
//-----------------------------------------------------------------------------
Vector3XZ& Vector3XZ::operator *= (const f32& in)
{
	x *= in;   
	z *= in;
	return (*this); // This is so we can chain operations together
}


//-----------------------------------------------------------------------------
// Accumulative division of a vector by a scalar
//-----------------------------------------------------------------------------
Vector3XZ& Vector3XZ::operator /= (const f32& in)
{
	f32 inv = 1.0f / in; // do one (expensive) divide and 3 (cheap) mults
	x *= inv;   
	z *= inv;
	return (*this); // This is so we can chain operations together 
}






//-----------------------------------------------------------------------------
//
// G E T   F U N C T I O N S
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// Return TRUE is v is "equal" to this
//-----------------------------------------------------------------------------
BOOL Vector3XZ::IsEqual(const Vector3XZ &v) const
{
    return (*this) == v;
}

//-----------------------------------------------------------------------------
// Return the magnitude of a vector
//-----------------------------------------------------------------------------
f32 Vector3XZ::Length() const
{
	return sqrtf((*this) * (*this));
}

//-----------------------------------------------------------------------------
// The length of the vector squared (to avoid the sqrt())
//-----------------------------------------------------------------------------
f32 Vector3XZ::SqrLength() const
{ 
	return (*this) * (*this);
}

//-----------------------------------------------------------------------------
// Performs a vector dot product : ret = a dot b
//-----------------------------------------------------------------------------
f32 Vector3XZ::Dot(const Vector3XZ &v) const
{
	return (*this) * v;
} 


//-----------------------------------------------------------------------------
// Performs a vector cross product : ret = a cross b
//-----------------------------------------------------------------------------
Vector3XZ Vector3XZ::Cross(const Vector3XZ &v) const
{
	return (*this) ^ v;
} 

//-----------------------------------------------------------------------------
// returns a Normalized version of this
//-----------------------------------------------------------------------------
Vector3XZ Vector3XZ::Normalized() const
{
	return (*this) / Length();
}

//-----------------------------------------------------------------------------
// this is plain old negation
//-----------------------------------------------------------------------------
Vector3XZ Vector3XZ::operator - () const
{
	return Vector3XZ(-x, -z);
}






//-----------------------------------------------------------------------------
//
// S T A T I C   O P E R A T O R S
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// Adds two vectors together: ret = a + b
//-----------------------------------------------------------------------------
Vector3XZ operator + (Vector3XZ const &a, Vector3XZ const &b)
{
	return Vector3XZ
	(
		a.x + b.x,
		a.z + b.z
	);
}; 
 

//-----------------------------------------------------------------------------
// Subtracts to vectors : ret = a - b
//-----------------------------------------------------------------------------
Vector3XZ operator - (Vector3XZ const &a, Vector3XZ const &b)
{
	return Vector3XZ
	(
		a.x - b.x,
		a.z - b.z
	);
}; 


//-----------------------------------------------------------------------------
// Scales a vector by a f32 : ret = a * b
//-----------------------------------------------------------------------------
Vector3XZ operator * (Vector3XZ const &a, f32 const &b)
{
	return Vector3XZ
	(
		a.x * b,
		a.z * b
	);
}; 


//-----------------------------------------------------------------------------
// Scales a vector by a f32 : ret = a * b
//-----------------------------------------------------------------------------
Vector3XZ operator * (f32  const &a, Vector3XZ const &b)
{
	return Vector3XZ
	(
		a * b.x,
		a * b.z
	);
}; 


//-----------------------------------------------------------------------------
// Divides a vector by a f32 : ret = a / b
//-----------------------------------------------------------------------------
Vector3XZ operator / (Vector3XZ const &a, f32 const &b)
{
	f32 inv = 1.0f / b;
	return Vector3XZ
	(
		a.x * inv,
		a.z * inv
	);
}; 


//-----------------------------------------------------------------------------
// Performs a vector cross product : ret = a cross b
//-----------------------------------------------------------------------------
Vector3XZ operator ^ (Vector3XZ const &a, Vector3XZ const &b)
{
	return Vector3XZ
	(
		(a.y),
		(-a.x)
	);
} 


//-----------------------------------------------------------------------------
// Performs a vector dot product : ret = a dot b
//-----------------------------------------------------------------------------
f32 operator * (Vector3XZ const &a, Vector3XZ const &b)
{
	return a.x * b.x + a.z * b.z;
} 

//-----------------------------------------------------------------------------
// Vector Equality, epsilon used due to numerical imprecision
//-----------------------------------------------------------------------------
BOOL operator == (Vector3XZ const &a, Vector3XZ const &b)
{
	if(Abs(a.x - b.x) < g_Tolerance)
		if(Abs(a.z - b.z) < g_Tolerance)
			return TRUE;

    return FALSE;
};

//-----------------------------------------------------------------------------
BOOL operator != (Vector3XZ const &a, Vector3XZ const &b)
{
    return !(a == b);
};

}