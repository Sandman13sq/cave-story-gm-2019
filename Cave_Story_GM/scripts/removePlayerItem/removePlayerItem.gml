/// @desc Returns value of player data
/// @arg item_index
function removePlayerItem(argument0) {

	var _list = PLAYER_DATA[? Player_Stat.items], _index = argument0;

	ds_list_delete(_list, ds_list_find_index(_list, _index) );


}
