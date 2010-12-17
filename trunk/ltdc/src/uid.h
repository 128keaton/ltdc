/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Unique-ID header
 * @file           uid.h
 * @package        gos
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

#pragma once

enum UID
{
	UID_PLAYER  = 0x20000000, // ... 0x200000FF
	
	UID_BALL    = 0x80000000,
	UID_FIELD   = 0x80000001,
	
	UID_INVALID = 0xFFFFFFFF,
};