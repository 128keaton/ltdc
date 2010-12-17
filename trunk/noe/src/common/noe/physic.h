/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Physic manager
 * @file           physic.h
 * @package        noe
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
#include <noe/collision.h>
#include <noe/system.h>

namespace noe {

//-----------------------------------------------------------------------------
/**
 * Game agent base interface
 */
class GameAgent
{
	/// Get the agent's Unique-IDentifier. @return The agent's Unique-IDentifier
	virtual u32 UID() const = 0;
};

//-----------------------------------------------------------------------------
/// Collision tpyes
enum PHYSIC_TYPE
{
	PHY_UNKNOW = -1,
	PHY_HEIGHT = 0,  // f32 height                    
	PHY_SPHERE,      // v3 pos, f32 radius
	PHY_CYLINDER,    // v3 pos, v3 dir, f32 radius
	PHY_CYLINDER_X,  // v3 pos, f32 h, f32 radius (h == 0 ? infinite)
	PHY_CYLINDER_Y,  // v3 pos, f32 h, f32 radius (h == 0 ? infinite)
	PHY_COLUMN = PHY_CYLINDER_Y,
	PHY_CYLINDER_Z,  // v3 pos, f32 h, f32 radius (h == 0 ? infinite)
	PHY_CAPSULE,     // v3 pos, v3 dir, f32 radius
	PHY_PLAN,        // v3 dir, f32 h ()
	PHY_RECTANGLE,   // v3 pos, v3 dir
	PHY_RECTANGLE_X, // v3 pos, v3 dir (pos.x == dir.x)
	PHY_RECTANGLE_Y, // v3 pos, v3 dir (pos.y == dir.y)
	PHY_RECTANGLE_Z, // v3 pos, v3 dir (pos.z == dir.z)
	PHY_BOX,         // PLAN[6]
	PHY_AABOX,       // v3 pos, v3 dir
	PHY_MAX,
	PHY_MASK         = 0x000000FF, //
/*
	PHY_POINT,       // v3 pos                     >> SPHERE 
	PHY_LINE,        // v3 pos, v3 dir            
	PHY_RAY,         // v3 pos, v3 dir             
	PHY_SEGMENT,     // v3 pos, v3 dir             >> CYLINDER
	PHY_CIRCLE,      // v3 pos, v3 dir, f32 radius >> CYLINDER
	PHY_CIRCLE_X,    // v3 pos, f32 radius         >> CYLINDER
	PHY_CIRCLE_Y,    // v3 pos, f32 radius         >> CYLINDER
	PHY_CIRCLE_Z,    // v3 pos, f32 radius         >> CYLINDER
	PHY_TRIANGLE,    // v3 pos, v3 edge1, v3 edge2
	PHY_SPHERE_TREE, //
*/
	PHY_COLLIDE      = 0x20000000, //
	PHY_STABLE       = 0x40000000, //
	PHY_DYNAMIC      = 0, //
	PHY_STATIC       = 0x80000000, //
};


//-----------------------------------------------------------------------------
/**
 * Interface class for agents that interact with physic
 */
class PhysicAgentInterface: public GameAgent
{
public:

	/// Collision callback prototype
	typedef BOOL (PhysicAgentInterface::*Function) (PhysicAgentInterface*, Collision::Hit*);

	PhysicAgentInterface() {} ///< Default constructor.

	virtual u32      UID()       const  = 0; ///< Get the agent Unique-IDentifier. @return The agent Unique-IDentifier.

	virtual i32      Type()      const  = 0; ///< Get the agent type. @return The agent type.
	virtual BOOL     IsStatic()  const  = 0; ///< Tell if agent is static. @retval TRUE Agent is static. @retval FALSE Agent is dynamic.
	virtual BOOL     IsDynamic() const  = 0; ///< Tell if agent is dynamic. @retval TRUE Agent is dynamic. @retval FALSE Agent is static.
	virtual BOOL     IsStable()  const  = 0; ///< Tell if in a stable state. @retval TRUE Agent is stable. @retval FALSE Agent is moving.
	virtual void     SetStable(BOOL b)  = 0; ///< Set the stable state. @param b The stable state.
	virtual BOOL     IsCollide() const  = 0; ///< Tell if agent colliding. @retval TRUE Agent is colliding. @retval FALSE Agent is not colliding.
	virtual void     SetCollide(BOOL b) = 0; ///< Set the collision state. @param b The collision state.
	
	virtual Vector3& Position()         = 0; ///< Get agent position. @return The agent position.
	virtual Vector3& Direction()        = 0; ///< Get agent direction. @return The agent direction.
	virtual Vector3& Velocity()         = 0; ///< Get agent velocity. @return The agent velocity.
	virtual Vector3& Force()            = 0; ///< Get agent force. @return The agent force.
	virtual Vector3& Move()             = 0; ///< Get agent movement. @return The agent movement.
	virtual f32      Mass()      const  = 0; ///< Get agent mass. @return The agent mass.
	virtual f32      BSphere()   const  = 0; ///< Get agent bounding-sphere. @return The agent bounding-sphere.
	virtual f32      Height()    const  = 0; ///< Get agent height. @return The agent height.
	virtual f32      Radius()    const  = 0; ///< Get agent radius. @return The agent radius.
	virtual f32      Bounce()    const  = 0; ///< Get agent bounce factor. @return The bounce factor.

	virtual Function Callback() = 0; ///< Get agent function callback. @return The agent function callback.
	virtual void Attach(PhysicAgentInterface*) = 0; ///< Attach agent to an other.
	virtual void Detach() = 0; ///< Detach agent.
	virtual PhysicAgentInterface* GetAttach() = 0; ///< Attach agent to an other.
};


//-----------------------------------------------------------------------------
/**
 * Basic class for agents that interact with physic
 */
class PhysicAgent: public PhysicAgentInterface
{
public:

	/// Default constructor
	PhysicAgent(i32 type = PHY_UNKNOW): m_Type(type & ~PHY_STABLE) {} 

	virtual u32      UID()      const = 0; ///< Get the agent Unique-IDentifier. @return The agent Unique-IDentifier.

	/// Get the agent type. @return The agent type.
	virtual i32      Type()      const { return m_Type & PHY_MASK; }
	/// Tell if agent is static. @retval TRUE Agent is static. @retval FALSE Agent is dynamic.
	virtual BOOL     IsStatic()  const { return m_Type & PHY_STATIC; }
	/// Tell if agent is dynamic. @retval TRUE Agent is dynamic. @retval FALSE Agent is static.
	virtual BOOL     IsDynamic() const { return !(m_Type & PHY_STATIC); }
	/// Tell if in a stable state. @retval TRUE Agent is stable. @retval FALSE Agent is moving.
	virtual BOOL     IsStable()  const { return m_Type & PHY_STABLE; }
	/// Set the stable state. @param b The stable state.
	virtual void     SetStable(BOOL b)  { b ? m_Type |= PHY_STABLE: m_Type &= ~PHY_STABLE; }
	/// Tell if agent colliding. @retval TRUE Agent is colliding. @retval FALSE Agent is not colliding.
	virtual BOOL     IsCollide() const { return m_Type & PHY_COLLIDE; }
	/// Set the collision state. @param b The collision state.
	virtual void     SetCollide(BOOL b) { b ? m_Type |= PHY_COLLIDE: m_Type &= ~PHY_COLLIDE; }

	virtual Vector3& Position()       = 0; ///< Get agent position. @return The agent position.
	virtual Vector3& Direction()        = 0; ///< Get agent direction. @return The agent direction.
	virtual Vector3& Velocity()       = 0; ///< Get agent velocity. @return The agent velocity.
	virtual Vector3& Force()          = 0; ///< Get agent force. @return The agent force.
	virtual Vector3& Move()           = 0; ///< Get agent movement. @return The agent movement.
	virtual f32      Mass()     const = 0; ///< Get agent mass. @return The agent mass.
	virtual f32      BSphere()  const = 0; ///< Get agent bounding-sphere. @return The agent bounding-sphere.
	virtual f32      Height()   const = 0; ///< Get agent height. @return The agent height.
	virtual f32      Radius()   const = 0; ///< Get agent radius. @return The agent radius.
	virtual f32      Bounce()   const = 0; ///< Get agent bounce factor. @return The bounce factor.

	virtual Function Callback() { return NULL; } ///< Get agent function callback. @return The agent function callback.
	virtual void Attach(PhysicAgentInterface*) = 0; ///< Attach agent to an other.
	virtual void Detach() = 0; ///< Detach agent.
	virtual PhysicAgentInterface* GetAttach() = 0; ///< Attach agent to an other.

protected:

	i32 m_Type; ///< The collision agent type. @see noe::PHYSIC_TYPE
};


//-----------------------------------------------------------------------------
/**
 * Basic class for dynamic agents that interact with physic
 */
class DynamicAgent: public PhysicAgent
{
public:

	/// Default constructor
	DynamicAgent(i32 type = PHY_UNKNOW): PhysicAgent(type), m_Attach(NULL) { m_Force.Clear(); m_Move.Clear(); }

	virtual u32      UID()      const = 0; ///< Get the agent Unique-IDentifier. @return The agent Unique-IDentifier.

	virtual Vector3& Position() = 0; ///< Get agent position. @return The agent position.
	virtual Vector3& Direction()        = 0; ///< Get agent direction. @return The agent direction.
	virtual Vector3& Velocity() = 0; ///< Get agent velocity. @return The agent velocity.
	virtual Vector3& Force()    { return m_Force; }; ///< Get agent force. @return The agent force.
	virtual Vector3& Move()     { return m_Move; };  ///< Get agent movement. @return The agent movement.
	virtual f32      Mass()     const = 0; ///< Get agent mass. @return The agent mass.
	virtual f32      BSphere()  const = 0; ///< Get agent bounding-sphere. @return The agent bounding-sphere.
	virtual f32      Height()   const = 0; ///< Get agent height. @return The agent height.
	virtual f32      Radius()   const = 0; ///< Get agent radius. @return The agent radius.
	virtual f32      Bounce()   const = 0; ///< Get agent bounce factor. @return The bounce factor.

	virtual Function Callback() { return NULL; } ///< Get agent function callback. @return The agent function callback.
	virtual void Attach(PhysicAgentInterface* a) { m_Attach = a; } ///< Attach agent to an other.
	virtual void Detach() { m_Attach = NULL; } ///< Detach agent.
	virtual PhysicAgentInterface* GetAttach() { return m_Attach; } ///< Attach agent to an other.

protected:

	PhysicAgentInterface* m_Attach; ///< Pointer to attached object
	Vector3               m_Force;  ///< Sum of forces applyed on the agent
	Vector3               m_Move;   ///< Agent mouvement
};

class Physic;

//-----------------------------------------------------------------------------
/**
 * Collision check thread.
 * @bug            noe::Collision::Hit is shared by all thread!
 * @todo           create a per thread Hit data.
 */
class CollisionThread: public Thread
{
friend Physic;

public:

	PhysicAgentInterface* agent; ///< Pointer to the agent to check

	CollisionThread(): agent(NULL) {} ///< The defailt constructor

	virtual void Run(); ///< Thread entry point.
};


//-----------------------------------------------------------------------------
/**
 * Physic manager class
 */
class Physic: public Singleton<Physic>
{
friend CollisionThread;

public:

	/// Agents list structure
	typedef std::vector<PhysicAgentInterface*> PhysicAgentList;

	static const BOOL MULTI_THREAD = FALSE; ///< Use multi-thread process for dynamic/static collision detection

	Physic(); ///< Constructor.

	Vector3& Gravity()       { return m_Gravity; } ///< Get/Set physic system's gravity
	Vector3  Gravity() const { return m_Gravity; } ///< Get physic system's gravity

	void AddDynamicAgent(PhysicAgentInterface* agent); ///< Add a dynamix agent into the physic system
	void AddStaticAgent(PhysicAgentInterface* agent);  ///< Add a static agent into the physic system

	void Process(); ///< Process physic & collision update

private:
	PhysicAgentList m_DynamicAgents; ///< List of dynamic agents.
	PhysicAgentList m_StaticAgents;  ///< List of static agents.
	Vector3         m_Gravity;       ///< Gravity.
	f32             m_Epsilon;       ///< Computation error margin.
};
/// Physic manager instance
#define PhysicInstance Physic::Instance()

} // namespace noe