/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          File handling
 * @file           file.cpp
 * @package        noe
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

// noe
#include <noe/noe.h>
#include <noe/file.h>

namespace noe
{

//-----------------------------------------------------------------------------
/**
 * Load a file (ANSI).
 * @param		filename		The file to load (ANSI).
 * @retval		TRUE			File successful loaded.
 * @retval		FALSE			Error while loading file.
 */
BOOL File::Load(const c8* filename) 
{ 
	DBG_PRINTL("noe.File.Load \"%s\"", filename);
	DBG_ASSERT(m_Data == NULL, "You must first unload the file!");

	FILE* file = NULL;
	errno_t err = fopen_s(&file, filename, "rb");
	if(err != 0 || !file)
	{
		DBG_STOP("Error loading \"%s\"", filename);
		return FALSE;
	}
	
	fseek(file, 0, SEEK_END);
	size = ftell(file);
	fseek(file, 0, SEEK_SET);

	m_Data = new u8[size];
	fread(m_Data, sizeof(u8), size, file);

	fclose(file);

	return TRUE; 
}

//-----------------------------------------------------------------------------
/**
 * Load a file (Unicode).
 * @param		filename		The file to load (Unicode).
 * @retval		TRUE			File successful loaded.
 * @retval		FALSE			Error while loading file.
 */
BOOL File::Load(const c16* filename) 
{ 
	DBG_PRINTL("noe.File.Load \"%s\"", filename);
	DBG_ASSERT(m_Data == NULL, "You must first unload the file!");

	FILE* file = NULL;
	errno_t err = _wfopen_s(&file, filename, L"rb");
	if(err != 0 || !file)
	{
		DBG_STOP("Error loading \"%s\"", filename);
		return FALSE;
	}
	
	fseek(file, 0, SEEK_END);
	size = ftell(file);
	fseek(file, 0, SEEK_SET);

	m_Data = new u8[size];
	fread(m_Data, sizeof(u8), size, file);

	fclose(file);

	return TRUE; 
}

//-----------------------------------------------------------------------------
/**
 * Unload the data if any was loaded.
 * @retval		TRUE			File successful loaded.
 * @retval		FALSE			Error while loading file.
 */
BOOL File::Unload() 
{ 
	if(m_Data)
	{
		delete m_Data;
		m_Data = NULL;
		size = 0;
		return TRUE;
	}
	return FALSE; 
}

} // namespace noe