/// @desc Returns weapon meta
/// @arg player_index,weapon_index
function getWeaponMeta(argument0, argument1) {

	var _player = argument0;

	return ds_map_find_value(GAME.weaponMap, argument1);


}
