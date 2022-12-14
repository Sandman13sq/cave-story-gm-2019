/// @desc 

/// @desc 

if keyboard_check_pressed(ord("I"))
{
	var i = 1;
	while ds_list_find_index(itemList, i) != -1
	{
		i++;
	}
	
	addPlayerItem(i);
}

x = (CAMERA_W - Menu.w) / 2;
y = ( (CAMERA_H - Menu.h) / 2 ) - 40;

if INPUT_MENU_PRESSED
{
	instance_destroy();
	exit;
}

if y_offset != y_offset_target
{
	y_offset = approach(y_offset, y_offset_target, 8);
}

switch(state)
{
	#region Choose Menu
	
	case(-1):
		
		if INPUT_ANY_PRESSED
		{
			var _push =
				(INPUT_DOWN_PRESSED || INPUT_RIGHT_PRESSED) -
				(INPUT_UP_PRESSED || INPUT_LEFT_PRESSED);
				
			if _push != 0
			{
				selectOffset[menuSelect] = 0;
				menuSelect = loop(menuSelect + _push, 0, menuCount);
				sfx(snd_menuMove);
				surface_free(menuSurf);
			}
			
			if INPUT_BACK_PRESSED
			{
				instance_destroy();
				sfx(snd_menuBack);
				exit;
			}
			
			else if INPUT_ACTION_PRESSED
			{
				state = menuSelect;
				sfx(snd_menuConfirm);
				
				switch(menuSelect)
				{
					case(0):
						var _list = weaponList, _val = ds_list_size(_list) > 0? _list[| select[state]]: 0;
						
						if eventExists(1000 + _val, tempScript) {runEvent(1000 + _val, tempScript);}
						break;
						
					case(1):
						var _list = itemList, _val = ds_list_size(_list) > 0? _list[| select[state]]: 0;
						
						if eventExists(5000 + _val, tempScript) {runEvent(5000 + _val, tempScript);}
						break;
				}
			}
			
			y_offset_target = 0;
		}
		break;
		
	#endregion
	
	#region Choose Weapon
	
	case(0):
		var _halt = false;
		if instance_exists(EVENT)
		{
			if EVENT.script_mode != Script_Mode.pause
			{
				_halt = true;
			}
		}
		else
		{
			var _list = weaponList, _val = ds_list_size(_list) > 0? _list[| select[state]]: 0;
			
			if eventExists(1000 + _val, tempScript) {runEvent(1000 + _val, tempScript);}
		}
		
		if INPUT_ANY_PRESSED && !_halt
		{
			var _push =
				(INPUT_DOWN_PRESSED || INPUT_RIGHT_PRESSED) -
				(INPUT_UP_PRESSED || INPUT_LEFT_PRESSED),
			_last = select[state], _l = ds_list_size(weaponList);
			
			if _l > 0
			{
				select[state] = loop(select[state] + _push, 0, _l);
			
				if _push != 0 {sfx(snd_menuMove);}
			
				if select[state] != _last
				{
					runEvent(1000 + weaponList[| select[state]], tempScript);
				
					var _perPage = 5, 
					_push = sign(select[state] - selectOffset[state]);
				
					while !in_range(select[state], 
						selectOffset[state], 
						selectOffset[state] + _perPage - 1, 
						)
					{
						selectOffset[state] += _push;
					}
				
					y_offset_target = (selectOffset[state]) * 40;
				}
			}
			
			if INPUT_BACK_PRESSED
			{
				state = -1;
				instance_destroy(TEXT);
				sfx(snd_menuBack);
				//break;
			}
			
			if INPUT_ACTION_PRESSED
			{
				setPlayerData(Player_Stat.current_weapon, select[state]);
				weaponCurrent = getPlayerData(Player_Stat.current_weapon);
				sfx(snd_menuConfirm);
			}
		}
		break;
		
	#endregion
	
	#region Choose Item
	
	case(1):
		if lastItemCount != ds_list_size(itemList)
		{
			surface_free(menuSurf);
		}
		
		var _halt = false;
		if instance_exists(EVENT)
		{
			if EVENT.script_mode != Script_Mode.pause
			{
				_halt = true;
			}
		}
		else
		{
			var _list = itemList, _val = ds_list_size(_list) > 0? _list[| select[state]]: 0;
			
			if eventExists(5000 + _val, tempScript) {runEvent(5000 + _val, tempScript);}
		}
		
		lastItemCount = ds_list_size(itemList);
		
		if INPUT_ANY_PRESSED && !_halt
		{
			var _last = select[state], _l = ds_list_size(itemList), _push;
			
			if _l > 0
			{
				_push = bool(INPUT_RIGHT_PRESSED) - bool(INPUT_LEFT_PRESSED);
			
				if _push != 0
				{
					select[state] = loop(select[state] + _push, 0, _l);
					sfx(snd_menuMove);
				}
				else
				{
					if INPUT_DOWN_PRESSED
					{
						if lowestProduct(select[state], Menu.itemPerRow) < lowestProduct(_l, Menu.itemPerRow)
						{
							select[state] = min(_l - 1, select[state] + Menu.itemPerRow); 
							sfx(snd_menuMove);
						}
						else
						{
							select[state] = select[state] mod Menu.itemPerRow; 
							sfx(snd_menuMove);
						}
					}
					else if INPUT_UP_PRESSED
					{
						if select[state] - Menu.itemPerRow >= 0
						{
							select[state] -= Menu.itemPerRow; 
							sfx(snd_menuMove);
						}
						else
						{
							select[state] = min(_l - 1, 
								lowestProduct(_l, Menu.itemPerRow) + select[state] mod Menu.itemPerRow);
							sfx(snd_menuMove);
						}
					}
				}
			}
			
			if select[state] != _last
			{
				if _l > 0
				{
					runEvent(5000 + itemList[| select[state]], tempScript);
				}
				else
				{
					runEvent(5000, tempScript);
				}
				
				selectOffset[state] = pushSelectionOffset(
					select[state] div Menu.itemPerRow, 
					selectOffset[state], 
					Menu.itemPerColumn);
					
				y_offset_target = selectOffset[state] * Menu.itemYsep;
			}
			
			if INPUT_BACK_PRESSED
			{
				state = -1;
				instance_destroy(TEXT);
				sfx(snd_menuBack);
				//break;
			}
			
			// Run Item Event
			else if INPUT_ACTION_PRESSED
			{
				if _l > 0
				{
					runEvent(6000 + itemList[| select[state]], tempScript);
					//sfx(snd_menuConfirm);
				}
				else
				{
					runEvent(6000, tempScript);
				}
			}
		}
		break;
		
	#endregion
	
	#region Choose Option
	
	case(2):
		if INPUT_ANY_PRESSED
		{
			var _push = bool(INPUT_DOWN_PRESSED) - bool(INPUT_UP_PRESSED);
				
			if _push != 0
			{
				select[state] = loop(select[state] + _push, 0, 6);
				sfxCut(snd_menuMove);
			}
			
			if INPUT_BACK_PRESSED
			{
				state = -1;
				sfx(snd_menuBack);
				break;
			}
			
			if INPUT_ACTION_PRESSED
			{
				switch(select[state])
				{
					case(0):
						with GAME {playerPaletteIndex = loop(playerPaletteIndex + 1, 0, 5)}
						sfx(snd_menuConfirm);
						break;
						
					case(1):
						with GAME {playerPaletteIndex = loop(playerPaletteIndex - 1, 0, 5)}
						sfx(snd_menuConfirm);
						break;
						
					case(5):
						if getEquipFlag(Equip_Flag.curly) {clearEquipFlag(Equip_Flag.curly)}
						else {setEquipFlag(Equip_Flag.curly)}
						
						updateEquip();

						with PLAYER {event_user(1);}
						
						sfx(snd_menuConfirm);
						break;
				}
				
				with PLAYER
				{
					setAnimationPallete(animationPalSprite, GAME.playerPaletteIndex);
				}
			}
		}
		
		var _push = 0;
		
		if INPUT_JUMP_HELD
		{
			_push = bool(INPUT_RIGHT_HELD) - bool(INPUT_LEFT_HELD);
		}
		else
		{
			if !alarm[0]
			{
				_push = bool(INPUT_RIGHT_HELD) - bool(INPUT_LEFT_HELD);
			}
		}
				
		if _push != 0
		{
			switch(select[state])
			{
				case(2):
					masterVolume = clamp(masterVolume + _push, 0, 255);
					audio_master_gain(masterVolume / 100);
					alarm[0] = 6;
					break;
						
				case(3):
					musicVolume = clamp(musicVolume + _push, 0, 255);
					MUSIC.gameSound = MUSIC.gameSound & ~(FullMask._8);
					MUSIC.gameSound = MUSIC.gameSound | musicVolume;
					audio_sound_gain(MUSIC.gameBGM_sound, VOLUME_BGM, 0);
					alarm[0] = 6;
					break;
						
				case(4):
					sfxVolume = clamp(sfxVolume + _push, 0, 255);
					MUSIC.gameSound = MUSIC.gameSound & ~(FullMask._8 << 8);
					MUSIC.gameSound = MUSIC.gameSound | (sfxVolume << 8);
					alarm[0] = 6;
					break;
			}
		}
		break;
	
	#endregion
}

highlightStep = !highlightStep;

FREEZE = true;
clearGameplayFlag(Gameplay_Flag.showGUI);