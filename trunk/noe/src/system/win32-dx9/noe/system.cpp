/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          System manager
 * @file           system.cpp
 * @package        noe
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

// win32
#include <windows.h>
#include <winuser.h>
// noe
#include <noe/noe.h>
#include <noe/thread.h>
#include <noe/window.h>
#include <noe/system.h>
#include <noe/multibuffer.h>

/// Application entry point
extern void Start(i8 argc=0, c8** argv=NULL);

/// Initialze the 
i32 noe::MultiBufferIndex::m_Index = 0;

//-----------------------------------------------------------------------------
/**
 * Programme entry point.
 */
INT WINAPI WinMain(HINSTANCE hInst, HINSTANCE, LPSTR, INT)
{
	Start();

	return 1;
}

namespace noe
{

//-----------------------------------------------------------------------------
/// Break the program
void System::DebugBreak()
{
	::DebugBreak();
}

//-----------------------------------------------------------------------------
/// Display a debug message (ANSI)
void System::DebugMessage(const c8* msg)
{
	::MessageBoxA(NULL, msg, "NOE Library", MB_OK|MB_ICONEXCLAMATION);
}

//-----------------------------------------------------------------------------
/// Display a debug message (ANSI)
void System::DebugMessage(const std::string msg)
{
	::MessageBoxA(NULL, msg.c_str(), "NOE Library", MB_OK|MB_ICONEXCLAMATION);
}

//-----------------------------------------------------------------------------
/// Display a debug message (Unicode)
void System::DebugMessage(const c16* msg)
{
	::MessageBoxW(NULL, msg, L"NOE Library", MB_OK|MB_ICONEXCLAMATION);
}

//-----------------------------------------------------------------------------
/// Display a debug message (Unicode)
void System::DebugMessage(const std::wstring msg)
{
	::MessageBoxW(NULL, msg.c_str(), L"NOE Library", MB_OK|MB_ICONEXCLAMATION);
}

u64 Timer::Current  = 0;
u64 Timer::Previous = 0;
u64 Timer::Elapsed  = 0;
f64 Timer::ElapsedSeconds = 0.0f;

#define CHAR_BUFFER_MAX 128
c8   g_CharBuffer[CHAR_BUFFER_MAX];
u32  g_CharNumber = 0;

//-----------------------------------------------------------------------------
/**
 *
 */
LRESULT CALLBACK WndProcedure(HWND hWnd, UINT Msg, WPARAM wParam, LPARAM lParam)
{						
	Window *win = rcast<Window*>(GetWindowLongPtr(hWnd, 0));

	switch(Msg)
	{
		/// If the user wants to close the application
		case WM_DESTROY:
		{
			/// then close it
			RenderInstance.Wait(TRUE); // Wait for rendering thread
			RenderInstance.Stop();
			PostQuitMessage(0);
			return 0;
		}

      case WM_PAINT:
		{
         //win->Render();
         ValidateRect(hWnd, NULL);
         return 0;
		}
		
		/// Resize The Direct3D Window
		case WM_SIZE:
		{
 			// LoWord=Width, HiWord=Height
			win->Resize(LOWORD(lParam), HIWORD(lParam));
			return 0;
		}

		case WM_SYSCOMMAND:				// Intercept system commands
		{
			switch(wParam)					// Check system calls
			{
				case SC_SCREENSAVE:		// Screensaver Trying To Start?
				case SC_MONITORPOWER:	// Monitor Trying To Enter Powersave?
					return 0;				// Prevent From Happening
			}
			break;
		}

      case WM_CHAR:
      {
         if(g_CharNumber < (CHAR_BUFFER_MAX- 1))
				g_CharBuffer[g_CharNumber++] = (c8)wParam;
         break;
      }
/*
		case WM_KEYDOWN:				// A key being held down
		{
			win->keys[wParam] = TRUE;
			return 0;
		}

		case WM_KEYUP:		// A key been released
		{
			win->keys[wParam] = FALSE;
			return 0;			
		}	
*/
	}

	/// Process the left-over messages
	return DefWindowProc(hWnd, Msg, wParam, lParam);;
}

// Dummy.
template<typename T> T GetTickCount() { return 0; }

//-----------------------------------------------------------------------------
/**
 *
 */
template<> u32 GetTickCount<u32>()
{
	return ::GetTickCount();
}

//-----------------------------------------------------------------------------
/**
 *
 */
template<> u64 GetTickCount<u64>()
{
	LARGE_INTEGER ret;
	::QueryPerformanceCounter(&ret);
	return ret.QuadPart;
}

// Dummy.
template<typename T> T GetTickFreq() { return 0; }

//-----------------------------------------------------------------------------
/**
 *
 */
template<> u32 GetTickFreq<u32>()
{
	return 1000;
}

//-----------------------------------------------------------------------------
/**
 *
 */
template<> u64 GetTickFreq<u64>()
{
	LARGE_INTEGER ret;
	::QueryPerformanceFrequency(&ret);
	return ret.QuadPart;
}

} // namespace noe.