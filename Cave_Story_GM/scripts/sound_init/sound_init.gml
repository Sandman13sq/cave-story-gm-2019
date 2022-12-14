///
function sound_init() {
	var _volBGM = 50, _volSFX = 32;

	// VOLUME_BGM
	gameSound = 0; //VOLUME_SFX & BGM ID
	gameSound = gameSound | _volBGM << 0; // BGM Volume
	gameSound = gameSound | _volSFX << 8; // SFX Volume

	gameBGM_sound = -1;
	gameBGM_stream = -1;
	gameBGM_index = -1;

	gameBGM_loop[1] = 0; // Place to end loop of music
	gameBGM_loop[0] = 0; // Place to start loop of music

	gameBGM_soundLast = "";
	gameBGM_indexLast = -1;
	gameBGM_positionLast = -1;
	gameBGM_loopLast = -1;

	audio_master_gain(1);

	snd_cutoff = -1; // Index of sound to cut off

	/*
	msg(string(gameSound) + "\n", 
		bitString(gameSound) + "\n",
		bitString(gameSound >> 0) + "\n",
		bitString(gameSound >> 0 & FullMask._8) + "\n",
		)

/* end sound_init */
}
