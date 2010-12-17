/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Window configuration
 * @file           window_config.h
 * @package        noe
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

#pragma once

// noe
#include <noe/math.h>

namespace noe
{

//-----------------------------------------------------------------------------
/**
 * Window's configuration class. ウィンドウコンフィグレーションクラス
 */
struct WindowConfig
{
	TVector2<u16>  position;     ///< Window's position (in pixels).
	TVector2<u16>  size;         ///< Window's size (in pixels).
	const c8*      name;         ///< Window's name.
	i8             argc;         ///< Command line's arguments number.
	c8**           argv;         ///< Command line's arguments strings.
	BOOL           fullscreen;   ///< Fullscreen toggle.
	i8             frame_buffer; ///< Frame-buffer bits
	i8             z_buffer;     ///< Z-buffer bits
	i8             multi_sample; ///< Multi-sample value (1, 2, 4)
	BOOL           sync;         ///< Synchronize with refresh rate

	/// Initializer list default constructor.
	WindowConfig(): 
		position(100, 100), 
		size(200, 200), 
		name("NOE Library"), 
		argc(0), 
		argv(NULL), 
		fullscreen(FALSE), 
		frame_buffer(32),
		z_buffer(16),
		multi_sample(1),
		sync(TRUE) {}
};

} // namespace noe