/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Matrix class
 * @file           matrix.h
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
#include <noe/math/vector4.h>
#include <noe/math/quaternion.h>
#include <noe/math/shape.h>

namespace noe
{

class Matrix4;

extern const Matrix4 mat_identity;
extern const Matrix4 mat_zero;

class Matrix4 : public D3DXMATRIX
{
public:

	// constructor
	Matrix4(){}
	Matrix4(const Matrix4 &mat) : D3DXMATRIX(mat) {}
	Matrix4(const f32 *mat) : D3DXMATRIX(mat) {}
	Matrix4(f32 _11, f32 _12, f32 _13, f32 _14,
           f32 _21, f32 _22, f32 _23, f32 _24,
           f32 _31, f32 _32, f32 _33, f32 _34,
           f32 _41, f32 _42, f32 _43, f32 _44) : D3DXMATRIX(_11, _12, _13, _14,
                                                            _21, _22, _23, _24,
                                                            _31, _32, _33, _34,
                                                            _41, _42, _43, _44) {}

	// automatic cast
	operator f32* () { return reinterpret_cast<f32*>(this); }
	operator const f32* const () { reinterpret_cast<const f32*>(this); }
	operator Vector4* () { return reinterpret_cast<Vector4*>(this); }
	operator const Vector4* const () { reinterpret_cast<const Vector4*>(this); }

	Vector4& operator [] (u32 i) { return reinterpret_cast<Vector4*>(this)[i]; }
	Vector4  operator [] (u32 i) const { return reinterpret_cast<const Vector4*>(this)[i]; }
	f32& operator () (u32 i, u32 j) { return reinterpret_cast<f32*>(&this->_11)[(j << 2) + i]; }
	f32  operator () (u32 i, u32 j) const { return reinterpret_cast<const f32*>(&this->_11)[j << (2 + i)]; }

	Vector4 &Right() { return *(Vector4 *)&this->_11; }
	const Vector4 &Right() const { return *(Vector4 *)&this->_11; }
	Vector4 &Up() { return *(Vector4 *)&this->_21; }
	const Vector4 &Up() const { return *(Vector4 *)&this->_21; }
	Vector4 &Dir() { return *(Vector4 *)&this->_31; }
	const Vector4 &Dir() const { return *(Vector4 *)&this->_31; }
	Vector4 &GetPosition() { return *(Vector4 *)&this->_41; }
	const Vector4 &GetPosition() const { return *(Vector4 *)&this->_41; }
	void ClearPosition() { _41 = _42 = _43 = 0.f; _44 = 1.f; }
	void SetPosition(const Vector3& pos) { _41 = pos.x; _42 = pos.y; _43 = pos.z; _44 = 1.f; }
	void SetPosition(const Vector4& pos) { _41 = pos.x; _42 = pos.y; _43 = pos.z; _44 = 1.f; }

	static const Matrix4 &GetIdentity() { return mat_identity; }
	static const Matrix4 &GetZero() { return mat_zero; }

/* inherited!

	// assignment operators
	Matrix4& operator *= (const Matrix4&);
	Matrix4& operator += (const Matrix4&);
	Matrix4& operator -= (const Matrix4&);
	Matrix4& operator *= (f32);
	Matrix4& operator /= (f32);

	// unary operators
	Matrix4 operator + () const;
	Matrix4 operator - () const;

	// binary operators
	Matrix4 operator * (const Matrix4&) const;
	Matrix4 operator + (const Matrix4&) const;
	Matrix4 operator - (const Matrix4&) const;
	Matrix4 operator * (f32) const;
	Matrix4 operator / (f32) const;

	BOOL operator == (const Matrix4&) const;
	BOOL operator != (const Matrix4&) const;
*/
	f32  Determinant();
	BOOL IsIdentity();
	void Inverse(f32 *pDeterminant=NULL);
	void Multiply(const Matrix4 *pM2);
	void MultiplyTranspose(const Matrix4 *pM2);
	void Transpose(const Matrix4 *pM);
	void Transpose(void);
	 
	void AffineTransformation(f32 Scaling, const Vector3 *pRotationCenter, const Quaternion *pRotation, const Vector3 *pTranslation);
	void AffineTransformation2D(f32 scaling, const Vector2 *pRotationCenter, f32 Rotation, const Vector2 *pTranslation);
	void Identity();
	void LookAtLH(const Vector3 *pEye, const Vector3 *pAt, const Vector3 *pUp) ;
	void LookAtRH(const Vector3 *pEye, const Vector3 *pAt, const Vector3 *pUp);
	void OrthoLH(f32 w, f32 h, f32 zn, f32 zf);
	void OrthoOffCenterLH(f32 l, f32 r, f32 b, f32 t, f32 zn, f32 zf);
	void OrthoOffCenterRH(f32 l, f32 r, f32 b, f32 t, f32 zn, f32 zf);
	void OrthoRH(f32 w, f32 h, f32 zn, f32 zf);
	void PerspectiveFovLH(f32 fovy, f32 Aspect, f32 zn, f32 zf);
	void PerspectiveFovRH(f32 fovy, f32 Aspect, f32 zn, f32 zf);
	void PerspectiveLH(f32 w, f32 h, f32 zn, f32 zf);
	void PerspectiveOffCenterLH(f32 l, f32 r, f32 b, f32 t, f32 zn, f32 zf);
	void PerspectiveOffCenterRH(f32 l, f32 r, f32 b, f32 t, f32 zn, f32 zf);
	void PerspectiveRH(f32 w, f32 h, f32 zn, f32 zf);
	void Reflection(const Plane *pPlane);
	void RotationAxis(const Vector3 *pV, f32 Angle);
	void RotationQuaternion(const Quaternion *pQ);
	void RotationX(f32 Angle);
	void RotationY(f32 Angle);
	void RotationYawPitchRoll(f32 Yaw, f32 Pitch, f32 Roll);
	void RotationZ(f32 Angle);
	void Scaling(f32 sx, f32 sy, f32 sz);
	void Scaling(Vector3 &v);
	void Shadow(const Vector4 *pLight, const Plane *pPlane);
	void Transformation(const Vector3 *pScalingCenter, const Quaternion *pScalingRotation, const Vector3 *pScaling, const Vector3 *pRotationCenter, const Quaternion *pRotation,  const Vector3 *pTranslation);
	void Transformation2D(const Vector2 *pScalingCenter, f32 pScalingRotation, const Vector2 *pScaling, const Vector2 *pRotationCenter, f32 Rotation, const Vector2 *pTranslation);
	void Translation(f32 x, f32 y, f32 z);
	void Translation(Vector3 &v);
};

} // namespace noe