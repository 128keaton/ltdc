/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Rendering manager
 * @file           render.cpp
 * @package        noe
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

// noe
#include <noe/render.h>
#include <noe/light.h>
#include <noe/model.h>
#include <noe/system.h>
#include <noe/color.h>
#include <noe/shader.h>
#include <noe/shader/constant.h>

#ifdef _DEBUG
#define D3D_ASSERT(_F_) { HRESULT hr = _F_; DBG_ASSERT(hr == S_OK, "D3D Error! " #_F_); }
#else
#define D3D_ASSERT(_F_) _F_
#endif



namespace noe
{

// Shadow-mapping shaders
Shader g_SMap_Shadow;
Shader g_SMap_Scene;

//-----------------------------------------------------------------------------
//  #####   #####    ####   ##   ##       #####   #####    ####    ####
//  ##  ##  ##  ##  ##  ##  ##   ##       ##  ##  ##  ##  ##  ##  ##  ##
//  ##  ##  #####   ######  ##   ##  ###  #####   #####   ##  ##  ##
//  ##  ##  ##  ##  ##	##  ### ###       ##      ##  ##  ##  ##  ##  ##
//  #####   ##  ##  ##	##  ## # ##       ##      ##  ##   ####    ####


//-----------------------------------------------------------------------------
/** 
 * Clear the back buffer to a blue color
 */
void DrawClearAll::Draw(DrawContext*)
{
	D3D_ASSERT(RenderDevice->Clear(0, NULL, D3DCLEAR_TARGET|D3DCLEAR_ZBUFFER, Color::LIGHTSKYBLUE, 1.0f, 0));
}

//-----------------------------------------------------------------------------
/**
 * Clear only the ZBuffer
 */
void DrawClearZBuffer::Draw(DrawContext*)
{
	D3D_ASSERT(RenderDevice->Clear(0, NULL, D3DCLEAR_ZBUFFER, 0, 1.0f, 0));
}

//-----------------------------------------------------------------------------
/**
 * Begin the scene.
 */
void DrawBegin::Draw(DrawContext*)
{
	D3D_ASSERT(RenderDevice->BeginScene());

	//--------------------------------------------
	// Default Render-states

	// Z-Buffer render state
	D3D_ASSERT(RenderDevice->SetRenderState(D3DRS_ZENABLE,          D3DZB_TRUE));
	D3D_ASSERT(RenderDevice->SetRenderState(D3DRS_ZFUNC,            D3DCMP_LESSEQUAL));
	D3D_ASSERT(RenderDevice->SetRenderState(D3DRS_ZWRITEENABLE,     TRUE));

	// Alpha test render state
	D3D_ASSERT(RenderDevice->SetRenderState(D3DRS_ALPHATESTENABLE,  FALSE));
	D3D_ASSERT(RenderDevice->SetRenderState(D3DRS_ALPHAREF,         0x00));
	D3D_ASSERT(RenderDevice->SetRenderState(D3DRS_ALPHAFUNC,        D3DCMP_GREATER));

	// Set alpha-blending mode
	D3D_ASSERT(RenderDevice->SetRenderState(D3DRS_ALPHABLENDENABLE, TRUE));
	D3D_ASSERT(RenderDevice->SetRenderState(D3DRS_BLENDOP,          D3DBLENDOP_ADD));
	D3D_ASSERT(RenderDevice->SetRenderState(D3DRS_SRCBLEND,         D3DBLEND_SRCALPHA));
	D3D_ASSERT(RenderDevice->SetRenderState(D3DRS_DESTBLEND,        D3DBLEND_ONE));

	// Primitive clipping
	D3D_ASSERT(RenderDevice->SetRenderState(D3DRS_CLIPPING,         TRUE));

	RenderInstance.LastMaterial = NULL;
	RenderInstance.LastTexture  = NULL;
	RenderInstance.LastShader   = NULL;
};

//-----------------------------------------------------------------------------
/** 
 * End and Present the scene.
 */
void DrawEnd::Draw(DrawContext*)
{
	D3D_ASSERT(RenderDevice->EndScene());

	D3D_ASSERT(RenderDevice->Present(NULL, NULL, NULL, NULL));
};

//-----------------------------------------------------------------------------
/**
 *
 */
void DrawInitShader::Draw(DrawContext*)
{
	//m_Integer[0] = m_Integer[1] = m_Integer[2] = m_Integer[3] = 0;

	// Color
	RenderInstance.SetAmbientColor(0.5f, 0.5f, 0.5f, 1.0f);
	
	// tween
	//RenderInstance._SetTweenEnable(FALSE);
	//RenderInstance._SetTweenFactor(0.f);

	// fog
	//RenderInstance._SetFogType(0);//FOG_TYPE_NONE);
	//RenderInstance._SetFogColor(1.0f, 1.0f, 1.0f, 1.0f);
	//RenderInstance._SetFogSetting(10.f, 100.f, 1.0f);
	//RenderInstance._SetFogRange(FALSE);

	// texture
	//RenderInstance._SetTextureType(0);//TEX_TYPE_NONE);
/*
	//================================================================
	// L I G H T S
	i32 light_dir_num(0);
	i32 light_point_num(0);
	i32 light_spot_num(0);
	i32 lreg(0); // registred lights

	//if(m_Lights)
	if(m_LightsNum)
	{
		i32 lnum = m_LightsNum;//m_Lights.size(); // lights total number
		Bound<i32>(lnum, 0, 8);

		// push direction lights
		loop(lid, lnum)
		{
			if(m_Lights[lid].GetType() == LIGHT_TYPE_DIRECTIONAL)
			{
				RenderInstance._SetLight(lreg, m_Lights[lid]);
				light_dir_num++;
				lreg++;
			}
		}

		// push direction lights
		loop(lid, lnum)
		{
			if(m_Lights[lid].GetType() == LIGHT_TYPE_POINT)
			{
				RenderInstance._SetLight(lreg, m_Lights[lid]);
				light_point_num++;
				lreg++;
			}
		}
		
		// push spot lights
		loop(lid, lnum)
		{
			if(m_Lights[lid].GetType() == LIGHT_TYPE_SPOT)
			{
				RenderInstance._SetLight(lreg, m_Lights[lid]);
				light_spot_num++;
				lreg++;
			}
		}
	}

	if(!lreg)
	{
		ZeroMemory(&m_Light, sizeof(m_Light));
		m_Light._SetDiffuse(1.0f, 1.0f, 1.0f);
		RenderInstance._SetLight(0, m_Light);
		light_dir_num++;			
	}
		
	// light
	RenderInstance._SetLightDirIni(0);
	RenderInstance._SetLightDirNum(light_dir_num);
	RenderInstance._SetLightPointIni(light_dir_num);
	RenderInstance._SetLightPointNum(light_point_num);
	RenderInstance._SetLightSpotIni(light_dir_num+light_point_num);
	RenderInstance._SetLightSpotNum(light_spot_num);
*/
}


//-----------------------------------------------------------------------------
/**
 *
 */
void DrawLight::Draw(DrawContext*)
{
	_Light light;

	light.SetType(LIGHT_TYPE_DIRECTIONAL);
	light.SetDiffuse(1.0f, 1.0f, 1.0f);
	light.SetSpecular(1.0f, 0.5f, 0.5f);
	light.SetAmbient(0.0f, 0.0f, 0.0f);
	Vector3 dir(-1.0f, 1.0f, -1.0f);
	dir.Normalize();
	light.SetDirection(dir);

	RenderInstance._SetLight(0, light);
	RenderInstance._SetLightDirIni(0);
	RenderInstance._SetLightDirNum(1);
}


//-----------------------------------------------------------------------------
//  #####   #####  ##   ##  #####   #####  #####
//  ##  ##  ##     ###  ##  ##  ##  ##     ##  ##
//  #####   ####   ## # ##  ##  ##  ####   #####
//  ##  ##  ##     ##  ###  ##  ##  ##     ##  ##
//  ##  ##  #####  ##   ##  #####   #####  ##  ##


//-----------------------------------------------------------------------------
/**
 * Initialize render engine
 */
void Render::Initialize()
{
	DBG_PRINTL("noe.Render.Initialize");

	/// Initialize Direct3D interface
	if(!(m_D3D = Direct3DCreate9(D3D_SDK_VERSION)))
	{
		System::DebugMessage("Can't initialize Direct3D 9.x interface.");
		return;
	}

	DBG_PRINTL("\n-- Device capacities --");
	D3DCAPS9 caps;
	D3D_ASSERT(m_D3D->GetDeviceCaps(D3DADAPTER_DEFAULT, D3DDEVTYPE_HAL, &caps));
	
	DBG_PRINTL("Presentation intervals: ");
	DBG_PRINTL("- Immediate......................................... %s", caps.PresentationIntervals & D3DPRESENT_INTERVAL_IMMEDIATE ? "OK" : "NO");
	DBG_PRINTL("- One............................................... %s", caps.PresentationIntervals & D3DPRESENT_INTERVAL_ONE ? "OK" : "NO");
	DBG_PRINTL("- Two............................................... %s", caps.PresentationIntervals & D3DPRESENT_INTERVAL_TWO ? "OK" : "NO");
	DBG_PRINTL("- Three............................................. %s", caps.PresentationIntervals & D3DPRESENT_INTERVAL_THREE ? "OK" : "NO");
	DBG_PRINTL("- Four.............................................. %s", caps.PresentationIntervals & D3DPRESENT_INTERVAL_FOUR ? "OK" : "NO");
	
	DBG_PRINTL("Capabilities of the device:");
	DBG_PRINTL("- Blits from system-memory textures................. %s", caps.DevCaps & D3DDEVCAPS_CANBLTSYSTONONLOCAL ? "OK" : "NO"); // Device supports blits from system-memory textures to nonlocal video-memory textures. 
	DBG_PRINTL("- Queue rendering commands.......................... %s", caps.DevCaps & D3DDEVCAPS_CANRENDERAFTERFLIP ? "OK" : "NO"); // Device can queue rendering commands after a page flip. Applications do not change their behavior if this flag is set; this capability means that the device is relatively fast. 
	DBG_PRINTL("- DirectX 5......................................... %s", caps.DevCaps & D3DDEVCAPS_DRAWPRIMITIVES2 ? "OK" : "NO"); // Device can support at least a DirectX 5.0-compliant driver.
	DBG_PRINTL("- DirectX 7.0....................................... %s", caps.DevCaps & D3DDEVCAPS_DRAWPRIMITIVES2EX ? "OK" : "NO"); // Device can support at least a DirectX 7.0-compliant driver.
	DBG_PRINTL("- DirectX 9......................................... %s", caps.DevCaps & D3DDEVCAPS_DRAWPRIMTLVERTEX ? "OK" : "NO"); // Device exports an IDirect3DDevice9::DrawPrimitive-aware hardware abstraction layer (HAL). 
	DBG_PRINTL("- Execute buffers from system memory................ %s", caps.DevCaps & D3DDEVCAPS_EXECUTESYSTEMMEMORY ? "OK" : "NO"); // Device can use execute buffers from system memory.
	DBG_PRINTL("- Execute buffers from video memory................. %s", caps.DevCaps & D3DDEVCAPS_EXECUTEVIDEOMEMORY ? "OK" : "NO"); // Device can use execute buffers from video memory. 
	DBG_PRINTL("- Hardware acceleration for scene rasterization..... %s", caps.DevCaps & D3DDEVCAPS_HWRASTERIZATION ? "OK" : "NO"); // Device has hardware acceleration for scene rasterization. 
	DBG_PRINTL("- Transformation and lighting in hardware........... %s", caps.DevCaps & D3DDEVCAPS_HWTRANSFORMANDLIGHT ? "OK" : "NO"); // Device can support transformation and lighting in hardware. 
	DBG_PRINTL("- N patches......................................... %s", caps.DevCaps & D3DDEVCAPS_NPATCHES ? "OK" : "NO"); // Device supports N patches. 
	DBG_PRINTL("- Rasterization, transform, lighting, and shading... %s", caps.DevCaps & D3DDEVCAPS_PUREDEVICE ? "OK" : "NO"); // Device can support rasterization, transform, lighting, and shading in hardware. 
	DBG_PRINTL("- Quintic Bézier curves and B-splines............... %s", caps.DevCaps & D3DDEVCAPS_QUINTICRTPATCHES ? "OK" : "NO"); // Device supports quintic Bézier curves and B-splines. 
	DBG_PRINTL("- Rectangular and triangular patches................ %s", caps.DevCaps & D3DDEVCAPS_RTPATCHES ? "OK" : "NO"); // Device supports rectangular and triangular patches. 
	DBG_PRINTL("- Not require caching of any information............ %s", caps.DevCaps & D3DDEVCAPS_RTPATCHHANDLEZERO ? "OK" : "NO"); // When this device capability is set, the hardware architecture does not require caching of any information, and uncached patches (handle zero) will be drawn as efficiently as cached ones. Note that setting D3DDEVCAPS_RTPATCHHANDLEZERO does not mean that a patch with handle zero can be drawn. A handle-zero patch can always be drawn whether this cap is set or not. 
	DBG_PRINTL("- Texturing from separate memory pools.............. %s", caps.DevCaps & D3DDEVCAPS_SEPARATETEXTUREMEMORIES ? "OK" : "NO"); // Device is texturing from separate memory pools. 
	DBG_PRINTL("- Retrieve textures from non-local video memory..... %s", caps.DevCaps & D3DDEVCAPS_TEXTURENONLOCALVIDMEM ? "OK" : "NO"); // Device can retrieve textures from non-local video memory. 
	DBG_PRINTL("- Retrieve textures from system memory.............. %s", caps.DevCaps & D3DDEVCAPS_TEXTURESYSTEMMEMORY ? "OK" : "NO"); // Device can retrieve textures from system memory. 
	DBG_PRINTL("- Retrieve textures from device memory.............. %s", caps.DevCaps & D3DDEVCAPS_TEXTUREVIDEOMEMORY ? "OK" : "NO"); // Device can retrieve textures from device memory. 
	DBG_PRINTL("- Use buffers from system memory.................... %s", caps.DevCaps & D3DDEVCAPS_TLVERTEXSYSTEMMEMORY ? "OK" : "NO"); // Device can use buffers from system memory for transformed and lit vertices. 
	DBG_PRINTL("- Use buffers from video memory..................... %s", caps.DevCaps & D3DDEVCAPS_TLVERTEXVIDEOMEMORY ? "OK" : "NO"); // Device can use buffers from video memory for transformed and lit vertices. 
	
	DBG_PRINTL("Miscellaneous primitive capabilities:");
	DBG_PRINTL("- Mask Z............................................ %s", caps.PrimitiveMiscCaps & D3DPMISCCAPS_MASKZ ? "OK" : "NO"); // Device can enable and disable modification of the depth buffer on pixel operations. 
	DBG_PRINTL("- Cull none......................................... %s", caps.PrimitiveMiscCaps & D3DPMISCCAPS_CULLNONE ? "OK" : "NO"); // The driver does not perform triangle culling. This corresponds to the D3DCULL_NONE member of the D3DCULL enumerated type. 
	DBG_PRINTL("- Cull clockwise.................................... %s", caps.PrimitiveMiscCaps & D3DPMISCCAPS_CULLCW  ? "OK" : "NO"); // The driver supports clockwise triangle culling through the D3DRS_CULLMODE state. (This applies only to triangle primitives.) This flag corresponds to the D3DCULL_CW member of the D3DCULL enumerated type. 
	DBG_PRINTL("- Cull counterclockwise............................. %s", caps.PrimitiveMiscCaps & D3DPMISCCAPS_CULLCCW ? "OK" : "NO"); // The driver supports counterclockwise culling through the D3DRS_CULLMODE state. (This applies only to triangle primitives.) This flag corresponds to the D3DCULL_CCW member of the D3DCULL enumerated type. 
	DBG_PRINTL("- Color wrtie enable................................ %s", caps.PrimitiveMiscCaps & D3DPMISCCAPS_COLORWRITEENABLE ? "OK" : "NO"); // Device supports per-channel writes for the render-target color buffer through the D3DRS_COLORWRITEENABLE state. 
	DBG_PRINTL("- Clip plane scaled points.......................... %s", caps.PrimitiveMiscCaps & D3DPMISCCAPS_CLIPPLANESCALEDPOINTS ? "OK" : "NO"); // Device correctly clips scaled points of size greater than 1.0 to user-defined clipping planes. 
	DBG_PRINTL("- Clip TL verts..................................... %s", caps.PrimitiveMiscCaps & D3DPMISCCAPS_CLIPTLVERTS ? "OK" : "NO"); // Device clips post-transformed vertex primitives. Specify D3DUSAGE_DONOTCLIP when the pipeline should not do any clipping. For this case, additional software clipping may need to be performed at draw time, requiring the vertex buffer to be in system memory.  
	DBG_PRINTL("- D3DTA for temporary register...................... %s", caps.PrimitiveMiscCaps & D3DPMISCCAPS_TSSARGTEMP ? "OK" : "NO"); // Device supports D3DTA for temporary register. 
	DBG_PRINTL("- Blend operation................................... %s", caps.PrimitiveMiscCaps & D3DPMISCCAPS_BLENDOP ? "OK" : "NO"); // Device supports alpha-blending operations other than D3DBLENDOP_ADD. 
	DBG_PRINTL("- Null reference.................................... %s", caps.PrimitiveMiscCaps & D3DPMISCCAPS_NULLREFERENCE ? "OK" : "NO"); // A reference device that does not render. 
	DBG_PRINTL("- Independent write masks........................... %s", caps.PrimitiveMiscCaps & D3DPMISCCAPS_INDEPENDENTWRITEMASKS ? "OK" : "NO"); // Device supports independent write masks for multiple element textures or multiple render targets. 
	DBG_PRINTL("- Per stage constant................................ %s", caps.PrimitiveMiscCaps & D3DPMISCCAPS_PERSTAGECONSTANT ? "OK" : "NO"); // Device supports per-stage constants. See D3DTSS_CONSTANT in D3DTEXTURESTAGESTATETYPE. 
	DBG_PRINTL("- Fog and specular alpha............................ %s", caps.PrimitiveMiscCaps & D3DPMISCCAPS_FOGANDSPECULARALPHA ? "OK" : "NO"); // Device supports separate fog and specular alpha. Many devices use the specular alpha channel to store the fog factor. 
	DBG_PRINTL("- Separate alpha blend.............................. %s", caps.PrimitiveMiscCaps & D3DPMISCCAPS_SEPARATEALPHABLEND ? "OK" : "NO"); // Device supports separate blend settings for the alpha channel. 
	DBG_PRINTL("- MRT independent bit depths........................ %s", caps.PrimitiveMiscCaps & D3DPMISCCAPS_MRTINDEPENDENTBITDEPTHS ? "OK" : "NO"); // Device supports different bit depths for multiple render targets. 
	DBG_PRINTL("- MRT post pixel shader blending.................... %s", caps.PrimitiveMiscCaps & D3DPMISCCAPS_MRTPOSTPIXELSHADERBLENDING ? "OK" : "NO"); // Device supports post-pixel shader operations for multiple render targets. 
	DBG_PRINTL("- Fog vertex clamped................................ %s", caps.PrimitiveMiscCaps & D3DPMISCCAPS_FOGVERTEXCLAMPED ? "OK" : "NO"); // Device clamps fog blend factor per vertex. 

	DBG_PRINTL("Shaders");
	DBG_PRINTL("- Vertex shader version............................. %d.%d", (caps.VertexShaderVersion >> 8) & 0xFF, caps.VertexShaderVersion & 0xFF);
	DBG_PRINTL("- Pixel shader version.............................. %d.%d", (caps.PixelShaderVersion  >> 8) & 0xFF, caps.PixelShaderVersion  & 0xFF);

	DBG_ASSERT((caps.VertexShaderVersion & 0xFFFF) >= 0x0200, "Need at least vertex shader version 2.0");
	DBG_ASSERT((caps.PixelShaderVersion & 0xFFFF) >= 0x0200, "Need at least pixel shader version 2.0");

	D3DPRESENT_PARAMETERS d3dpp; 
	d3dpp.BackBufferWidth            = WindowInstance.Config()->size.x;
	d3dpp.BackBufferHeight           = WindowInstance.Config()->size.y;
	d3dpp.BackBufferFormat           = WindowInstance.Config()->frame_buffer == 32 ? D3DFMT_X8R8G8B8 : D3DFMT_R5G6B5;
	d3dpp.BackBufferCount            = 1;
	d3dpp.MultiSampleType            = D3DMULTISAMPLE_NONE;
	d3dpp.MultiSampleQuality         = 0;
	d3dpp.SwapEffect                 = D3DSWAPEFFECT_DISCARD;
	d3dpp.hDeviceWindow              = WindowInstance.m_Handle;
	d3dpp.Windowed                   = !WindowInstance.Config()->fullscreen;
	d3dpp.EnableAutoDepthStencil     = TRUE;
	d3dpp.AutoDepthStencilFormat     = WindowInstance.Config()->z_buffer == 24 ? D3DFMT_D24X8 : D3DFMT_D16;
	d3dpp.Flags                      = 0;
	d3dpp.FullScreen_RefreshRateInHz = D3DPRESENT_RATE_DEFAULT;
	d3dpp.PresentationInterval       = WindowInstance.Config()->sync ? D3DPRESENT_INTERVAL_ONE : D3DPRESENT_INTERVAL_IMMEDIATE;

	/// Check The Wanted Surface Format
	D3D_ASSERT(m_D3D->CheckDeviceFormat(
		D3DADAPTER_DEFAULT, 
		D3DDEVTYPE_HAL, 
		d3dpp.BackBufferFormat, 
		D3DUSAGE_DEPTHSTENCIL, 
		D3DRTYPE_SURFACE, 
		d3dpp.AutoDepthStencilFormat));

	// Create The DirectX 3D Device 
	D3D_ASSERT(m_D3D->CreateDevice(
		D3DADAPTER_DEFAULT, 
		D3DDEVTYPE_HAL, 
		WindowInstance.m_Handle, 
		D3DCREATE_MIXED_VERTEXPROCESSING, 
		&d3dpp, 
		&m_D3DDevice));

	// Initialisation
	D3D_ASSERT(m_D3DDevice->SetRenderState(D3DRS_ZENABLE,  TRUE));  /// Z-Buffer (Depth Buffer)
	D3D_ASSERT(m_D3DDevice->SetRenderState(D3DRS_CULLMODE, FALSE)); /// Disable Backface Culling
	D3D_ASSERT(m_D3DDevice->SetRenderState(D3DRS_LIGHTING, FALSE)); /// Disable Light

	m_EventStart = CreateEvent(0, FALSE, 0, 0); DBG_ASSERT(m_EventStart != NULL);
	m_EventEnd   = CreateEvent(0, FALSE, 1, 0); DBG_ASSERT(m_EventEnd  != NULL);

	// Create shadow-map texture
	D3D_ASSERT(m_D3DDevice->CreateTexture(
		SHADOW_SIZE,
		SHADOW_SIZE,
		1,
		D3DUSAGE_RENDERTARGET,
		D3DFMT_R32F,
		D3DPOOL_DEFAULT,
		&m_ShadowMap,
      NULL));

	D3D_ASSERT(m_D3DDevice->CreateDepthStencilSurface(
		SHADOW_SIZE,
		SHADOW_SIZE,
		WindowInstance.Config()->z_buffer == 24 ? D3DFMT_D24X8 : D3DFMT_D16,
		D3DMULTISAMPLE_NONE,
		0,
		TRUE,
		&m_ShadowDS,
		NULL));

	g_SMap_Shadow.Create(File("noe/shader/smap_shadow.vso"), File("noe/shader/smap_shadow.pso"), g_DefaultElements);
	g_SMap_Scene.Create (File("noe/shader/smap_scene.vso"),  File("noe/shader/smap_scene.pso"),  g_DefaultElements);

	Start();
}

//-----------------------------------------------------------------------------
/**
 * Release render engine
 */
void Render::Release()
{
	if(m_D3DDevice != NULL)	
	{
		m_D3DDevice->Release(); // Release D3D Device
		m_D3DDevice = NULL;
	}

	if(m_D3D!=NULL)
	{
		m_D3D->Release(); // Release D3D Interface
		m_D3D = NULL;
	}
}

//-----------------------------------------------------------------------------
/**
 * Wait for render thread completion
 */
void Render::Wait(BOOL stop)
{
	WaitForSingleObject(m_EventEnd, INFINITE); // Wait for rendering thread
	if(stop)
		return;
	Synchronize();
	DoubleBufferIndex::Flip();
	noe::Timer::Update();
	SetEvent(m_EventStart);
}

//-----------------------------------------------------------------------------
/**
 *
 */
void Render::InitShadowMap()
{
	// Backup the default render target
	m_DefaultRT = NULL;
	D3D_ASSERT(m_D3DDevice->GetRenderTarget(0, &m_DefaultRT));

	// Get shadow texture surface and set it as render target
	IDirect3DSurface9 *pShadowSurf;
	D3D_ASSERT(m_ShadowMap->GetSurfaceLevel(0, &pShadowSurf));
	D3D_ASSERT(m_D3DDevice->SetRenderTarget(0, pShadowSurf));
	pShadowSurf->Release();

	// Backup default depth stencil surface and set the shadow depth stencil surface
	m_DefaultDS = NULL;
	D3D_ASSERT(m_D3DDevice->GetDepthStencilSurface(&m_DefaultDS));
	D3D_ASSERT(m_D3DDevice->SetDepthStencilSurface(m_ShadowDS));

	// Clear shadow depth stencil surface
	D3D_ASSERT(m_D3DDevice->Clear(0L, NULL, D3DCLEAR_ZBUFFER, 0x000000ff, 1.0f, 0L));
}

//-----------------------------------------------------------------------------
/**
 *
 */
void Render::UseShadowMap()
{
	// Reset old Depth Stencil and Render Target
	D3D_ASSERT(m_D3DDevice->SetDepthStencilSurface(m_DefaultDS));
	m_DefaultDS->Release();
	D3D_ASSERT(m_D3DDevice->SetRenderTarget(0, m_DefaultRT));
	m_DefaultRT->Release();

	// Reset transformation matrices
	SetWorldView(&m_Camera->WorldView(RENDER));
	SetViewProj(&m_Camera->ViewProj(RENDER));

	// Set shadow-map texture
	D3D_ASSERT(RenderDevice->SetTexture(1, m_ShadowMap));
}

//-----------------------------------------------------------------------------
/**
 * Render the previous computed frame
 */
void Render::Process()
{
	loop(layer, LAYER_NUM) // for each layer
	{
		m_Context.layer = layer;

		if(m_Context.layer == LAYER_SMAP)
		{
			// skip if nothing have to be shadow-mapped
			if(m_DrawProc.GetRender()[layer].empty())
				continue;

			//--------------------------------------------------------------------
			// Shadow pass
			InitShadowMap();

			/// @test Bring the light managment to the application level
			Light light; 
			light.Draw(&m_Context);

			// Render shadow
			m_Context.pass  = PASS_SHADOW;
			loop(proc, scast<i32>(m_DrawProc.GetRender()[layer].size()))
				m_DrawProc.GetRender()[layer][proc]->Draw(&m_Context);

			//--------------------------------------------------------------------
			// Scene pass
			UseShadowMap();
		
			// Render scene
			m_Context.pass  = PASS_SCENE;
			loop(proc, scast<i32>(m_DrawProc.GetRender()[layer].size()))
				m_DrawProc.GetRender()[layer][proc]->Draw(&m_Context);
		}
		else
		{
			m_Context.pass  = PASS_FIRST;

			loop(proc, scast<i32>(m_DrawProc.GetRender()[layer].size()))
				m_DrawProc.GetRender()[layer][proc]->Draw(&m_Context);
		}
	}

	SetEvent(m_EventEnd); // Signal the render process end
	WaitForSingleObject(m_EventStart, INFINITE); // Wait for main thread
}

//-----------------------------------------------------------------------------
/**
 * Synchronize 'update' and 'render' threads
 */
void Render::Synchronize()
{
	loop(layer, LAYER_NUM) // for each layer
	{
		loop(proc, scast<i32>(m_DrawProc.GetUpdate()[layer].size()))
			m_DrawProc.GetUpdate()[layer][proc]->Synchronize();
	}
	loop(layer, LAYER_NUM) // for each layer
		m_DrawProc.GetRender()[layer].clear();
}

//-----------------------------------------------------------------------------
/**
 * Render thread entry point
 */
void Render::Run()
{ 
	SetEvent(m_EventEnd); // Signal the render process end
	WaitForSingleObject(m_EventStart, INFINITE); // Wait for main thread

	while(1)
	{
		Process(); 
	}
}

// Set material shader constant
void Render::_SetSpecularEnable(i32 enable)                     { VS_BOOL(B_SPECULAR, enable); }
void Render::_SetMaterialDiffuse(f32 r, f32 g, f32 b, f32 a)    { VS_FLOAT4(V_MATERIALDIFFUSE, r, g, b, a); }
void Render::_SetMaterialDiffuse(const Vector4 &color)          { VS_VECTOR(V_MATERIALDIFFUSE, color); }
void Render::_SetMaterialAmbient(f32 r, f32 g, f32 b, f32 a)    { VS_FLOAT4(V_MATERIALAMBIENT, r, g, b, a); }
void Render::_SetMaterialAmbient(const Vector4 &color)          { VS_VECTOR(V_MATERIALAMBIENT, color); }
void Render::_SetMaterialSpecular(f32 r, f32 g, f32 b, f32 a)   { VS_FLOAT4(V_MATERIALSPECULAR, r, g, b, a); }
void Render::_SetMaterialSpecular(const Vector4 &color)         { VS_VECTOR(V_MATERIALSPECULAR, color); }
void Render::_SetMaterialEmissive(f32 r, f32 g, f32 b, f32 a)   { VS_FLOAT4(V_MATERIALEMISSIVE, r, g, b, a); }
void Render::_SetMaterialEmissive(const Vector4 &color)         { VS_VECTOR(V_MATERIALEMISSIVE, color); }
void Render::_SetMaterialPower(f32 power)                       { VS_FLOAT(V_MATERIALPOWER, power); }
// Set light shader constant
void Render::_SetAmbientColor(f32 r, f32 g, f32 b, f32 a)       { VS_FLOAT4(V_AMBIENTCOLOR, r, g, b, a); }
void Render::_SetAmbientColor(const Vector4 &color)             { VS_VECTOR(V_AMBIENTCOLOR, color); }
void Render::_SetLight(i32 id, const _Light &light)              { VS_LIGHT(id, light); }
void Render::_SetLightDirIni(i32 i)                             { VS_FLOAT(V_LIGHTDIRINI, scast<f32>(i)); }
void Render::_SetLightDirNum(i32 n)                             { VS_INT(I_LIGHTDIRNUM, n); }
void Render::_SetLightPointIni(i32 i)                           { VS_FLOAT(V_LIGHTPOINTINI, scast<f32>(i)); }
void Render::_SetLightPointNum(i32 n)                           { VS_INT(I_LIGHTPOINTNUM, n); }
void Render::_SetLightSpotIni(i32 i)                            { VS_FLOAT(V_LIGHTSPOTINI, scast<f32>(i)); }
void Render::_SetLightSpotNum(i32 n)                            { VS_INT(I_LIGHTSPOTNUM, n); }
// Set fog shader constant
void Render::_SetFogType(i32 type)                              { VS_FLOAT(V_FOGTYPE, scast<f32>(type)); }
void Render::_SetFogColor(f32 r, f32 g, f32 b, f32 a)           { VS_FLOAT4(V_FOGCOLOR, r, g, b, a); }
void Render::_SetFogColor(const Vector4 &color)                 { VS_VECTOR(V_FOGCOLOR, color); }
void Render::_SetFogSetting(f32 a, f32 b, f32 c)                { VS_FLOAT4(V_FOGSETTING, a, b, c, 0.f); }
void Render::_SetFogSetting(const Vector4 &vec)                 { VS_VECTOR(V_FOGSETTING, vec); }
void Render::_SetFogRange(i32 enable)                           { VS_BOOL(B_FOGRANGE, enable); }
// Set transformation matrix shader constant
void Render::_SetMatrixW(const Matrix4 &mat)                    { VS_MATRIX(V_WORLD, mat); }
void Render::_SetMatrixWV(const Matrix4 &mat)                   { VS_MATRIX(V_WORLDVIEW, mat); }
void Render::_SetMatrixWVP(const Matrix4 &mat)                  { VS_MATRIX(V_WORLDVIEWPROJ, mat); }
void Render::_SetMatrixVIT(const Matrix4 &mat)                  { VS_MATRIX(V_VIEWIT, mat); }
void Render::_SetMatrixWVIT(const Matrix4 &mat)                 { VS_MATRIX(V_WORLDVIEWIT, mat); }
// Set texture shader constant
void Render::_SetTextureType(i32 type)                          { VS_FLOAT(V_TEXTYPE, scast<f32>(type)); }
void Render::_SetTexGenerationType(i32 id, i32 type)            { VS_FLOAT(V_TEXGENTYPE+id, scast<f32>(type)); }
void Render::_SetUVModifier(i32 id, f32 x, f32 y, f32 z, f32 w) { VS_FLOAT4(V_UVMODIFIER+id, x, y, z, w); }
void Render::_SetUVModifier(i32 id, const Vector4 &vec)         { VS_VECTOR(V_UVMODIFIER+id, vec); }
void Render::_SetTextureFunction(i32 id, i32 func)              { PS_FLOAT(PS_TEXTURETYPE+id, scast<f32>(func)); }
void Render::_SetTextureNumber(int num)                         { VS_FLOAT(V_TEXTURENUM, scast<f32>(num)); PS_FLOAT(PS_TEXTURENUM, scast<f32>(num)); }
// Set tweening shader constant
void Render::_SetTweenEnable(i32 enable)                        { VS_BOOL(B_SPECULAR, enable); }
void Render::_SetTweenFactor(f32 factor)                        { VS_FLOAT(V_TWEENFACTOR, factor); }

//-----------------------------------------------------------------------------
// Shader constant setting functions
void Render::SetMatrixWVP(const Matrix4 &mat)                   { VS_MATRIX(0, mat); }
void Render::SetMatrixWV(const Matrix4 &mat)                    { VS_MATRIX(4, mat); }
void Render::SetMatrixVLP(const Matrix4 &mat)                   { VS_MATRIX(8, mat); }

void Render::SetUVModifier(f32 x, f32 y, f32 z, f32 w)			{ VS_FLOAT4(12, x, y, z, w); }
void Render::SetUVModifier(const Vector4 &vec)					{ VS_VECTOR(12, vec); }

void Render::SetMaterialDiffuse(f32 r, f32 g, f32 b, f32 a)     { PS_FLOAT4(20, r, g, b, a); }
void Render::SetMaterialDiffuse(const Vector4 &color)           { PS_VECTOR(20, color); }

void Render::SetLightPosition(f32 x, f32 y, f32 z)              { PS_FLOAT4(21, x, y, z, 0.0f); }
void Render::SetLightPosition(const Vector4 &vec)               { PS_VECTOR(21, vec); }
void Render::SetLightDirection(f32 x, f32 y, f32 z)             { PS_FLOAT4(22, x, y, z, 0.0f); }
void Render::SetLightDirection(const Vector4 &vec)              { PS_VECTOR(22, vec); }
void Render::SetLightDiffuse(f32 r, f32 g, f32 b, f32 a)        { PS_FLOAT4(23, r, g, b, a); }
void Render::SetAmbientColor(f32 r, f32 g, f32 b, f32 a)        { PS_FLOAT4(24, r, g, b, a); }
void Render::SetLightCosTheta(f32 x)                            { PS_FLOAT4(25, x, 0.0f, 0.0f, 0.0f); }


} // namespace noe