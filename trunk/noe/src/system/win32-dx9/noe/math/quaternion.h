/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Quaternion
 * @file           quaternion.h
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
#include <noe/math/vector3.h>

namespace noe
{

class Quaternion : public D3DXQUATERNION
{
public:
		// constructor


	// assignment operators
	Quaternion &BaryCentric(const Quaternion &q1, const Quaternion &q2, const Quaternion &q3, f32 f, f32 g) { D3DXQuaternionBaryCentric(this, &q1, &q2, &q3, f, g); return *this; } // Set a quaternion in Barycentric coordinates.
	Quaternion &Identity() { D3DXQuaternionIdentity(this); return *this; } // Returns the identity quaternion.
	Quaternion &Inverse() { D3DXQuaternionInverse(this, this); return *this; } // Conjugates and renormalizes a quaternion.
	Quaternion &Multiply(const Quaternion &q1) { D3DXQuaternionMultiply(this, this, &q1); return *this; } // Multiplies two quaternions.
	Quaternion &Normalize() { D3DXQuaternionNormalize(this, this); return *this; } // Computes a unit length quaternion.
	Quaternion &RotationAxis(const Vector3 &axis, f32 angle) { D3DXQuaternionRotationAxis(this, &axis, angle); return *this; } // Rotates a quaternion about an arbitrary axis.
	Quaternion &RotationMatrix(const Matrix4 &m) { D3DXQuaternionRotationMatrix(this, rcast<const D3DXMATRIX*>(&m)); return *this; } // Builds a quaternion from a rotation matrix.
	Quaternion &RotationYawPitchRoll(f32 yaw, f32 pitch, f32 roll) { D3DXQuaternionRotationYawPitchRoll(this, yaw, pitch, roll); return *this; } // Builds a quaternion with the given yaw, pitch, and roll.
	Quaternion &Slerp(const Quaternion &q1, const Quaternion &q2, f32 t) { D3DXQuaternionSlerp(this, &q1, &q2, t); return *this; } // Interpolates between two quaternions, using spherical linear interpolation.
	Quaternion &Squad(const Quaternion &q1, const Quaternion &q2, const Quaternion &q3, const Quaternion &q4, f32 t) { D3DXQuaternionSquad(this, &q1, &q2, &q3, &q4, t); return *this; } // Interpolates between quaternions, using spherical quadrangle interpolation.

	// "get" operators
	Quaternion	Conjugate() const { Quaternion q; D3DXQuaternionConjugate(&q, this); return q; } // Returns the conjugate of a quaternion.
	f32			Dot(const Quaternion &q) const { return D3DXQuaternionDot(this, &q); } // Returns the dot product of two quaternions.
	Quaternion	Exp() const { Quaternion q; D3DXQuaternionExp(&q, this); return q; } // Calculates the exponential.
	BOOL			IsIdentity() const { return D3DXQuaternionIsIdentity(this); } // Determines if a quaternion is an identity quaternion.
	f32			Length() const { return D3DXQuaternionLength(this); } // Returns the length of a quaternion.
	f32			LengthSq() const { return D3DXQuaternionLengthSq(this); } // Returns the square of the length of a quaternion.
	Quaternion	Ln() const { Quaternion q; D3DXQuaternionLn(&q, this); return q; } // Calculates the natural logarithm.
	Quaternion	Multiply(const Quaternion &q1) const { Quaternion rq; D3DXQuaternionMultiply(&rq, this, &q1); return rq; } // Multiplies two quaternions.
	Quaternion	Normalized() const { Quaternion rq; D3DXQuaternionNormalize(&rq, this); return rq; } // Computes a unit length quaternion.
	void			ToAxisAngle(Vector3 &axis, f32 &angle) const { D3DXQuaternionToAxisAngle(this, &axis, &angle); } // Computes a quaternion's axis and angle of rotation.

	// static operators
	/*static SquadSetup(Quaternion &qA,
		Quaternion &qB,
		Quaternion &qC,
		const Quaternion &q1,
		const Quaternion &q2,
		const Quaternion &q3,
		const Quaternion &q4) { D3DXQuaternionSquadSetup(&qA, &qB, &qC, &q1, &q2, &q3, &q4); }*/ // Setup control points for spherical quadrangle interpolation.

	static Quaternion &BaryCentric(Quaternion &out, const Quaternion &q1, const Quaternion &q2, const Quaternion &q3, f32 f, f32 g) { D3DXQuaternionBaryCentric(&out, &q1, &q2, &q3, f, g); return out; } // Set a quaternion in Barycentric coordinates.
	static Quaternion &Identity(Quaternion &out) { D3DXQuaternionIdentity(&out); return out; } // Returns the identity quaternion.
	static Quaternion &Inverse(Quaternion &out, const Quaternion &in) { D3DXQuaternionInverse(&out, &in); return out; } // Conjugates and renormalizes a quaternion.
	static Quaternion &Multiply(Quaternion &out, const Quaternion &q1, const Quaternion &q2) { D3DXQuaternionMultiply(&out, &q1, &q2); return out; } // Multiplies two quaternions.
	static Quaternion &Normalize(Quaternion &out, const Quaternion &in) { D3DXQuaternionNormalize(&out, &in); return out; } // Computes a unit length quaternion.
	static Quaternion &RotationAxis(Quaternion &out, const Vector3 &axis, f32 angle) { D3DXQuaternionRotationAxis(&out, &axis, angle); return out; } // Rotates a quaternion about an arbitrary axis.
	static Quaternion &RotationMatrix(Quaternion &out, const Matrix4 &m) { D3DXQuaternionRotationMatrix(&out, rcast<const D3DXMATRIX*>(&m)); return out; } // Builds a quaternion from a rotation matrix.
	static Quaternion &RotationYawPitchRoll(Quaternion &out, f32 yaw, f32 pitch, f32 roll) { D3DXQuaternionRotationYawPitchRoll(&out, yaw, pitch, roll); return out; } // Builds a quaternion with the given yaw, pitch, and roll.
	static Quaternion &Slerp(Quaternion &out, const Quaternion &q1, const Quaternion &q2, f32 t) { D3DXQuaternionSlerp(&out, &q1, &q2, t); return out; } // Interpolates between two quaternions, using spherical linear interpolation.
	static Quaternion &Squad(Quaternion &out, const Quaternion &q1, const Quaternion &q2, const Quaternion &q3, const Quaternion &q4, f32 t) { D3DXQuaternionSquad(&out, &q1, &q2, &q3, &q4, t); return out; } // Interpolates between quaternions, using spherical quadrangle interpolation.
	
	static Quaternion	&Conjugate(Quaternion &out, const Quaternion &in) { D3DXQuaternionConjugate(&out, &in); return out; } // Returns the conjugate of a quaternion.
	static f32			 Dot(const Quaternion &q1, const Quaternion &q2) { return D3DXQuaternionDot(&q1, &q2); } // Returns the dot product of two quaternions.
	static Quaternion	&Exp(Quaternion &out, const Quaternion &in) { D3DXQuaternionExp(&out, &in); return out; } // Calculates the exponential.
	static BOOL			 IsIdentity(const Quaternion &q) { return D3DXQuaternionIsIdentity(&q); } // Determines if a quaternion is an identity quaternion.
	static f32			 Length(const Quaternion &q) { return D3DXQuaternionLength(&q); } // Returns the length of a quaternion.
	static f32			 LengthSq(const Quaternion &q) { return D3DXQuaternionLengthSq(&q); } // Returns the square of the length of a quaternion.
	static Quaternion	 Ln(Quaternion &out, const Quaternion &in) { D3DXQuaternionLn(&out, &in); return out; } // Calculates the natural logarithm.
	static void			 ToAxisAngle(const Quaternion &in, Vector3 &axis, f32 &angle) { D3DXQuaternionToAxisAngle(&in, &axis, &angle); } // Computes a quaternion's axis and angle of rotation.

/*
   //------------------------------------------------------------
	// From D3DXQUATERNION class

	Quaternion() {}
	Quaternion(const f32 *);
	Quaternion(const D3DXF3216 *);
	Quaternion(f32 x, f32 y, f32 z, f32 w);

	// casting
	operator f32* ();
	operator const f32* () const;

	// assignment operators
	Quaternion& operator += (const Quaternion&);
	Quaternion& operator -= (const Quaternion&);
	Quaternion& operator *= (const Quaternion&);
	Quaternion& operator *= (f32);
	Quaternion& operator /= (f32);

	// unary operators
	Quaternion  operator + () const;
	Quaternion  operator - () const;

	// binary operators
	Quaternion operator + (const Quaternion&) const;
	Quaternion operator - (const Quaternion&) const;
	Quaternion operator * (const Quaternion&) const;
	Quaternion operator * (f32) const;
	Quaternion operator / (f32) const;

	friend Quaternion operator * (f32, const Quaternion&);

	BOOL operator == (const Quaternion&) const;
	BOOL operator != (const Quaternion&) const;
*/
};

} // namespace noe