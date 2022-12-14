/// @desc

borderStep = loop(borderStep + 0.25, 0, 20);

xOffset *= 0.9;

if INPUT_LEFT_PRESSED || INPUT_RIGHT_PRESSED
|| INPUT_DOWN_PRESSED || INPUT_UP_PRESSED
{
	selection = !selection;
	sfx(snd_menuMove);
}

if selection >= 0
{
	if INPUT_ACTION_PRESSED
	{
		var _no = selection, _event = undefined;
		with EVENT
		{
			script_mode = Script_Mode.cmd;
			
			clear_text();
			
			// Jump to Event if No
			if _no
			{
				sfx(snd_menuBack);
				_event = script_hold;
				instance_destroy();
			}
			// Continue Event if Yes
			else 
			{
				sfx(snd_menuConfirm);
				command_runner_classic();
			}
		}
		
		if _event != undefined {runEvent(_event);}
		instance_destroy();
	}
}