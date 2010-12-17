/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Effect base class
 * @file           effect.h
 * @package        noe.effect
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

#pragma once

// noe
#include <noe/noe.h>
#include <noe/render.h>
#include <noe/model.h>

namespace noe
{

/**
 * Material effect base class
 */
class Effect
{
public:
	/// Draw the effect for the given material-group
	virtual void Draw(DrawContext* context, const MaterialGroup* group) = 0;
};

} // namespace noe
