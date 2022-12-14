///
/// @arg weapon_index,maxAmmo,currentAmmo
function set_weapon_ammo() {

	var _index = argument[0],
	_weapon = weaponData_list[| _index];

	// Set max ammo
	_weapon[_index, 2] = argument[1];

	if argument_count > 2
	{
		// Set current ammo
		_weapon[_index, 3] = argument[2];
	}

	weaponData_list[| _index] = _weapon;


}
