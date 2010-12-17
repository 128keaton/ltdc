/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Window manager
 * @file           window.cpp
 * @package        noe
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

// std
#include <stdio.h>
#include <fcntl.h>
#include <io.h>
#include <iostream>
#include <fstream>
// win32
#include <windows.h>
#include <winuser.h>
// dx9
#include <d3d9.h>
#include <d3dx9math.h>
// noe
#include <noe/system.h>
#include <noe/window.h>
#include <noe/scene.h>

#ifndef _USE_OLD_IOSTREAMS

	using namespace std;

#endif

// maximum mumber of lines the output console should have
static const WORD MAX_CONSOLE_LINES = 500;

namespace noe
{

/**
 * Window's destructor.
 * Release all created datas.
 */
Window::~Window()
{
	Release();
}

#ifdef _DEBUG // only for debug mode

/**
 * Create a IO console and attach it to current application
 * @param          out                 Redirect output stream to the console.
 * @param          in                  Redirect input stream to the console.
 * @param          err                 Redirect error stream to the console.
 */
void RedirectIOToConsole(BOOL out, BOOL in, BOOL err)
{
	int hConHandle;
	long lStdHandle;
	CONSOLE_SCREEN_BUFFER_INFO coninfo;
	FILE *fp;

	// allocate a console for this app
	AllocConsole();
	SetConsoleTitle("NOE Debug Console");

	// set the screen buffer to be big enough to let us scroll text
	GetConsoleScreenBufferInfo(GetStdHandle(STD_OUTPUT_HANDLE), &coninfo);
	coninfo.dwSize.Y = MAX_CONSOLE_LINES;
	SetConsoleScreenBufferSize(GetStdHandle(STD_OUTPUT_HANDLE), coninfo.dwSize);
	
	if(out)
	{
		// redirect unbuffered STDOUT to the console
		lStdHandle = (long)GetStdHandle(STD_OUTPUT_HANDLE);
		hConHandle = _open_osfhandle(lStdHandle, _O_TEXT);
		fp = _fdopen( hConHandle, "w" );
		*stdout = *fp;
		setvbuf( stdout, NULL, _IONBF, 0 );
	}

	if(in)
	{
		// redirect unbuffered STDIN to the console
		lStdHandle = (long)GetStdHandle(STD_INPUT_HANDLE);
		hConHandle = _open_osfhandle(lStdHandle, _O_TEXT);
		fp = _fdopen( hConHandle, "r" );
		*stdin = *fp;
		setvbuf( stdin, NULL, _IONBF, 0 );
	}

	if(err)
	{
		// redirect unbuffered STDERR to the console
		lStdHandle = (long)GetStdHandle(STD_ERROR_HANDLE);
		hConHandle = _open_osfhandle(lStdHandle, _O_TEXT);
		fp = _fdopen( hConHandle, "w" );
		*stderr = *fp;
		setvbuf( stderr, NULL, _IONBF, 0 );
	}

	// make cout, wcout, cin, wcin, wcerr, cerr, wclog and clog
	// point to console as well
	ios::sync_with_stdio();
}

#endif // _DEBUG

/**
 * Create the window.
 * @param          conf
 */
BOOL Window::Create(WindowConfig* conf)
{
	DBG_ASSERT(conf != NULL);

	m_Config = conf;

	m_Instance = GetModuleHandle(NULL);

	/// Register the window class.
	WNDCLASSEX wc;
	wc.cbSize        = sizeof(WNDCLASSEX);
	wc.style         = CS_HREDRAW|CS_VREDRAW|CS_OWNDC; //CS_CLASSDC;
	wc.lpfnWndProc   = WndProcedure;
	wc.cbClsExtra    = 0;
	wc.cbWndExtra    = sizeof(LONG);
	wc.hInstance     = m_Instance;
	wc.hIcon         = LoadIcon(NULL, IDI_ASTERISK);
	wc.hCursor       = LoadCursor(NULL, IDC_ARROW);
	wc.hbrBackground = NULL;
	wc.lpszMenuName  = NULL;
	wc.lpszClassName = NOE_REGISTER_CLASS;
	wc.hIconSm       = NULL;

	/// Register the window class
	if(!RegisterClassEx(&wc))		
	{
		DBG_STOP("Failed to register the window class.");
		return FALSE;			
	}

	/// Create the application's window.
	m_Handle = CreateWindow(
		NOE_REGISTER_CLASS, 
		conf->name, 
		WS_OVERLAPPEDWINDOW, 
		conf->position.x, 
		conf->position.y, 
		conf->size.x, 
		conf->size.y,
		GetDesktopWindow(), 
		NULL, 
		m_Instance, 
		NULL);

	/// Find out if the window was created
	if(!m_Handle)
	{
		Release();
		DBG_STOP("Window creation error.");
		return FALSE;	
	}

	/// Initialize rendering
	RenderInstance.Initialize();
	SceneInstance.Initialize();

	/// associate the windows with the current class
	SetLastError(0);
	SetWindowLongPtr(m_Handle, 0, rcast<LONG>(this));
	DWORD err = GetLastError();

	/// Check if we can get the device context
	if(!(m_DC = GetDC(m_Handle)))	
	{
		Release();
		DBG_STOP("Can't create a device tontext.");
		return FALSE;
	}

#ifdef _DEBUG
	RedirectIOToConsole(TRUE, FALSE, TRUE); // redirect the output and error message to the console
#endif // _DEBUG

	/// Display the window to the user
	ShowWindow(m_Handle, SW_SHOWNORMAL); // Show the window
	SetForegroundWindow(m_Handle);	// Slightly higher priority
	SetFocus(m_Handle); // Sets focus to the window
	UpdateWindow(m_Handle);

	Resize(conf->size.x, conf->size.y);

	DBG_PRINTL("noe.Window.Create");

	return TRUE;
}

/**
 * Window's release.
 * Release all created datas.
 */
void Window::Release()
{
	DBG_PRINTL("noe.Window.Release");

	// Detach the console
	#ifdef _DEBUG // only for debug mode
		FreeConsole();
	#endif

	if(m_Config->fullscreen)
	{
		ChangeDisplaySettings(NULL, 0);	// witch Back To Desktop
		ShowCursor(TRUE);			// Show Mouse Pointer
	}

	if(m_DC && !ReleaseDC(m_Handle, m_DC))
	{
		DBG_STOP("Release device context failed.");
		m_DC = NULL;
	}

	if(m_Handle && !DestroyWindow(m_Handle))
	{
		DBG_STOP("Could not release window.");
		m_Handle = NULL;
	}

	if(!UnregisterClass(NOE_REGISTER_CLASS, m_Instance))
	{
		DBG_STOP("Could Not Unregister Class.");
		m_Instance = NULL;
	}
}

/**
 * Render the window.
 */
void Window::Render()
{
	SceneInstance.Render();
}

/**
 * Resize the window.
 */
void Window::Resize(int width, int height)
{
   if(height==0) /// Prevent a divide by zero
		height++;

	m_Config->size.Set(width, height);

	SceneInstance.Resize(width, height);
}

/**
 *
 */
BOOL Window::Process()
{
	MSG msg;

	// Is there a message waiting?
	if (PeekMessage(&msg, NULL, 0, 0, PM_REMOVE))
	{
		// Have we received a quit message?
		if(msg.message==WM_QUIT)
		{
			Release();
			return FALSE;
		}
		else	// If not, deal with window messages
		{
			TranslateMessage(&msg);	// Translate the message
			DispatchMessage(&msg);	// Dispatch the message
		}
	}
	else	// If there are no messages
	{
	}
	Render(); // Draw The Scene.

	return TRUE;
}

}; // namespace noe