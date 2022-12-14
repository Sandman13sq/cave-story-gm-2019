/// @desc Returns value of player data
/// @arg item_index,*allow_duplicates?
function addPlayerItem() {

	var _duplicates = false;

	if argument_count > 1
	{
		_duplicates = bool(argument[1]);
	}


	if _duplicates
	{
		ds_list_add(PLAYER_DATA[? Player_Stat.items], argument[0]);
	}
	else
	{
		if ds_list_find_index(PLAYER_DATA[? Player_Stat.items], argument[0]) == -1
		{
			ds_list_add(PLAYER_DATA[? Player_Stat.items], argument[0]);
		}
	}


}
