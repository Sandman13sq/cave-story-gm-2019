/// @desc ()
/// @arg controller_instance,numOfPlayers
function input_init(argument0) {

	global.InputObj = argument0;
#macro CONTROLLER_OBJECT global.InputObj;
#macro INPUT_NULL 1

#region enum Input

	enum Input 
	{
		// Input Values
		left = 0,
		up = 1,
		right = 2,
		down = 3,
		action = 4, z = Input.action,
		cancel = 5, x = Input.cancel, back = Input.x, shoot = Input.x,
		menu = 6, c = Input.menu,
		select = 7, a = Input.select, alt = Input.a,
		prev = 8,
		next = 9,
		aimLeft = 10,
		aimRight = 11,
	
		any = 15,
	
		// Check Types
		type_active = 0,
		type_pressed = 1,
		type_released = 2,
	
		// Flag Stuffs
		maskSize_keys = 8,
		maskSize_gpad = 16,
		fullMask_keys = FullMask._8,
		fullMask_gpad = FullMask._16,
	
		// Etc.
		buffer_time = 10,
	}

#endregion

#region Input Macros

#macro LEFT Input.left
#macro UP Input.up
#macro RIGHT Input.right
#macro DOWN Input.down
#macro ACTION Input.action
#macro BACK Input.back
#macro MENU Input.menu
#macro ALT Input.alt
#macro AIM_LEFT Input.aimLeft
#macro AIM_RIGHT Input.aimRight

#macro INPUT_RIGHT_PRESSED (global.inputFlag_pressed & 1 << Input.right)
	#macro INPUT_RIGHT_HELD (global.inputFlag & 1 << Input.right)
#macro INPUT_UP_PRESSED (global.inputFlag_pressed & 1 << Input.up)
	#macro INPUT_UP_HELD (global.inputFlag & 1 << Input.up)
#macro INPUT_LEFT_PRESSED (global.inputFlag_pressed & 1 << Input.left)
	#macro INPUT_LEFT_HELD (global.inputFlag & 1 << Input.left)
#macro INPUT_DOWN_PRESSED (global.inputFlag_pressed & 1 << Input.down)
	#macro INPUT_DOWN_HELD (global.inputFlag & 1 << Input.down)

#macro INPUT_ACTION_PRESSED (global.inputFlag_pressed & 1 << Input.z)
	#macro INPUT_JUMP_PRESSED INPUT_ACTION_PRESSED
	#macro INPUT_JUMP_HELD (global.inputFlag & 1 << Input.z)
	#macro INPUT_JUMP_RELEASED (global.inputFlag_released & 1 << Input.z)
	
#macro INPUT_BACK_PRESSED (global.inputFlag_pressed & 1 << Input.x)
	#macro INPUT_SHOOT_PRESSED INPUT_BACK_PRESSED
	#macro INPUT_SHOOT_HELD (global.inputFlag & 1 << Input.x)
	#macro INPUT_SHOOT_RELEASED (global.inputFlag_released & 1 << Input.x)
	
#macro INPUT_MENU_PRESSED (global.inputFlag_pressed & 1 << Input.c)

#macro INPUT_ALT_PRESSED (global.inputFlag_pressed & 1 << Input.alt)
	#macro INPUT_ALT_HELD (global.inputFlag & 1 << Input.alt)

#macro INPUT_ANY_PRESSED (global.inputFlag_pressed != 0)
#macro INPUT_ANY_HELD (global.inputFlag != 0)

#endregion

	// input_manage()
	// input_check()

	global.inputFlag = 0;
	global.inputFlag_pressed = 0;
	global.inputFlag_released = 0;
	global.inputFlag_locked = 0;

	global.inputBuffer_button = 0;
	global.inputBuffer_alarm = 0;

	inputBuffer_time = Input.buffer_time;
	inputDevice = -1;
	input_sensitivity = 0.5;

#region Button Mapping

	ini_open("controls.ini");

	var _mapping, _button = 0;

	inputMap_keys = 0; _mapping = 0;
	for (var i = 0; i < Input.maskSize_keys; i++)
	{
		switch(i)
		{
			case(Input.left):	_button = ini_read_real("keyboard", "Left", vk_left);	break;
			case(Input.up):		_button = ini_read_real("keyboard", "Up", vk_up);	break;
			case(Input.right):	_button = ini_read_real("keyboard", "Right", vk_right);	break;
			case(Input.down):	_button = ini_read_real("keyboard", "Down", vk_down);	break;
			case(Input.action):	_button = ini_read_real("keyboard", "Jump", ord("Z"));	break;
			case(Input.back):	_button = ini_read_real("keyboard", "Shoot", ord("X"));	break;
			case(Input.menu):	_button = ini_read_real("keyboard", "Menu", ord("C"));	break;
			case(Input.select):	_button = ini_read_real("keyboard", "Select", vk_shift);	break;
		}
		_mapping = _mapping | (_button << (Input.maskSize_keys * i));
	}
	inputMap_keys = _mapping;
	// -------------------------------------------------------------

	inputMap_keys2 = 0; _mapping = 0;
	for (var i = 0; i < Input.maskSize_keys; i++)
	{
		switch(i)
		{
			default: _button = INPUT_NULL; break;
			case(Input.prev - 8):	_button = ini_read_real("keyboard", "Previous", ord("A"));	break;
			case(Input.next - 8):	_button = ini_read_real("keyboard", "Next", ord("S"));	break;
			case(Input.aimLeft - 8):	_button = ini_read_real("keyboard", "Aim Left", vk_control);	break;
			case(Input.aimRight - 8):	_button = ini_read_real("keyboard", "Aim Right", vk_alt);	break;
		}
		_mapping = _mapping | (_button << (Input.maskSize_keys * i));
	}
	inputMap_keys2 = _mapping;
	// -------------------------------------------------------------

	inputMap_Dpad = 0; _mapping = 0;
	for (var i = 0; i < Input.maskSize_gpad; i++)
	{
		switch(i)
		{
			case(Input.left):	_button = ini_read_real("gamepad", "Left", gp_padl);	break;
			case(Input.up):		_button = ini_read_real("gamepad", "Up", gp_padu);	break;
			case(Input.right):	_button = ini_read_real("gamepad", "Right", gp_padr);	break;
			case(Input.down):	_button = ini_read_real("gamepad", "Down", gp_padd);	break;
		}
		_mapping = _mapping | (_button << (Input.maskSize_gpad * i));
	}
	inputMap_Dpad = _mapping;

	// -------------------------------------------------------------

	inputMap_face = 0; _mapping = 0;
	for (var i = 0; i < Input.maskSize_gpad; i++)
	{
		switch(i)
		{
			case(Input.action - 4):	_button = ini_read_real("gamepad", "Jump", gp_face1);	break;
			case(Input.back - 4):	_button = ini_read_real("gamepad", "Shoot", gp_face3);	break;
			case(Input.menu - 4):	_button = ini_read_real("gamepad", "Menu", gp_face4);	break;
			case(Input.select - 4):	_button = ini_read_real("gamepad", "Select", gp_face2);	break;
		}
		_mapping = _mapping | (_button << (Input.maskSize_gpad * i));
	}
	inputMap_face = _mapping;
	// -------------------------------------------------------------

	inputMap_shoulder = 0; _mapping = 0;
	for (var i = 0; i < Input.maskSize_gpad; i++)
	{
		switch(i)
		{
			case(Input.prev - 8):	_button = ini_read_real("gamepad", "Prev", gp_shoulderl);		break;
			case(Input.next - 8):	_button = ini_read_real("gamepad", "Next", gp_shoulderr);		break;
			case(Input.aimLeft - 8):	_button = ini_read_real("gamepad", "Aim Left", gp_shoulderlb);	break;
			case(Input.aimRight - 8):	_button = ini_read_real("gamepad", "Aim Right", gp_shoulderrb);	break;
		}
		_mapping = _mapping | (_button << (Input.maskSize_gpad * i));
	}
	inputMap_shoulder = _mapping;

	ini_close();

#endregion



}
