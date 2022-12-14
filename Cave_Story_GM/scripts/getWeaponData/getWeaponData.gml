/// @desc Returns weapon data map of weapon's level
/// @arg player_index,weapon_index
function getWeaponData(argument0, argument1) {

	var _player = argument0,
	_map = ds_map_find_value(GAME.weaponMap, argument1),
	_list = _map[? Wep_Meta.data];

	return _list[| clamp(_map[? Wep_Meta.level] - 1, 0, _map[? Wep_Meta.levelMax]) ];


}
