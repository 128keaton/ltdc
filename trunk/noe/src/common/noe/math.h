/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Math helper function
 * @file           math.h
 * @package        noe
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

#pragma once

// std
#include <stdlib.h>
#include <limits>
// noe
#include <noe/noe.h>

namespace noe
{

//-----------------------------------------------------------------------------
// Global constant values

const f32 PI_32BITS = 3.14159265358979323846f;
const f64 PI_64BITS = 3.1415926535897932384626433832795l;
const f32 PI        = PI_32BITS;
const f32 PIx2      = 2.0f*PI;
const f32 PIx4      = 4.0f*PI;
const f32 PIx3_4    = PI*0.75f;
const f32 PIx3_2    = PI*1.5f;
const f32 PI_2      = PI*0.5f;
const f32 DIV_PI    = 1.0f/PI;

const f32 E         = 2.71828182845904523536f;
const f32 LOG2E     = 1.44269504088896340736f;
const f32 LOG10E    = 0.434294481903251827651f;
const f32 LN2       = 0.693147180559945309417f;
const f32 LN10      = 2.30258509299404568402f;

const f32 DIV_255   = 1.0f / 255.0f;
const f32 DIV_256   = 1.0f / 256.0f;
const f32 DIV_128   = 1.0f / 128.0f;
const f32 DIV_100   = 1.0f / 100.0f;

// 3D constants
const f32 DEGREES_TO_RADIANS = PI/360.0f;
const f32 RADIANS_TO_DEGREES = 360.0f/PI;

//-----------------------------------------------------------------------------
//
// INLINE FUNCTION
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
/**
 * Quick absolute value.
 * Get the absolute value of the input 'in'.
 * @param          in                  Input value.
 * @return                             Absolute value.
 */
inline f32 Abs(f32 in)
{
    int a = *(u32*)&in & 0x7FFFFFFF;
    return *(f32*)&a;
}

//-----------------------------------------------------------------------------
/**
 * Quick absolute value.
 * Get the absolute value of the input 'in'.
 * @param          in                  Input value.
 * @return                             Absolute value.
 */
inline s32 Abs(s32 in)
{
    return ((in) ^ (-((s32)in >> 31))) + ((s32)in >> 31);
}

//-----------------------------------------------------------------------------
/**
 * Return a random integer value between 0 and max-1.
 * @param          max                 Upper limit.
 * @return                             Random integer.
 */
inline s32 Random(s32 max) 
{ 
    return((s32)(max * ((f32)rand() / RAND_MAX))); 
}

//-----------------------------------------------------------------------------
/**
 * Return a random integer value between min and max-1
 * @param          min                 Lower limit.
 * @param          max                 Upper limit.
 * @return                             Random integer.
 */
inline s32 Random(s32 min, s32 max) 
{ 
    return((s32)(min + (max - min) * ((f32)rand() / RAND_MAX))); 
}

//-----------------------------------------------------------------------------
/**
 * Return a random float value between 0.0f and max
 * @param          max                 Upper limit.
 * @return                             Random float.
*/
inline f32 Random(f32 max) 
{ 
    return(max * ((f32)rand() / RAND_MAX)); 
}

//-----------------------------------------------------------------------------
/**
 * Return a random float value between min and max
 * @param          min                 Lower limit.
 * @param          max                 Upper limit.
 * @return                             Random float.
 */
inline f32 Random(f32 min, f32 max) 
{ 
    return(min + (max - min) * ((f32)rand() / RAND_MAX)); 
}

//-----------------------------------------------------------------------------
/**
 * Return a random float value between 0.0f and 1.0f
 * @return                             Random float.
 */
inline f32 Random(void) 
{ 
    return((f32)rand() / RAND_MAX); 
}


//-----------------------------------------------------------------------------
//
// TEMPLATE FUNCTION
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
/**
 * Get the squared value.
 * @return                             Squared value.
 */
template <typename T> T Square(T x) 
{ 
	return x*x; 
}

//-----------------------------------------------------------------------------
/**
 * Random.
 * Return a random value between 0 and 1.
 * @return                             Randomized value.
 */
template <typename T> T Random() 
{ 
	return scast<T>(rand()) / scast<T>(RAND_MAX); 
}

//-----------------------------------------------------------------------------
/**
 * Random.
 * Return a random value between 0 and 'max'.
 * @param          max                 Maximum value.
 * @return                             Randomized value.
 */
template <typename T> T Random(T max) 
{ 
	return max * scast<T>(rand()) / scast<T>(RAND_MAX); 
}

//-----------------------------------------------------------------------------
/**
 * Random.
 * Return a random value between 'min' and 'max'.
 * @param          min                 Minimum value.
 * @param          max                 Maximum value.
 * @return                             Randomized value.
 */
template <typename T> T Random(T min, T max) 
{ 
	return min + (max - min) * scast<T>(rand()) / scast<T>(RAND_MAX);
}

//-----------------------------------------------------------------------------
/**
 * Tell if the input variable is a power of 2.
 * @param          in                  Input value (integer).
 * @retval         TRUE                Value is a power of 2.
 * @retval         FALSE               Value is not a power of 2.
 */
template<typename T> BOOL IsPower2(T in) 
{ 
	return (!(in & (in-1))); 
}

//-----------------------------------------------------------------------------
/**
 * Get the Log2 value.
 * @param          x                   The input floating value.
 * @return                             The Log2 value.
 */
template<typename T> T Log2(T x) 
{ 
	return log(x)/log(scast<T>(2)); 
}

//-----------------------------------------------------------------------------
/**
 * Swap two value.
 * Inverse the value of the variables.
 * @param          a                   First variable.
 * @param          b                   Second variable.
 */
template <typename T> void Swap(T &a, T &b)
{
	T c = a;
	a = b;
	b = c;
}

//-----------------------------------------------------------------------------
/**
 * Align a value.
 * Template function to align a value according to input parameters.
 * @param          addr                Value to align.
 * @param          align               Align parameter.
 * @return                             Aligned value.
 */
template <typename T> T Align(T addr, const T align)
{
	align--;
	addr += align;
	addr &= ~align;
	return addr;
}

//-----------------------------------------------------------------------------
/**
 * Bound input value.
 * Bound the input variable between an interval defined by 'min' and 'max' values.
 * @param          a                   Value to bound.
 * @param          min                 Lower limit.
 * @param          max                 Upper limit.
 */
template <typename T> void Bound(T& a, const T min, const T max)
{
	if(a < min) 
		a = min; 
	if(a > max) 
		a = max;
}

//-----------------------------------------------------------------------------
/**
 * Bound input value.
 * Bound the input variable between an interval defined by 'min' and 'max' values.
 * @param          a                   Value to bound.
 * @param          min                 Lower limit.
 * @param          max                 Upper limit.
 * @return                             Bounded value.
 */
template <typename T> T Bounded(const T a, const T min, const T max)
{
	if(a < min) 
		return min; 
	if(a > max) 
		return max;
	return a;
}

//-----------------------------------------------------------------------------
/**
 * Template 2 values vector class.
 */
template <typename T> class TVector2
{
public:

	T x; ///< x value
	T y; ///< y value

	TVector2() {} ///< Default constructor
	TVector2(T a, T b): x(a), y(b) {} ///< Initializer list constructor. @param a First value. @param b second value.
	
	void Set(T a, T b) { x=a; y=b; } ///< Set member data. @param a First value. @param b second value.
};

//-----------------------------------------------------------------------------
/**
 * Get the minimal value
 * @return                             The minimal value of the type T.
 */
template<typename T> T Min() 
{ 
#undef min
	return std::numeric_limits<T>::min(); 
}

//-----------------------------------------------------------------------------
/**
 * Get the maximum value
 * @return                             The maximal value of the type T.
 */
template<typename T> T Max() 
{ 
#undef max
	return std::numeric_limits<T>::max(); 
}

//-----------------------------------------------------------------------------
/**
 * Get the minimal value between two.
 * @param          a                   First value.
 * @param          b                   Second value.
 * @return                             The minimal value.
 */
template<typename T> T Min(T a, T b) // Min(T &a, T &b)
{ 
	return a < b ? a: b; 
}

//-----------------------------------------------------------------------------
/**
 * Get the maximal value between two.
 * @param          a                   First value.
 * @param          b                   Second value.
 * @return                             The maximal value.
 */
template<typename T> T Max(T a, T b) // Max(T &a, T &b)
{ 
	return a < b ? b: a;
}


//-----------------------------------------------------------------------------
//
// TEMPLATE METAPROGRAM
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
/**
 * Factorial (template metaprogram).
 * N is the number to get the factorial (template arguemnt).
 * The value of N! can be retreive from Factorial<N>::value.
 */
template<int N> class Factorial 
{
	public: enum { value = N * Factorial<N-1>::value };	
};

//-----------------------------------------------------------------------------
/**
 * Factorial (template metaprogram).
 * Root class.
 */
template<> class Factorial<1>
{
	public: enum { value = 1 };	
};

//-----------------------------------------------------------------------------
/**
 * Power (template metaprogram)
 * N is the number to get the power and P the power factor (template arguemnt).
 * The value of N^P can be retreive from Power<N,P>::value.
 */
template<int N, int P> class Power
{
	public: enum { value = N * Power<N, P-1>::value };	
};

//-----------------------------------------------------------------------------
/**
 * Power (template metaprogram).
 * Root class.
 */
template<int N> class Power<N, 0>
{
	public: enum { value = 1 };	
};

//-----------------------------------------------------------------------------
/**
 * Bit (template metaprogram)
 * N is the bit we want the value.
 * The value of 2^N can be retreive from Bit<N>::value.
 */
template<int N> class Bit 
{
	public: enum { value = Bit<N-1>::value << 1 };
};

//-----------------------------------------------------------------------------
/**
 * Bit (template metaprogram).
 * Root class.
 */
template<> class Bit<0> ///< Root class.
{
	public: enum { value = 1 };
};

}; // Namespace noe.