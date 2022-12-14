/// @desc Returns value of player data
/// @arg weapon,*allow_duplicates?
function addPlayerWeapon() {

	var _duplicates = false, _weapon = argument[0],
	_list = getPlayerData(Player_Stat.weapons);

	if argument_count > 1
	{
		_duplicates = bool(argument[1]);
	}

	if _duplicates
	{
		ds_list_add(_list, _weapon);
	}
	else
	{	
		if ds_list_find_index(_list, _weapon) == -1
		{
			while ds_list_find_index(_list, Weapon.none) != -1
			{ds_list_delete(_list, ds_list_find_index(_list, Weapon.none));}
		
			ds_list_add(_list, _weapon);
		}
	}

	with PLAYER {update_weapon(false)}


}
