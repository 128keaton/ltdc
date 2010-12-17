/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Collision manager
 * @file           collision.h
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
#include <noe/math/vector3.h>
#include <noe/singleton.h>

namespace noe {

class PhysicAgentInterface;

#define COL_FUNC(a, b) (a * PHY_MAX) + b

//-----------------------------------------------------------------------------
/**
 * Collison manager class.
 */
class Collision: public Singleton<Collision>
{
public:

	/// Collision check callback prototype
	typedef BOOL (Collision::*Function) (PhysicAgentInterface*, PhysicAgentInterface*);

	/// Collision hit information structure.
	struct Hit
	{
		Vector3 position;    ///< Collision position
		Vector3 penetration; ///< Collision penetration
	};

	/// Default constructor
	Collision();

	/// Generic collision check function.
	BOOL Check(PhysicAgentInterface*, PhysicAgentInterface*);
	/// Sphere x Height collision check.
	BOOL SphereHeight(PhysicAgentInterface*, PhysicAgentInterface*);
	/// Sphere x Sphere collision check.
	BOOL SphereSphere(PhysicAgentInterface*, PhysicAgentInterface*);
	/// Sphere x Cylinder collision check.
	BOOL SphereCylinder(PhysicAgentInterface*, PhysicAgentInterface*);
	/// Cylinder x Height collision check.
	BOOL CylinderHeight(PhysicAgentInterface*, PhysicAgentInterface*);
	/// Cylinder x Cylinder collision check.
	BOOL CylinderCylinder(PhysicAgentInterface*, PhysicAgentInterface*);
	/// Horizontal-sphere x Sphere collision check.
	BOOL HorizontalSphereSphere(PhysicAgentInterface*, PhysicAgentInterface*);

protected:

	//Hit                   m_Hit;          ///< The last hit. @bug Not multi-thread safe! @see noe::CollisionThread
	f32                   m_VelocityMin;  ///< Squared value
	std::vector<Function> m_FunctionList; ///< List of collision check function
};

/// Collison class instance
#define CollisionInstance Collision::Instance()

} // namespace noe