/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Matrix class
 * @file           matrix4.cpp
 * @package        noe.math
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

// noe
#include <noe/noe.h>
#include <noe/math/matrix4.h>

namespace noe
{

const Matrix4 mat_identity(
	1.0f, 0.0f, 0.0f, 0.0f,
	0.0f, 1.0f, 0.0f, 0.0f,
	0.0f, 0.0f, 1.0f, 0.0f,
	0.0f, 0.0f, 0.0f, 1.0f);

const Matrix4 mat_zero(
	0.0f, 0.0f, 0.0f, 0.0f,
	0.0f, 0.0f, 0.0f, 0.0f,
	0.0f, 0.0f, 0.0f, 0.0f,
	0.0f, 0.0f, 0.0f, 0.0f);


/**
 * Returns the determinant of a matrix.
 */
f32 Matrix4::Determinant() 
{ 
	return D3DXMatrixDeterminant(this); 
}

/**
 * Determines if a matrix is an identity matrix.
 */
BOOL Matrix4::IsIdentity() 
{ 
	return D3DXMatrixIsIdentity(this); 
}

/**
 * Calculates the inverse of a matrix.
 */
void Matrix4::Inverse(f32 *pDeterminant) 
{ 
	D3DXMatrixInverse(this, pDeterminant, this); 
}

/**
 * Determines the product of two matrices.
 */
void Matrix4::Multiply(const Matrix4 *pM2) 
{ 
	D3DXMatrixMultiply(this, this, pM2); 
}

/**
 * Calculates the transposed product of two matrices.
 */
void Matrix4::MultiplyTranspose(const Matrix4 *pM2) 
{ 
	D3DXMatrixMultiplyTranspose(this, this, pM2); 
}

/**
 * Returns the matrix transpose of a matrix.
 */
void Matrix4::Transpose(const Matrix4 *pM) 
{ 
	D3DXMatrixTranspose(this, pM); 
}

void Matrix4::Transpose(void)
{
	Matrix4 transpose(
		_11, _21, _31, _41,
		_12, _22, _32, _42,
		_13, _23, _33, _43,
		_14, _24, _34, _44
	);
	*this = transpose;
}










/**
 * Builds an affine transformation matrix.
 */
void Matrix4::AffineTransformation(f32 Scaling, const Vector3 *pRotationCenter, const Quaternion *pRotation, const Vector3 *pTranslation)
{
	D3DXMatrixAffineTransformation(this, Scaling, pRotationCenter, (D3DXQUATERNION*)pRotation, pTranslation);
}

/**
 * Build 2D affine transformation matrix in the XY plane. Null arguments are treated as identity.
 */
void Matrix4::AffineTransformation2D(f32 scaling, const Vector2 *pRotationCenter, f32 Rotation, const Vector2 *pTranslation)
{
	D3DXMatrixAffineTransformation2D(this, scaling, (D3DXVECTOR2*)pRotationCenter, Rotation, (D3DXVECTOR2*)pTranslation);
}

/**
 * Creates an identity matrix.
 */
void Matrix4::Identity() 
{ 
	D3DXMatrixIdentity(this); 
}

/**
 * Builds a left-handed, look-at matrix.
 */
void Matrix4::LookAtLH(const Vector3 *pEye, const Vector3 *pAt, const Vector3 *pUp) 
{	
	D3DXMatrixLookAtLH(this, pEye, pAt, pUp); 
}

/**
 * Builds a right-handed, look-at matrix.
 */
void Matrix4::LookAtRH(const Vector3 *pEye, const Vector3 *pAt, const Vector3 *pUp)
{
	D3DXMatrixLookAtRH(this, pEye, pAt, pUp);
}

/**
 * Builds a left-handed orthogonal projection matrix.
 */
void Matrix4::OrthoLH(f32 w, f32 h, f32 zn, f32 zf) 
{ 
	D3DXMatrixOrthoLH(this, w, h, zn, zf); 
}

/**
 * Builds a customized, left-handed orthogonal projection matrix.
 */
void Matrix4::OrthoOffCenterLH(f32 l, f32 r, f32 b, f32 t, f32 zn, f32 zf) 
{ 
	D3DXMatrixOrthoOffCenterLH(this, l, r, b, t, zn, zf); 
}

/**
 * Builds a customized, right-handed orthogonal projection matrix.
 */
void Matrix4::OrthoOffCenterRH(f32 l, f32 r, f32 b, f32 t, f32 zn, f32 zf) 
{ 
	D3DXMatrixOrthoOffCenterRH(this, l, r, b, t, zn, zf); 
}

/**
 * Builds a right-handed orthogonal projection matrix.
 */
void Matrix4::OrthoRH(f32 w, f32 h, f32 zn, f32 zf) 
{ 
	D3DXMatrixOrthoRH(this, w, h, zn, zf); 
}

/**
 * Builds a left-handed perspective projection matrix based on a field of view.
 */
void Matrix4::PerspectiveFovLH(f32 fovy, f32 Aspect, f32 zn, f32 zf) 
{ 
	D3DXMatrixPerspectiveFovLH(this, fovy, Aspect, zn, zf); 
}

/**
 * Builds a right-handed perspective projection matrix based on a field of view.
 */
void Matrix4::PerspectiveFovRH(f32 fovy, f32 Aspect, f32 zn, f32 zf) 
{ 
	D3DXMatrixPerspectiveFovRH(this, fovy, Aspect, zn, zf); 
}

/**
 * Builds a left-handed perspective projection matrix
 */
void Matrix4::PerspectiveLH(f32 w, f32 h, f32 zn, f32 zf) 
{ 
	D3DXMatrixPerspectiveLH(this, w, h, zn, zf); 
}

/**
 * Builds a customized, left-handed perspective projection matrix.
 */
void Matrix4::PerspectiveOffCenterLH(f32 l, f32 r, f32 b, f32 t, f32 zn, f32 zf) 
{ 
	D3DXMatrixPerspectiveOffCenterLH(this, l, r, b, t, zn, zf); 
}

/**
 * Builds a customized, right-handed perspective projection matrix.
 */
void Matrix4::PerspectiveOffCenterRH(f32 l, f32 r, f32 b, f32 t, f32 zn, f32 zf) 
{ 
	D3DXMatrixPerspectiveOffCenterRH(this, l, r, b, t, zn, zf); 
}

/**
 * Builds a right-handed perspective projection matrix.
 */
void Matrix4::PerspectiveRH(f32 w, f32 h, f32 zn, f32 zf) 
{ 
	D3DXMatrixPerspectiveRH(this, w, h, zn, zf); 
}

/**
 * Builds a matrix that reflects the coordinate system about a plane.
 */
void Matrix4::Reflection(const Plane *pPlane) 
{ 
	D3DXMatrixReflect(this, (D3DXPLANE*)pPlane); 
}

/**
 * Builds a matrix that rotates around an arbitrary axis.
 */
void Matrix4::RotationAxis(const Vector3 *pV, f32 Angle) 
{ 
	D3DXMatrixRotationAxis(this, pV, Angle); 
}

/**
 * Builds a rotation matrix from a quaternion.
 */
void Matrix4::RotationQuaternion(const Quaternion *pQ) 
{ 
	D3DXMatrixRotationQuaternion(this, (D3DXQUATERNION*)pQ); 
}

/**
 * Builds a matrix that rotates around the x-axis.
 */
void Matrix4::RotationX(f32 Angle) 
{ 
	D3DXMatrixRotationX(this, Angle); 
}

/**
 * Builds a matrix that rotates around the y-axis.
 */
void Matrix4::RotationY(f32 Angle) 
{ 
	D3DXMatrixRotationY(this, Angle); 
}

/**
 * Builds a matrix with a specified yaw, pitch, and roll.
 */
void Matrix4::RotationYawPitchRoll(f32 Yaw, f32 Pitch, f32 Roll) 
{ 
	D3DXMatrixRotationYawPitchRoll(this, Yaw, Pitch, Roll); 
}

/**
 * Builds a matrix that rotates around the z-axis.
 */
void Matrix4::RotationZ(f32 Angle) 
{ 
	D3DXMatrixRotationZ(this, Angle); 
}

/**
 * Builds a matrix that scales along the x-axis, the y-axis, and the z-axis.
 */
void Matrix4::Scaling(f32 sx, f32 sy, f32 sz) 
{ 
	D3DXMatrixScaling(this, sx, sy, sz); 
}

/**
 * Builds a matrix that scales along the x-axis, the y-axis, and the z-axis.
 */
void Matrix4::Scaling(Vector3 &v) 
{ 
	D3DXMatrixScaling(this, v.x, v.y, v.z); 
}

/**
 * Builds a matrix that flattens geometry into a plane.
 */
void Matrix4::Shadow(const Vector4 *pLight, const Plane *pPlane) 
{ 
	D3DXMatrixShadow(this, pLight, (D3DXPLANE*)pPlane); 
}

/**
 * Builds a transformation matrix.
 */
void Matrix4::Transformation(const Vector3 *pScalingCenter, const Quaternion *pScalingRotation, const Vector3 *pScaling, const Vector3 *pRotationCenter, const Quaternion *pRotation,  const Vector3 *pTranslation)
{
	D3DXMatrixTransformation(this, pScalingCenter, (D3DXQUATERNION*)pScalingRotation, pScaling, pRotationCenter, (D3DXQUATERNION*)pRotation, pTranslation);
}

/**
 * Build 2D transformation matrix in the XY plane. Null arguments are treated as identity.
 */
void Matrix4::Transformation2D(const Vector2 *pScalingCenter, f32 pScalingRotation, const Vector2 *pScaling, const Vector2 *pRotationCenter, f32 Rotation, const Vector2 *pTranslation)
{
	D3DXMatrixTransformation2D(this, (D3DXVECTOR2*)pScalingCenter, pScalingRotation, (D3DXVECTOR2*)pScaling, (D3DXVECTOR2*)pRotationCenter, Rotation, (D3DXVECTOR2*)pTranslation);
}

/**
 * Builds a matrix using the specified offsets.
 */
void Matrix4::Translation(f32 x, f32 y, f32 z) 
{ 
	D3DXMatrixTranslation(this, x, y, z); 
}

/**
 * Builds a matrix using the specified offsets.
 */
void Matrix4::Translation(Vector3 &v) 
{ 
	D3DXMatrixTranslation(this, v.x, v.y, v.z); 
}


} // namespace noe