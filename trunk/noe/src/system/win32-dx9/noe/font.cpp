/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Font manager
 * @file           font.cpp
 * @package        noe
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

// noe
#include <noe/noe.h>
#include <noe/font.h>

namespace noe
{

//-----------------------------------------------------------------------------
/**
 * Constructor (ANSI)
 * @param	name		[in] Font name.
 * @param	size		[in] Font size (in pixel).
 * @param	size		[in] Font flag. @see Font::FLAGS
 */
Font::Font(const c8* name, u32 size, u32 flag/*=0*/) : m_Interface(NULL)
{
	// Create a font using the DirectX interface
	D3DXCreateFontA(
		RenderDevice, 
		size, 
		0, 
		(flag & WEIGHT_MASK) == THIN ? FW_THIN : (flag & WEIGHT_MASK) == BOLD ? FW_BOLD : FW_NORMAL,
		0, 
		flag & ITALIC, 
		DEFAULT_CHARSET, 
		OUT_DEFAULT_PRECIS, 
		DEFAULT_QUALITY, 
		DEFAULT_PITCH | FF_DONTCARE, 
		name, 
		&m_Interface);
}

//-----------------------------------------------------------------------------
/**
 * Constructor (Unicode)
 * @param	name		[in] Font name.
 * @param	size		[in] Font size (in pixel).
 * @param	size		[in] Font flag. @see Font::FLAGS
 */
Font::Font(const c16* name, u32 size, u32 flag/*=0*/) : m_Interface(NULL)
{
	// Create a font using the DirectX interface
	D3DXCreateFontW(
		RenderDevice, 
		size, 
		0, 
		(flag & WEIGHT_MASK) == THIN ? FW_THIN : (flag & WEIGHT_MASK) == BOLD ? FW_BOLD : FW_NORMAL,
		0, 
		flag & ITALIC, 
		DEFAULT_CHARSET, 
		OUT_DEFAULT_PRECIS, 
		DEFAULT_QUALITY, 
		DEFAULT_PITCH | FF_DONTCARE, 
		name, 
		&m_Interface);
}

//-----------------------------------------------------------------------------
/**
 * Destructor
 */
Font::~Font()
{
	m_Interface->Release(); // Release the Direct font interface
}

//-----------------------------------------------------------------------------
/**
 * Add a draw request.
 * @param	text		[in] Text to draw.
 * @param	x        [in] X position of the left side of the text.
 * @param	y        [in] Y position of the upper side of the text.
 * @param	color    [in] Text color.
 */
void Font::Print(const c8* text, s16 x, s16 y, u32 color)
{
	Display info;
	info.text  = text;
	info.x     = x;
	info.y     = y;
	info.color = color;

	m_List.GetUpdate().push_back(info);
	//m_List.push_back(info);
}

//-----------------------------------------------------------------------------
/**
 * Clear the string draw request list.
 */
void Font::Clear() 
{
	m_List.GetUpdate().clear(); 
	//m_List.clear();
}

//-----------------------------------------------------------------------------
/**
 * Draw a text on the screnn
 * @deprecated     Not yet updated to multi-thread rendering (use noe::Font::Print instead).
 * @param          info                Information about the text to draw. @see Font::Display.
 */
void Font::Draw(const Display& info)
{
	DBG_ASSERT(m_Interface != NULL);

	// Create a rectangle to indicate where on the screen it should be drawn
	RECT rct;
	rct.left   = info.x;
	rct.right  = 640;
	rct.top    = info.y;
	rct.bottom = 480;

	// Draw some text
	m_Interface->DrawText(NULL, info.text, -1, &rct, 0, info.color);
}

//-----------------------------------------------------------------------------
/**
 * Draw all text into the list. [RENDER]
 * @param	context		<i>Ignored.</i>
 */
void Font::Draw(DrawContext* context)
{
	loop(i, scast<i32>(m_List.GetRender().size()))
		Draw(m_List.GetRender()[i]);
}

//-----------------------------------------------------------------------------
/**
 *	Syncrhonize double-buffered data.
 */
void Font::Synchronize() 
{ 
	m_List.GetRender() = m_List.GetUpdate();
}

} // namespace noe
