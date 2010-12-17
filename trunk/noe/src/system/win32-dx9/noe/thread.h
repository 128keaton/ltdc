/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Thread manager
 * @file           thread.h
 * @package        noe
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

#pragma once

// win32
#include <windows.h>
#include <process.h>
// noe
#include <noe/noe.h>

namespace noe
{

// Set this define to 1 if runtime library is set to Multi-thread
#define MT_RUNTIME 1

//-----------------------------------------------------------------------------
/**
 * Critical Section class
 */
class CriticalSection
{
protected:

	CRITICAL_SECTION m_Section; ///< Critical section data

public:

	CriticalSection()  { InitializeCriticalSection(&m_Section); } ///< Create a critical section 
	~CriticalSection() { DeleteCriticalSection(&m_Section); }     ///< Destroy a critical section 
	void Lock()        { EnterCriticalSection(&m_Section); }      ///< Lock a critical section 
	void Unlock()      { LeaveCriticalSection(&m_Section); }      ///< Unlock a critical section 

};

//-----------------------------------------------------------------------------
/**
 * Thread class
 */
class Thread 
{
protected:

	// Win32 compatible thread parameter and procedure 
	u32    m_ID;     ///< Thread id
	HANDLE m_Handle; ///< Thread handle

	/// Thread entry point
#if(MT_RUNTIME)
	static unsigned int __stdcall EntryPoint(void* ptr) 
#else
	static unsigned long __stdcall EntryPoint(void* ptr) 
#endif
	{
		rcast<Thread*>(ptr)->Run();
#if(MT_RUNTIME)
		_endthreadex(0);
#endif
		return 0;
	}   

public:

	/// Thread priority enum
	enum PRIORITY
	{
		PRIORITY_ABOVE_NORMAL  = THREAD_PRIORITY_ABOVE_NORMAL,  // Priority 1 point above the priority class. 
		PRIORITY_BELOW_NORMAL  = THREAD_PRIORITY_BELOW_NORMAL,  // Priority 1 point below the priority class. 
		PRIORITY_HIGHEST       = THREAD_PRIORITY_HIGHEST,       // Priority 2 points above the priority class. 
		PRIORITY_IDLE          = THREAD_PRIORITY_IDLE,          // Base priority of 1 for IDLE_PRIORITY_CLASS, BELOW_NORMAL_PRIORITY_CLASS, NORMAL_PRIORITY_CLASS, ABOVE_NORMAL_PRIORITY_CLASS, or HIGH_PRIORITY_CLASS processes, and a base priority of 16 for REALTIME_PRIORITY_CLASS processes. 
		PRIORITY_LOWEST        = THREAD_PRIORITY_LOWEST,        // Priority 2 points below the priority class. 
		PRIORITY_NORMAL        = THREAD_PRIORITY_NORMAL,        // Normal priority for the priority class. 
		PRIORITY_TIME_CRITICAL = THREAD_PRIORITY_TIME_CRITICAL, // Base priority of 15 for IDLE_PRIORITY_CLASS, BELOW_NORMAL_PRIORITY_CLASS, NORMAL_PRIORITY_CLASS, ABOVE_NORMAL_PRIORITY_CLASS, or HIGH_PRIORITY_CLASS processes, and a base priority of 31 for REALTIME_PRIORITY_CLASS processes.
	};

	/// Thread class constructor
	Thread() : m_ID(0), m_Handle(NULL) {}

	/// Thread class destructor
	~Thread() { Stop(); }

	/// Run() function for class derived type thread
	virtual void Run() {}

	/**
	 * Start the thread.
	 * @retval         TRUE                Thread start successfuly
	 * @retval         FALSE               Thread start failed
	 */
	virtual BOOL Start() 
	{
#if(MT_RUNTIME)
		if(NULL == (m_Handle = rcast<HANDLE>(_beginthreadex(NULL, 0, EntryPoint, this, 0, rcast<unsigned int*>(&m_ID)))))
#else
		if(NULL == (m_Handle = ::CreateThread(NULL, 0, EntryPoint, this, 0, &m_ID)))
#endif
		{
			DBG_STOP("Probleme lors de la creation du thread.");
			return FALSE;
		}
		return TRUE;
	}

	/// Stop the thread
	virtual void Stop()
	{
		if(m_Handle != NULL)
		{
#if(MT_RUNTIME)
			//_endthreadex(0);
#else
			::TerminateThread(m_Handle, 0);
#endif
			::CloseHandle(m_Handle);
			m_Handle = NULL;
		}
	}

	/// Pause the thread execution
	virtual BOOL Pause() const
	{
		u32 count = ::SuspendThread(m_Handle);
		return (count == (u32)-1) ? FALSE : TRUE;
	}

	/// Resume the thread execution
	virtual BOOL Resume() const
	{
		u32 count = ::ResumeThread(m_Handle);
		return (count == (u32)-1) ? FALSE : TRUE;
	}

	/// Set the thread priority
	virtual BOOL SetPriority(i32 priority)
	{
		return ::SetThreadPriority(m_Handle, priority);
	}

	/// Get the thread priority
	virtual i32 GetPriority() const
	{
		return ::GetThreadPriority(m_Handle);
	}
};


}; // namespace noe