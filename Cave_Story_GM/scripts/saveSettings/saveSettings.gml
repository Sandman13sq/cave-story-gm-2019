/// @desc Writes settings to file
function saveSettings() {

	// loadSettings()

	with GAME
	{
		ini_open(SETTINGS_PATH);
	
		// Audio
		ini_write_string("Audio", "Master", round(VOLUME_MASTER * 100));
		ini_write_string("Audio", "BGM", round(VOLUME_BGM * 100));
		ini_write_string("Audio", "SFX", round(VOLUME_SFX * 100));
	
		// Game Flags
		ini_write_string("Game", "GM_Flags", FLAGS_GM);
	
		if getBit(FLAGS_GM, GM_Flag.startWith_edge) 
			{addPlayerWeapon(Weapon.edge, 0);}
		else
			{removePlayerWeapon(Weapon.edge)}
		
		if getBit(FLAGS_GM, GM_Flag.startWith_grenadeLauncher) 
			{addPlayerWeapon(Weapon.grenadeLauncher, 0);}
		else
			{removePlayerWeapon(Weapon.grenadeLauncher)}
		
		if getBit(FLAGS_GM, GM_Flag.startWith_shark) 
			{addPlayerWeapon(Weapon.shark, 0);}
		else
			{removePlayerWeapon(Weapon.shark)}
	
		ini_close();
	}


}
