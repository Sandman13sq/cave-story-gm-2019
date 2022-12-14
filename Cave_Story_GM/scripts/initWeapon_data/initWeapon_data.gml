/// @desc Returns map of weapon data
/// @arg object,maxEnergy
function initWeapon_data(argument0, argument1) {

	var _map = ds_map_create(),
	_obj = argument0, _energy = argument1;

	_map[? Wep_Data.object] = _obj;

	_map[? Wep_Data.energy] = 0;
	_map[? Wep_Data.energyMax] = _energy;

	return _map;


}
