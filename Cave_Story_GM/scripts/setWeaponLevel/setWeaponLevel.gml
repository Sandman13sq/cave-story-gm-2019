/// @desc Sets the level data for a weapon
/// @arg weapon,current_level,experience
function setWeaponLevel(argument0, argument1, argument2) {

	var _weapon = argument0, 
	_meta = getWeaponMeta(0, _weapon);

	if argument1 > -1 {_meta[? Wep_Meta.level] = argument1;}

	// Clear All Energy
	var _list = _meta[? Wep_Meta.data], _data,
	_l = ds_list_size(_list), _lvl = _meta[? Wep_Meta.level];

	for (var i = 0; i < _l; i++)
	{
		_data = _list[| i];
	
		if (i + 1) < _lvl
		{
			_data[? Wep_Data.energy] = _data[? Wep_Data.energyMax];
		}
		else if (i + 1) == _lvl
		{
			if argument2 > -1 {_data[? Wep_Data.energy] = argument2;}
		}
		else
		{
			_data[? Wep_Data.energy] = 0;
		}
	
		cout(i + 1, _data[? Wep_Data.energy]);
	
		_list[| i] = _data;
	}


}
