/// @desc 

#region enum Music

enum Music
{
	// Classic
	null = 0,
	mischeviousRobot,
	safety,
	gameOver,
	gravity,
	grasstown,
	meltdown2,
	eyesOfFlame,
	gestation,
	mimigaTown,
	itemGet,
	balrog,
	cemetery,
	plant,
	pulse,
	victory,
	lifeFanfare,
	tyrant,
	run,
	jenka,
	labyrinthFight,
	access,
	oppression,
	geothermal,
	plantation,
	moonsong,
	heroEnd,
	scorchingBack,
	quiet,
	lastCave,
	balcony,
	charge,
	lastBattle,
	theWayBackHome,
	zombie,
	breakDown,
	runningHell,
	jenka2,
	livingWaterway,
	sealChamber,
	toroko,
	white,
	
	// Beta
	pierWalk,
	betaTheme,
	
	// GM
	moonsongMidi,
	mizuno,
}

#endregion

#macro MUSIC mas_music
#macro MUSIC_QUEUE_SIZE 5

sampleData = ds_map_create();

sound_init();

audio_listener_orientation(0, 0, -1000, 0, 1, 0);
audio_falloff_set_model(audio_falloff_exponent_distance_clamped);
audio_channel_num(32);

titleList = list_create(); // Functions as a queue

timer = -1; // Timer to Stop music on fade

//bgm()