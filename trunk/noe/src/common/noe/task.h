/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2008 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Task system
 * @file           task.h
 * @package        noe
 * @date           2008/06/29
 * @version        0.1
 * @author         Guillaume Blanchard
 */
#pragma once

// noe
#include <noe/noe.h>
#include <noe/singleton.h>

namespace noe
{

/**
 *
 */
class Task
{
public:

	union Flag
	{
		struct
		{
			u32 Pause : 1;
		};
		u32 Value;
	};

protected: // member variables
	
	Task* m_Child;
	Task* m_Sibiling;
	Flag  m_Flag;

public: // member methods

	Task(): m_Child(NULL), m_Sibiling(NULL) {}
	virtual ~Task() {}

	virtual void Initialize() = 0;
	virtual void Update() = 0;
	virtual void Release() = 0;

public:

	Task* GetChild() { return m_Child; }
	const Task* GetChild() const { return m_Child; }
	void SetChild(Task* task) { m_Child = task; }

	Task* GetSibiling() { return m_Sibiling; }
	const Task* GetSibiling() const { return m_Sibiling; }
	void SetSibiling(Task* task) { m_Sibiling = task; }

	void SetPause(BOOL b) { m_Flag.Pause = b ? 1 : 0; }
	BOOL IsPaused() const { return m_Flag.Pause == 1; }

	Task* GetLastChild()
	{
		if(m_Child == NULL)
			return NULL;

		Task* dest = m_Child;
		while(dest->m_Sibiling != NULL)
			dest = dest->m_Sibiling;
		return dest;
	}

	void AddChild(Task* task)
	{
		Task* last = GetLastChild();
		if(last == NULL)
			m_Child = task;
		else
			last->m_Sibiling = task;
	}
};

/**
 *
 */
class TaskRoot: public Task, public Singleton<TaskRoot>
{
protected:
	void UpdateTask(Task* task)
	{
		if(task->IsPaused())
			return;

		task->Update();
		
		Task* next = task->GetSibiling();
		while(next != NULL)
		{
			UpdateTask(next);
			next = next->GetSibiling();
		}

		if(task->GetChild() != NULL)
			UpdateTask(task->GetChild());
	}

public:
	void Initialize() {}
	void Update()
	{
		if(GetChild())
			UpdateTask(GetChild());
	}
	void Release() {}
};
#define ITaskRoot TaskRoot::Instance()


}; // Namespace noe.