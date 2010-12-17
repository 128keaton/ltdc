/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Distance functions
 * @file           distance.cpp
 * @package        noe
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

#include <noe/distance.h>

namespace noe
{

/// Global variable for computation error tolerance. @todo Encapsulate it into a singleton class.
static const f32 g_Tolerance = 1e-06f;

//-----------------------------------------------------------------------------
//
// Point <-> Point
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
/**
 * Get the squared distance between two 3d points.
 * @param		v1			First point.
 * @param		v2			Second point.
 * @return					The squared distance between 2 points.
 */
f32 SqrDistance(const Vector3 &v1, const Vector3 &v2)
{
	return(v2.x-v1.x) *(v2.x-v1.x) +(v2.y-v1.y) *(v2.y-v1.y) +(v2.z-v1.z) *(v2.z-v1.z);
}

//-----------------------------------------------------------------------------
/**
 * Get the distance between two 3d points.
 * @param		v1			First point.
 * @param		v2			Second point.
 * @return					The distance between 2 points.
 * @see                     SqrDistance
 */
f32 Distance(const Vector3 &v1, const Vector3 &v2)
{
	return sqrtf(SqrDistance(v1, v2));
}

//-----------------------------------------------------------------------------
/**
 * Get the squared horizontal distance between two 3d points.
 * @param		v1			First point.
 * @param		v2			Second point.
 * @return					The squared horizontal distance between two 3d points.
 */
f32 SqrDistanceXZ(const Vector3 &v1, const Vector3 &v2)
{
	return(v2.x-v1.x) *(v2.x-v1.x) +(v2.z-v1.z) *(v2.z-v1.z);
}

//-----------------------------------------------------------------------------
/**
 * Get the horizontal distance between two 3d points.
 * @param		v1			First point.
 * @param		v2			Second point.
 * @return					The horizontal distance between two 3d points.
 */
f32 DistanceXZ(const Vector3 &v1, const Vector3 &v2)
{
	return sqrtf(SqrDistanceXZ(v1, v2));
}


//-----------------------------------------------------------------------------
//
// Point <-> Plane
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
/**
 * Get the distance between a 3d point and a plane.
 * @param		pos			The point.
 * @param		plane		The plane.
 * @return					The distance between a 3d point and a plane.
 */
f32 Distance(const Vector3& pos, const Plane& plane)
{
	return plane.a * pos.x + plane.b * pos.y + plane.c * pos.z + plane.d;
}


//-----------------------------------------------------------------------------
//
// Point <-> Line
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
/**
 * Get the squared distance between a 3d point and a line.
 * @param		point		The point.
 * @param		line		The line.
 * @param		pLine		[out] The normalized distance of the nearest point on the line.
 * @return					The squared distance between a 3d point and a line.
 */
f32 SqrDistance(const Vector3& point, const Line3& line, f32* pLine)
{
	Vector3 diff = point - line.Origin(); // get the vector between point and line 'origin'.
	f32 length = line.Direction().SqrLength();
	f32 dot = diff * line.Direction();
	dot /= length;
	diff -= dot*line.Direction(); // get the vector between point and nearest point on the line.

	if(pLine)
		*pLine = dot; // return the normalized distance of the nearest point on the line.

	return diff.SqrLength();
}

//-----------------------------------------------------------------------------
/**
 * Get the distance between a 3d point and a line.
 * @param		point		The point.
 * @param		line		The line.
 * @param		pLine		[out] The normalized distance of the nearest point on the line.
 * @return					The distance between a 3d point and a line.
 */
f32 Distance(const Vector3& point, const Line3& line, f32* pLine)
{
    return sqrtf(SqrDistance(point, line, pLine));
}

//-----------------------------------------------------------------------------
/**
 * Get the horizontal squared distance between a 3d point and a line.
 * @param		point		The point.
 * @param		line		The line.
 * @param		pLine		[out] The normalized distance of the nearest point on the line.
 * @return					The horizontal squared distance between a 3d point and a line.
 */
f32 SqrDistanceXZ(const Vector3& point, const Line3& line, f32* pLine)
{
	Vector3XZ diff = point.GetXZ() - line.Origin().GetXZ(); // get the horizontal vector between point and line 'origin'.
	f32 length = line.Direction().GetXZ().SqrLength();
	f32 dot = diff * line.Direction().GetXZ();
	dot /= length;
	diff -= dot * line.Direction().GetXZ(); // get the horizontal vector between point and nearest point on the line.

   if(pLine)
		*pLine = dot; // return the normalized distance of the nearest point on the line.

	return diff.SqrLength();
}

//-----------------------------------------------------------------------------
/**
 * Get the horizontal distance between a 3d point and a line.
 * @param		point		The point.
 * @param		line		The line.
 * @param		pLine		[out] The normalized distance of the nearest point on the line.
 * @return					The horizontal distance between a 3d point and a line.
 */
f32 DistanceXZ(const Vector3& point, const Line3& line, f32* pLine)
{
    return sqrtf(SqrDistanceXZ(point, line, pLine));
}


//-----------------------------------------------------------------------------
//
// Point <-> Ray
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
/**
 * Get the squared distance between a 3d point and a ray.
 * @param		point		The point.
 * @param		ray			The ray.
 * @param		pRay		[out] The normalized distance of the nearest point on the ray.
 * @return					The squared distance between a 3d point and a ray.
 */
f32 SqrDistance(const Vector3& point, const Ray3& ray, f32* pRay)
{
    Vector3 diff = point - ray.Origin(); // get the vector between point and ray origin.
    f32 dot = diff * ray.Direction();

    if(pRay)
    {
		if(dot > 0.0f)
        {
            dot /= ray.Direction().SqrLength();
            diff -= dot*ray.Direction(); // get the horizontal vector between point and nearest point on the line.
        }
		else // the origin point is the nearest point on the ray
            dot = 0.0f;

		*pRay = dot;
    }
    else if(dot > 0.0f)
    {
        dot /= ray.Direction().SqrLength();
        diff -= dot*ray.Direction(); // get the horizontal vector between point and nearest point on the line.
    }

    return diff.SqrLength();
}

//-----------------------------------------------------------------------------
/**
 * Get the distance between a 3d point and a ray.
 * @param		point		The point.
 * @param		ray			The ray.
 * @param		pRay		[out] The normalized distance of the nearest point on the ray.
 * @return					The distance between a 3d point and a ray.
 */
f32 Distance(const Vector3& point, const Ray3& ray, f32* pRay)
{
    return sqrtf(SqrDistance(point, ray, pRay));
}


//-----------------------------------------------------------------------------
//
// Point <-> Segment
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
/**
 * Get the squared distance between a 3d point and a segment.
 * @param		point		The point.
 * @param		segment		The segment.
 * @param		pSeg 		[out] The normalized distance of the nearest point on the segment.
 * @return					The squared distance between a 3d point and a segment.
 */
f32 SqrDistance(const Vector3& point, const Segment3& segment, f32* pSeg)
{
    Vector3 diff = point - segment.Origin();
    f32 dot = diff * segment.Direction();

    if(pSeg)
    {
        if(dot <= 0.0f)
        {
            dot = 0.0f;
        }
        else
        {
            f32 length = segment.Direction().SqrLength();
            if(dot >= length)
            {
                dot = 1.0f;
                diff -= segment.Direction();
            }
            else
            {
                dot /= length;
                diff -= dot*segment.Direction();
            }
        }
        *pSeg = dot;
    }
    else
    {
        if(dot > 0.0f)
        {
            f32 length = segment.Direction().SqrLength();
            if(dot >= length)
            {
                diff -= segment.Direction();
            }
            else
            {
                dot /= length;
                diff -= dot*segment.Direction();
            }
        }
    }

    return diff.SqrLength();
}

//-----------------------------------------------------------------------------
/**
 * Get the distance between a 3d point and a segment.
 * @param		point		The point.
 * @param		segment		The Segment.
 * @param		pSeg		[out] The normalized distance of the nearest point on the segment.
 * @return					The distance between a 3d point and a segment.
 */
f32 Distance(const Vector3& point, const Segment3& segment, f32* pSeg)
{
    return sqrtf(SqrDistance(point, segment, pSeg));
}

//-----------------------------------------------------------------------------
/**
 * Get the horizontal squared distance between a 3d point and a segment.
 * @param		point		The point.
 * @param		segment		The segment.
 * @param		pSeg		[out] The normalized distance of the nearest point on the segment.
 * @return					The horizontal squared distance between a 3d point and a segment.
 */
f32 SqrDistanceXZ(const Vector3& point, const Segment3& segment, f32* pSeg)
{
	Vector3XZ diff = point.GetXZ() - segment.Origin().GetXZ();
    f32 dot = diff * segment.Direction().GetXZ();

    if(pSeg)
    {
        if(dot <= 0.0f)
        {
            dot = 0.0f;
        }
        else
        {
            f32 length = segment.Direction().GetXZ().SqrLength();
            if(dot >= length)
            {
                dot = 1.0f;
                diff -= segment.Direction().GetXZ();
            }
            else
            {
                dot /= length;
                diff -= dot*segment.Direction().GetXZ();
            }
        }
        *pSeg = dot;
    }
    else
    {
        if(dot > 0.0f)
        {
            f32 length = segment.Direction().GetXZ().SqrLength();
            if(dot >= length)
            {
                diff -= segment.Direction().GetXZ();
            }
            else
            {
                dot /= length;
                diff -= dot*segment.Direction().GetXZ();
            }
        }
    }

    return diff.SqrLength();
}

//-----------------------------------------------------------------------------
/**
 * Get the horizontal distance between a 3d point and a segment.
 * @param		point		The point.
 * @param		segment		The Segment.
 * @param		pSeg		[out] The normalized distance of the nearest point on the segment.
 * @return					The horizontal distance between a 3d point and a segment.
 */
f32 DistanceXZ(const Vector3& point, const Segment3& segment, f32* pSeg)
{
    return sqrtf(SqrDistanceXZ(point, segment, pSeg));
}


//-----------------------------------------------------------------------------
//
// Point <-> Triangle
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
/**
 * Get the squared distance between a 3d point and a triangle.
 * @param		point		The point.
 * @param		tri			The ray.
 * @param		pTri1		[out] The normalized distance of the nearest point on the triangle first edge.
 * @param		pTri2		[out] The normalized distance of the nearest point on the triangle second edge.
 * @return					The squared distance between a 3d point and a triangle.
 */
f32 SqrDistance(const Vector3& point, const Triangle3& tri, f32* pTri1, f32* pTri2)
{
    Vector3 vDiff = tri.Origin() - point;
    f32 fA00 = tri.Edge1().SqrLength();
    f32 fA01 = tri.Edge1() * tri.Edge2();
    f32 fA11 = tri.Edge2().SqrLength();
    f32 fB0  = vDiff * tri.Edge1();
    f32 fB1  = vDiff * tri.Edge2();
    f32 fC   = vDiff.SqrLength();
    f32 fDet = Abs(fA00 * fA11 - fA01 * fA01);
    f32 fS   = fA01 * fB1 - fA11 * fB0;
    f32 fT   = fA01 * fB0 - fA00 * fB1;
    f32 fSqrDist;

    if(fS + fT <= fDet)
    {
        if(fS < 0.0f)
        {
            if(fT < 0.0f)  // region 4
            {
                if(fB0 < 0.0f)
                {
                    fT = 0.0f;
                    if(-fB0 >= fA00)
                    {
                        fS = 1.0f;
                        fSqrDist = fA00 + 2.0f * fB0 + fC;
                    }
                    else
                    {
                        fS = -fB0 / fA00;
                        fSqrDist = fB0 * fS + fC;
                    }
                }
                else
                {
                    fS = 0.0f;
                    if(fB1 >= 0.0f)
                    {
                        fT = 0.0f;
                        fSqrDist = fC;
                    }
                    else if(-fB1 >= fA11)
                    {
                        fT = 1.0f;
                        fSqrDist = fA11 + 2.0f * fB1 + fC;
                    }
                    else
                    {
                        fT = -fB1 / fA11;
                        fSqrDist = fB1 * fT + fC;
                    }
                }
            }
            else  // region 3
            {
                fS = 0.0f;
                if(fB1 >= 0.0f)
                {
                    fT = 0.0f;
                    fSqrDist = fC;
                }
                else if(-fB1 >= fA11)
                {
                    fT = 1.0f;
                    fSqrDist = fA11 + 2.0f * fB1 + fC;
                }
                else
                {
                    fT = -fB1 / fA11;
                    fSqrDist = fB1 * fT + fC;
                }
            }
        }
        else if(fT < 0.0f)  // region 5
        {
            fT = 0.0f;
            if(fB0 >= 0.0f)
            {
                fS = 0.0f;
                fSqrDist = fC;
            }
            else if(-fB0 >= fA00)
            {
                fS = 1.0f;
                fSqrDist = fA00 + 2.0f * fB0 + fC;
            }
            else
            {
                fS = -fB0 / fA00;
                fSqrDist = fB0 * fS + fC;
            }
        }
        else  // region 0
        {
            // minimum at interior point
            f32 fInvDet = 1.0f / fDet;
            fS *= fInvDet;
            fT *= fInvDet;
            fSqrDist = fS * (fA00 * fS + fA01 * fT + 2.0f * fB0) + fT * (fA01 * fS + fA11 * fT + 2.0f * fB1) + fC;
        }
    }
    else
    {
        f32 fTmp0, fTmp1, fNumer, fDenom;

        if(fS < 0.0f)  // region 2
        {
            fTmp0 = fA01 + fB0;
            fTmp1 = fA11 + fB1;
            if(fTmp1 > fTmp0)
            {
                fNumer = fTmp1 - fTmp0;
                fDenom = fA00 - 2.0f * fA01 + fA11;
                if(fNumer >= fDenom)
                {
                    fS = 1.0f;
                    fT = 0.0f;
                    fSqrDist = fA00 + 2.0f * fB0 + fC;
                }
                else
                {
                    fS = fNumer / fDenom;
                    fT = 1.0f - fS;
                    fSqrDist = fS * (fA00 * fS + fA01 * fT + 2.0f * fB0) + fT * (fA01 * fS + fA11 * fT + 2.0f * fB1) + fC;
                }
            }
            else
            {
                fS = 0.0f;
                if(fTmp1 <= 0.0f)
                {
                    fT = 1.0f;
                    fSqrDist = fA11 + 2.0f * fB1 + fC;
                }
                else if(fB1 >= 0.0f)
                {
                    fT = 0.0f;
                    fSqrDist = fC;
                }
                else
                {
                    fT = -fB1 / fA11;
                    fSqrDist = fB1 * fT + fC;
                }
            }
        }
        else if(fT < 0.0f)  // region 6
        {
            fTmp0 = fA01 + fB1;
            fTmp1 = fA00 + fB0;
            if(fTmp1 > fTmp0)
            {
                fNumer = fTmp1 - fTmp0;
                fDenom = fA00 - 2.0f * fA01 + fA11;
                if(fNumer >= fDenom)
                {
                    fT = 1.0f;
                    fS = 0.0f;
                    fSqrDist = fA11 + 2.0f * fB1 + fC;
                }
                else
                {
                    fT = fNumer / fDenom;
                    fS = 1.0f - fT;
                    fSqrDist = fS * (fA00 * fS + fA01 * fT + 2.0f * fB0) + fT * (fA01 * fS + fA11 * fT + 2.0f * fB1) + fC;
                }
            }
            else
            {
                fT = 0.0f;
                if(fTmp1 <= 0.0f)
                {
                    fS = 1.0f;
                    fSqrDist = fA00 + 2.0f * fB0 + fC;
                }
                else if(fB0 >= 0.0f)
                {
                    fS = 0.0f;
                    fSqrDist = fC;
                }
                else
                {
                    fS = -fB0 / fA00;
                    fSqrDist = fB0 * fS + fC;
                }
            }
        }
        else  // region 1
        {
            fNumer = fA11 + fB1 - fA01 - fB0;
            if(fNumer <= 0.0f)
            {
                fS = 0.0f;
                fT = 1.0f;
                fSqrDist = fA11 + 2.0f * fB1 + fC;
            }
            else
            {
                fDenom = fA00 - 2.0f * fA01 + fA11;
                if(fNumer >= fDenom)
                {
                    fS = 1.0f;
                    fT = 0.0f;
                    fSqrDist = fA00 + 2.0f * fB0 + fC;
                }
                else
                {
                    fS = fNumer / fDenom;
                    fT = 1.0f - fS;
                    fSqrDist = fS * (fA00 * fS + fA01 * fT + 2.0f * fB0) + fT * (fA01 * fS + fA11 * fT + 2.0f * fB1) + fC;
                }
            }
        }
    }

    if(pTri1)
        *pTri1 = fS;

    if(pTri2)
        *pTri2 = fT;

    return Abs(fSqrDist);
}

//-----------------------------------------------------------------------------
/**
 * Get the distance between a 3d point and a triangle.
 * @param		point		The point.
 * @param		tri			The ray.
 * @param		pTri1		[out] The normalized distance of the nearest point on the triangle first edge.
 * @param		pTri2		[out] The normalized distance of the nearest point on the triangle second edge.
 * @return					The distance between a 3d point and a triangle.
 */
f32 Distance(const Vector3& point, const Triangle3& tri, f32* pTri1, f32* pTri2)
{
    return sqrtf(SqrDistance(point, tri, pTri1, pTri2));
}


//-----------------------------------------------------------------------------
//
// Segment <-> Triangle
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
/**
 * Get the squared distance between a 3d segment and a triangle.
 * @param		seg			The segment.
 * @param		tri			The triangle.
 * @param		pSeg		[out] The normalized distance of the nearest point on the segment.
 * @param		pTri1		[out] The normalized distance of the nearest point on the triangle first edge.
 * @param		pTri2		[out] The normalized distance of the nearest point on the triangle second edge.
 * @return					The squared distance between a 3d sgment and a triangle.
 */
f32 SqrDistance(const Segment3& seg, const Triangle3& tri, f32* pSeg, f32* pTri1, f32* pTri2)
{
    Vector3 diff = tri.Origin() - seg.Origin();
    f32 fA00 = seg.Direction().SqrLength();
    f32 fA01 = -seg.Direction() * tri.Edge1();
    f32 fA02 = -seg.Direction() * tri.Edge2();
    f32 fA11 = tri.Edge1().SqrLength();
    f32 fA12 = tri.Edge1() * tri.Edge2();
    f32 fA22 = tri.Edge2() * tri.Edge2();
    f32 fB0  = -diff * seg.Direction();
    f32 fB1  = diff * tri.Edge1();
    f32 fB2  = diff * tri.Edge2();

    Segment3 kTriSeg;
    Vector3 kPt;
    f32 fSqrDist, fSqrDist0, fR, fS, fT, fR0, fS0, fT0;

    // Set up for a relative error test on the angle between ray direction
    // and triangle normal to determine parallel/nonparallel status.
    Vector3 kN = tri.Edge1() ^ tri.Edge2();
    f32 fNSqrLen = kN.SqrLength();
    f32 fDot = seg.Direction() * kN;

    if(fDot * fDot >= g_Tolerance * fA00 * fNSqrLen)
    {
        f32 fCof00 = fA11 * fA22 - fA12 * fA12;
        f32 fCof01 = fA02 * fA12 - fA01 * fA22;
        f32 fCof02 = fA01 * fA12 - fA02 * fA11;
        f32 fCof11 = fA00 * fA22 - fA02 * fA02;
        f32 fCof12 = fA02 * fA01 - fA00 * fA12;
        f32 fCof22 = fA00 * fA11 - fA01 * fA01;
        f32 fInvDet = 1.0f / (fA00 * fCof00 + fA01 * fCof01 + fA02 * fCof02);
        f32 fRhs0 = -fB0 * fInvDet;
        f32 fRhs1 = -fB1 * fInvDet;
        f32 fRhs2 = -fB2 * fInvDet;

        fR = fCof00 * fRhs0 + fCof01 * fRhs1 + fCof02 * fRhs2;
        fS = fCof01 * fRhs0 + fCof11 * fRhs1 + fCof12 * fRhs2;
        fT = fCof02 * fRhs0 + fCof12 * fRhs1 + fCof22 * fRhs2;

        if(fR < 0.0f)
        {
            if(fS+fT <= 1.0f)
            {
                if(fS < 0.0f)
                {
                    if(fT < 0.0f)  // region 4m
                    {
                        // min on face s=0 or t=0 or r=0
                        kTriSeg.Origin() = tri.Origin();
                        kTriSeg.Direction() = tri.Edge2();
                        fSqrDist = SqrDistance(seg, kTriSeg, &fR, &fT);
                        fS = 0.0f;
                        kTriSeg.Origin() = tri.Origin();
                        kTriSeg.Direction() = tri.Edge1();
                        fSqrDist0 = SqrDistance(seg, kTriSeg, &fR0, &fS0);
                        fT0 = 0.0f;
                        if(fSqrDist0 < fSqrDist)
                        {
                            fSqrDist = fSqrDist0;
                            fR = fR0;
                            fS = fS0;
                            fT = fT0;
                        }
                        fSqrDist0 = SqrDistance(seg.Origin(), tri, &fS0, &fT0);
                        fR0 = 0.0f;
                        if(fSqrDist0 < fSqrDist)
                        {
                            fSqrDist = fSqrDist0;
                            fR = fR0;
                            fS = fS0;
                            fT = fT0;
                        }
                    }
                    else  // region 3m
                    {
                        // min on face s=0 or r=0
                        kTriSeg.Origin() = tri.Origin();
                        kTriSeg.Direction() = tri.Edge2();
                        fSqrDist = SqrDistance(seg,kTriSeg,&fR,&fT);
                        fS = 0.0f;
                        fSqrDist0 = SqrDistance(seg.Origin(),tri,&fS0,&fT0);
                        fR0 = 0.0f;
                        if(fSqrDist0 < fSqrDist)
                        {
                            fSqrDist = fSqrDist0;
                            fR = fR0;
                            fS = fS0;
                            fT = fT0;
                        }
                    }
                }
                else if(fT < 0.0f)  // region 5m
                {
                    // min on face t=0 or r=0
                    kTriSeg.Origin() = tri.Origin();
                    kTriSeg.Direction() = tri.Edge1();
                    fSqrDist = SqrDistance(seg,kTriSeg,&fR,&fS);
                    fT = 0.0f;
                    fSqrDist0 = SqrDistance(seg.Origin(),tri,&fS0,&fT0);
                    fR0 = 0.0f;
                    if(fSqrDist0 < fSqrDist)
                    {
                        fSqrDist = fSqrDist0;
                        fR = fR0;
                        fS = fS0;
                        fT = fT0;
                    }
                }
                else  // region 0m
                {
                    // min on face r=0
                    fSqrDist = SqrDistance(seg.Origin(),tri,&fS,&fT);
                    fR = 0.0f;
                }
            }
            else
            {
                if(fS < 0.0f)  // region 2m
                {
                    // min on face s=0 or s+t=1 or r=0
                    kTriSeg.Origin() = tri.Origin();
                    kTriSeg.Direction() = tri.Edge2();
                    fSqrDist = SqrDistance(seg,kTriSeg,&fR,&fT);
                    fS = 0.0f;
                    kTriSeg.Origin() = tri.Origin()+tri.Edge1();
                    kTriSeg.Direction() = tri.Edge2()-tri.Edge1();
                    fSqrDist0 = SqrDistance(seg,kTriSeg,&fR0,&fT0);
                    fS0 = 1.0f-fT0;
                    if(fSqrDist0 < fSqrDist)
                    {
                        fSqrDist = fSqrDist0;
                        fR = fR0;
                        fS = fS0;
                        fT = fT0;
                    }
                    fSqrDist0 = SqrDistance(seg.Origin(),tri,&fS0,&fT0);
                    fR0 = 0.0f;
                    if(fSqrDist0 < fSqrDist)
                    {
                        fSqrDist = fSqrDist0;
                        fR = fR0;
                        fS = fS0;
                        fT = fT0;
                    }
                }
                else if(fT < 0.0f)  // region 6m
                {
                    // min on face t=0 or s+t=1 or r=0
                    kTriSeg.Origin() = tri.Origin();
                    kTriSeg.Direction() = tri.Edge1();
                    fSqrDist = SqrDistance(seg,kTriSeg,&fR,&fS);
                    fT = 0.0f;
                    kTriSeg.Origin() = tri.Origin()+tri.Edge1();
                    kTriSeg.Direction() = tri.Edge2()-tri.Edge1();
                    fSqrDist0 = SqrDistance(seg,kTriSeg,&fR0,&fT0);
                    fS0 = 1.0f-fT0;
                    if(fSqrDist0 < fSqrDist)
                    {
                        fSqrDist = fSqrDist0;
                        fR = fR0;
                        fS = fS0;
                        fT = fT0;
                    }
                    fSqrDist0 = SqrDistance(seg.Origin(),tri,&fS0,&fT0);
                    fR0 = 0.0f;
                    if(fSqrDist0 < fSqrDist)
                    {
                        fSqrDist = fSqrDist0;
                        fR = fR0;
                        fS = fS0;
                        fT = fT0;
                    }
                }
                else  // region 1m
                {
                    // min on face s+t=1 or r=0
                    kTriSeg.Origin() = tri.Origin()+tri.Edge1();
                    kTriSeg.Direction() = tri.Edge2()-tri.Edge1();
                    fSqrDist = SqrDistance(seg,kTriSeg,&fR,&fT);
                    fS = 1.0f-fT;
                    fSqrDist0 = SqrDistance(seg.Origin(),tri,&fS0,&fT0);
                    fR0 = 0.0f;
                    if(fSqrDist0 < fSqrDist)
                    {
                        fSqrDist = fSqrDist0;
                        fR = fR0;
                        fS = fS0;
                        fT = fT0;
                    }
                }
            }
        }
        else if(fR <= 1.0f)
        {
            if(fS+fT <= 1.0f)
            {
                if(fS < 0.0f)
                {
                    if(fT < 0.0f)  // region 4
                    {
                        // min on face s=0 or t=0
                        kTriSeg.Origin() = tri.Origin();
                        kTriSeg.Direction() = tri.Edge2();
                        fSqrDist = SqrDistance(seg,kTriSeg,&fR,&fT);
                        fS = 0.0f;
                        kTriSeg.Origin() = tri.Origin();
                        kTriSeg.Direction() = tri.Edge1();
                        fSqrDist0 = SqrDistance(seg,kTriSeg,&fR0,&fS0);
                        fT0 = 0.0f;
                        if(fSqrDist0 < fSqrDist)
                        {
                            fSqrDist = fSqrDist0;
                            fR = fR0;
                            fS = fS0;
                            fT = fT0;
                        }
                    }
                    else  // region 3
                    {
                        // min on face s=0
                        kTriSeg.Origin() = tri.Origin();
                        kTriSeg.Direction() = tri.Edge2();
                        fSqrDist = SqrDistance(seg,kTriSeg,&fR,&fT);
                        fS = 0.0f;
                    }
                }
                else if(fT < 0.0f)  // region 5
                {
                    // min on face t=0
                    kTriSeg.Origin() = tri.Origin();
                    kTriSeg.Direction() = tri.Edge1();
                    fSqrDist = SqrDistance(seg,kTriSeg,&fR,&fS);
                    fT = 0.0f;
                }
                else  // region 0
                {
                    // global minimum is interior, done
                    fSqrDist = 0.0f;
                }
            }
            else
            {
                if(fS < 0.0f)  // region 2
                {
                    // min on face s=0 or s+t=1
                    kTriSeg.Origin() = tri.Origin();
                    kTriSeg.Direction() = tri.Edge2();
                    fSqrDist = SqrDistance(seg,kTriSeg,&fR,&fT);
                    fS = 0.0f;
                    kTriSeg.Origin() = tri.Origin()+tri.Edge1();
                    kTriSeg.Direction() = tri.Edge2()-tri.Edge1();
                    fSqrDist0 = SqrDistance(seg,kTriSeg,&fR0,&fT0);
                    fS0 = 1.0f-fT0;
                    if(fSqrDist0 < fSqrDist)
                    {
                        fSqrDist = fSqrDist0;
                        fR = fR0;
                        fS = fS0;
                        fT = fT0;
                    }
                }
                else if(fT < 0.0f)  // region 6
                {
                    // min on face t=0 or s+t=1
                    kTriSeg.Origin() = tri.Origin();
                    kTriSeg.Direction() = tri.Edge1();
                    fSqrDist = SqrDistance(seg,kTriSeg,&fR,&fS);
                    fT = 0.0f;
                    kTriSeg.Origin() = tri.Origin()+tri.Edge1();
                    kTriSeg.Direction() = tri.Edge2()-tri.Edge1();
                    fSqrDist0 = SqrDistance(seg,kTriSeg,&fR0,&fT0);
                    fS0 = 1.0f-fT0;
                    if(fSqrDist0 < fSqrDist)
                    {
                        fSqrDist = fSqrDist0;
                        fR = fR0;
                        fS = fS0;
                        fT = fT0;
                    }
                }
                else  // region 1
                {
                    // min on face s+t=1
                    kTriSeg.Origin() = tri.Origin()+tri.Edge1();
                    kTriSeg.Direction() = tri.Edge2()-tri.Edge1();
                    fSqrDist = SqrDistance(seg,kTriSeg,&fR,&fT);
                    fS = 1.0f-fT;
                }
            }
        }
        else  // fR > 1
        {
            if(fS+fT <= 1.0f)
            {
                if(fS < 0.0f)
                {
                    if(fT < 0.0f)  // region 4p
                    {
                        // min on face s=0 or t=0 or r=1
                        kTriSeg.Origin() = tri.Origin();
                        kTriSeg.Direction() = tri.Edge2();
                        fSqrDist = SqrDistance(seg,kTriSeg,&fR,&fT);
                        fS = 0.0f;
                        kTriSeg.Origin() = tri.Origin();
                        kTriSeg.Direction() = tri.Edge1();
                        fSqrDist0 = SqrDistance(seg,kTriSeg,&fR0,&fS0);
                        fT0 = 0.0f;
                        if(fSqrDist0 < fSqrDist)
                        {
                            fSqrDist = fSqrDist0;
                            fR = fR0;
                            fS = fS0;
                            fT = fT0;
                        }
                        kPt = seg.Origin()+seg.Direction();
                        fSqrDist0 = SqrDistance(kPt,tri,&fS0,&fT0);
                        fR0 = 1.0f;
                        if(fSqrDist0 < fSqrDist)
                        {
                            fSqrDist = fSqrDist0;
                            fR = fR0;
                            fS = fS0;
                            fT = fT0;
                        }
                    }
                    else  // region 3p
                    {
                        // min on face s=0 or r=1
                        kTriSeg.Origin() = tri.Origin();
                        kTriSeg.Direction() = tri.Edge2();
                        fSqrDist = SqrDistance(seg,kTriSeg,&fR,&fT);
                        fS = 0.0f;
                        kPt = seg.Origin()+seg.Direction();
                        fSqrDist0 = SqrDistance(kPt,tri,&fS0,&fT0);
                        fR0 = 1.0f;
                        if(fSqrDist0 < fSqrDist)
                        {
                            fSqrDist = fSqrDist0;
                            fR = fR0;
                            fS = fS0;
                            fT = fT0;
                        }
                    }
                }
                else if(fT < 0.0f)  // region 5p
                {
                    // min on face t=0 or r=1
                    kTriSeg.Origin() = tri.Origin();
                    kTriSeg.Direction() = tri.Edge1();
                    fSqrDist = SqrDistance(seg,kTriSeg,&fR,&fS);
                    fT = 0.0f;
                    kPt = seg.Origin()+seg.Direction();
                    fSqrDist0 = SqrDistance(kPt,tri,&fS0,&fT0);
                    fR0 = 1.0f;
                    if(fSqrDist0 < fSqrDist)
                    {
                        fSqrDist = fSqrDist0;
                        fR = fR0;
                        fS = fS0;
                        fT = fT0;
                    }
                }
                else  // region 0p
                {
                    // min face on r=1
                    kPt = seg.Origin()+seg.Direction();
                    fSqrDist = SqrDistance(kPt,tri,&fS,&fT);
                    fR = 1.0f;
                }
            }
            else
            {
                if(fS < 0.0f)  // region 2p
                {
                    // min on face s=0 or s+t=1 or r=1
                    kTriSeg.Origin() = tri.Origin();
                    kTriSeg.Direction() = tri.Edge2();
                    fSqrDist = SqrDistance(seg, kTriSeg, &fR, &fT);
                    fS = 0.0f;
                    kTriSeg.Origin() = tri.Origin() + tri.Edge1();
                    kTriSeg.Direction() = tri.Edge2() - tri.Edge1();
                    fSqrDist0 = SqrDistance(seg, kTriSeg, &fR0, &fT0);
                    fS0 = 1.0f - fT0;
                    if(fSqrDist0 < fSqrDist)
                    {
                        fSqrDist = fSqrDist0;
                        fR = fR0;
                        fS = fS0;
                        fT = fT0;
                    }
                    kPt = seg.Origin()+seg.Direction();
                    fSqrDist0 = SqrDistance(kPt, tri, &fS0, &fT0);
                    fR0 = 1.0f;
                    if(fSqrDist0 < fSqrDist)
                    {
                        fSqrDist = fSqrDist0;
                        fR = fR0;
                        fS = fS0;
                        fT = fT0;
                    }
                }
                else if(fT < 0.0f)  // region 6p
                {
                    // min on face t=0 or s+t=1 or r=1
                    kTriSeg.Origin() = tri.Origin();
                    kTriSeg.Direction() = tri.Edge1();
                    fSqrDist = SqrDistance(seg, kTriSeg, &fR, &fS);
                    fT = 0.0f;
                    kTriSeg.Origin() = tri.Origin() + tri.Edge1();
                    kTriSeg.Direction() = tri.Edge2() - tri.Edge1();
                    fSqrDist0 = SqrDistance(seg, kTriSeg, &fR0, &fT0);
                    fS0 = 1.0f - fT0;
                    if(fSqrDist0 < fSqrDist)
                    {
                        fSqrDist = fSqrDist0;
                        fR = fR0;
                        fS = fS0;
                        fT = fT0;
                    }
                    kPt = seg.Origin()+seg.Direction();
                    fSqrDist0 = SqrDistance(kPt, tri, &fS0, &fT0);
                    fR0 = 1.0f;
                    if(fSqrDist0 < fSqrDist)
                    {
                        fSqrDist = fSqrDist0;
                        fR = fR0;
                        fS = fS0;
                        fT = fT0;
                    }
                }
                else  // region 1p
                {
                    // min on face s+t=1 or r=1
                    kTriSeg.Origin() = tri.Origin() + tri.Edge1();
                    kTriSeg.Direction() = tri.Edge2() - tri.Edge1();
                    fSqrDist = SqrDistance(seg, kTriSeg, &fR, &fT);
                    fS = 1.0f - fT;
                    kPt = seg.Origin() + seg.Direction();
                    fSqrDist0 = SqrDistance(kPt, tri, &fS0, &fT0);
                    fR0 = 1.0f;
                    if(fSqrDist0 < fSqrDist)
                    {
                        fSqrDist = fSqrDist0;
                        fR = fR0;
                        fS = fS0;
                        fT = fT0;
                    }
                }
            }
        }
    }
    else
    {
        // segment and triangle are parallel
        kTriSeg.Origin() = tri.Origin();
        kTriSeg.Direction() = tri.Edge1();
        fSqrDist = SqrDistance(seg,kTriSeg, &fR, &fS);
        fT = 0.0f;

        kTriSeg.Direction() = tri.Edge2();
        fSqrDist0 = SqrDistance(seg,kTriSeg, &fR0, &fT0);
        fS0 = 0.0f;
        if(fSqrDist0 < fSqrDist)
        {
            fSqrDist = fSqrDist0;
            fR = fR0;
            fS = fS0;
            fT = fT0;
        }

        kTriSeg.Origin() = tri.Origin() + tri.Edge1();
        kTriSeg.Direction() = tri.Edge2() - tri.Edge1();
        fSqrDist0 = SqrDistance(seg, kTriSeg, &fR0, &fT0);
        fS0 = 1.0f - fT0;
        if(fSqrDist0 < fSqrDist)
        {
            fSqrDist = fSqrDist0;
            fR = fR0;
            fS = fS0;
            fT = fT0;
        }

        fSqrDist0 = SqrDistance(seg.Origin(), tri, &fS0, &fT0);
        fR0 = 0.0f;
        if(fSqrDist0 < fSqrDist)
        {
            fSqrDist = fSqrDist0;
            fR = fR0;
            fS = fS0;
            fT = fT0;
        }

        kPt = seg.Origin()+seg.Direction();
        fSqrDist0 = SqrDistance(kPt, tri, &fS0, &fT0);
        fR0 = 1.0f;
        if(fSqrDist0 < fSqrDist)
        {
            fSqrDist = fSqrDist0;
            fR = fR0;
            fS = fS0;
            fT = fT0;
        }
    }

    if(pSeg)
        *pSeg = fR;

    if(pTri1)
        *pTri1 = fS;

    if(pTri2)
        *pTri2 = fT;

    return fSqrDist;
}

//-----------------------------------------------------------------------------
/**
 * Get the distance between a 3d segment and a triangle.
 * @param		seg			The segment.
 * @param		tri			The triangle.
 * @param		pSeg		[out] The normalized distance of the nearest point on the segment.
 * @param		pTri1		[out] The normalized distance of the nearest point on the triangle first edge.
 * @param		pTri2		[out] The normalized distance of the nearest point on the triangle second edge.
 * @return					The distance between a 3d sgment and a triangle.
 */
f32 Distance(const Segment3& seg, const Triangle3& tri, f32* pSeg, f32* pTri1, f32* pTri2)
{
    return sqrtf(SqrDistance(seg, tri, pSeg, pTri1, pTri2));
}


//-----------------------------------------------------------------------------
//
// Segment <-> Segment
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
/**
 * Get the squared distance between two 3d segment.
 * @param		seg0		The first segment.
 * @param		seg1		The second segment.
 * @param		pSeg0		[out] The normalized distance of the nearest point on the first segment.
 * @param		pSeg1		[out] The normalized distance of the nearest point on the second segment.
 * @return					The squared distance between two 3d segment.
 */
f32 SqrDistance(const Segment3& seg0, const Segment3& seg1, f32* pSeg0, f32* pSeg1)
{
    Vector3 diff = seg0.Origin() - seg1.Origin();
    f32 fA00 = seg0.Direction().SqrLength();
    f32 fA01 = -seg0.Direction() * seg1.Direction();
    f32 fA11 = seg1.Direction().SqrLength();
    f32 fB0  = diff * seg0.Direction();
    f32 fC   = diff.SqrLength();
    f32 fDet = Abs(fA00 * fA11 - fA01 * fA01);
    f32 fB1, fS, fT, fSqrDist, fTmp;

    if(fDet >= g_Tolerance)
    {
        // line segments are not parallel
        fB1 = -diff * seg1.Direction();
        fS = fA01 * fB1 - fA11 * fB0;
        fT = fA01 * fB0 - fA00 * fB1;
        
        if(fS >= 0.0f)
        {
            if(fS <= fDet)
            {
                if(fT >= 0.0f)
                {
                    if(fT <= fDet)  // region 0(interior)
                    {
                        // minimum at two interior points of 3D lines
                        f32 fInvDet = 1.0f / fDet;
                        fS *= fInvDet;
                        fT *= fInvDet;
                        fSqrDist = fS * (fA00 * fS + fA01 * fT + 2.0f * fB0) + fT * (fA01 * fS + fA11 * fT + 2.0f * fB1) + fC;
                    }
                    else  // region 3(side)
                    {
                        fT = 1.0f;
                        fTmp = fA01 + fB0;
                        if(fTmp >= 0.0f)
                        {
                            fS = 0.0f;
                            fSqrDist = fA11 + 2.0f * fB1 + fC;
                        }
                        else if(-fTmp >= fA00)
                        {
                            fS = 1.0f;
                            fSqrDist = fA00 + fA11 + fC + 2.0f * (fB1 + fTmp);
                        }
                        else
                        {
                            fS = -fTmp/fA00;
                            fSqrDist = fTmp * fS + fA11 + 2.0f * fB1 + fC;
                        }
                    }
                }
                else  // region 7(side)
                {
                    fT = 0.0f;
                    if(fB0 >= 0.0f)
                    {
                        fS = 0.0f;
                        fSqrDist = fC;
                    }
                    else if(-fB0 >= fA00)
                    {
                        fS = 1.0f;
                        fSqrDist = fA00 + 2.0f * fB0 + fC;
                    }
                    else
                    {
                        fS = -fB0 / fA00;
                        fSqrDist = fB0 * fS + fC;
                    }
                }
            }
            else
            {
                if(fT >= 0.0)
                {
                    if(fT <= fDet)  // region 1(side)
                    {
                        fS = 1.0f;
                        fTmp = fA01 + fB1;
                        if(fTmp >= 0.0f)
                        {
                            fT = 0.0f;
                            fSqrDist = fA00 + 2.0f * fB0 + fC;
                        }
                        else if(-fTmp >= fA11)
                        {
                            fT = 1.0f;
                            fSqrDist = fA00 + fA11 + fC + 2.0f * (fB0 + fTmp);
                        }
                        else
                        {
                            fT = -fTmp / fA11;
                            fSqrDist = fTmp * fT + fA00 + 2.0f * fB0 + fC;
                        }
                    }
                    else  // region 2(corner)
                    {
                        fTmp = fA01 + fB0;
                        if(-fTmp <= fA00)
                        {
                            fT = 1.0f;
                            if(fTmp >= 0.0f)
                            {
                                fS = 0.0f;
                                fSqrDist = fA11 + 2.0f * fB1 + fC;
                            }
                            else
                            {
                                 fS = -fTmp / fA00;
                                 fSqrDist = fTmp * fS + fA11 + 2.0f * fB1 + fC;
                            }
                        }
                        else
                        {
                            fS = 1.0f;
                            fTmp = fA01 + fB1;
                            if(fTmp >= 0.0f)
                            {
                                fT = 0.0f;
                                fSqrDist = fA00 + 2.0f * fB0 + fC;
                            }
                            else if(-fTmp >= fA11)
                            {
                                fT = 1.0f;
                                fSqrDist = fA00 + fA11 + fC + 2.0f * (fB0 + fTmp);
                            }
                            else
                            {
                                fT = -fTmp/fA11;
                                fSqrDist = fTmp * fT + fA00 + 2.0f * fB0 + fC;
                            }
                        }
                    }
                }
                else  // region 8(corner)
                {
                    if(-fB0 < fA00)
                    {
                        fT = 0.0f;
                        if(fB0 >= 0.0f)
                        {
                            fS = 0.0f;
                            fSqrDist = fC;
                        }
                        else
                        {
                            fS = -fB0 / fA00;
                            fSqrDist = fB0 * fS + fC;
                        }
                    }
                    else
                    {
                        fS = 1.0f;
                        fTmp = fA01 + fB1;
                        if(fTmp >= 0.0f)
                        {
                            fT = 0.0f;
                            fSqrDist = fA00 + 2.0f * fB0 + fC;
                        }
                        else if(-fTmp >= fA11)
                        {
                            fT = 1.0f;
                            fSqrDist = fA00 + fA11 + fC + 2.0f * (fB0 + fTmp);
                        }
                        else
                        {
                            fT = -fTmp / fA11;
                            fSqrDist = fTmp * fT + fA00 + 2.0f * fB0 + fC;
                        }
                    }
                }
            }
        }
        else 
        {
            if(fT >= 0.0f)
            {
                if(fT <= fDet)  // region 5(side)
                {
                    fS = 0.0f;
                    if(fB1 >= 0.0f)
                    {
                        fT = 0.0f;
                        fSqrDist = fC;
                    }
                    else if(-fB1 >= fA11)
                    {
                        fT = 1.0f;
                        fSqrDist = fA11 + 2.0f * fB1 + fC;
                    }
                    else
                    {
                        fT = -fB1 / fA11;
                        fSqrDist = fB1 * fT + fC;
                    }
                }
                else  // region 4(corner)
                {
                    fTmp = fA01 + fB0;
                    if(fTmp < 0.0f)
                    {
                        fT = 1.0f;
                        if(-fTmp >= fA00)
                        {
                            fS = 1.0f;
                            fSqrDist = fA00 + fA11 + fC + 2.0f * (fB1 + fTmp);
                        }
                        else
                        {
                            fS = -fTmp / fA00;
                            fSqrDist = fTmp * fS + fA11 + 2.0f * fB1 + fC;
                        }
                    }
                    else
                    {
                        fS = 0.0f;
                        if(fB1 >= 0.0f)
                        {
                            fT = 0.0f;
                            fSqrDist = fC;
                        }
                        else if(-fB1 >= fA11)
                        {
                            fT = 1.0f;
                            fSqrDist = fA11 + 2.0f * fB1 + fC;
                        }
                        else
                        {
                            fT = -fB1 / fA11;
                            fSqrDist = fB1 * fT + fC;
                        }
                    }
                }
            }
            else   // region 6(corner)
            {
                if(fB0 < 0.0f)
                {
                    fT = 0.0f;
                    if(-fB0 >= fA00)
                    {
                        fS = 1.0f;
                        fSqrDist = fA00 + 2.0f * fB0 + fC;
                    }
                    else
                    {
                        fS = -fB0 / fA00;
                        fSqrDist = fB0 * fS + fC;
                    }
                }
                else
                {
                    fS = 0.0f;
                    if(fB1 >= 0.0f)
                    {
                        fT = 0.0f;
                        fSqrDist = fC;
                    }
                    else if(-fB1 >= fA11)
                    {
                        fT = 1.0f;
                        fSqrDist = fA11 + 2.0f * fB1 + fC;
                    }
                    else
                    {
                        fT = -fB1 / fA11;
                        fSqrDist = fB1 * fT + fC;
                    }
                }
            }
        }
    }
    else
    {
        // line segments are parallel
        if(fA01 > 0.0f)
        {
            // direction vectors form an obtuse angle
            if(fB0 >= 0.0f)
            {
                fS = 0.0f;
                fT = 0.0f;
                fSqrDist = fC;
            }
            else if(-fB0 <= fA00)
            {
                fS = -fB0 / fA00;
                fT = 0.0f;
                fSqrDist = fB0 * fS + fC;
            }
            else
            {
                fB1 = -diff * seg1.Direction();
                fS = 1.0f;
                fTmp = fA00 + fB0;
                if(-fTmp >= fA01)
                {
                    fT = 1.0f;
                    fSqrDist = fA00 + fA11 + fC + 2.0f * (fA01 + fB0 + fB1);
                }
                else
                {
                    fT = -fTmp / fA01;
                    fSqrDist = fA00 + 2.0f * fB0 + fC + fT * (fA11 * fT + 2.0f * (fA01 + fB1));
                }
            }
        }
        else
        {
            // direction vectors form an acute angle
            if(-fB0 >= fA00)
            {
                fS = 1.0f;
                fT = 0.0f;
                fSqrDist = fA00 + 2.0f * fB0 + fC;
            }
            else if(fB0 <= 0.0f)
            {
                fS = -fB0 / fA00;
                fT = 0.0f;
                fSqrDist = fB0 * fS + fC;
            }
            else
            {
                fB1 = -diff * seg1.Direction();
                fS = 0.0f;
                if(fB0 >= -fA01)
                {
                    fT = 1.0f;
                    fSqrDist = fA11 + 2.0f * fB1 + fC;
                }
                else
                {
                    fT = -fB0/fA01;
                    fSqrDist = fC + fT * (2.0f * fB1 + fA11 * fT);
                }
            }
        }
    }

    if(pSeg0)
        *pSeg0 = fS;

    if(pSeg1)
        *pSeg1 = fT;

    return Abs(fSqrDist);
}

//-----------------------------------------------------------------------------
/**
 * Get the distance between two 3d segment.
 * @param		seg0		The first segment.
 * @param		seg1		The second segment.
 * @param		pSeg0		[out] The normalized distance of the nearest point on the first segment.
 * @param		pSeg1		[out] The normalized distance of the nearest point on the second segment.
 * @return					The distance between two 3d segment.
 */
f32 Distance(const Segment3& seg0, const Segment3& seg1, f32* pSeg0, f32* pSeg1)
{
    return sqrtf(SqrDistance(seg0, seg1, pSeg0, pSeg1));
}


//-----------------------------------------------------------------------------
//
// Line <-> Segment
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
/**
 * Get the squared distance between a 3d line and a segment.
 * @param		line		The line.
 * @param		seg			The segment.
 * @param		pLine		[out] The normalized distance of the nearest point on the line.
 * @param		pSeg		[out] The normalized distance of the nearest point on the segment.
 * @return					The squared distance between a 3d line and a segment.
 */
f32 SqrDistance(const Line3& line, const Segment3& seg, f32* pLine, f32* pSeg)
{
    Vector3 kDiff = line.Origin() - seg.Origin();
    f32 fA00 = line.Direction().SqrLength();
    f32 fA01 = -line.Direction() * seg.Direction();
    f32 fA11 = seg.Direction().SqrLength();
    f32 fB0 = kDiff * line.Direction();
    f32 fC = kDiff.SqrLength();
    f32 fDet = Abs(fA00 * fA11 - fA01 * fA01);
    f32 fB1, fS, fT, fSqrDist;

    if(fDet >= g_Tolerance)
    {
        fB1 = -kDiff * seg.Direction();
        fT = fA01 * fB0 - fA00 * fB1;

        if(fT >= 0.0f)
        {
            if(fT <= fDet)
            {
                // two interior points are closest, one on line and one on
                // segment
                f32 fInvDet = 1.0f / fDet;
                fS = (fA01 * fB1 - fA11 * fB0) * fInvDet;
                fT *= fInvDet;
                fSqrDist = fS * (fA00 * fS + fA01 * fT + 2.0f * fB0) + fT * (fA01 * fS + fA11 * fT + 2.0f * fB1) + fC;
            }
            else
            {
                // end point e1 of segment and interior point of line are
                // closest
                f32 fTmp = fA01 + fB0;
                fS = -fTmp / fA00;
                fT = 1.0f;
                fSqrDist = fTmp * fS + fA11 + 2.0f * fB1 + fC;
            }
        }
        else
        {
            // end point e0 of segment and interior point of line are closest
            fS = -fB0 / fA00;
            fT = 0.0f;
            fSqrDist = fB0 * fS + fC;
        }
    }
    else
    {
        // lines are parallel, closest pair with one point at segment origin
        fS = -fB0 / fA00;
        fT = 0.0f;
        fSqrDist = fB0 * fS + fC;
    }

    if(pLine)
        *pLine = fS;

    if(pSeg)
        *pSeg = fT;

    return Abs(fSqrDist);
}

//-----------------------------------------------------------------------------
/**
 * Get the distance between a 3d line and a segment.
 * @param		line		The line.
 * @param		seg			The segment.
 * @param		pLine		[out] The normalized distance of the nearest point on the line.
 * @param		pSeg		[out] The normalized distance of the nearest point on the segment.
 * @return					The distance between a 3d line and a segment.
 */
f32 Distance(const Line3& line, const Segment3& seg, f32* pLine, f32* pSeg)
{
    return sqrtf(SqrDistance(line, seg, pLine, pSeg));
}


//-----------------------------------------------------------------------------
//
// Line <-> Line
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
/**
 * Get the squared distance between two 3d lines.
 * @param		line0		The first line.
 * @param		line1		The second line.
 * @param		pLine0		[out] The normalized distance of the nearest point on the first line.
 * @param		pLine1		[out] The normalized distance of the nearest point on the second line.
 * @return					The squared distance between two 3d lines.
 */
f32 SqrDistance(const Line3& line0, const Line3& line1, f32* pLine0, f32* pLine1)
{
    Vector3 diff = line0.Origin() - line1.Origin();
    f32 fA00 = line0.Direction().SqrLength();
    f32 fA01 = -line0.Direction() * line1.Direction();
    f32 fA11 = line1.Direction().SqrLength();
    f32 fB0 = diff * line0.Direction();
    f32 fC = diff.SqrLength();
    f32 fDet = Abs(fA00 * fA11 - fA01 * fA01);
    f32 fB1, fS, fT, fSqrDist;

    if(fDet >= g_Tolerance)
    {
        // lines are not parallel
        fB1 = -diff * line1.Direction();
        f32 fInvDet = 1.0f / fDet;
        fS = (fA01 * fB1 - fA11 * fB0) * fInvDet;
        fT = (fA01 * fB0 - fA00 * fB1) * fInvDet;
        fSqrDist = fS * (fA00 * fS + fA01 * fT + 2.0f * fB0) + fT * (fA01 * fS + fA11 * fT + 2.0f * fB1) + fC;
    }
    else
    {
        // lines are parallel, select any closest pair of points
        fS = -fB0 / fA00;
        fT = 0.0f;
        fSqrDist = fB0 * fS + fC;
    }

    if(pLine0)
        *pLine0 = fS;

    if(pLine1)
        *pLine1 = fT;

    return Abs(fSqrDist);
}

//-----------------------------------------------------------------------------
/**
 * Get the distance between two 3d lines.
 * @param		line0		The first line.
 * @param		line1		The second line.
 * @param		pLine0		[out] The normalized distance of the nearest point on the first line.
 * @param		pLine1		[out] The normalized distance of the nearest point on the second line.
 * @return					The distance between two 3d lines.
 */
f32 Distance(const Line3& line0, const Line3& line1, f32* pLine0, f32* pLine1)
{
    return sqrtf(SqrDistance(line0, line1, pLine0, pLine1));
} 



} // namespace noe