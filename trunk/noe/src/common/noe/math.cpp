/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Math helper function
 * @file           math.cpp
 * @package        noe
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

// noe
#include <noe/noe.h>
#include <noe/math.h>

//-----------------------------------------------------------------------------
//
// F U N C T I O N S
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
/**
 * General absolute value template.
 * @param          in                  Input value.
 * @return                             Absolute value.
 */
template<typename T> T Abs(const T &in)
{
	return (T > 0) T: -T;
}

//-----------------------------------------------------------------------------
/**
 * 8 bits signed integer optimized absolute function.
 * Get the absolute value of the input 'in'.
 * @param          in                  Input value.
 * @return                             Absolute value.
 */
template<> s8 Abs<s8>(const s8 &in)
{
    return ((in) ^ ( -(scast<u8>(in) >> 7))) + (scast<u8>(in) >> 7);
}

//-----------------------------------------------------------------------------
/**
 * 16 bits signed integer optimized absolute function.
 * Get the absolute value of the input 'in'.
 * @param          in                  Input value.
 * @return                             Absolute value.
 */
template<> s16 Abs<s16>(const s16 &in)
{
    return ((in) ^ ( -(scast<u16>(in) >> 15))) + (scast<u16>(in) >> 15);
}

//-----------------------------------------------------------------------------
/**
 * 32 bits signed integer optimized absolute function.
 * Get the absolute value of the input 'in'.
 * @param          in                  Input value.
 * @return                             Absolute value.
 */
template<> s32 Abs<s32>(const s32 &in)
{
    return ((in) ^ ( -(scast<u32>(in) >> 31))) + (scast<u32>(in) >> 31);
}

//-----------------------------------------------------------------------------
/**
 * 64 bits signed integer optimized absolute function.
 * Get the absolute value of the input 'in'.
 * @param          in                  Input value.
 * @return                             Absolute value.
 */
template<> s64 Abs<s64>(const s64 &in)
{
    return ((in) ^ ( -(scast<u64>(in) >> 63))) + (scast<u64>(in) >> 63);
}

//-----------------------------------------------------------------------------
/**
 * 32 bits floating point optimized absolute function.
 * Get the absolute value of the input 'in'.
 * @param          in                  Input value.
 * @return                             Absolute value.
 */
template<> f32 Abs<f32>(const f32 &in)
{
    u32 a = *rcast<const u32*>(&in) & 0x7FFFFFFF;
    return *rcast<f32*>(&a);
}

//-----------------------------------------------------------------------------
/**
 * 64 bits floating point optimized absolute function.
 * Get the absolute value of the input 'in'.
 * @param          in                  Input value.
 * @return                             Absolute value.
 */
template<> f64 Abs<f64>(const f64 &in)
{
    u64 a = *rcast<const u64*>(&in) & 0x7FFFFFFFFFFFFFFF;

    return *rcast<f64*>(&a);
}