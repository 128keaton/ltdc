/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Camera class
 * @file           camera.h
 * @package        gos
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

#pragma once

// noe
#include <noe/noe.h>
#include <noe/math.h>
#include <noe/math/matrix4.h>
#include <noe/math/frustum.h>
#include <noe/render.h>

namespace noe
{
	
//-----------------------------------------------------------------------------
/**
 * Camera class.
 */
class Camera: public DrawProc
{

public:

	enum MODE { FREE, TARGET };

	/// Constructor
	Camera();

	/// World to view's transformation matrix. @param n N-th buffer. @return World-view matrix.
	Matrix4& WorldView(i32 n = UPDATE)          { return m_WorldView.Get(n); }
	/// World to view's transformation matrix. @param n N-th buffer. @return World-view matrix.
	Matrix4  WorldView(i32 n = UPDATE) const    { return m_WorldView.Get(n); }
	/// View to projection's transformation matrix. @param n N-th buffer. @return View-proj matrix.
	Matrix4& ViewProj(i32 n = UPDATE)           { return m_ViewProj.Get(n); }
	/// View to projection's transformation matrix. @param n N-th buffer. @return View-proj matrix.
	Matrix4  ViewProj(i32 n = UPDATE)  const    { return m_ViewProj.Get(n); }
	/// Camera's frustum in world space. @param n N-th buffer. @return View frustum.
	Frustum& WorldFrustum(i32 n = UPDATE)       { return m_Frustum.Get(n); }
	/// Camera's frustum in world space. @param n N-th buffer. @return View frustum.
	Frustum  WorldFrustum(i32 n = UPDATE) const { return m_Frustum.Get(n); }

	/// Attach camera position vector to camera. @param v Position pointer.
	void AttachPosition(const Vector3* v) { m_PositionAttach = v; }
	/// Attach target position vector to camera. @param v Target pointer.
	void AttachTarget(const Vector3* v)   { m_TargetAttach = v; }

	/// Camera position vector. @return Position.
	Vector3& Position()        { return m_Position; }
	/// Camera position vector. @return Position.
	Vector3  Position()  const { return m_Position; }
	/// Target position vector. @return Target.
	Vector3& Target()          { return m_Target; }
	/// Target position vector. @return Target.
	Vector3  Target()    const { return m_Target; }
	/// Target position vector. @return Direction.
	Vector3& Direction()       { return m_Direction; }
	/// Target position vector. @return Direction.
	Vector3  Direction() const { return m_Direction; }

	/// Set the camera mode. @param mode Camera mode.
	void SetMode(u8 mode) { m_Mode = mode; }
	/// Get the camera mode. @return Camera mode.
	u8   GetMode() { return m_Mode; }

	/// Update camera data.
	void Process();
	/// Camera draw procedure [RENDER].
	void Draw(DrawContext*);
	/// Synchronize camera data before doublebuffer swapping.
	void Synchronize();
	/// Set camera aspect ratio.
	void SetAspect(f32 a);

protected:

	/// Build the View frustum (in world space).
	void BuildFrustum();

protected:

	DoubleBuffer<Matrix4> m_WorldView; ///< World to view's transformation matrix.
	DoubleBuffer<Matrix4> m_ViewProj;  ///< View to projection's transformation matrix.
	DoubleBuffer<Frustum> m_Frustum;   ///< View frustum in world space
	Vector3 m_Position;                ///< Position
	Vector3	m_Target;                  ///< Target
	Vector3	m_Direction;               ///< Direction
	const Vector3* m_PositionAttach;   ///< Attached position
	const Vector3* m_TargetAttach;     ///< Attached target
	u8  m_Mode;                        ///< Camera mode
	f32 m_FOV;                         ///< FOV
	f32 m_Aspect;                      ///< Aspect ratio
	f32 m_Near;                        ///< Near clipping distance
	f32 m_Far;                         ///< Far clipping distance
};

}; // Namespace noe.