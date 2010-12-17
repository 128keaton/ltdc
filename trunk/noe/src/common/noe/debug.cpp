/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Debug functions
 * @file           debug.cpp
 * @package        noe
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

// std
#include <stdarg.h>
#include <string>
// noe
#include <noe/noe.h>
#include <noe/debug.h>
#include <noe/system.h>

namespace noe
{

// Only implement debug function when build profile is 'debug'.
#ifdef _DEBUG

//-----------------------------------------------------------------------------
// Global variables. 
/// @todo Encapsulate into a singleton class
const c8*  dbg_Func; ///< Last executed function name.
const c8*  dbg_File; ///< Last executed function's file name.
int        dbg_Line; ///< Last executed instruction line.
BOOL       dbg_Ret;  ///< Add a end-of-line at the end of debug message.
BOOL       dbg_Stop; ///< Stop the program execution. 
BOOL       dbg_Skip; ///< Skip the debug handling.

//-----------------------------------------------------------------------------
/**
 * Set debug variables.
 * @param	func		Last executed function name.
 * @param	file		Last executed function's file name.
 * @param	line		Last executed instruction line.
 * @param	ret			Add a end-of-line at the end of debug message.
 * @param	stop		Stop the program execution.
 */
void DebugSet(const c8* func, const c8* file, int line, BOOL ret, BOOL stop)
{
	dbg_Func  = func;
	dbg_File  = file;
	dbg_Line  = line;
	dbg_Ret   = ret;
	dbg_Stop  = stop;
	dbg_Skip  = FALSE;
}

//-----------------------------------------------------------------------------
/**
 * Assert a boolean expression.
 * @param	check		Boolean expression to be asserted.
 */
void DebugAssert(BOOL check)
{
	dbg_Skip = check;

	DebugPrint("Assert error!");
}

//-----------------------------------------------------------------------------
/**
 * Assert a boolean expression and print a ANSI message.
 * @param	check		Boolean expression to be asserted.
 * @param	format		Debug ANSI text to printed (followed by ellipsis)
 */
void DebugAssert(BOOL check, const c8* format, ...)
{
	dbg_Skip = check;
	
	va_list args;
	va_start(args, format);
	DebugPrint(format, args);
	va_end(args);
}

//-----------------------------------------------------------------------------
/**
 * Assert a boolean expression and print a Unicode message.
 * @param	check		Boolean expression to be asserted.
 * @param	format		Debug Unicode text to printed (followed by ellipsis)
 */
void DebugAssert(BOOL check, const c16* format, ...)
{
	dbg_Skip = check;
	
	va_list args;
	va_start(args, format);
	DebugPrint(format, args);
	va_end(args);
}

//-----------------------------------------------------------------------------
/**
 * Print a debug ANSI string.
 * @param	format		Debug ANSI text to display (followed by ellipsis)
 */
void DebugPrint(const c8* format, ...)
{
	if(!dbg_Skip)
	{
		if(dbg_Func || dbg_File || dbg_Line)
		{
			if(dbg_Func)
				printf("%s() ", dbg_Func);
			if(dbg_Func && dbg_File)
				printf("@ ");
			if(dbg_File)
			{
				c8* s = ccast<c8*>(strrchr(dbg_File, '\\'));
				if(s)
					s++;
				else
					s = ccast<c8*>(dbg_File);
				printf("\"%s\" ", s);
			}
			if(dbg_Line)
				printf("(%d)", dbg_Line);

			printf(": ");
		}

		va_list args;
		va_start(args, format);
		vprintf(format, args);
		va_end(args);
		
		if(dbg_Ret)
			printf("\n");

		if(dbg_Stop)
			System::DebugBreak(); 
	}
}

//-----------------------------------------------------------------------------
/**
 * Print a debug string.
 * @param	format		Debug Unicode text to display (followed by ellipsis)
 */
void DebugPrint(const c16* format, ...)
{
	if(!dbg_Skip)
	{
		if(dbg_Func || dbg_File || dbg_Line)
		{
			if(dbg_Func)
				printf("%s ", dbg_Func);
			if(dbg_Func && dbg_File)
				printf("@ ");
			if(dbg_File)
			{
				c8* s = ccast<c8*>(strrchr(dbg_File, '\\'));
				if(s)
					s++;
				else
					s = ccast<c8*>(dbg_File);
				printf("%s ", s);
			}
			if(dbg_Line)
				printf("(%d) ", dbg_Line);
			printf("\n>> ", dbg_Line);
		}

		va_list args;
		va_start(args, format);
		vwprintf(format, args);
		va_end(args);

		if(dbg_Ret)
			printf("\n");

		if(dbg_Stop)
			System::DebugBreak(); 
	}
}

#endif

}; // namespace noe
