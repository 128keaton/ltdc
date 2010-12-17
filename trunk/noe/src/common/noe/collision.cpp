/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Collision manager
 * @file           collision.cpp
 * @package        gos
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

#pragma once

// std
#include <vector>
// noe
#include <noe/noe.h>
#include <noe/math.h>
#include <noe/collision.h>
#include <noe/physic.h>
#include <noe/distance.h>

namespace noe {

/// Constructor
Collision::Collision()
{
	m_FunctionList.resize(PHY_MAX * PHY_MAX, NULL);
	m_FunctionList[COL_FUNC(PHY_SPHERE,   PHY_HEIGHT)]   = &Collision::SphereHeight;
	m_FunctionList[COL_FUNC(PHY_SPHERE,   PHY_SPHERE)]   = &Collision::HorizontalSphereSphere;//SphereSphere;
	m_FunctionList[COL_FUNC(PHY_SPHERE,   PHY_CYLINDER)] = &Collision::SphereCylinder;
	m_FunctionList[COL_FUNC(PHY_CYLINDER, PHY_CYLINDER)] = &Collision::CylinderCylinder;
	m_FunctionList[COL_FUNC(PHY_CYLINDER, PHY_HEIGHT)]   = &Collision::CylinderHeight;
}

/**
 * Generic collision check function.
 * @param          a1                  First physic agent.
 * @param          a2                  Second physic agent.
 * @retval         TRUE                At least 1 collision occured.
 * @retval         FALSE               No collision occured.
 */
BOOL Collision::Check(PhysicAgentInterface* a1, PhysicAgentInterface* a2)
{
	//DBG_ASSERT(this->*m_FunctionList[COL_FUNC(a1->Type(), a2->Type())] == NULL);

	return (this->*m_FunctionList[COL_FUNC(a1->Type(), a2->Type())])(a1, a2);
}

/**
 * Sphere x Height collision check.
 * @param          s                   Sphere.
 * @param          h                   Height.
 * @retval         TRUE                At least 1 collision occured.
 * @retval         FALSE               No collision occured.
 */
BOOL Collision::SphereHeight(PhysicAgentInterface* s, PhysicAgentInterface* h)
{
	DBG_ASSERT(s->Type() == PHY_SPHERE);
	DBG_ASSERT(s->IsDynamic());
	DBG_ASSERT(h->Type() == PHY_HEIGHT);
	DBG_ASSERT(h->IsStatic());

	Hit m_Hit; //

	BOOL hit(FALSE);
	f32  pos_y = s->Position().y - s->BSphere();

	if(pos_y < h->Height())
	{
		hit = TRUE;
		m_Hit.position = s->Position();
		m_Hit.position.y = h->Height();
	}
	else if(s->Move().y < 0.0f)
	{
		if(pos_y + s->Move().y < h->Height())
		{
			hit = TRUE;
			m_Hit.position = s->Position() + s->Move();
			m_Hit.position.y = h->Height();
		}
	}

	if(hit)
	{
		PhysicAgentInterface::Function func;

		func = s->Callback();
		if(!func || (s->*func)(h, &m_Hit))
		{
			s->Velocity().y *= -1.0f;
			s->Velocity() *= s->Bounce() * h->Bounce();

			m_Hit.position.y += s->BSphere();
			s->Move() = m_Hit.position - s->Position();
		}
		
		func = h->Callback();
		if(func)
			(h->*func)(s, &m_Hit);
	
		s->SetCollide(TRUE);
		h->SetCollide(TRUE);

		return TRUE;
	}
	return FALSE;
}

/**
 * Sphere x Sphere collision check.
 * @param          s1                  First sphere.
 * @param          s2                  Second sphere.
 * @retval         TRUE                At least 1 collision occured.
 * @retval         FALSE               No collision occured.
 */
BOOL Collision::SphereSphere(PhysicAgentInterface* s1, PhysicAgentInterface* s2)
{
	DBG_ASSERT(s1->Type() == PHY_SPHERE);
	DBG_ASSERT(s1->IsDynamic());
	DBG_ASSERT(s2->Type() == PHY_SPHERE);

	Hit m_Hit; //

	// first check static collision
	Vector3 dif = s1->Position() - s2->Position();
	f32 dist = dif.SqrLength();
	f32 rad = Square(s1->BSphere()+s2->BSphere());
	if(dist < rad)
	{
		PhysicAgentInterface::Function func;

		dif.Normalize();
		dif *= sqrtf(rad) - sqrtf(dist);

		func = s1->Callback();
		if(!func || (s1->*func)(s2, &m_Hit))
		{
			s1->Move() += dif * 0.5f;//* (s2->Mass() / (s1->Mass() + s2->Mass()));
		}

		func = s2->Callback();
		if(!func || (s2->*func)(s1, &m_Hit))
		{
			s2->Move() -= dif * 0.5f;//* (s1->Mass() / (s1->Mass() + s2->Mass()));
		}
	
		return TRUE;
	}
/*
	if(s2->IsStatic())
	{
	}
	else 
	{
		f32 pseg1, pseg2;
		Segment3 seg1(s1->Position(), s1->Move());
		Segment3 seg2(s2->Position(), s2->Move());
		f32 dist = SqrDistance(seg1, seg2, &pseg1, pseg2&);
		if(dist < rad)
		{
			PhysicAgentInterface::Function func;

			dif.Normalize();
			dif *= sqrtf(rad) - sqrtf(dist);

			func = s1->Callback();
			if(!func || (s1->*func)(s2, &m_Hit))
			{
				s1->Move() += dif * (s2->Mass() / (s1->Mass() + s2->Mass()));
			}

			func = s2->Callback();
			if(!func || (s2->*func)(s1, &m_Hit))
			{
				s2->Move() -= dif * (s1->Mass() / (s1->Mass() + s2->Mass()));
			}
		
			return TRUE;
		}
	}
*/
	return FALSE;
}


/**
 * Horizontal-sphere x Sphere collision check.
 * @param          s1                  First sphere.
 * @param          s2                  Second sphere.
 * @retval         TRUE                At least 1 collision occured.
 * @retval         FALSE               No collision occured.
 */
BOOL Collision::HorizontalSphereSphere(PhysicAgentInterface* s1, PhysicAgentInterface* s2)
{
	DBG_ASSERT(s1->Type() == PHY_SPHERE);
	DBG_ASSERT(s1->IsDynamic());
	DBG_ASSERT(s2->Type() == PHY_SPHERE);

	Hit m_Hit; //

	// first check static collision
	Vector3 dif = s1->Position() - s2->Position();
	f32 dist = dif.SqrLength();
	f32 rad = Square(s1->BSphere() + s2->BSphere());
	if(dist < rad)
	{
		PhysicAgentInterface::Function func;

		dif.y = 0.0f;
		dif.Normalize();
		dif *= sqrtf(rad) - sqrtf(dist);

		func = s1->Callback();
		if(!func || (s1->*func)(s2, &m_Hit))
		{
			s1->Move() += dif * (s2->Mass() / (s1->Mass() + s2->Mass()));
		}

		func = s2->Callback();
		if(!func || (s2->*func)(s1, &m_Hit))
		{
			s2->Move() -= dif * (s1->Mass() / (s1->Mass() + s2->Mass()));
		}
	
		return TRUE;
	}
	return FALSE;
}


/**
 * Sphere x Cylinder collision check.
 * @param          s                   Sphere.
 * @param          c                   Cylinder.
 * @retval         TRUE                At least 1 collision occured.
 * @retval         FALSE               No collision occured.
 */
BOOL Collision::SphereCylinder(PhysicAgentInterface* s, PhysicAgentInterface* c)
{
	DBG_ASSERT(s->IsDynamic());

	Hit m_Hit; //

	if(0) // dynamic
	{
	}
	else // static
	{
		f32 pos_y = s->Position().y + s->Move().y;

		if(pos_y < c->Position().y)
			return FALSE;

		if(pos_y > c->Position().y + c->Height())
			return FALSE;

		Vector3 dif = (s->Position() + s->Move()) - c->Position();
		dif.y = 0.0f;
		f32 dist = dif.SqrLength();
		f32 rad = Square(s->BSphere() + c->BSphere());
		if(dist < rad)
		{
			PhysicAgentInterface::Function func;

			dif.Normalize();
			dif *= sqrtf(rad) - sqrtf(dist);

			func = s->Callback();
			if(!func || (s->*func)(c, &m_Hit))
			{
				s->Move() += dif;
			}

			func = c->Callback();
			if(!func || (c->*func)(s, &m_Hit))
			{
			}
		
			return TRUE;
		}
	}
	return FALSE;
}

/**
 * Cylinder x Cylinder collision check.
 * @bug            Not yet implemented!
 * @param          c1                  First cylinder.
 * @param          c2                  Second cylinder.
 * @retval         TRUE                At least 1 collision occured.
 * @retval         FALSE               No collision occured.
 */
BOOL Collision::CylinderCylinder(PhysicAgentInterface* c1, PhysicAgentInterface* c2)
{
	Hit m_Hit; //

	return FALSE;
}

/**
 * Cylinder x Height collision check.
 * @bug            Not yet implemented!
 * @param          c                   Cylinder.
 * @param          h                   Height.
 * @retval         TRUE                At least 1 collision occured.
 * @retval         FALSE               No collision occured.
 */
BOOL Collision::CylinderHeight(PhysicAgentInterface* c, PhysicAgentInterface* h)
{
	Hit m_Hit; //

	return FALSE;
}

} // namespace noe