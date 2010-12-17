/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2008 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Utilitaries functions and macros
 * @file           utils.cpp
 * @package        noe
 * @date           2008/06/29
 * @version        0.1
 * @author         Guillaume Blanchard
 */

// noe
#include <noe/utils.h>
#include <noe/debug.h>
#include <noe/window.h>

namespace noe
{


/**
 * 32 bits CRC generator function
 * @param	src		Name of the source to be convert
 * @param	size	Length of the source to be convert
 * @return			The converted unisgined 32 bits CRC value
 */
u32 Crc32(const c8* src, size_t size)
{	
	u32 r = 0xFFFFFFFF;
	for(std::size_t i = 0; i < size; i++) 
	{
		r ^= (u32)(src[i] << (32 - 8));
		for(int j = 0; j < 8; j++) 
		{
			if(r & 0x80000000) 
				r = (r << 1) ^ 0x04C11DB7;
			else 
				r <<= 1;
		}
	}
	return r ^ 0xFFFFFFFF;
}


/**
 * 32 bits CRC generator function
 * @param	src		Name of the source to be convert
 * @return			The converted unisgined 32 bits CRC value
 */
u32 Crc32(const c8* src)
{
	std::size_t size = strlen( src);
	return Crc32(src, size);
}


}; // Namespace noe.