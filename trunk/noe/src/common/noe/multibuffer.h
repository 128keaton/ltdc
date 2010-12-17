/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Multi-buffer class
 * @file           multibuffer.h
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
//
// MULTI-BUFFER
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
/// Multi-buffer index class.
class MultiBufferIndex { protected: static i32 m_Index; };

//-----------------------------------------------------------------------------
/**
 * Multi-buffer class.
 * @param          T                   Typename of the buffer.
 * @param          N                   Number of buffers.
 */
template<typename T, i32 N> class MultiBuffer: public MultiBufferIndex
{
protected:

	T m_Buffers[N]; ///< The multi-buffer data.

public:

	/// Flip the counter.
	static void Flip() { m_Index++; m_Index %= N; }

	/**
	 * Get the n-th buffer data.
	 * @param          n                   The buffer number.
	 * @return                             Reference to the n-th buffer data.
	 */
	T& Get(i32 n) { return m_Buffers[(m_Index + n) % N]; }

	/**
	 * Get the n-th buffer data.
	 * @param          n                   The buffer number.
	 * @return                             Reference to the n-th buffer data.
	 */
	const T& Get(i32 n) const { return m_Buffers[(m_Index + n) % N]; }
};


//-----------------------------------------------------------------------------
//
// DOUBLE-BUFFER
//
//-----------------------------------------------------------------------------

enum { UPDATE, RENDER };

//-----------------------------------------------------------------------------
/**
 * Double-buffer class (optimization).
 * @param          T                   Typename of the buffer.
 */
template<typename T> class DoubleBuffer: public MultiBuffer<T, 2>
{
public:

	/// Optimized version of MultiBuffer::Flip() function.
	//static void Flip() { m_Index = 1 - m_Index; }                         

	/**
	 * Get the n-th buffer data.
	 * @param          n                   The buffer number.
	 * @return                             Reference to the n-th buffer data.
	 */
	inline T& Get(i32 n) { return m_Buffers[(m_Index + n) & 0x1]; }

	/**
	 * Get the n-th buffer data.
	 * @param          n                   The buffer number.
	 * @return                             Reference to the n-th buffer data.
	 */
	inline const T& Get(i32 n) const { return m_Buffers[(m_Index + n) & 0x1]; }

	/**
	 * Get the 'update' buffer data.
	 * @return                             Reference to the 'update' buffer data.
	 */
	inline T& GetUpdate() { return m_Buffers[m_Index]; }

	/**
	 * Get the 'update' buffer data.
	 * @return                             Reference to the 'update' buffer data.
	 */
	inline const T& GetUpdate() const { return m_Buffers[m_Index]; }

	/**
	 * Get the 'render' buffer data.
	 * @return                             Reference to the 'render' buffer data.
	 */
	inline T& GetRender() { return m_Buffers[(m_Index + 1) & 0x1]; }             ///< Get 'render' data.

	/**
	 * Get the 'render' buffer data.
	 * @return                             Reference to the 'render' buffer data.
	 */
	inline const T& GetRender() const { return m_Buffers[(m_Index + 1) & 0x1]; } ///< Get 'render' data.

	/**
	 * Get the n-th buffer data.
	 * Template function to get ether 'update' or 'render' data.
	 * @return                             Reference to the n-th buffer data.
	 */
	template<int N> T& Get()
	{
		if(N == UPDATE)
			return m_Buffers[m_Index];
		else // if(N == RENDER)
			return m_Buffers[(m_Index + 1) & 0x1];
	}

	/**
	 * Get the n-th buffer data.
	 * Template function to get ether 'update' or 'render' data.
	 * @return                             Reference to the n-th buffer data.
	 */
	template<int N> const T& Get() const
	{
		if(N == UPDATE)
			return m_Buffers[m_Index];
		else // if(N == RENDER)
			return m_Buffers[(m_Index + 1) & 0x1];
	}

	/// Copy 'render' data to 'update' buffer
	inline void RenderToUpdate() { memcpy(&GetUpdate(), &GetRender(), sizeof(T)); }

	/// Copy 'update' data to 'render' buffer
	inline void UpdateToRender() { memcpy(&GetRender(), &GetUpdate(), sizeof(T)); }
};

//-----------------------------------------------------------------------------
/// Double-buffer index class.
class DoubleBufferIndex: public MultiBufferIndex
{
public:

	/// Flip the double-buffer index value.
	static void Flip() { m_Index = 1 - m_Index; }
};

} // namespace noe