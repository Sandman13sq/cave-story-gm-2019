/// @desc Runs script commands
function command_runner_classic() {

	if script_pos > string_length(script_str) {instance_destroy(); exit;}

#region Skip Newlines

	while string_char_at(script_str, script_pos) == "\n"
	{
		script_pos++;
		if script_pos > string_length(script_str) {break;}
	}

#endregion

#region Non Command Stuffs

	// Non Event Stuffs
	if string_char_at(script_str, script_pos) != "<"
	{
		// String Stuffs
		if instance_exists(TEXT)
		{
			var _str = "";
		
			if TEXT.text_str != ""
			{
				// Add a line break of one exists between last string of text and the current one
				if string_pos("\n", string_copy(script_str, 
					script_lastPos, script_pos - script_lastPos))
					{_str += "\n"}
			}
	
			while string_char_at(script_str, script_pos) != "<"
			{
				_str += string_char_at(script_str, script_pos);
				script_pos++;
				if script_pos > string_length(script_str) {break;}
			}
	
			script_mode = Script_Mode.text;
			display_text(0, _str);
		}
	
		script_lastPos = script_pos;
	}

#endregion

	// Actual Commands

	else
	{
		var _cmd = string_copy(script_str, script_pos, 4);
		script_pos += 4;
		lastCommand = _cmd;
		//msg(_cmd, script_pos, script_mode);

		switch(_cmd)
		{
			default:
				//msg(_cmd);
				consoleOut("Unknown/Uncoded Command in Script: \"" + _cmd + "\"", c_red);
				command_runner_classic();
				break;
		
			// -----------------------------------------------------
		
		#region End Script (<END)
		
			case("<END"): // End Script
				//mass_activate(true);
				end_event();
				break;
			
		#endregion
			
			// -----------------------------------------------------
		
			// General
		
		#region Event (<EVE)
		
			case("<EVE"): // Go to event (event)
				is_running = false; 
				runEvent(command_runner_getValue(true), EVENT_MAP);
				instance_destroy();
				break;
			
		#endregion
		
		#region Start Game (<INI)
		
			case("<INI"): // Initialize Game
				startClassicGame();
				command_runner_classic();
				break;
			
		#endregion
		
		#region Save Profile (<SVP)
		
			case("<SVP"): // Opens Profile Select Screen
				script_mode = Script_Mode.profile;
				with instance_create_depth(0, 0, 0, obj_profileSave)
				{
					inGame = true;
				};
				break;
			
		#endregion
		
		#region Load Profile (<LDP)
		
			case("<LDP"):
				if getEventFlag(0431)
				{
					loadProfile(PROFILE_PATH);
				}
				else
				{
					startClassicGame();
				}
				command_runner_classic();
				break;
			
		#endregion
		
		#region Quit to Title (<ESC)
		
			case("<ESC"):
				room_goto(rm_intro);
				setCamera_state(Camera_State.free);
				command_clear();
				instance_destroy();
				break;
			
		#endregion
		
		#region Wait X Frames (<WAI)
		
			case("<WAI"): // Wait x number of Cave Story Ticks (ticks)
				var _frames = command_runner_getValue(true);
				if _frames < 9999
				{
					alarm[0] = _frames * WAIT;
					script_mode = Script_Mode.wait;
				}
				else
				{
					script_mode = Script_Mode.pause;
				}
			
				break;
			
		#endregion
		
		#region Prevent Input (<KEY)
		
			case("<KEY"):
				FREEZE = false;
				with PLAYER
				{
					setGameplayFlag(Gameplay_Flag.noInput);
					clearGameplayFlag(Gameplay_Flag.showGUI);
				}
				command_runner_classic();
				break;
			
		#endregion
		
		#region Freeze Step (<PRI)
		
			case("<PRI"):
				FREEZE = true;
			
				if getGameplayFlag(Gameplay_Flag.playerExists)
				{
					clearGameplayFlag(Gameplay_Flag.showGUI);
				}
				command_runner_classic();
				break;
			
		#endregion
		
		#region Advance Script (<NOD)
		
			case("<NOD"): // Advance Script
				script_mode = Script_Mode.nod;
				break;
			
		#endregion
		
			// -----------------------------------------------------
		
			// Messages
		
		#region Message 1, Bottom of Screen (<MSG)
		
			case("<MSG"): // Text Box at Bottom of Screen
				if !instance_exists(TEXT)
				{
					instance_create_depth(0, 0, 0, TEXT);
				}
				else
				{
					with TEXT {anchor = 0; event_user(1);}
				}
			
				command_runner_classic();
				break;
			
		#endregion
		
		#region Message 2, Top of Screen, no Box (<MS2)
		
			case("<MS2"): // Text (No Box) at Top of Screen
				if !instance_exists(TEXT)
				{
					instance_create_depth(0, 0, 0, TEXT);
				}
				else
				{
					with TEXT 
					{
						text_drawBox = false;
						anchor = 1;
						event_user(1);
					}
				}
			
				command_runner_classic();
				break;
			
		#endregion
		
		#region Message 3, Top of Screen (<MS3)
		
			case("<MS3"):  // Text at Top of Screen
				if !instance_exists(TEXT)
				{
					instance_create_depth(0, 0, 0, TEXT);
				}
				else
				{
					with TEXT {anchor = 1; event_user(1);}
				}
			
				command_runner_classic();
				break;
			
		#endregion
		
			// -----------------------------------------------------
		
		#region Close Text Box (<CLO)
		
			case("<CLO"):
				clear_text();
				instance_destroy(TEXT);
				command_runner_classic();
				break;
			
		#endregion
		
		#region Clear Text (<CLR)
		
			case("<CLR"):
				clear_text();
				command_runner_classic();
				break;
			
		#endregion
		
		#region Instant Display (<TUR)
		
			case("<TUR"):
				with TEXT 
				{
					text_speed = 9999;
				};
				command_runner_classic();
				break;
			
		#endregion
		
		#region Face (<FAC)
		
			case("<FAC"):
				var _face = command_runner_getValue(true);
				if !instance_exists(TEXT)
				{
					if _face > 0
					{
						instance_create_depth(0, 0, 0, TEXT);
					}
				}
			
				with TEXT
				{
					faceIndex = _face;
					faceXOffset = Text.faceOffset;
				}
				with EVENT
				{
					faceIndex = _face;
				}
				command_runner_classic();
				break;
			
		#endregion
			
			// -----------------------------------------------------
		
		#region Yes/No Jump (<YNJ)
		
			case("<YNJ"): // Jump to Event x if no (event)
				script_hold = command_runner_getValue(true);
				instance_create_depth(0, 0, 0, obj_yesNo);
				script_mode = Script_Mode.yesNo;
				break;
			
		#endregion
		
			// -----------------------------------------------------
		
			// Stage
		
		#region Set Teleporter Stage (<PS+)
		
			case("<PS+"): // Map teleporter index X to event Y (index, event)
				var _index = command_runner_getValue(false);
				_event = command_runner_getValue(true);
			
				TELEPORTER_STAGE[? _index] = _event;
			
				command_runner_classic();
			
				// NOTE: Events are written in the stage's TSC
			
				break;
			
		#endregion
		
		#region Transport Player to Map (<TRA)
		
			case("<TRA"): // Go to map (mapIndex, event, x, y)
				var _map = command_runner_getValue(false), _event = command_runner_getValue(false),
				_x = command_runner_getValue(false), _y = command_runner_getValue(true);
				load_classic_map(_map, _event, _x, _y);
				clear_text();
				instance_destroy(TEXT);
				break;
			
		#endregion
		
		#region Transport Player to Room (<TRR)
		
			case("<TRR"): // Go to map (mapIndex, event, x, y)
				command_clear();
				var _map = command_runner_getValue(false), _event = command_runner_getValue(false),
				_x = command_runner_getValue(false), _y = command_runner_getValue(true);
			
				with instance_create_depth(0, 0, 0, obj_loadRoom_GM)
				{
					event = _event;
					player_x = _x;
					player_y = _y;
				}
			
				room_goto(_map);
			
				command_clear();
				// command_runner_classic();
				break;
			
		#endregion
		
		#region Select (<SLP)
		
			case("<SLP"): // Show Stage Select
				instance_create_depth(0, 0, 0, obj_stageSelect_classic);
			
				command_runner_classic();
				break;
			
		#endregion
		
		
			// -----------------------------------------------------
		
			// Flags
		
		#region Flag Jump (<FLJ)
		
			case("<FLJ"): // Jump to Event Y if Flag X is set (event, flag)
				var _flag = command_runner_getValue(false), _event = command_runner_getValue(true);
				if getEventFlag(_flag)
				{
					is_running = false; runEvent(_event, EVENT_MAP);
				}
				else
				{
					command_runner_classic();
				}
				break;
			
		#endregion
		
		#region Set Flag (<FL+)
		
			case("<FL+"): // Set flag X (flag)
				var _flag = command_runner_getValue(true);
				setEventFlag(_flag);
				command_runner_classic();
				break;
			
		#endregion
		
		#region Clear Flag (<FL-)
		
			case("<FL-"): // Clear flag X (flag)
				var _flag = command_runner_getValue(true);
				clearEventFlag(_flag);
				command_runner_classic();
				break;
			
		#endregion
		
		#region Skip Flag Jump (<SKJ)
		
			case("<SKJ"): // Jump to Event Y if Flag X is set (event, flag)
				var _flag = command_runner_getValue(false), _event = command_runner_getValue(true);
				if getSkipFlag(_flag)
				{
					is_running = false; runEvent(_event, EVENT_MAP);
				}
				else
				{
					command_runner_classic();
				}
				break;
			
		#endregion
		
		#region Set Flag (<SK+)
		
			case("<SK+"): // Set Skip Flag X (flag)
				var _flag = command_runner_getValue(true);
				setSkipFlag(_flag);
				command_runner_classic();
				break;
			
		#endregion
		
		#region Clear Skip Flag (<SK-)
		
			case("<SK-"): // Set skipflag X (flag)
				var _flag = command_runner_getValue(true);
				clearSkipFlag(_flag);
				command_runner_classic();
				break;
			
		#endregion
			
			// -----------------------------------------------------
		
			// Items & Equip
		
		#region Add Item (<IT+)
		
			case("<IT+"): // Add Item
				var _item = command_runner_getValue(true);
				addPlayerItem(_item, true);
				sfxCut(snd_getItem);
				command_runner_classic();
				break;
			
		#endregion
		
		#region Remove Item (<IT-)
		
			case("<IT-"): // Remove Item
				var _item = command_runner_getValue(true);
				removePlayerItem(_item);
				sfxCut(snd_loseItem);
				command_runner_classic();
				break;
			
		#endregion
		
		#region Item Event Jump (<ITJ)
		
			case("<ITJ"): // Jump to event Y if player has item X (item, event)
				var _item = command_runner_getValue(false), 
				_event = command_runner_getValue(true);
			
				if getPlayerItem(_item)
				{
					is_running = false; runEvent(_event, EVENT_MAP);
				}
				else
				{
					command_runner_classic();
				}
				break;
			
		#endregion
		
		#region Equip (<EQ+)
		
			case("<EQ+"): // Add Equip Bytes X (bytes)
				var _flag = command_runner_getValue(true);
			
				FLAGS_EQUIP = FLAGS_EQUIP | _flag;
			
				updateEquip();
				with PLAYER {event_user(1)}
			
				command_runner_classic();
				break;
			
		#endregion
		
		#region Unequip (<EQ-)
		
			case("<EQ-"): // Clear Equip Bytes X (flag)
				var _flag = command_runner_getValue(true);
			
				FLAGS_EQUIP = FLAGS_EQUIP & ~(_flag);
			
				updateEquip();
				with PLAYER {event_user(1)}
			
				command_runner_classic();
				break;
			
		#endregion
		
		#region Equip Jump (<EQJ)
		
			case("<EQJ"): // Jump to Event Y if Equip Flag X is set (event, flag)
				var _flag = command_runner_getValue(false), _event = command_runner_getValue(true);
			
				if getEquipFlag(_flag)
				{
					is_running = false; runEvent(_event, EVENT_MAP);
				}
				else
				{
					command_runner_classic();
				}
				break;
			
		#endregion
			
			// -----------------------------------------------------
		
			// Weapon
		
		#region Add Weapon/Ammo (<AM+)
		
			case("<AM+"): // Add Weapon (weapon, ammo)
				var _weapon = command_runner_getValue(false),
				_ammo = command_runner_getValue(true);
			
				ammoHold += _ammo;
			
				with PLAYER
				{
					if !getPlayerWeapon(_weapon)
					{
						addPlayerWeapon(_weapon, false);
					}
			
					addWeaponMaxAmmo(_weapon, _ammo);
					addWeaponAmmo(_weapon, _ammo);
				}
			
				sfxCut(snd_getItem);
			
				command_runner_classic();
				break;
			
		#endregion
		
		#region Remove Weapon (<AM-)
		
			case("<AM-"): // Remove Weapon (weapon)
				var _weapon = command_runner_getValue(true);
				removePlayerWeapon(_weapon);
				sfxCut(snd_loseItem);
				command_runner_classic();
				break;
			
		#endregion
		
		#region Trade Weapon (<TAM)
		
			case("<TAM"): // Trade Weapon X for weapon Y, set Max ammo to Z (myWeapon, newWeapon, ammo)
				var _oldWeapon = command_runner_getValue(false),
				_newWeapon = command_runner_getValue(false),
				_ammo = command_runner_getValue(true);
				removePlayerWeapon(_oldWeapon);
				addPlayerWeapon(_newWeapon);
				setWeaponAmmo(_newWeapon, _ammo, _ammo);
				command_runner_classic();
				break;
			
		#endregion
		
		#region Weapon Jump (<AMJ)
		
			case("<AMJ"): // Jump to event Y if player has weapon X (weapon, event)
				var _weapon = command_runner_getValue(false), 
				_event = command_runner_getValue(true);
			
				if getPlayerWeapon(_weapon)
				{
					is_running = false; 
					runEvent(_event, EVENT_MAP);
				}
				else
				{
					command_runner_classic();
				}
				break;
			
		#endregion
		
		#region Refill All Ammo (<AE+)
		
			case("<AE+"): // Refill all Ammo
				var _list = getPlayerData(Player_Stat.weapons), _l = ds_list_size(_list);
			
				with PLAYER
				{
					for (var i = 0; i < _l; i++)
					{
						addWeaponAmmo(_list[| i], 9999);
					}
				}
				command_runner_classic();
				break;
			
		#endregion
		
		#region Output Ammo (<NUM)
		
			case("<NUM"):
				var _weapon = command_runner_getValue(true);
			
				if _weapon == 0
				{
					display_text(0, ammoHold);
				}
				else
				{
					display_text(0, string(getWeaponAmmo(_weapon)));
				}
			
				command_runner_classic();
				break;
		
		#endregion
		
			// -----------------------------------------------------
		
			// NPC Handling
		
		#region Animate NPC (<ANP)
		
			case("<ANP"): // Animate Entities linked to Event X with animation Y and direction Z (event, animation, direction)
				var _event = command_runner_getValue(false),
				_state = command_runner_getValue(false),
				_dir = command_runner_getValue(true);
			
				with ENTITY
				{
					if event == _event
					{
						setEntityDirection(_dir);
						setEntityState(_state);
					}
				};
			
				command_runner_classic();
				break;
			
		#endregion
		
		#region Move NPC (<MNP)
		
			case("<MNP"): // Move Entities linked to Event X to xpos Y and ypos Z with direction W (event, x, y, direction)
				var _event = command_runner_getValue(false),
				_x = command_runner_getValue(false) * UNIT_PX,
				_y = command_runner_getValue(false) * UNIT_PX,
				_dir = command_runner_getValue(true);
			
				with ENTITY
				{
					if event == _event
					{
						x = _x;
						y = _y;
						setEntityDirection(_dir);
					}
				};
			
				command_runner_classic();
				break;
			
		#endregion
			
		#region Delete NPC (<DNP)
		
			case("<DNP"): // Delete NPC that is mapped to the x event (event)
				var _event = command_runner_getValue(true);
				with ENTITY
				{
					if event == _event {instance_destroy()}
				}
				command_runner_classic();
				break;
			
		#endregion
		
		#region Delete All NPCs of Type (<DNA)
		
			case("<DNA"): // Delete All NPCs of type X (type)
				var _type = command_runner_getValue(true);
				with ENTITY
				{
					if type == getClassicObject(_type) {instance_destroy()}
				}
				command_runner_classic();
				break;
			
		#endregion
		
		#region Change NPC (<CNP)
		
			case("<CNP"): // Changes Entities with Event X to type Y with direction Z (event, type, direction)
				var _event = command_runner_getValue(false), 
				_type = command_runner_getValue(false),
				_direction = command_runner_getValue(true);
			
				with ENTITY 
				{
					if event == _event
					{
						changeEntity(_type, _direction);
					}
				};
			
				command_runner_classic();
				break;
			
		#endregion
		
		#region NPC Jump (<NCJ)
		
			case("<NCJ"): // Jump to Event Y if an entity with type X exists (type, event)
				var _type = command_runner_getValue(false),
				_obj = getClassicObject(_type),
				_event = command_runner_getValue(true),
				_jump = false;
			
				with ENTITY 
				{
					if object_index == _obj
					{
						_jump = true;
					}
				};
				//msg(_jump)
				if _jump
				{
					is_running = false; runEvent(_event, EVENT_MAP);
				}
				else
				{
					command_runner_classic();
				}
				break;
			
		#endregion
		
			// -----------------------------------------------------
		
			// Bosses
		
		#region Load Boss Script (<BSL)
		
			case("<BSL"): // Run Boss script with npc linked to event X (event)
				var _event = command_runner_getValue(true);
			
				with ENTITY
				{
					if event == _event
					{
						instance_create_dependent(id, obj_bossHealthbar)
					}
				};
			
				command_runner_classic();
			
				break;
			
		#endregion
		
			// -----------------------------------------------------
		
			// Graphics
		
		#region Show Item (<GIT)
		
			case("<GIT"): // Show Item in text box
				var _item = command_runner_getValue(true);
			
				// If item is set to 0, Close item display
				if _item == 0
				{
					if instance_exists(obj_textItem)
					{
						with obj_textItem {instance_destroy()};
					}
				}
				// Item is not 0, Show item on screen
				else
				{
					if !instance_exists(obj_textItem)
					{
						instance_create_depth(x, y, 0, obj_textItem);
					}
			
					with obj_textItem
					{
						if _item >= 1000 
						{
							sprite_index = spr_item;
							itemIndex = _item - 1000;
						}
						else 
						{
							sprite_index = spr_weapon;
							itemIndex = _item;
						}
					}
				}
				command_runner_classic();
				break;
			
		#endregion
		
		#region Flash Screen (<FLA)
		
			case("<FLA"): // Flash Screen with White
				instance_create_depth(0, 0, 0, obj_flash);
				command_runner_classic();
				break;
			
		#endregion
		
		#region Map Name (<MNA)
		
			case("<MNA"): // Show Map Name
				instance_create_depth(0, 0, 0, obj_mapname);
				command_runner_classic();
				break;
			
		#endregion
		
		#region Quake (<QUA)
		
			case("<QUA"): // Shake screen for x frames (frames)
				shakeScreen(command_runner_getValue(true), 4);
				command_runner_classic();
				break;
			
		#endregion
		
		#region Change Map Tile (<CMP)
		
			case("<CMP"): // Change tile at X, Y to Z (cell_x, cell_y, tile)
				var _x = command_runner_getValue(false), _y = command_runner_getValue(false),
				_tile = command_runner_getValue(true);
			
				changeStageTile(0, _x, _y, _tile);
				part_particles_create_region_wh(PART_SYS_FOREGROUND, 
					_x * UNIT_PX, _y * UNIT_PX,
					UNIT_PX, UNIT_PX, getPartType(Part_Index.poof), 3
					);
				
				sfxCut_at(sfx_classic(snd_blockDestroy), _x, _y, 0);
				command_runner_classic();
				break;
			
		#endregion
		
		#region Display Map (<MLP)
		
			case("<MLP"): // Show Map Name
				instance_create_depth(0, 0, 0, obj_player_map);
				command_runner_classic();
				break;
			
		#endregion
		
		#region Map Jump (<MPJ)
		
			case("<MPJ"): // Go to event X if map system is present (event)
				var _event = command_runner_getValue(true);
			
				if getPlayerItem(Item.mapSystem)
				{
					is_running = false; runEvent(_event, EVENT_MAP);
				}
				else
				{
					command_runner_classic();
				}
				break;
		
		#endregion
			
			// -----------------------------------------------------
		
			// Fades
		
		#region Fade Out (<FAO)
		
			case("<FAO"): // Fade Out (direction)
				screenFade(false, command_runner_getValue(true));
				is_running = false;
				script_mode = Script_Mode.fade;
				break;
			
		#endregion
		
		#region Fade In (<FAI)
		
			case("<FAI"): // Fade In
				screenFade(true, command_runner_getValue(true));
				script_mode = Script_Mode.fade;
				break;
			
		#endregion
		
			// -----------------------------------------------------
		
			// Focus
		
		#region Focus on NPC (<FON)
		
			case("<FON"): // Focus on Entity X in Y Frames (entityEvent, frames)
				var _event = command_runner_getValue(false),
				_frames = command_runner_getValue(true);
			
				setCamera_focus(_event, _frames);
			
				if _frames <= 1
				{
					var _inst = find_entity(_event);
				
					setCamera_center(_inst[0].x, _inst[0].y);
				}
			
				command_runner_classic();
				break;
			
		#endregion
		
		#region Focus on Me (<FOM)
		
			case("<FOM"): // Focus on Player in X Frames (frames)
				var _frames = command_runner_getValue(true);
			
				setCamera_state(Camera_State.player);
			
				if _frames <= 1
				{
					setCamera_center(PLAYER.x, PLAYER.y);
				}
				command_runner_classic();
				break;
			
		#endregion
		
			// -----------------------------------------------------
		
			// Audio
		
		#region Play Song (<CMU)
		
			case("<CMU"): // Play Song
				var _song = command_runner_getValue(true);
				bgm(_song);
				command_runner_classic();
				break;
			
		#endregion
		
		#region Resume Last Played Song (<RMU)
		
			case("<RMU"): // Resume Last Played Song
				bgm_resume();
				command_runner_classic();
				break;
			
		#endregion
		
		#region Fade Music (<FMU)
		
			case("<FMU"): // Fade Music
				bgm_fade(140);
				command_runner_classic();
				break;
			
		#endregion
		
		#region Play Sound (<SOU)
		
			case("<SOU"):
				//sfxCut();
				var _snd = command_runner_getValue(true);
				sfx(sfx_classic(_snd));
				command_runner_classic();
				break;
			
		#endregion
		
		#region Play Stream Sound (<SSS)
		
			case("<SSS"):
				var _snd = command_runner_getValue(true);
				sfx(sfx_classic(_snd));
				command_runner_classic();
				break;
			
		#endregion
			
			// -----------------------------------------------------
		
		#region Increase Max Life (<ML+)
		
			case("<ML+"): // Increase Max life by X (life)
				var _hp = command_runner_getValue(true), 
				_newHp;
				
				with PLAYER
				{
					_newHp = ceil(
						(PLAYER.healthPoints / PLAYER.healthPointsMax) *
						(PLAYER.healthPointsMax + _hp)
						);
				
					healthPointsMax += _hp;
					healthPoints = _newHp;
				
					setPlayerData(Player_Stat.lifeMax, healthPointsMax);
					setPlayerData(Player_Stat.life, healthPoints);
				}
			
				command_runner_classic();
				break;
			
		#endregion
		
		#region Increase Life (<LI+)
		
			case("<LI+"): // Increase life by X (life)
				var _hp = command_runner_getValue(true);
			
				with PLAYER
				{
					healthPoints = min(healthPoints + _hp, healthPointsMax);
					setPlayerData(Player_Stat.life, healthPoints);
				}
				command_runner_classic();
				break;
			
		#endregion
		
			// -----------------------------------------------------
		
			// Player Animations
		
		#region Set Player Direction (<MYD)
		
			case("<MYD"):
				var _dir = command_runner_getValue(true);
				with PLAYER
				{
					setEntityDirection(_dir);
					direction = dirAngle(_dir);
					playerFlag = clearBit(playerFlag, Player_Flag.searching);
					setAnimation(Sequence_player.idle);
				
					if _dir == Dir.down
					{
						setAnimation(Sequence_player.search, true);
						updateAnimation();
						playerFlag = setBit(playerFlag, Player_Flag.searching);
					}
				}
				command_runner_classic();
				break;
			
		#endregion
		
		#region Hide Player (<HMC)
		
			case("<HMC"):
				playerVisible(false);
				command_runner_classic();
				break;
			
		#endregion
		
		#region Show Player (<SMC)
		
			case("<SMC"):
				playerVisible(true);
				command_runner_classic();
				break;
			
		#endregion
		
		#region Player Jumps in Direction (<MYB)
		
			case("<MYB"): // Player Jumps in direction (dir)
				var _spd = 2, _dir = command_runner_getValue(true);
			
				with PLAYER
				{
					switch(_dir)
					{
						case(Dir.left): // Bump Left (Move Right)
							x_speed = _spd; y_speed = -_spd; break;
						
						case(Dir.up): // Bump Up
							y_speed = -_spd; break;
						
						case(Dir.right): // Bump Right (Move Left)
							x_speed = -_spd; y_speed = -_spd; break;
						
						case(Dir.down): // Bump Down (?)
							y_speed = _spd; break;
					}
				
					setAnimation(Sequence_player.air);
				}
				command_runner_classic();
				break;
			
		#endregion
		
		#region Set Player Horizontal Motion to 0 (<MM0)
		
			case("<MM0"): // Set Player Horizontal motion to 0
				with PLAYER {x_speed = 0; if !getFlag(Entity_Flag.inAir) {setAnimation(Sequence_player.idle)}}
				command_runner_classic();
				break;
			
		#endregion
		
		#region Move Player (<MOV)
		
			case("<MOV"): // Move Player to Cell X, Cell Y (x,y)
				var _x = command_runner_getValue(false), _y = command_runner_getValue(true); 
				with PLAYER
				{
					x = _x * UNIT_PX;
					y = _y * UNIT_PX;
				}
				command_runner_classic();
				break;
			
		#endregion
		
		#region Wait until Standing (<WAS)
		
			case("<WAS"): // Pause Script until standing
				script_mode = Script_Mode.waitTillStanding;
				break;
			
		#endregion
			
			// -----------------------------------------------------
		
		}
	}


}
