///
/// @arg weapon_index,level,experience,maxExperience,object,sprite
function set_weapon_data(argument0, argument1, argument2, argument3, argument4, argument5) {

	var _index = argument0, _level = argument1,
	_weapon = weaponData_list[| _index];

	_weapon[0, 1] = max(_level, _weapon[0, 1]);
	_weapon[_level, 2] = argument2;
	_weapon[_level, 3] = argument3;
	_weapon[_level, 4] = argument4;
	_weapon[_level, 5] = argument5;

	weaponData_list[| _index] = _weapon;


}
