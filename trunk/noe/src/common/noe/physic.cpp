/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Physic manager
 * @file           physic.cpp
 * @package        noe
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

// std
#include <vector>
// noe
#include <noe/noe.h>
#include <noe/physic.h>

namespace noe {

//-----------------------------------------------------------------------------
/**
 * Constructor.
 */
Physic::Physic()
{
	m_Epsilon = 0.00001f;
	m_Gravity.Set(0.0f, -9.8f, 0.0f);
}

//-----------------------------------------------------------------------------
/**
 * Add a dynamix agent into the physic system.
 * @param	agent		Pointer to the agent structure to add.
 */
void Physic::AddDynamicAgent(PhysicAgentInterface* agent)
{
	m_DynamicAgents.push_back(agent);
}

//-----------------------------------------------------------------------------
/**
 * Add a static agent into the physic system.
 * @param	agent		Pointer to the agent structure to add.
 */
void Physic::AddStaticAgent(PhysicAgentInterface* agent)
{
	m_StaticAgents.push_back(agent);
}

//-----------------------------------------------------------------------------
/**
 * Check all static agent with the current dynamic agent
 */
void CollisionThread::Run()
{
	DBG_ASSERT(agent != NULL);

	// Check all static agent with the current dynamic agent
	loop(i, scast<i32>(PhysicInstance.m_StaticAgents.size()))
		CollisionInstance.Check(agent, PhysicInstance.m_StaticAgents[i]);
}

//-----------------------------------------------------------------------------
/**
 * Process physic & collision update.
 */
void Physic::Process()
{
	//DBG_ASSERT(Timer::ElapsedSeconds > 0.0f);

	//--------------------------------------------------------------------------
	// update dynamic agents
	for(u32 i = 0; i < m_DynamicAgents.size(); i++)
	{
		if(1)//!m_DynamicAgents[i]->IsStable() || (m_DynamicAgents[i]->Velocity().SqrLength() > m_Epsilon) || (m_DynamicAgents[i]->Force().SqrLength() > m_Epsilon))
		{
			// Set flag
			m_DynamicAgents[i]->SetStable(FALSE);
			m_DynamicAgents[i]->SetCollide(FALSE);
			// Compute force
			m_DynamicAgents[i]->Force() += m_Gravity;
			// Apply force to velocity
			m_DynamicAgents[i]->Velocity() += m_DynamicAgents[i]->Force() * scast<f32>(Timer::ElapsedSeconds);
			// Clear forces
			m_DynamicAgents[i]->Force().Clear();
			// Compute movement vector
			m_DynamicAgents[i]->Move() = m_DynamicAgents[i]->Velocity() * scast<f32>(Timer::ElapsedSeconds);
		}
		else
			m_DynamicAgents[i]->Move().Clear();
	}
	
	//--------------------------------------------------------------------------
	// Collision

	/// @todo When agent number is upper than max, we must split the list.
	DBG_ASSERT(m_DynamicAgents.size() <= MAXIMUM_WAIT_OBJECTS);

	if(MULTI_THREAD)
	{
		std::vector<CollisionThread> cThread;
		std::vector<HANDLE>          hThread;
		i32 agents = scast<i32>(m_DynamicAgents.size());
		cThread.resize(agents);
		hThread.resize(agents);
		loop(i, agents)
		{
			cThread[i].agent = m_DynamicAgents[i];
			cThread[i].Start();
			hThread[i] = cThread[i].m_Handle;
		}

		// Wait for all collision threads completion
		WaitForMultipleObjects(agents, &hThread[0], TRUE, INFINITE);
	}
	else
	{
		// check dynamic-static agents collision
		for(u32 i = 0; i < m_DynamicAgents.size(); i++)
			for(u32 j = 0; j < m_StaticAgents.size(); j++)
				CollisionInstance.Check(m_DynamicAgents[i], m_StaticAgents[j]);
	}

	// check dynamic-dynamic agents collision
	for(u32 i = 0; i < m_DynamicAgents.size() - 1; i++)
		for(u32 j = i + 1; j < m_DynamicAgents.size(); j++)
			CollisionInstance.Check(m_DynamicAgents[i], m_DynamicAgents[j]);

	//--------------------------------------------------------------------------
	// Update

	// update dynamic agents
	for(u32 i = 0; i < m_DynamicAgents.size(); i++)
	{
		// Check of object is in stable state
		if(1)//m_DynamicAgents[i]->IsCollide())
		{
			if(scast<Vector3XZ>(m_DynamicAgents[i]->Velocity()).SqrLength() < m_Epsilon)
			{
				if(m_DynamicAgents[i]->Velocity().y < m_Gravity.y)
				{
					m_DynamicAgents[i]->Velocity().Clear();
					m_DynamicAgents[i]->SetStable(TRUE);
				}
			}
		}

		// Apply resulting movement to position
		if(1)//m_DynamicAgents[i]->Move().SqrLength() > m_Epsilon)
		{
			m_DynamicAgents[i]->Position() += m_DynamicAgents[i]->Move();
			m_DynamicAgents[i]->SetStable(FALSE);
		}
	}
}

} // namespace noe