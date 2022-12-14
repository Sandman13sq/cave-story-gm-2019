/// @desc Adds experience to weapon and does appropriate stuffs
/// @arg experience
function weapon_removeExperience(argument0) {

	// Returns amount subtracted

	var _exp = argument0, _level = weaponData[0, Weapon_Data.level], _diff = 0;

	// Add Exp
	weaponData[_level, Weapon_Data.experience] += _exp;
	_diff += _exp;

	// Check if overflows or matches max
	if weaponData[_level, Weapon_Data.experience] >= weaponData[_level, Weapon_Data.maxExperience]
	{
		// Get Value of Overflow
		_diff -= diff(weaponData[_level, Weapon_Data.experience], weaponData[_level, Weapon_Data.maxExperience]);
		_exp = weaponData[_level, Weapon_Data.experience] - weaponData[_level, Weapon_Data.maxExperience];
		
		// Set Exp for level to Max
		weaponData[_level, Weapon_Data.experience] = weaponData[_level, Weapon_Data.maxExperience];
	
		// Jump to next level if not max
		if _level < weaponData[0, Weapon_Data.maxLevel]
		{
			weaponData[0, Weapon_Data.level]++;
			update_weapon_pre(); update_weapon();
			_diff += weapon_addExperience(_exp); // RECCCCURSIONNN
		
			sfxCut(snd_levelUp);
		
			instance_create_depth(MY_X, MY_Y, LyrDepth.maxFront, obj_gfxLevelUp);
		}
	}

	return _diff;


}
