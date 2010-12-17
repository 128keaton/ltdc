/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Debug functions
 * @file           debug.h
 * @package        noe
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

#pragma once

// noe
#include <noe/noe.h>

namespace noe
{

//-----------------------------------------------------------------------------
/**
 * Base template data class.
 */
template<typename T/* = u8*/> class DataT
{
	protected:
	
		T* m_Data; ///< Pointer to data buffer in memory.

	public:

		/// Default constructor.
		DataT() : m_Data(NULL) {}

		/**
		 * Get the data buffer pointer.
		 * @return The data buffer pointer
		 */
		virtual T* Pointer() const { return m_Data; }

		/**
		 * Get the data buffer size.
		 * Pure-virtual function
		 * @return The data buffer size
		 */
		virtual u32 Size() const = 0;
};

//-----------------------------------------------------------------------------
/**
 * Base data class.
 */
class Data: public DataT<u8>
{
	public:

		/// Default constructor.
		Data() : DataT<u8>() {}

		/**
		 * Get the data buffer size.
		 * Pure-virtual function
		 * @return The data buffer size
		 */
		virtual u32 Size() const = 0;
};

}; // namespace noe