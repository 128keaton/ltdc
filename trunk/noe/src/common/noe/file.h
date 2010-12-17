/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          File handling
 * @file           file.h
 * @package        noe
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

#pragma once

// std
#include <stdio.h>
// noe
#include <noe/noe.h>
#include <noe/data.h>

namespace noe
{

//-----------------------------------------------------------------------------
/**
 * Basic file class.
 */
class File: public Data
{
protected:

	s32 size; ///< Size of the loaded file

public:

	/// Default constructor.
	File(): size(0) {}
	/// Constructor. @param filename The file to load (ANSI).
	File(c8* filename) { Load(filename); }
	/// Constructor. @param filename The file to load (Unicode).
	File(c16* filename) { Load(filename); }	
	/// Destructor. Unload the data if any was loaded.
	~File() { Unload(); }

	/// Load a file (ANSI).
	virtual BOOL Load(const c8* filename);
	/// Load a file (Unicode).
	virtual BOOL Load(const c16* filename);
	/// Unload a file.
	virtual BOOL Unload();

	/// Get the file size. @return File size.
	virtual u32 Size() const { return size; }
};

	
//-----------------------------------------------------------------------------
/**
 * Basic file template class.
 */
template<typename T> class FileT: public DataT<T>
{
protected:

	s32 size; ///< Size of the loaded file

public:

	/// Default constructor.
	FileT(): size(0) {}
	/// Constructor. @param filename The file to load (ANSI).
	FileT(c8* filename) { Load(filename); }
	/// Constructor. @param filename The file to load (Unicode).
	FileT(c16* filename) { Load(filename); }	
	/// Destructor. Unload the data if any was loaded.
	/// Destructor. Unload the data if any was loaded.
	~FileT() { Unload(); }

	/// Load a file (ANSI).
	virtual BOOL Load(const c8* filename);
	/// Load a file (Unicode).
	virtual BOOL Load(const c16* filename);
	/// Unload a file.
	virtual BOOL Unload();

	/// Get the file size. @return File size.
	virtual u32 Size() const { return size; }
};

//-----------------------------------------------------------------------------
/**
 * Load a file (ANSI).
 * @param		filename		The file to load (ANSI).
 * @retval		TRUE			File successful loaded.
 * @retval		FALSE			Error while loading file.
 */
template<typename T> BOOL FileT<T>::Load(const c8* filename) 
{ 
	DBG_PRINTL("noe.File.Load \"%s\"", filename);
	DBG_ASSERT(data == NULL, "You must first unload the file!");

	FILE* file = fopen(filename, "rb");
	if(!file)
		return FALSE;
	
	fseek(file, 0, SEEK_END);
	size = ftell(file);
	fseek(file, 0, SEEK_SET);

	u32 count = size/sizeof(T);
	data = new T[count];
	fread(data, sizeof(T), count, file);

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
template<typename T> BOOL FileT<T>::Load(const c16* filename) 
{ 
	DBG_PRINTL("noe.File.Load \"%s\"", filename);
	DBG_ASSERT(data == NULL, "You must first unload the file!");

	FILE* file = _wfopen(filename, "rb");
	if(!file)
		return FALSE;
	
	fseek(file, 0, SEEK_END);
	size = ftell(file);
	fseek(file, 0, SEEK_SET);

	u32 count = size/sizeof(T);
	data = new T[count];
	fread(data, sizeof(T), count, file);

	fclose(file);

	return TRUE; 
}

//-----------------------------------------------------------------------------
/**
 * Unload the data if any was loaded.
 * @retval		TRUE			File successful loaded.
 * @retval		FALSE			Error while loading file.
 */
template<typename T> BOOL FileT<T>::Unload() 
{ 
	if(data)
	{
		delete data;
		data = NULL;
		size = 0;
		return TRUE;
	}
	return FALSE; 
}

}; // namespace noe