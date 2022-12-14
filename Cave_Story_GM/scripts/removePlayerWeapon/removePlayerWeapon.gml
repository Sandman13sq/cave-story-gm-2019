/// @desc Returns value of player data
/// @arg weapon
function removePlayerWeapon() {

	var _weapon = argument[0];

	ds_list_delete(PLAYER_DATA[? Player_Stat.weapons], 
		ds_list_find_index(PLAYER_DATA[? Player_Stat.weapons], _weapon)
		);
	
	/*
	if ds_list_size(PLAYER_DATA[? Player_Stat.weapons]) == 0
	{
		ds_list_add(PLAYER_DATA[? Player_Stat.weapons], Weapon.none);
	}

/* end removePlayerWeapon */
}
