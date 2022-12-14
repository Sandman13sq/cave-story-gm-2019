/// @desc Begins classic game
function startClassicGame() {

	// Weapons
	var _list = getPlayerData(Player_Stat.weapons);
	ds_list_clear(_list);

	var _l = Weapon.count;
	for (var i = 0; i < _l; i++)
	{
		setWeaponAmmo(0, 0);
	}

	//addPlayerWeapon(Weapon.none);

	FLAGS_EVENT = array_create(160, 0);
	FLAGS_EQUIP = 0;

	// Items
	var _list = getPlayerData(Player_Stat.items);
	ds_list_clear(_list);

	// Health
	setPlayerData(Player_Stat.life, 3);
	setPlayerData(Player_Stat.lifeMax, 3);

	setPlayerData(Player_Stat.dir, 2);

	load_classic_map(13, 200, 10, 8);


}
