/// @desc Initialize player variables
function destroy_playerData() {

	list_free(getPlayerData(Player_Stat.items));
	list_free(getPlayerData(Player_Stat.weapons));
	ds_map_destroy(playerData);


}
