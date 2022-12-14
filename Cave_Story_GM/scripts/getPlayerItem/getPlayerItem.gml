/// @desc Returns value of player data
/// @arg item_index
function getPlayerItem() {

	return ds_list_find_index(PLAYER_DATA[? Player_Stat.items], argument[0]) != -1;


}
