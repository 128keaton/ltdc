/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          TGA file handling
 * @file           tga.h
 * @package        noe
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

#pragma once

// noe
#include <noe/noe.h>
#include <noe/data.h>
#include <noe/texture.h>

namespace noe
{

/// TGA texture file header format.
struct TGA_Header
{
   u8  Offset;       // Usually 0.
   u8  ColorType;    // Image type. 0 = RGB, 1 = Indexed.
   u8  ImageType;    // 0 = None, 1 = Indexed, 2 = RGB, 3 = Greyscale, +8 = RLE encoded.
   u16 PaletteStart; // Start of palette.
   u16 PaletteLen;   // Number of palette entries.
   u8  PalBits;      // Bits per colour entry.
   u16 OriginX;      // Image X origin.
   u16 OriginY;      // Image Y origin.
   u16 Width;        // Image width (Pixels).
   u16 Height;       // Image height (Pixels).
   u8  BPP;          // Bits per pixel (8,16,24 or 32).
   u8  Orientation;  //  If Bit 5 is set, the image will be upside down (like BMP).
};

/**
 * TGA texture class.
 * @deprecated
 */
class TextureTGA: public Texture
{
protected:

	u32 type; ///< Type.

public:

	/// Default constructor.
	TextureTGA() {}
	/// Default destructor.
	~TextureTGA() {}

	/// Load TGA texture. @bug Not implemented!
	virtual BOOL Load(const Data*) 
	{
		//TGA_Header *head = (TGA_Header *)data->Pointer();
		return TRUE;
	}
	/// Save TGA texture. @bug Not implemented!
	virtual BOOL Save() { return FALSE; }
};

}; // namespace noe