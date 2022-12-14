/// @desc Updates Player weapon object
/// @arg *show_bar
function update_weapon() {

	//if getGameplayFlag(Gameplay_Flag.playerExists)

	var _showWep = false;

	instance_destroy(obj_player_weapon);

	if ds_list_size(weaponList) <= 0
	{
		weaponMeta = getWeaponMeta(0, Weapon.none);
		weaponData = getWeaponData(0, Weapon.none);
		weaponObj = noone;
	}
	else
	{
		// Show Weapon Switch
		if getGameplayFlag(Gameplay_Flag.showGUI)
		{
			var _showBar = true;
		
			if argument_count > 0 {_showBar = argument[0]}
		
			if _showBar
			{
				if !instance_exists(obj_player_weaponSwitch)
				{instance_create_dependent(self, obj_player_weaponSwitch)}

				with obj_player_weaponSwitch
				{
					alarm[0] = 120;
					weaponList = other.weaponList;
					weaponCurrent = other.weaponCurrent;
				}
			}
		}

		var _wep = weaponList[| weaponCurrent];

		weaponMeta = getWeaponMeta(0, _wep);
		weaponData = getWeaponData(0, _wep);
		
		if _wep != Weapon.none
		{
			weaponObj = create_weapon_obj(weaponData[? Wep_Data.object]);
			
			// Sprite
			_showWep = sprite_exists(weaponObj.sprite_index);
		
			with weaponObj
			{
				event_perform(ev_step, ev_step_end);
				updateAnimation();
			}
		}
	}
	
	// Sprite
	if _showWep
	{
		// Set to weapon Sprite
		sprite_index = playerSpriteSet[1];
	}
	else
	{
		// Set to No weapon Sprite
		sprite_index = playerSpriteSet[0];
	}

	setPlayerData(Player_Stat.current_weapon, weaponCurrent);


}
