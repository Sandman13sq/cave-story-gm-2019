function needMissiles() {

	return 
	(
		ds_list_find_index(PLAYER_DATA[? Player_Stat.weapons], Weapon.missileLauncher) != -1
		|| ds_list_find_index(PLAYER_DATA[? Player_Stat.weapons], Weapon.superLauncher) != -1
		|| ds_list_find_index(PLAYER_DATA[? Player_Stat.weapons], Weapon.grenadeLauncher) != -1
		|| ds_list_find_index(PLAYER_DATA[? Player_Stat.weapons], Weapon.shark) != -1
	)


}
