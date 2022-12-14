/// @desc Adds experience to weapon and does appropriate stuffs
/// @arg experience
function weapon_addExperience(argument0) {

	// Returns amount subtracted

	if ds_exists(weaponMeta, ds_type_map)
	{
		var _exp = argument0, _level = weaponMeta[? Wep_Meta.level], _diff = 0;

	#region Exp amount is positive

		if _exp > 0
		{
			// Add Exp
			weaponData[? Wep_Data.energy] = _level <= 1?
				max(weaponData[? Wep_Data.energy] + _exp, 0): weaponData[? Wep_Data.energy] + _exp;
			_diff += _exp;

			// Check if overflows or matches max
			if weaponData[? Wep_Data.energy] >= weaponData[? Wep_Data.energyMax]
			{
				// Get Value of Overflow
				_diff -= diff(weaponData[? Wep_Data.energy], weaponData[? Wep_Data.energyMax]);
				_exp = weaponData[? Wep_Data.energy] - weaponData[? Wep_Data.energyMax];
		
				// Set Exp for level to Max
				weaponData[? Wep_Data.energy] = weaponData[? Wep_Data.energyMax];
	
				// Jump to next level if not max
				if _level < weaponMeta[? Wep_Meta.levelMax]
				{
					weaponMeta[? Wep_Meta.level]++;
					update_weapon_pre(); update_weapon(false);
					_diff += weapon_addExperience(_exp); // RECCCCURSIONNN
		
					sfxCut(snd_levelUp);
		
					instance_create_depth(MY_X, MY_Y, LyrDepth.maxFront, obj_gfxLevelUp);
				}
			}
		}

	#endregion

	#region Exp amount is negative

		if _exp < 0
		{
			// Add Exp
			weaponData[? Wep_Data.energy] = _level <= 1?
				max(weaponData[? Wep_Data.energy] + _exp, 0): weaponData[? Wep_Data.energy] + _exp;
			_diff += abs(_exp);

			// Check if overflows or matches max
			if weaponData[? Wep_Data.energy] < 0
			{
				// Get Value of Overflow
				_diff -= diff(weaponData[? Wep_Data.energy], 0);
	
				// Jump to last level if not min
				if _level > 1
				{
					weaponMeta[? Wep_Meta.level]--;
					_level = weaponMeta[? Wep_Meta.level];
			
					// Set Exp for level to Max
					weaponData[? Wep_Data.energy] = weaponData[? Wep_Data.energyMax];
			
					update_weapon_pre(); update_weapon(false);
					_diff += weapon_addExperience(_exp); // RECCCCURSIONNN
		
					//sfxCut(snd_levelUp);
		
					with instance_create_depth(MY_X, MY_Y, LyrDepth.maxFront, obj_gfxLevelUp)
					{
						subimage = 2;
					};
				}
			}
		}

	#endregion

	}
	else
	{
		_diff = 0;
	}

	return _diff;


}
