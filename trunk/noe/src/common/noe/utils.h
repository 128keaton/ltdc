/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2008 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Utilitaries functions and macros
 * @file           utils.h
 * @package        noe
 * @date           2008/06/29
 * @version        0.1
 * @author         Guillaume Blanchard
 */
#pragma once

// noe
#include <noe/noe.h>

namespace noe
{

u32 Crc32(const c8* src, size_t size);
u32 Crc32(const c8* src);

}; // Namespace noe.