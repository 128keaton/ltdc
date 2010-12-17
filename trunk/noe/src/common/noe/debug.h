/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Debug functions
 * @file           debug.h
 * @package        noe
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

#pragma once

// std
#include <stdio.h>
#include <assert.h>

namespace noe
{

//-----------------------------------------------------------------------------
// Only implement debug function when build profile is 'debug'.
#ifdef _DEBUG

	/// Set debug variables.
	void DebugSet(const c8* func, const c8* file, int line, BOOL ret, BOOL stop);
	/// Assert a boolean expression.
	void DebugAssert(BOOL check);
	/// Assert a boolean expression and print a ANSI message.
	void DebugAssert(BOOL check, const c8* format, ...);
	/// Assert a boolean expression and print a Unicode message.
	void DebugAssert(BOOL check, const c16* format, ...);
	/// Print a debug ANSI string.
	void DebugPrint(const c8* format, ...);
	/// Print a debug Unicode string.
	void DebugPrint(const c16* format, ...);

	/// STOP macro. Print a debug message and stop the program execution.
	#define DBG_STOP           noe::DebugSet(__FUNCTION__, __FILE__, __LINE__, TRUE,  TRUE),  noe::DebugPrint
	/// ASSERT macro. If boolean expression is FALSE then print a debug message and stop the program execution.
	#define DBG_ASSERT         noe::DebugSet(__FUNCTION__, __FILE__, __LINE__, TRUE,  TRUE),  noe::DebugAssert
	/// WARNING macro. If boolean expression is FALSE then print a debug message.
	#define DBG_WARNING        noe::DebugSet(NULL,         NULL,     0,        TRUE,  FALSE), noe::DebugAssert
	/// PRINT macro. Print a debug message.
	#define DBG_PRINT          noe::DebugSet(NULL,         NULL,     0,        FALSE, FALSE), noe::DebugPrint
	/// PRINTL macro. Print a debug message.
	#define DBG_PRINTL         noe::DebugSet(NULL,         NULL,     0,        TRUE,  FALSE), noe::DebugPrint
	/// CODE macro. Execute this code only while in 'debug' mode.
	#define DBG_CODE(_CODES)   _CODES
	/// BLOCK macro. Execute the code into this block only while in 'debug' mode.
	#define DBG_BLOCK()        if(1)
	/// BREAK macro. Stop the program execution.
	#define DBG_BREAK()        noe::System::DebugBreak()

//-----------------------------------------------------------------------------
// @warning In 'release' mode, all the code contained into the macros are removed!
#else

	#define DBG_STOP(...)
	#define DBG_ASSERT(...)
	#define DBG_WARNING(...)
	#define DBG_PRINT(...)
	#define DBG_PRINTL(...)
	#define DBG_CODE(...)
	#define DBG_BLOCK()        if(0)
	#define DBG_BREAK()

#endif

}; // namespace noe
