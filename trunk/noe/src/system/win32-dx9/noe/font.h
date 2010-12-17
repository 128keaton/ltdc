/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Font manager
 * @file           font.h
 * @package        noe
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

#pragma once

// std
#include <vector>
// dx9
#include <d3d9.h>
#include <d3dx9core.h>
// noe
#include <noe/noe.h>
#include <noe/debug.h>
#include <noe/render.h>

namespace noe
{

//-----------------------------------------------------------------------------
/**
 * Font handling class.
 */
class Font: public DrawProc
{
public:

	/// Font property enumeration
	enum FLAGS
	{
		THIN        = 0x0001,
		NORMAL      = 0x0002,
		BOLD        = 0x0003,
		WEIGHT_MASK = 0x0003,
		ITALIC      = 0x0004,
	};

	/// Display information structure
	struct Display
	{
		const c8* text;
		s16 x;
		s16 y;
		u32 color;
	};

	// Constructor (ANSI)
	Font(const c8* name, u32 size, u32 flag = 0);

	// Constructor (Unicode)
	Font(const c16* name, u32 size, u32 flag = 0);

	// Destructor
	~Font();

	// Add a draw request
	void Print(const c8* text, s16 x, s16 y, u32 color);

	// Clear the string list
	void Clear();

	// Draw a string
	void Draw(const Display& info);

	// DrawProc process function [RENDER]
	void Draw(DrawContext*);

	// Syncrhonize double-buffered data
	void Synchronize();

	/// Get default font
	static Font& Default()
	{
		static Font DefaultFont("Arial", 20);
		return DefaultFont;
	}

protected:

	 ID3DXFont*                           m_Interface; ///< DirectX font interface.
	 DoubleBuffer< std::vector<Display> > m_List;      ///< Double-buffered list of print request.
};

}; // namespace noe