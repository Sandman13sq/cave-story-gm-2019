/// @desc 

x = CAMERA_W / 2;
y = 96;

switch(state)
{
	#region Choose Keyboard or Contoller
	
	case(0):
		if INPUT_LEFT_PRESSED || INPUT_RIGHT_PRESSED
		{
			showGpad = !showGpad;
			sfx(snd_menuMove);
		}
		
		if INPUT_BACK_PRESSED
		{
			sfx(snd_menuBack);
			instance_destroy();
		}
		
		if INPUT_ACTION_PRESSED
		{
			state = 1;
			sfx(snd_menuConfirm);
		}
		break;
		
	#endregion
		
	#region Choose Input
	
	case(1):
		var _push = bool(INPUT_DOWN_PRESSED) - bool(INPUT_UP_PRESSED);
		
		if _push != 0
		{
			sfx(snd_menuMove);
			
			if inPre
			{
				preSelect += _push;
				
				if preSelect < 0
				{
					inPre = false;
					inputSelect = menuMax - 1;
					preSelect = 0;
					selectOffset = pushSelectionOffset(inputSelect, selectOffset, 6);
				}
				else if preSelect >= inputSelectStart
				{
					inPre = false;
					inputSelect = 0;
					preSelect = 0;
					selectOffset = pushSelectionOffset(inputSelect, selectOffset, 6);
				}
			}
			else
			{
				inputSelect += _push;
				
				if inputSelect < 0
				{
					inPre = true;
					inputSelect = 0;
					preSelect = inputSelectStart - 1;
				}
				else if inputSelect >= menuMax
				{
					inPre = true;
					inputSelect = 0;
					preSelect = 0;
				}
				else
				{
					selectOffset = pushSelectionOffset(inputSelect, selectOffset, 6);
				}
			}
		}
		
		if INPUT_BACK_PRESSED
		{
			state = 0;
			sfx(snd_menuBack);
		}
		else if INPUT_ACTION_PRESSED
		{
			if inPre
			{
				switch(preSelect)
				{
					case(0): state = 0; sfx(snd_menuBack); break;
					case(1): state = 2; sfx(snd_menuMove); break;
				}
			}
			else
			{
				state = 3;
				lastInput = INPUT_NULL;
				alarm[0] = 180;
				sfx(snd_menuMove);
			}
		}
		
		break;
		
	#endregion
	
	#region Test Input
	
	case(2):
		activeInput = -1;
		
		var i = 0;
		repeat(menuMax)
		{
			if input_check(i, Input.type_active)
			{
				if activeInput != -1
				{
					state = 1;
				}
				else
				{
					activeInput = i;
				}
			}
			i++;
		}
		
		if showGpad
		{
			if gamepad_get_device() > -1
			{
				inputDevice = gamepad_get_device();
			}
		}
		
		break;
	
	#endregion
	
	#region Change Input
	
	case(3):
		if showGpad
		{
			if gamepad_get_device() > -1
			{
				inputDevice = gamepad_get_device();
			}
			
			var _button = gamepad_any_pressed(inputDevice)
			
			if _button
			{
				lastInput = _button;
			}
		}
		else
		{
			if keyboard_check_pressed(vk_anykey)
			{
				lastInput = keyboard_lastkey;
			}
		}
		break;
	
	#endregion
}