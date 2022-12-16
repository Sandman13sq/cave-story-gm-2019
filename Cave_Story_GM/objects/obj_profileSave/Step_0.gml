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
	
	case(Profile_State.select_save):
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
			
			if push > _pushMax {y_offset_target -= _h; push--;}
			
			if push < 0 {y_offset_target += _h; push++;}
			
			if INPUT_ACTION_PRESSED
			{
				if profileSelect < profileCount 
				{
					state = Profile_State.overwrite;
				}
				else
				{
					state = Profile_State.saveEdit_new;
					
					var _chance = irandom(1);
					
					newData = new GameProfile();
					newData.name = _chance? "Mr Traveller": "Ms Traveller";
					newData.stagename = STAGE.caption;
					newData.date = "--/--/--";
					newData.time = "--:--";
					newData.life = "--";
					newData.lifemax = "--";
					newData.face = _chance? 31: 19;
					
					var i = 0;
					while (file_exists("Profile" + string(i) + ".sav"))
					{
						i++;
					}
					
					newData.path = "Profile" + string(i);
					canSave = true;
					
					sfx(snd_menuMove);
				}
			}
			
			if INPUT_BACK_PRESSED
			{
				runEventLine("<END");
				sfx(snd_menuBack);
				instance_destroy();
			}
		}
		break;
		
	#endregion
	
	#region Save Overwrite
	
	case(Profile_State.overwrite):
		if INPUT_ANY_PRESSED
		{
			if INPUT_RIGHT_PRESSED || INPUT_DOWN_PRESSED
			|| INPUT_UP_PRESSED || INPUT_LEFT_PRESSED
			{
				select[state] = !select[state];
				sfx(snd_menuMove);
			}
			
			if INPUT_ACTION_PRESSED
			{
				// Save
				if !select[state]
				{
					var _prof = profileList[| profileSelect];
					GAME.username = _prof.name;
					saveProfile(_prof.path, _prof.face);
					advanceEvent();
					instance_destroy();
					sfx(snd_menuConfirm);
				}
				// Back
				else
				{
					sfx(snd_menuBack);
					state = Profile_State.select_save;
				}
				
			}
			
			if INPUT_BACK_PRESSED
			{
				sfx(snd_menuBack);
				state = Profile_State.select_save;
			}
		}
		break;
	
	#endregion
	
	#region Edit New Profile
	
	case(Profile_State.saveEdit_new):
		if INPUT_ANY_PRESSED
		{
			if INPUT_LEFT_PRESSED || INPUT_RIGHT_PRESSED
			{
				select[state] = loop(select[state] - polarize(select[state] mod 2 == 1), 
				0, array_length(newDataChoice));
				sfx(snd_menuMove);
			}
			
			if INPUT_UP_PRESSED
			{
				select[state] = loop(select[state] - 2, 0, array_length(newDataChoice));
				sfx(snd_menuMove);
			}
			
			if INPUT_DOWN_PRESSED
			{
				select[state] = loop(select[state] + 2, 0, array_length(newDataChoice));
				sfx(snd_menuMove);
			}
			
			switch(select[state])
			{
				// Rename
				case(0):
					if INPUT_ACTION_PRESSED
					{
						state = Profile_State.rename;
						editString = "Rename Profile";
						keyboard_string = newData.name;
					}
					break;
					
				// Rename File
				case(1):
					if INPUT_ACTION_PRESSED
					{
						state = Profile_State.rename_file;
						editString = "Change file name";
						keyboard_string = newData.path;
					}
					break;
						
				// Prev Face
				case(2):
					if INPUT_ACTION_PRESSED
					{
						newData.face = loop(newData.face - 1, 
							0, sprite_get_number(faceSprite)); 
						sfx(snd_menuMove);
					}
					break;
					
				// Next Face
				case(3):
					if INPUT_ACTION_PRESSED
					{
						newData.face = loop(newData.face + 1, 
							0, sprite_get_number(faceSprite)); 
						sfx(snd_menuMove);
					}
					break;
					
				// Save
				case(4):
					if INPUT_ACTION_PRESSED
					{
						GAME.username = newData.name;
						PROFILE_PATH = newData.path + ".sav";
						
						saveProfile(PROFILE_PATH, newData.face);
						sfx(snd_menuConfirm);
						
						if inGame {advanceEvent(); instance_destroy();}
						else {state = Profile_State.select_load;}
					}
					break;
						
				// Back
				case(5):
					if INPUT_ACTION_PRESSED
					{
						state = Profile_State.select_save;
					}
					break;
					
			}
		}
		break;
	
	#endregion
	
	#region Rename File
	
	case(Profile_State.rename_file):
			
		if keyboard_check_pressed(vk_anykey)
		{
			canSave = true;
			editString = "Enter Name for file:";
				
			if file_exists(keyboard_string + ".sav")
			{
				editString = "Profile with name already exists";
				canSave = false;
			}
			else if keyboard_string == ""
			{
				canSave = false;
				if keyboard_check_pressed(vk_backspace)
				{
					if backSpaceCheck
					{
						backSpaceCheck = false;
						state = Profile_State.saveEdit_new;
						sfx(snd_menuBack);
					}
					else
					{
						backSpaceCheck = true;
					}
				}
				else
				{
					backSpaceCheck = false;
				}
			}
				
			if canSave
			{
				if keyboard_check_pressed(vk_enter)
				{
					newData.path = keyboard_string;
					state = Profile_State.saveEdit_new;
					sfx(snd_menuConfirm);
				}
			}
		}
		break;
	
	#endregion
	
	#region Rename Profile
	
	case(Profile_State.rename):
			
		if keyboard_check_pressed(vk_anykey)
		{
			if keyboard_string == ""
			{
				canSave = false;
				if keyboard_check_pressed(vk_backspace)
				{
					if backSpaceCheck
					{
						backSpaceCheck = false;
						state = Profile_State.saveEdit_new;
						sfx(snd_menuBack);
					}
					else
					{
						backSpaceCheck = true;
					}
				}
				else
				{
					backSpaceCheck = false;
				}
			}

			if keyboard_check_pressed(vk_enter)
			{
				newData.name = keyboard_string;
				state = Profile_State.saveEdit_new;
				sfx(snd_menuConfirm);
			}
		}
		break;
	
	#endregion
	
}