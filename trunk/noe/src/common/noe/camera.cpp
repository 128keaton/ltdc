/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Camera class
 * @file           camera.cpp
 * @package        gos
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

// noe
#include <noe/noe.h>
#include <noe/camera.h>
#include <noe/math.h>

namespace noe
{

//-----------------------------------------------------------------------------
/**
 * Camera constructor.
 * Set default value.
 */
Camera::Camera(): m_PositionAttach(NULL), m_TargetAttach(NULL), m_Mode(FREE), m_FOV(PI*0.25f), m_Aspect(1.0f), m_Near(0.01f), m_Far(100.0f)
{
	m_Position.Set(0.0f, 2.0f, -10.0f);
	m_Target.Set(0.0f, 0.0f, 0.0f);
	m_Direction.Set(0.0f, 0.0f, 1.0f);

	m_WorldView.GetUpdate().Identity();
	m_ViewProj.GetUpdate().PerspectiveFovLH(m_FOV, m_Aspect, m_Near, m_Far);
}

//-----------------------------------------------------------------------------
/**
 * Update camera data.
 */
void Camera::Process()
{
	if(m_Mode == FREE)
	{
		m_Target = m_Position + m_Direction;
	}
	else if(m_Mode == TARGET)
	{
		if(m_PositionAttach)
			m_Position = *m_PositionAttach;

		if(m_TargetAttach)
			m_Target = *m_TargetAttach;
	}

	m_WorldView.GetUpdate().LookAtLH(&m_Position, &m_Target, &Vector3::Up());
	m_ViewProj.GetUpdate().PerspectiveFovLH(m_FOV, m_Aspect, m_Near, m_Far); 
	BuildFrustum();
}

//-----------------------------------------------------------------------------
/**
 * Camera draw procedure [RENDER].
 * @param	context		<i>Not used.</i>
 */
void Camera::Draw(DrawContext* context)
{
	RenderInstance.SetWorldView(&m_WorldView.GetRender());
	RenderInstance.SetViewProj(&m_ViewProj.GetRender());
	RenderInstance.SetFrustum(&m_Frustum.GetRender());
	RenderInstance.SetCamera(this);
}

//-----------------------------------------------------------------------------
/**
 * Synchronize camera data before doublebuffer swapping.
 */
void Camera::Synchronize()
{
	m_WorldView.UpdateToRender();
	m_ViewProj.UpdateToRender();
	m_Frustum.UpdateToRender();
}

//-----------------------------------------------------------------------------
/**
 * Set camera aspect ratio.
 * @param          a                   Screen aspect ratio (width / height).
 */
void Camera::SetAspect(f32 a) 
{ 
	m_Aspect = a;
	m_ViewProj.GetUpdate().PerspectiveFovLH(m_FOV, m_Aspect, m_Near, m_Far); 
}

//-----------------------------------------------------------------------------
/**
 * Build the View frustum (in world space).
 */
void Camera::BuildFrustum()
{
	Matrix4 matVP = m_WorldView.GetUpdate() * m_ViewProj.GetUpdate();
	m_Frustum.GetUpdate().Build(matVP);
}

}; // Namespace noe.