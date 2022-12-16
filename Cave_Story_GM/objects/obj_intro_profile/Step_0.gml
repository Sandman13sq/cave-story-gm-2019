/// @desc 

x = (CAMERA_W - Profile_GUI.w) / 2;
y = 40 + y_offset;

y_offset = approach(y_offset, y_offset_target, 16);

for (var i = 0; i < profileCount; i++)
{
	profile_x[i] = approach_grad(profile_x[i], 0, 8);
}

switch(state)
{
	#region Profile Select
	
	case(0):
		if INPUT_ANY_PRESSED
		{
			var _pushMax = 2, _h = Profile_GUI.h + Profile_GUI.ysep;
			
			if INPUT_RIGHT_PRESSED || INPUT_DOWN_PRESSED
			{
				profileSelect++; push++; sfx(snd_menuMove);
			}
			
			if INPUT_UP_PRESSED || INPUT_LEFT_PRESSED
			{
				profileSelect--; push--; sfx(snd_menuMove);
			}
			
			if profileSelect < 0 
			{
				profileSelect = profileCount;
				push = _pushMax;
				y_offset_target = -_h * (profileCount - _pushMax);
			}
			
			if profileSelect > profileCount
			{
				profileSelect = 0;
				push = 0;
				y_offset_target = 0;
			}
			
			selectOffset = pushSelectionOffset(profileSelect, selectOffset, 3);

			y_offset_target = -(Profile_GUI.h + Profile_GUI.ysep) * selectOffset;
			
			if INPUT_ACTION_PRESSED
			{
				if profileSelect == 0 
				{
					state = 1;
					sfx(snd_menuConfirm);
					runEventLine("<FAO0004<INI<END");
					instance_destroy();
				}
				else
				{
					state = 2;
					sfx(snd_menuConfirm);
				}
			}
			
			if INPUT_BACK_PRESSED
			{
				with obj_intro
				{
					menu_state = Intro_State.play;
					drawChoices = true;
				}
				sfx(snd_menuBack);
				instance_destroy();
			}
		}
		break;
		
	#endregion
	
	#region View Profile
	
	case(2):
		if INPUT_ANY_PRESSED
		{
			if INPUT_RIGHT_PRESSED || INPUT_DOWN_PRESSED
			{select[state] = loop(select[state] + 1, 0, 2); sfx(snd_menuMove);}
			
			if INPUT_UP_PRESSED || INPUT_LEFT_PRESSED
			{select[state] = loop(select[state] - 1, 0, 2); sfx(snd_menuMove);}
			
			if INPUT_ACTION_PRESSED
			{
				switch(select[state])
				{
					// Load Game
					case(0):
						sfx(snd_menuConfirm);
						var _prof = profileList[| profileSelect - 1];
						PROFILE_PATH = _prof.path;
						setEventFlag(0431);
						runEventLine("<LDP<END");
						break;
					
					// Delete
					case(1):
						state = 3;
						select[state] = 1;
						break;
				}
			}
			
			if INPUT_BACK_PRESSED
			{
				state = 0;
				sfx(snd_menuBack);
			}
		}
		break;
	
	#endregion
	
	#region Delete Profile
	
	case(3):
		if INPUT_UP_PRESSED || INPUT_DOWN_PRESSED
		|| INPUT_LEFT_PRESSED || INPUT_RIGHT_PRESSED
		{
			select[state] = !select[state];
		}
		
		if INPUT_ACTION_PRESSED
		{
			// No (Back)
			if select[state]
			{
				state = 2;
				sfx(snd_menuBack);
			}
			// Yes (Delete)
			else
			{
				var _prof = profileList[| profileSelect - 1];
				file_delete(_prof.path);
				state = 0;
				event_user(0);
			}
		}
		
		if INPUT_BACK_PRESSED
		{
			state = 2;
			sfx(snd_menuBack);
		}
		break;
	
	#endregion
}