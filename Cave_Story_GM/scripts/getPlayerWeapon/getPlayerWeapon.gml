/// @desc Returns value of player data
/// @arg weapon_index
function getPlayerWeapon() {

	return ds_list_find_index(PLAYER_DATA[? Player_Stat.weapons], argument[0]) != -1;


}
