/// @desc Writes settings to file
function loadSettings() {

	// saveSettings()

	ini_open(SETTINGS_PATH);
	
	var _volMaster = 50, _volBGM = 50, _volSFX = 32;

	with MUSIC
	{
		// Audio
		gameSound = gameSound & ~(FullMask._16);
		gameSound = gameSound | (ini_read_real("Audio", "BGM", _volBGM)) << 0;
		gameSound = gameSound | (ini_read_real("Audio", "SFX", _volSFX)) << 8;
	
		audio_master_gain(ini_read_real("Audio", "Master", _volMaster) / 100);
	}
	
	// Game Flags
	FLAGS_GM = ini_read_real("Game", "GM_Flags", -1 );

	if FLAGS_GM == -1
	{
		FLAGS_GM = setBit(0, 
			GM_Flag.dreamStoryFont, 
			GM_Flag.energyGravitation,
			);
	}
	
	DEBUG = getBit(FLAGS_GM, GM_Flag.debug);

	global.MainFont = getBit(FLAGS_GM, GM_Flag.dreamStoryFont)? global.DreamFont: fnt_main;
	
	/*

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
	
	//*/
	
	ini_close();


}
