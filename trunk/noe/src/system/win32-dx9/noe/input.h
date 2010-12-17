/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Input manager
 * @file           input.h
 * @package        noe
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

#pragma once

// dx9
#define DIRECTINPUT_VERSION 0x0800
#include <dinput.h>
// noe
#include <noe/window.h>
#include <noe/singleton.h>

namespace noe
{

//-----------------------------------------------------------------------------
/// Gamepad button enumeration
enum GAMEPAD_BUTTON_ID
{
	GAMEPAD_BUTTON_1,
	GAMEPAD_BUTTON_2,
	GAMEPAD_BUTTON_3,
	GAMEPAD_BUTTON_4,
	GAMEPAD_BUTTON_5,
	GAMEPAD_BUTTON_6,
	GAMEPAD_BUTTON_7,
	GAMEPAD_BUTTON_8,
	GAMEPAD_BUTTON_9,
	GAMEPAD_BUTTON_10,
	GAMEPAD_BUTTON_11,
	GAMEPAD_BUTTON_12,
	GAMEPAD_BUTTON_13,
	GAMEPAD_BUTTON_14,
	GAMEPAD_BUTTON_15,
	GAMEPAD_BUTTON_16,
	GAMEPAD_BUTTON_17,
	GAMEPAD_BUTTON_18,
	GAMEPAD_BUTTON_19,
	GAMEPAD_BUTTON_21,
	GAMEPAD_BUTTON_22,
	GAMEPAD_BUTTON_23,
	GAMEPAD_BUTTON_24,
	GAMEPAD_BUTTON_25,
	GAMEPAD_BUTTON_26,
	GAMEPAD_BUTTON_27,
	GAMEPAD_BUTTON_28,
	GAMEPAD_BUTTON_29,
	GAMEPAD_BUTTON_30,
	GAMEPAD_BUTTON_31,
	GAMEPAD_BUTTON_32,
	GAMEPAD_THUMB1_UP,
	GAMEPAD_THUMB1_DOWN,
	GAMEPAD_THUMB1_LEFT,
	GAMEPAD_THUMB1_RIGHT,
	GAMEPAD_THUMB2_UP,
	GAMEPAD_THUMB2_DOWN,
	GAMEPAD_THUMB2_LEFT,
	GAMEPAD_THUMB2_RIGHT,
	KEYBOARD_KEY,
};

//-----------------------------------------------------------------------------
/// Input list enumeration
enum INPUT_ID
{
    // Full name
    GAMEPAD_1 = 0,                  // 0
    GAMEPAD_2,                      // 1
    GAMEPAD_3,                      // 2
    GAMEPAD_4,                      // 3
    GAMEPAD_MAX,
    KEYBOARD_1 = GAMEPAD_MAX,   // 4
    INPUT_MAX,
    INPUT_NONE,
};

//-----------------------------------------------------------------------------
/// Virtual input button enumeration
enum BUTTON_ID
{
	BUTTON_NONE = NONE,
	// Standard buttons
	BUTTON_1 = 0,
	BUTTON_2,
	BUTTON_3,
	BUTTON_4,
	BUTTON_5,
	BUTTON_6,
	BUTTON_7,
	BUTTON_8,
	BUTTON_9,
	BUTTON_10,
	BUTTON_11,
	BUTTON_12,
	BUTTON_13,
	BUTTON_14,
	BUTTON_15,
	BUTTON_16,
	// Standard buttons
	BUTTON_A,
	BUTTON_B,
	BUTTON_C,
	BUTTON_D,
	BUTTON_X,
	BUTTON_Y,
	BUTTON_Z,
	// Specials buttons
	BUTTON_START,
	BUTTON_SELECT,
	BUTTON_BACK,
	BUTTON_WHITE,
	BUTTON_BLACK,
	BUTTON_FORWARD,
	BUTTON_BACKWARD,
	// Triggers
	TRIGGER_L_1,
	TRIGGER_L_2,
	TRIGGER_L_3,
	TRIGGER_R_1,
	TRIGGER_R_2,
	TRIGGER_R_3,
	// Thumbs
	THUMB_L_BUTTON,
	THUMB_L_UP,
	THUMB_L_RIGHT,
	THUMB_L_DOWN,
	THUMB_L_LEFT,
	THUMB_R_BUTTON,
	THUMB_R_UP,
	THUMB_R_RIGHT,
	THUMB_R_DOWN,
	THUMB_R_LEFT,
	// Cross
	CROSS_L_UP,
	CROSS_L_RIGHT,
	CROSS_L_DOWN,
	CROSS_L_LEFT,
	CROSS_R_UP,
	CROSS_R_RIGHT,
	CROSS_R_DOWN,
	CROSS_R_LEFT,
	BUTTON_MAX,
};

//-----------------------------------------------------------------------------
/// Input configuration enumeration
enum INPUT_CONFIG_ID
{
    // Short name
    INPUT_CONFIG_1 = 0,
    INPUT_CONFIG_2,
    INPUT_CONFIG_3,
    INPUT_CONFIG_4,
    INPUT_CONFIG_5,
    INPUT_CONFIG_6,
    INPUT_CONFIG_7,
    INPUT_CONFIG_8,
    INPUT_CONFIG_DEFAULT,
    INPUT_CONFIG_MAX,
};

//-----------------------------------------------------------------------------
/// Input configuration structure
struct INPUT_CONFIG
{
    u32 input;
    u32 key[BUTTON_MAX];

};

//-----------------------------------------------------------------------------
/// Gamepad data structure
typedef struct tag_GAMEPAD_DATA
{
    LPDIRECTINPUTDEVICE8 device;
    DIDEVCAPS            capabilitie;
    DIJOYSTATE2          state;
    DIJOYSTATE2          previous;

} GAMEPAD_DATA, *LPGAMEPAD_DATA;

//-----------------------------------------------------------------------------
/**
 * Input manager class.
 */
class Input: public Singleton<Input>
{
protected:

	INPUT_CONFIG m_InputConfig[INPUT_CONFIG_MAX]; ///< Configuration list
	GAMEPAD_DATA m_Gamepad[GAMEPAD_MAX]; ///< Gamepad list
	i32          m_Number; ///< Number of active gamepad

	IDirectInputDevice8* m_Keyboard; ///< Keboard interface
	u8          m_KbState[256]; ///< Keys current state
	u8          m_KbPrevious[256]; ///< Keys previous state
	u32         m_CharRead;

	u32  PressedSys(u32 input, void* state); // Get a system button pressing value
	BOOL IsPressSys(u32 btn, u32 input, void* state); // Tell if a system button is pressed

public: //intern:

	static IDirectInput8*       m_pDI;                       ///< DirectInput interface
	static IDirectInputDevice8* m_JoystickList[GAMEPAD_MAX]; ///< Gamepad interfaces
	static u32                  m_JoystickNum;               ///< Gamepad number

public:

	~Input(); // Default destructor

	BOOL Initialize(); // Initialize input manager library
	BOOL Process();    // Process input manager library update
	BOOL Release();    // Release input manager library

	// buttons check
	BOOL IsDown(u32 cfg, u32 btn);  // Tell is a given button was pressed
	BOOL IsPress(u32 cfg, u32 btn); // Tell is a given button is pressed
	BOOL IsUp(u32 cfg, u32 btn);    // Tell is a given button was release

	// default configuration buttons check
	BOOL IsDown(u32 btn);  // Tell is a given button was pressed
	BOOL IsPress(u32 btn); // Tell is a given button is pressed
	BOOL IsUp(u32 btn);	   // Tell is a given button was release

	u32  Pressed(u32 cfg=INPUT_CONFIG_DEFAULT); // Get the pressed button (if any) on the given device.
	
	void ClearButton(u32 cfg, u32 btn = BUTTON_NONE); // Remove a button to the gaven configuration.
	BOOL ScanButton(u32 cfg, u32 btn);                // Scan a button from the input device and set it to the selected button.
	void SwapButton(u32 cfg, u32 b1, u32 b2);         // Swap two buttons id.

	c8   GetChar(u32 cfg=INPUT_CONFIG_DEFAULT); // Get a typed character
};

/// Input manager instance
#define InputInstance Input::Instance()

} // namespace noe