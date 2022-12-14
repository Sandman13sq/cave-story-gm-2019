/// @desc 

if state && !wait
{
	#region Choosing Map
	
	// Finish Loading Stages
	if !done
	{
		while (!done) {event_user(0);}
	}
	else
	{
		if INPUT_LEFT_PRESSED || INPUT_UP_PRESSED
		{
			select = loop(select - 1, 0, mapCount);
			sfx(snd_menuMove);
			alarm[0] = 20;
		}
		
		else if INPUT_RIGHT_PRESSED || INPUT_DOWN_PRESSED
		{
			select = loop(select + 1, 0, mapCount);
			sfx(snd_menuMove);
			alarm[0] = 20;
		}
		
		else if !alarm[0]
		{
			if INPUT_LEFT_HELD || INPUT_UP_HELD
			{
				select = loop(select - 1, 0, mapCount);
				sfx(snd_menuMove);
				alarm[0] = 4;
			}
		
			else if INPUT_RIGHT_HELD || INPUT_DOWN_HELD
			{
				select = loop(select + 1, 0, mapCount);
				sfx(snd_menuMove);
				alarm[0] = 4;
			}
		}
		
		if INPUT_BACK_PRESSED
		{
			with obj_intro
			{
				menu_state = Intro_State.vanillaMap;
				drawChoices = true;
				wait = 2;
			}
			state = false;
			sfx(snd_menuBack);
		}
	
		if INPUT_ACTION_PRESSED
		{
			sfx(snd_menuConfirm);
			load_classic_map(stageArr[select, 0], 90, 4, 4);
		}
	}
	
	#endregion
}
else
{
	// Load a few at a time
	if !done
	{
		if !alarm[1] {alarm[1] = 2}
	}
	
	wait--;
}
