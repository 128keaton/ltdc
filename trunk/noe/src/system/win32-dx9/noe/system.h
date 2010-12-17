/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          System manager
 * @file           system.h
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
#include <noe/window.h>
#include <noe/scene.h>
#include <noe/camera.h>
// win32
#include <Windows.h>

namespace noe
{

//-----------------------------------------------------------------------------
/**
 * System class
 */
class System
{
public:

	static void DebugBreak();                         ///< Program break
	static void DebugMessage(const c8* msg);          ///< Debug message handler (ANSI)
	static void DebugMessage(const std::string msg);  ///< Debug message handler (ANSI)
	static void DebugMessage(const c16* msg);         ///< Debug message handler (Unicode)
	static void DebugMessage(const std::wstring msg); ///< Debug message handler (Unicode)
};

template<typename T> T GetTickCount();
template<> u32 GetTickCount<u32>();
template<> u64 GetTickCount<u64>();

template<typename T> T GetTickFreq();
template<> u32 GetTickFreq<u32>();
template<> u64 GetTickFreq<u64>();

//-----------------------------------------------------------------------------
/**
 * Timer class
 */
class Timer
{
public:

	static void Initialize()
	{
		Current  = GetTickCount<u64>();
		Previous = Current;
	}

	static void Update()
	{
		Current  = GetTickCount<u64>();
		Elapsed  = Current - Previous;
		ElapsedSeconds  = scast<f64>(Elapsed) / scast<f64>(GetTickFreq<u64>());
		Previous = Current;
	}

	static u64 Current;  // ticks
	static u64 Previous; // ticks
	static u64 Elapsed;  // ticks
	static f64 ElapsedSeconds;  // seconds

};


LRESULT CALLBACK WndProcedure(HWND hWnd, UINT Msg, WPARAM wParam, LPARAM lParam);

}; // Namespace noe.