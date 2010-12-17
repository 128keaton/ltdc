/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Singleton class.
 * @file           singleton.h
 * @package        noe
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

#pragma once

// boost
#include <boost/noncopyable.hpp>
// noe
#include <noe/noe.h>

namespace noe
{

/**
 * Singleton class.
 * Prevent copying using the Boost noncopyable base class.
 */
template<typename T> class Singleton: public boost::noncopyable
{
public:

	/**
	 * Get a reference to the singleton's instance.
	 * @return                             The singleton's instance reference.
	 */
	static T& Instance()
	{
		static T instance;
		return instance;
	}
};


} // namespace noe
