/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          GOS main program
 * @file           main.cpp
 * @package        gos
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

// std
#include <math.h>
#include <iostream>
// noe
#include <noe/noe.h>
#include <noe/system.h>
#include <noe/math.h>
#include <noe/window.h>
#include <noe/scene.h>
#include <noe/camera.h>
#include <noe/file.h>
#include <noe/tga.h>
#include <noe/model.h>
#include <noe/input.h>
#include <noe/network.h>
#include <noe/font.h>
#include <noe/system.h>
#include <noe/script.h>
#include <noe/multibuffer.h>
#include <noe/thread.h>
#include <noe/color.h>
#include <noe/render.h>
// ltdc
#include "ltdc.h"

//-----------------------------------------------------------------------------
/**
 * Game entry point.
 */
void Start(i8 argc, c8** argv)
{
	/// first camera creation.
	noe::Camera cam;
	cam.WorldView().Identity();
	cam.SetMode(noe::Camera::TARGET);
	cam.Target().Clear();
	cam.Position().Set(0.0f, 10.0f, 0.0f);
	cam.Process();

	/// scene creation.
	noe::SceneInstance.AddView(&cam);

	/// window's setting.
	noe::Script script;
	script.Load(DATA_PATH("config.lua"));
	script.Run();

	BOOL dbg_message = script.GetGlobal<BOOL>("dbg_message");

	noe::WindowConfig wc;
	wc.name         = script.GetGlobal<const c8*>("win_name");
	wc.position.x   = script.GetGlobal<i16>("win_posx");
	wc.position.y   = script.GetGlobal<i16>("win_posy");
	wc.size.x       = script.GetGlobal<i16>("win_width");
	wc.size.y       = script.GetGlobal<i16>("win_height");
	wc.fullscreen   = script.GetGlobal<BOOL>("win_fullscreen");
	wc.frame_buffer = script.GetGlobal<i8>("win_frame_buffer");
	wc.z_buffer     = script.GetGlobal<i8>("win_z_buffer");
	wc.multi_sample = script.GetGlobal<i8>("win_multi_sample");
	wc.sync         = script.GetGlobal<BOOL>("win_sync");

	/// window creation. 
	noe::WindowInstance.Create(&wc);

	/// input creation
	noe::InputInstance.Initialize();

	// font initialization
	noe::SceneInstance.AddFont(&noe::Font::Default());

	//-----------------------------------------------------------------------------
	// Background field
	noe::Texture   bg_tex;
	noe::Material  bg_mat;
	noe::Model     bg_mod;

	noe::File bg_file(DATA_PATH("gcheck.tga"));
	bg_tex.Load(&bg_file);
	bg_mat.SetTexture(0, &bg_tex);
	bg_mod.CreatePlane(100.0f, 100.0f, &bg_mat, noe::Model::MODEL_HORIZONTAL, 0xFFFFFFFF, 10.0f, 10.0f);
	bg_mod.SetCastShadow(FALSE);
	noe::SceneInstance.AddModel(&bg_mod);

	//-----------------------------------------------------------------------------
	// Create objects
	noe::Texture   obj_tex;
	noe::Material  obj_mat;
	noe::Model     obj_mod;

	noe::File obj_file(DATA_PATH("smiley_b.png"));
	obj_tex.Load(&obj_file);
	obj_mat.SetTexture(0, &obj_tex);
	obj_mod.CreateSphere(0.5f, 16, &obj_mat, 0xFFFFFFFF);
	obj_mod.SetPosition(0.0f, 0.5f, 0.0f);
	obj_mod.SetCastShadow(FALSE);
	noe::SceneInstance.AddModel(&obj_mod);

	//-----------------------------------------------------------------------------
	// Main loop
	BOOL go(TRUE);
	while(go)
	{
		static f32 dist(10.0f);

		// Free camera
		{
			cam.SetMode(noe::Camera::FREE);

			static const f32 ANGULAR = 0.05f;
			static const f32 SPEED = 0.2f;

			static f32 yaw = 0.0f;
			static f32 pitch = 0.0f;

			if(noe::InputInstance.IsPress(noe::CROSS_L_RIGHT))
				yaw += ANGULAR;
			else if(noe::InputInstance.IsPress(noe::CROSS_L_LEFT))
				yaw -= ANGULAR;

			if(noe::InputInstance.IsPress(noe::CROSS_L_UP))
				pitch += ANGULAR;
			else if(noe::InputInstance.IsPress(noe::CROSS_L_DOWN))
				pitch -= ANGULAR;

			// Direction update
			noe::Bound(pitch, -noe::PI_2*0.9f, noe::PI_2*0.9f);
			cam.Direction().x = sinf(yaw) * cosf(pitch);
			cam.Direction().y = sinf(pitch);
			cam.Direction().z = cosf(yaw) * cosf(pitch);
			cam.Direction().Normalize();

			if(noe::InputInstance.IsPress(noe::BUTTON_6)) // backward
				cam.Position() += cam.Direction() * SPEED;
			else if(noe::InputInstance.IsPress(noe::BUTTON_10)) // forward
				cam.Position() -= cam.Direction() * SPEED;

			if(noe::InputInstance.IsPress(noe::BUTTON_9)) // right
			{
				noe::Vector3 tan = cam.Direction() ^ noe::Vector3::Up();
				tan.Normalize();
				cam.Position() += tan * SPEED;
			}
			else if(noe::InputInstance.IsPress(noe::BUTTON_11)) // left
			{
				noe::Vector3 tan = cam.Direction() ^ noe::Vector3::Up();
				tan.Normalize();
				cam.Position() -= tan * SPEED;
			}
		}

		cam.Process();

		//noe::PhysicInstance.Process();

		//-----------------------------------------------------------------------------
		// Print debug information
		if(dbg_message)
		{
			noe::Font::Default().Clear();
			static c8 buffer[1024];
			static u8 show_camera = 0;

			c8 chr = noe::InputInstance.GetChar();

			if(chr == 'c')
				show_camera = 1 - show_camera;
	      
			buffer[0] = 0;

			sprintf_s(buffer, 1024, "%.2f fps\n", 1.0f / noe::Timer::Elapsed);

			if(show_camera)
			{
				sprintf_s(buffer, 1024, "%sCamera:\n"
									"> Pos: %.3f; %.3f; %.3f\n"
									"> Tar: %.3f; %.3f; %.3f\n"
									"> Dir: %.3f; %.3f; %.3f\n", buffer,
									cam.Position().x,               cam.Position().y,               cam.Position().z,
									cam.Target().x,                 cam.Target().y,                 cam.Target().z,
									cam.WorldView().Dir().x,        cam.WorldView().Dir().y,        cam.WorldView().Dir().z);
			}

			noe::Font::Default().Print(buffer, 10, 10, 0xFFFFFFFF);
		}

		noe::InputInstance.Process();		
		go = noe::WindowInstance.Process();
	}
}
