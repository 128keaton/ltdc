/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Input manager
 * @file           input.cpp
 * @package        noe
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

// noe
#include <noe/noe.h>
#include <noe/input.h>

namespace noe
{

extern c8   g_CharBuffer[];
extern u32  g_CharNumber;

//-----------------------------------------------------------------------------
// D E F I N E S

#define DEAD_ZONE	5000 //   /32765

//-----------------------------------------------------------------------------
// C A L L B A C K   F U N C T I O N 

IDirectInput8*       Input::m_pDI = NULL;
IDirectInputDevice8* Input::m_JoystickList[GAMEPAD_MAX];
u32                  Input::m_JoystickNum = 0;

//-----------------------------------------------------------------------------
/**
 * Callback function for joystick enumeration.
 * @param          pdidInstance        Pointer to device instance
 * @param          pContext            Pointer to context information
 * @retval         DIENUM_CONTINUE     Continue the enumeration
 * @retval         DIENUM_STOP         Stop the enumeration
 */
int CALLBACK EnumJoysticksCallback(const DIDEVICEINSTANCE* pdidInstance, void* pContext)
{
	LPDIRECTINPUTDEVICE8 pJoystick;

	if(FAILED(Input::m_pDI->CreateDevice(pdidInstance->guidInstance, &pJoystick, NULL)))
		return DIENUM_CONTINUE;

	Input::m_JoystickList[Input::m_JoystickNum] = pJoystick;
	Input::m_JoystickNum++;

	if(Input::m_JoystickNum >= GAMEPAD_MAX)
		return DIENUM_STOP;

	return DIENUM_CONTINUE;
}

//-----------------------------------------------------------------------------
/**
 * Callback function for object enumeration.
 * @param          pdidoi              Pointer to object instance
 * @param          pContext            Pointer to context information
 * @retval         DIENUM_CONTINUE     Continue the enumeration
 * @retval         DIENUM_STOP         Stop the enumeration
 */
int CALLBACK EnumObjectsCallback(const DIDEVICEOBJECTINSTANCE* pdidoi, void* pContext)
{
	LPDIRECTINPUTDEVICE8 pJoystick = (LPDIRECTINPUTDEVICE8)pContext;

	if(pdidoi->dwType & DIDFT_AXIS)
	{
		DIPROPRANGE diprg; 
		diprg.diph.dwSize       = sizeof(DIPROPRANGE); 
		diprg.diph.dwHeaderSize = sizeof(DIPROPHEADER); 
		diprg.diph.dwHow        = DIPH_BYID; 
		diprg.diph.dwObj        = pdidoi->dwType; // Specify the enumerated axis
		diprg.lMin              = Min<s16>();
		diprg.lMax              = Max<s16>();

		if(FAILED(pJoystick->SetProperty(DIPROP_RANGE, &diprg.diph))) 
			return DIENUM_STOP;         
	}
	return DIENUM_CONTINUE;
}

//-----------------------------------------------------------------------------
/**
 * Destructor
 */
Input::~Input()
{
	Release();
}

//-----------------------------------------------------------------------------
/**
 * Initialize the input library.
 * @return					TRUE if initialize was successful.
 */
BOOL Input::Initialize()
{
	BOOL ret = TRUE;
	i32 i;

	// Initialize devices
	m_pDI = NULL;
	loop(j, GAMEPAD_MAX)
		m_JoystickList[j] = NULL;
	m_Keyboard = NULL;

	if(FAILED(DirectInput8Create(GetModuleHandle(NULL), DIRECTINPUT_VERSION, IID_IDirectInput8, (void**)&m_pDI, NULL)))
		return FALSE;

	if(FAILED(m_pDI->EnumDevices(DI8DEVCLASS_GAMECTRL, EnumJoysticksCallback, NULL, DIEDFL_ATTACHEDONLY)))
		return FALSE;
	
	// Now executing the callback function : EnumJoysticksCallback(pdidInstance, pContext);

	if(m_JoystickNum == 0) // No joystick founded !
		ret = FALSE;

	m_Number = m_JoystickNum;
	for(i=0; i<m_Number; i++)
	{
		m_Gamepad[i].device = m_JoystickList[i];

		if(FAILED(m_Gamepad[i].device->SetDataFormat(&c_dfDIJoystick2)))
			return FALSE;
        
		if(FAILED(m_Gamepad[i].device->SetCooperativeLevel(WindowInstance.m_Handle, DISCL_EXCLUSIVE | DISCL_FOREGROUND)))
			return FALSE;

		m_Gamepad[i].capabilitie.dwSize = sizeof(DIDEVCAPS);
		if(FAILED(m_Gamepad[i].device->GetCapabilities(&m_Gamepad[i].capabilitie)))
			return FALSE;

		if(FAILED(m_Gamepad[i].device->EnumObjects(EnumObjectsCallback, m_Gamepad[i].device, DIDFT_ALL)))
			return FALSE;

		// Now executing the callback function : EnumObjectsCallback(pdidoi, pContext)
		ZeroMemory(&m_Gamepad[i].previous, sizeof(DIJOYSTATE2));
		ZeroMemory(&m_Gamepad[i].state, sizeof(DIJOYSTATE2));
	}
	for(i=m_Number; i<GAMEPAD_MAX; i++)
	{
		ZeroMemory(&m_Gamepad[i].previous, sizeof(DIJOYSTATE2));
		ZeroMemory(&m_Gamepad[i].state, sizeof(DIJOYSTATE2));
	}
    
	//Default setting
	m_InputConfig[INPUT_CONFIG_DEFAULT].input = KEYBOARD_1;

	m_InputConfig[INPUT_CONFIG_DEFAULT].key[BUTTON_1]        = KEYBOARD_KEY + 0x02; // 1
	m_InputConfig[INPUT_CONFIG_DEFAULT].key[BUTTON_2]        = KEYBOARD_KEY + 0x03; // 2
	m_InputConfig[INPUT_CONFIG_DEFAULT].key[BUTTON_3]        = KEYBOARD_KEY + 0x04; // 3
	m_InputConfig[INPUT_CONFIG_DEFAULT].key[BUTTON_4]        = KEYBOARD_KEY + 0x05; // 4
	m_InputConfig[INPUT_CONFIG_DEFAULT].key[BUTTON_5]        = KEYBOARD_KEY + 0x10; // Q
	m_InputConfig[INPUT_CONFIG_DEFAULT].key[BUTTON_6]        = KEYBOARD_KEY + 0x11; // W
	m_InputConfig[INPUT_CONFIG_DEFAULT].key[BUTTON_7]        = KEYBOARD_KEY + 0x12; // E
	m_InputConfig[INPUT_CONFIG_DEFAULT].key[BUTTON_8]        = KEYBOARD_KEY + 0x13; // R
	m_InputConfig[INPUT_CONFIG_DEFAULT].key[BUTTON_9]        = KEYBOARD_KEY + 0x1e; // A
	m_InputConfig[INPUT_CONFIG_DEFAULT].key[BUTTON_10]       = KEYBOARD_KEY + 0x1f; // S
	m_InputConfig[INPUT_CONFIG_DEFAULT].key[BUTTON_11]       = KEYBOARD_KEY + 0x20; // D
	m_InputConfig[INPUT_CONFIG_DEFAULT].key[BUTTON_12]       = KEYBOARD_KEY + 0x21; // F
	m_InputConfig[INPUT_CONFIG_DEFAULT].key[BUTTON_13]       = KEYBOARD_KEY + 0x2c; // Z
	m_InputConfig[INPUT_CONFIG_DEFAULT].key[BUTTON_14]       = KEYBOARD_KEY + 0x2d; // X
	m_InputConfig[INPUT_CONFIG_DEFAULT].key[BUTTON_15]       = KEYBOARD_KEY + 0x2e; // C
	m_InputConfig[INPUT_CONFIG_DEFAULT].key[BUTTON_16]       = KEYBOARD_KEY + 0x2f; // V
	m_InputConfig[INPUT_CONFIG_DEFAULT].key[BUTTON_A]        = KEYBOARD_KEY + 0x10; // Q  
	m_InputConfig[INPUT_CONFIG_DEFAULT].key[BUTTON_B]        = KEYBOARD_KEY + 0x11; // W  
	m_InputConfig[INPUT_CONFIG_DEFAULT].key[BUTTON_C]        = KEYBOARD_KEY + 0x12; // E           
	m_InputConfig[INPUT_CONFIG_DEFAULT].key[BUTTON_D]        = KEYBOARD_KEY + 0x13; // R           
	m_InputConfig[INPUT_CONFIG_DEFAULT].key[BUTTON_X]        = KEYBOARD_KEY + 0x1e; // A         
	m_InputConfig[INPUT_CONFIG_DEFAULT].key[BUTTON_Y]        = KEYBOARD_KEY + 0x1f; // S         
	m_InputConfig[INPUT_CONFIG_DEFAULT].key[BUTTON_Z]        = KEYBOARD_KEY + 0x20; // D         
	m_InputConfig[INPUT_CONFIG_DEFAULT].key[BUTTON_START]    = KEYBOARD_KEY + 0x1c; // ENTER          
	m_InputConfig[INPUT_CONFIG_DEFAULT].key[BUTTON_SELECT]   = KEYBOARD_KEY + 0x39; // SPACE
	m_InputConfig[INPUT_CONFIG_DEFAULT].key[BUTTON_BACK]     = KEYBOARD_KEY + 0x0e; // BACK SPACE
	m_InputConfig[INPUT_CONFIG_DEFAULT].key[BUTTON_WHITE]    = KEYBOARD_KEY + 0x2c; // Z    
	m_InputConfig[INPUT_CONFIG_DEFAULT].key[BUTTON_BLACK]    = KEYBOARD_KEY + 0x2d; // X    
	m_InputConfig[INPUT_CONFIG_DEFAULT].key[BUTTON_FORWARD]  = KEYBOARD_KEY + 0xcd; // RIGHT
	m_InputConfig[INPUT_CONFIG_DEFAULT].key[BUTTON_BACKWARD] = KEYBOARD_KEY + 0xcb; // LEFT
	m_InputConfig[INPUT_CONFIG_DEFAULT].key[TRIGGER_L_1]     = KEYBOARD_KEY + 0x2a; // L SHIFT
	m_InputConfig[INPUT_CONFIG_DEFAULT].key[TRIGGER_L_2]     = KEYBOARD_KEY + 0x1d; // L CTRL
	m_InputConfig[INPUT_CONFIG_DEFAULT].key[TRIGGER_R_1]     = KEYBOARD_KEY + 0x36; // R SHIFT
	m_InputConfig[INPUT_CONFIG_DEFAULT].key[TRIGGER_R_2]     = KEYBOARD_KEY + 0x9d; // R CTRL
	m_InputConfig[INPUT_CONFIG_DEFAULT].key[THUMB_L_BUTTON]  = BUTTON_NONE;
	m_InputConfig[INPUT_CONFIG_DEFAULT].key[THUMB_L_UP]      = KEYBOARD_KEY + 0xc8; // UP
	m_InputConfig[INPUT_CONFIG_DEFAULT].key[THUMB_L_RIGHT]   = KEYBOARD_KEY + 0xcd; // RIGHT
	m_InputConfig[INPUT_CONFIG_DEFAULT].key[THUMB_L_DOWN]    = KEYBOARD_KEY + 0xd0; // DOWN
	m_InputConfig[INPUT_CONFIG_DEFAULT].key[THUMB_L_LEFT]    = KEYBOARD_KEY + 0xcb; // LEFT
	m_InputConfig[INPUT_CONFIG_DEFAULT].key[THUMB_R_BUTTON]  = BUTTON_NONE;
	m_InputConfig[INPUT_CONFIG_DEFAULT].key[THUMB_R_UP]      = KEYBOARD_KEY + 0x11; // W
	m_InputConfig[INPUT_CONFIG_DEFAULT].key[THUMB_R_RIGHT]   = KEYBOARD_KEY + 0x20; // D
	m_InputConfig[INPUT_CONFIG_DEFAULT].key[THUMB_R_DOWN]    = KEYBOARD_KEY + 0x1f; // S
	m_InputConfig[INPUT_CONFIG_DEFAULT].key[THUMB_R_LEFT]    = KEYBOARD_KEY + 0x1e; // A
	m_InputConfig[INPUT_CONFIG_DEFAULT].key[CROSS_L_UP]      = KEYBOARD_KEY + 0xc8; // UP      
	m_InputConfig[INPUT_CONFIG_DEFAULT].key[CROSS_L_RIGHT]   = KEYBOARD_KEY + 0xcd; // RIGHT   
	m_InputConfig[INPUT_CONFIG_DEFAULT].key[CROSS_L_DOWN]    = KEYBOARD_KEY + 0xd0; // DOWN    
	m_InputConfig[INPUT_CONFIG_DEFAULT].key[CROSS_L_LEFT]    = KEYBOARD_KEY + 0xcb; // LEFT    
	m_InputConfig[INPUT_CONFIG_DEFAULT].key[CROSS_R_UP]      = KEYBOARD_KEY + 0x11; // W      
	m_InputConfig[INPUT_CONFIG_DEFAULT].key[CROSS_R_RIGHT]   = KEYBOARD_KEY + 0x20; // D      
	m_InputConfig[INPUT_CONFIG_DEFAULT].key[CROSS_R_DOWN]    = KEYBOARD_KEY + 0x1f; // S      
	m_InputConfig[INPUT_CONFIG_DEFAULT].key[CROSS_R_LEFT]    = KEYBOARD_KEY + 0x1e; // A      

	// Standard buttons
	u32 cpt=0;
	for(u32 cfg=INPUT_CONFIG_1; cfg<INPUT_CONFIG_DEFAULT; cfg++)
	{
		m_InputConfig[cfg].input = GAMEPAD_1 + cpt++;

		m_InputConfig[cfg].key[BUTTON_1]         = GAMEPAD_BUTTON_1;
		m_InputConfig[cfg].key[BUTTON_2]         = GAMEPAD_BUTTON_2;
		m_InputConfig[cfg].key[BUTTON_3]         = GAMEPAD_BUTTON_3;
		m_InputConfig[cfg].key[BUTTON_4]         = GAMEPAD_BUTTON_4;
		m_InputConfig[cfg].key[BUTTON_5]         = GAMEPAD_BUTTON_5;
		m_InputConfig[cfg].key[BUTTON_6]         = GAMEPAD_BUTTON_6;
		m_InputConfig[cfg].key[BUTTON_7]         = GAMEPAD_BUTTON_7;
		m_InputConfig[cfg].key[BUTTON_8]         = GAMEPAD_BUTTON_8;
		m_InputConfig[cfg].key[BUTTON_9]         = GAMEPAD_BUTTON_9;
		m_InputConfig[cfg].key[BUTTON_10]        = GAMEPAD_BUTTON_10;
		m_InputConfig[cfg].key[BUTTON_11]        = GAMEPAD_BUTTON_11;
		m_InputConfig[cfg].key[BUTTON_12]        = GAMEPAD_BUTTON_12;
		m_InputConfig[cfg].key[BUTTON_13]        = GAMEPAD_BUTTON_13;
		m_InputConfig[cfg].key[BUTTON_14]        = GAMEPAD_BUTTON_14;
		m_InputConfig[cfg].key[BUTTON_15]        = GAMEPAD_BUTTON_15;
		m_InputConfig[cfg].key[BUTTON_16]        = GAMEPAD_BUTTON_16;
		m_InputConfig[cfg].key[BUTTON_A]         = BUTTON_NONE;
		m_InputConfig[cfg].key[BUTTON_B]         = BUTTON_NONE;
		m_InputConfig[cfg].key[BUTTON_C]         = BUTTON_NONE;
		m_InputConfig[cfg].key[BUTTON_D]         = BUTTON_NONE;
		m_InputConfig[cfg].key[BUTTON_X]         = BUTTON_NONE;
		m_InputConfig[cfg].key[BUTTON_Y]         = BUTTON_NONE;
		m_InputConfig[cfg].key[BUTTON_Z]         = BUTTON_NONE;
		m_InputConfig[cfg].key[BUTTON_START]     = GAMEPAD_BUTTON_10;
		m_InputConfig[cfg].key[BUTTON_SELECT]    = GAMEPAD_BUTTON_9;
		m_InputConfig[cfg].key[BUTTON_BACK]      = GAMEPAD_BUTTON_9;
		m_InputConfig[cfg].key[BUTTON_WHITE]     = GAMEPAD_BUTTON_6;
		m_InputConfig[cfg].key[BUTTON_BLACK]     = GAMEPAD_BUTTON_3;
		m_InputConfig[cfg].key[BUTTON_FORWARD]   = GAMEPAD_THUMB1_LEFT;
		m_InputConfig[cfg].key[BUTTON_BACKWARD]  = GAMEPAD_THUMB1_RIGHT;
		m_InputConfig[cfg].key[TRIGGER_L_1]      = GAMEPAD_BUTTON_7;
		m_InputConfig[cfg].key[TRIGGER_L_2]      = BUTTON_NONE;
		m_InputConfig[cfg].key[TRIGGER_R_1]      = GAMEPAD_BUTTON_8;
		m_InputConfig[cfg].key[TRIGGER_R_2]      = BUTTON_NONE;
		m_InputConfig[cfg].key[THUMB_L_BUTTON]   = BUTTON_NONE;
		m_InputConfig[cfg].key[THUMB_L_UP]       = GAMEPAD_THUMB1_UP;
		m_InputConfig[cfg].key[THUMB_L_RIGHT]    = GAMEPAD_THUMB1_DOWN;
		m_InputConfig[cfg].key[THUMB_L_DOWN]     = GAMEPAD_THUMB1_LEFT;
		m_InputConfig[cfg].key[THUMB_L_LEFT]     = GAMEPAD_THUMB1_RIGHT;
		m_InputConfig[cfg].key[THUMB_R_BUTTON]   = BUTTON_NONE;
		m_InputConfig[cfg].key[THUMB_R_UP]       = GAMEPAD_THUMB2_UP;
		m_InputConfig[cfg].key[THUMB_R_RIGHT]    = GAMEPAD_THUMB2_DOWN;
		m_InputConfig[cfg].key[THUMB_R_DOWN]     = GAMEPAD_THUMB2_LEFT;
		m_InputConfig[cfg].key[THUMB_R_LEFT]     = GAMEPAD_THUMB2_RIGHT;
		m_InputConfig[cfg].key[CROSS_L_UP]       = GAMEPAD_THUMB1_UP;
		m_InputConfig[cfg].key[CROSS_L_DOWN]     = GAMEPAD_THUMB1_DOWN;
		m_InputConfig[cfg].key[CROSS_L_LEFT]     = GAMEPAD_THUMB1_LEFT;
		m_InputConfig[cfg].key[CROSS_L_RIGHT]    = GAMEPAD_THUMB1_RIGHT;
		m_InputConfig[cfg].key[CROSS_R_UP]       = GAMEPAD_BUTTON_5;
		m_InputConfig[cfg].key[CROSS_R_RIGHT]    = GAMEPAD_BUTTON_2;
		m_InputConfig[cfg].key[CROSS_R_DOWN]     = GAMEPAD_BUTTON_1;
		m_InputConfig[cfg].key[CROSS_R_LEFT]     = GAMEPAD_BUTTON_4;
	}

	// KEYBOARD
	m_Keyboard = NULL;

	if(FAILED(m_pDI->CreateDevice(GUID_SysKeyboard, &m_Keyboard, NULL)))
		return FALSE;

	if(FAILED(m_Keyboard->SetDataFormat(&c_dfDIKeyboard)))
		return FALSE;

	// Set the cooperativity level to let DirectInput know how this device should interact with the system and with other DirectInput applications.
	m_Keyboard->SetCooperativeLevel(WindowInstance.m_Handle, DISCL_NONEXCLUSIVE | DISCL_FOREGROUND);

	// Acquire the newly created device
	m_Keyboard->Acquire();

	return TRUE;
}

//-----------------------------------------------------------------------------
/**
 * Release the input library.
 * @return					TRUE if release was successful.
 */
BOOL Input::Release()
{
	if(m_pDI)
	{
		m_pDI->Release();
		m_pDI = NULL;
	}
	loop(i, scast<i32>(m_JoystickNum))
	{
		if(m_JoystickList[i])
		{
			m_JoystickList[i]->Release();
			m_JoystickList[i] = NULL;
		}
	}
	if(m_Keyboard)
	{
		m_Keyboard->Release();
		m_Keyboard = NULL;
	}
	return TRUE;
}

//-----------------------------------------------------------------------------
/**
 * Process the input library.
 * @return					TRUE if process was successful.
 */
BOOL Input::Process()
{
	BOOL ret = TRUE;

	g_CharNumber = 0;
	m_CharRead = 0;

	loop(i, m_Number)
	{
		if(m_Gamepad[i].device)
		{
			m_Gamepad[i].previous = m_Gamepad[i].state;

			if(FAILED(m_Gamepad[i].device->GetDeviceState(sizeof(DIJOYSTATE2), &m_Gamepad[i].state)))
			{
				ZeroMemory(&m_Gamepad[i].state, sizeof(DIJOYSTATE2));
				m_Gamepad[i].device->Acquire();
				ret = FALSE; 
			}
		}
	}

	if(m_Keyboard) 
	{
		memcpy(m_KbPrevious, m_KbState, sizeof(m_KbState));

		if(FAILED(m_Keyboard->GetDeviceState(sizeof(m_KbState), &m_KbState)))
		{
			ZeroMemory(&m_KbState, sizeof(m_KbState)); // Get the input's device state, and put the state in dims
			m_Keyboard->Acquire();
			ret = FALSE;
		}
	}
    
	return ret;
}

//-----------------------------------------------------------------------------
/**
 * Get the pressed button (if any) on the given device.
 * @param	input			Input device id.
 * @param	state			State of the given device.
 * @return					The pressed button if any, then BUTTON_NONE.
 */
u32 Input::PressedSys(u32 input, void* state)
{
	switch(input)
	{
		case KEYBOARD_1:
		{
			for(u32 i=0; i<256; i++)
				if(((u8*)state)[i] & 0x80)
					return KEYBOARD_KEY + i;
		}
		break;

		case GAMEPAD_1:
		case GAMEPAD_2:
		case GAMEPAD_3:
		case GAMEPAD_4:
		{
			for(u32 btn = GAMEPAD_BUTTON_1; btn<=GAMEPAD_BUTTON_32; btn++)
				if(((DIJOYSTATE2*)state)->rgbButtons[btn])
					return btn;

			if(((DIJOYSTATE2*)state)->lY < -DEAD_ZONE)
				return GAMEPAD_THUMB1_UP;
    
			if(((DIJOYSTATE2*)state)->lY > DEAD_ZONE)
				return GAMEPAD_THUMB1_DOWN;

			if(((DIJOYSTATE2*)state)->lX < -DEAD_ZONE)
				return GAMEPAD_THUMB1_LEFT;

			if(((DIJOYSTATE2*)state)->lX > DEAD_ZONE)
				return GAMEPAD_THUMB1_RIGHT;
		}
		break;
	}

	return BUTTON_NONE;
}

//-----------------------------------------------------------------------------
/**
 * Test if a button was pressed.
 * @param	btn			Button id to check.
 * @param	input			Input device id.
 * @param	state			State of the given device.
 * @return					TRUE if the button was just pressed.
 */
BOOL Input::IsPressSys(u32 btn, u32 input, void* state)
{
	switch(input)
	{
		case KEYBOARD_1:
		{
			if(btn >= KEYBOARD_KEY)
				return (((u8*)state)[btn-KEYBOARD_KEY] & 0x80);
		}
		break;
    
		case GAMEPAD_1:
		case GAMEPAD_2:
		case GAMEPAD_3:
		case GAMEPAD_4:
		{
			if((btn >= GAMEPAD_BUTTON_1) && (btn <=GAMEPAD_BUTTON_32))
				return ((DIJOYSTATE2*)state)->rgbButtons[btn] ? TRUE : FALSE;

			if(btn == GAMEPAD_THUMB1_UP)
				return ((DIJOYSTATE2*)state)->lY < -DEAD_ZONE ? TRUE : FALSE;

			if(btn == GAMEPAD_THUMB1_DOWN)
				return ((DIJOYSTATE2*)state)->lY > DEAD_ZONE ? TRUE : FALSE;

			if(btn == GAMEPAD_THUMB1_LEFT)
				return ((DIJOYSTATE2*)state)->lX < -DEAD_ZONE ? TRUE : FALSE;

			if(btn == GAMEPAD_THUMB1_RIGHT)
				return ((DIJOYSTATE2*)state)->lX > DEAD_ZONE ? TRUE : FALSE;
		}
		break;
	}

	return FALSE;
}

//-----------------------------------------------------------------------------
/**
 * Remove a button to the gaven configuration.
 * @param	cfg			Configuration to update.
 * @param	btn			Button to remove (if BUTTON_NONE then all buttons are removed).
 */
void Input::ClearButton(u32 cfg, u32 btn)
{
    if(btn == BUTTON_NONE)
    {
        for(u32 i=0; i<BUTTON_MAX; i++)
            m_InputConfig[cfg].key[i] = BUTTON_NONE;
    }
    else
        m_InputConfig[cfg].key[btn] = BUTTON_NONE;
}

//-----------------------------------------------------------------------------
/**
 * Check if a given button is actually pressed.
 * @param	cfg			Configuration to test.
 * @param	btn			Button to test.
 * @return					TRUE if the button is actually pressed.
 */
BOOL Input::IsPress(u32 cfg, u32 btn)
{
    if(cfg >= INPUT_CONFIG_MAX)
        return FALSE;

    switch(m_InputConfig[cfg].input)
    {
        case KEYBOARD_1:
        {
            return IsPressSys(m_InputConfig[cfg].key[btn], m_InputConfig[cfg].input, m_KbState);
        }
        break;
    
        case GAMEPAD_1:
        case GAMEPAD_2:
        case GAMEPAD_3:
        case GAMEPAD_4:
        {
            return IsPressSys(m_InputConfig[cfg].key[btn], m_InputConfig[cfg].input, &m_Gamepad[m_InputConfig[cfg].input].state);
        }
        break;
    }

    return FALSE;
}

//-----------------------------------------------------------------------------
/**
 * Check if a given button was just pressed.
 * @param	cfg			Configuration to test.
 * @param	btn			Button to test.
 * @return					TRUE if the button was just pressed.
 */
BOOL Input::IsDown(u32 cfg, u32 btn)
{
    if(cfg >= INPUT_CONFIG_MAX)
        return FALSE;

    switch(m_InputConfig[cfg].input)
    {
        case KEYBOARD_1:
        {
            return IsPressSys(m_InputConfig[cfg].key[btn], m_InputConfig[cfg].input, m_KbState)
                && !IsPressSys(m_InputConfig[cfg].key[btn], m_InputConfig[cfg].input, m_KbPrevious);
        }
        break;
    
        case GAMEPAD_1:
        case GAMEPAD_2:
        case GAMEPAD_3:
        case GAMEPAD_4:
        {
            return IsPressSys(m_InputConfig[cfg].key[btn], m_InputConfig[cfg].input, &m_Gamepad[m_InputConfig[cfg].input].state)
                && !IsPressSys(m_InputConfig[cfg].key[btn], m_InputConfig[cfg].input, &m_Gamepad[m_InputConfig[cfg].input].previous);
        }
        break;
    }

    return FALSE;
}

//-----------------------------------------------------------------------------
/**
 * Check if a given button was just released.
 * @param	cfg			Configuration to test.
 * @param	btn			Button to test.
 * @return					TRUE if the button was just released.
 */
BOOL Input::IsUp(u32 cfg, u32 btn)
{
    if(cfg >= INPUT_CONFIG_MAX)
        return FALSE;

    switch(m_InputConfig[cfg].input)
    {
        case KEYBOARD_1:
        {
            return !IsPressSys(m_InputConfig[cfg].key[btn], m_InputConfig[cfg].input, m_KbState)
                && IsPressSys(m_InputConfig[cfg].key[btn], m_InputConfig[cfg].input, m_KbPrevious);
        }
        break;
    
        case GAMEPAD_1:
        case GAMEPAD_2:
        case GAMEPAD_3:
        case GAMEPAD_4:
        {
            return !IsPressSys(m_InputConfig[cfg].key[btn], m_InputConfig[cfg].input, &m_Gamepad[m_InputConfig[cfg].input].state)
                && IsPressSys(m_InputConfig[cfg].key[btn], m_InputConfig[cfg].input, &m_Gamepad[m_InputConfig[cfg].input].previous);
        }
        break;
    }

    return FALSE;
}

//-----------------------------------------------------------------------------
/**
 * Get the pressed button (if any) on the given device.
 * @param	cfg			Configuration to test.
 * @return					The pressed button if any, then BUTTON_NONE.
 */
u32 Input::Pressed(u32 cfg)
{
    if(cfg >= INPUT_CONFIG_MAX)
        return FALSE;

    u32 sys_btn = BUTTON_NONE;
    switch(m_InputConfig[cfg].input)
    {
        case KEYBOARD_1:
        {
            sys_btn = PressedSys(m_InputConfig[cfg].input, m_KbState);
        }
        break;
    
        case GAMEPAD_1:
        case GAMEPAD_2:
        case GAMEPAD_3:
        case GAMEPAD_4:
        {
            sys_btn = PressedSys(m_InputConfig[cfg].input, &m_Gamepad[m_InputConfig[cfg].input].state);
        }
        break;
    }
    if(sys_btn != BUTTON_NONE)
        return m_InputConfig[cfg].key[sys_btn];    

    return BUTTON_NONE;
}

//-----------------------------------------------------------------------------
/**
 * Scan a button from the input device and set it to the selected button.
 * @param	cfg			Configuration to test.
 * @param	btn			Button to test.
 * @return					TRUE if the scan succeed.
 */
BOOL Input::ScanButton(u32 cfg, u32 btn)
{
    if(cfg >= INPUT_CONFIG_MAX || btn >= BUTTON_MAX)
        return FALSE;

    u32 sys_btn = BUTTON_NONE;
    switch(m_InputConfig[cfg].input)
    {
        case KEYBOARD_1:
        {
            if(sys_btn = PressedSys(m_InputConfig[cfg].input, m_KbState) == BUTTON_NONE)
                return FALSE;
            if(IsPressSys(sys_btn, m_InputConfig[cfg].input, m_KbPrevious))
                return FALSE;
        }
        break;
    
        case GAMEPAD_1:
        case GAMEPAD_2:
        case GAMEPAD_3:
        case GAMEPAD_4:
        {
            if(sys_btn = PressedSys(m_InputConfig[cfg].input, &m_Gamepad[m_InputConfig[cfg].input].state) == BUTTON_NONE)
                return FALSE;
            if(IsPressSys(sys_btn, m_InputConfig[cfg].input, &m_Gamepad[m_InputConfig[cfg].input].previous))
                return FALSE;
        }
        break;
    }

    m_InputConfig[cfg].key[btn] = sys_btn;
    return TRUE;
}

//-----------------------------------------------------------------------------
/**
 * Swap two buttons id.
 * @param	cfg			Configuration to test.
 * @param	b1				First button to swap.
 * @param	b2				Second button to swap.
 * @return					TRUE if the scan succeed.
 */
void Input::SwapButton(u32 cfg, u32 b1, u32 b2)
{
    u32 temp = m_InputConfig[cfg].key[b1];
    m_InputConfig[cfg].key[b1] = m_InputConfig[cfg].key[b2];
    m_InputConfig[cfg].key[b2] = temp;
}

//-----------------------------------------------------------------------------
/**
 * Get a typed character
 * @param	cfg			The input configuration to test.
 * @return					The push letter or 0 if none
 */
c8 Input::GetChar(u32 cfg)
{
    if(cfg >= INPUT_CONFIG_MAX || m_CharRead >= g_CharNumber)
        return 0;

    if(m_InputConfig[cfg].input != KEYBOARD_1)
        return 0;

    return g_CharBuffer[m_CharRead++];
}

//-----------------------------------------------------------------------------
/**
 * Check if a given button was just pressed on the default configuration.
 * @param	btn			Button to test.
 * @return					TRUE if the button was just pressed.
 */
BOOL Input::IsDown(u32 btn)  
{ 
	return IsDown(INPUT_CONFIG_DEFAULT, btn); 
}

//-----------------------------------------------------------------------------
/**
 * Check if a given button is actually pressed on the default configuration.
 * @param	btn			Button to test.
 * @return					TRUE if the button is actually pressed.
 */
BOOL Input::IsPress(u32 btn) 
{ 
	return IsPress(INPUT_CONFIG_DEFAULT, btn); 
}

//-----------------------------------------------------------------------------
/**
 * Check if a given button was just released on the default configuration.
 * @param	btn			Button to test.
 * @return					TRUE if the button was just released.
 */
BOOL Input::IsUp(u32 btn)
{ 
	return IsUp(INPUT_CONFIG_DEFAULT, btn); 
}

} // namespace noe
