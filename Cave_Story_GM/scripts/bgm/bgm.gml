/// Sets bgm stuff
/// @arg bgm_index
function bgm() {

	var _index = argument[0];

	// Hold Current Music Data
	with (Mas.music)
	{
		gameBGM_soundLast = audio_get_name(gameBGM_sound);
		gameBGM_indexLast = gameBGM_index;
		gameBGM_positionLast = audio_sound_get_track_position(gameBGM_sound);
		gameBGM_loopLast[1] = gameBGM_loop[1];
		gameBGM_loopLast[0] = gameBGM_loop[0];
	}

	// For get_musicTime(), choose one bar AFTER the desired bar

	// Use Sample List
	if ds_map_exists(GAME.sampleData, _index)
	{
		var _arr = GAME.sampleData[? _index];
	
		with MUSIC
		{
			if _index != gameBGM_index
			{
				if gameBGM_stream != -1
				{
					audio_destroy_stream(gameBGM_stream);
					gameBGM_stream = -1;
				}
			}
	
			gameBGM_stream = audio_create_stream(
				file_dir_string("Mods", DATANAME, "Music") + _arr[3] );
		
			_set_bgm(gameBGM_stream, _index, _arr[0], _arr[1]);
		
			if _arr[4] != ""
			{
				showMusicTitle(_arr[4]);
			}
		}
	}
	// Load native stuffs
	else
	{
		switch(_index)
		{
			default: case(Music.null):
				with (Mas.music)
				{
					_set_bgm(0, _index, 0, 0); 
					audio_stop_sound(gameBGM_sound);
				
					gameBGM_index = Music.null;
					gameBGM_loop[0] = -1;
					gameBGM_loop[1] = -1;
				}
				break;

		#region Pier Walk
			case(Music.pierWalk): // Pier Walk
				_set_bgm_org(mus_pierWalk, _index, 100, 6, 4, 9, 33);
				showMusicTitle("Pier Walk");
				break;
		#endregion

		#region Plantation
			case(Music.plantation): // Plantation
				_set_bgm_org(mus_plantation, _index, 92, 6, 4, 5, 62);
				showMusicTitle("Plantation");
				break;
		#endregion

		#region Beta Theme
			case(Music.betaTheme): // Beta Theme
				_set_bgm_org(mus_betaTheme, _index, 92, 4, 6, 5, 62);
				showMusicTitle("Cave Story (Beta)");
				break;
		#endregion

		#region Mischevious Robot
			case(Music.mischeviousRobot): // Mischevious Robot
				_set_bgm_org(mus_mischeviousRobot, _index, 94, 4, 4, 9, 41);
				showMusicTitle("Mischevious Robot");
				break;
		#endregion

		#region Safety
			case(Music.safety): // Safety
				_set_bgm_org(mus_safety, _index, 110, 3, 4, 5, 57);
				showMusicTitle("Safety");
				break;
		#endregion

		#region Game Over
			case(Music.gameOver): // Game Over
				_set_bgm_org(mus_gameOver, _index, 128, 4, 6, 7, 9);
				break;
		#endregion

		#region Gravity
			case(Music.gravity): // Gravity
				_set_bgm_org(mus_gravity, _index, 86, 4, 4, 7, 39);
				break;
		#endregion

		#region On to Grasstown
			case(Music.grasstown): // On to Grasstown
				_set_bgm_org(mus_ontoGrasstown, _index, 90, 4, 4, 17, 65);
				showMusicTitle("On to Grasstown");
				break;
		#endregion

		#region Meltdown 2
			case(Music.meltdown2): // Meltdown 2
				_set_bgm_org(mus_meltdown2, _index, 105, 4, 4, 1, 37);
				showMusicTitle("Meltdown 2");
				break;
		#endregion

		#region Eyes Of Flame
			case(Music.eyesOfFlame): // Eyes Of Flame
				_set_bgm_org(mus_eyesOfFlame, _index, 80, 4, 4, 9, 41);
				break;
		#endregion

		#region Gestation
			case(Music.gestation): // Gestation
				_set_bgm_org(mus_gestation, _index, 160, 4, 4, 5, 29)
				showMusicTitle("Gestation");
				break;
		#endregion

		#region Mimiga Town
			case(Music.mimigaTown): // Mimiga Town
				_set_bgm_org(mus_mimigaTown, _index, 140, 4, 4, 1, 31);
				showMusicTitle("Mimiga Town");
				break;
		#endregion

		#region Item Get
			case(Music.itemGet): // Item Get
				_set_bgm_org(mus_itemGet, _index, 0, 0, 0, -1, -1);
				break;
		#endregion
	
		#region Balrog Theme
			case(Music.balrog):
				_set_bgm_org(mus_balrog, _index, 100, 4, 4, 1, 17);
				break;
		#endregion

		#region Cemetery
			case(Music.cemetery): // Cemetery
				_set_bgm_org(mus_cemetery, _index, 180, 4, 3, 5, 21);
				showMusicTitle("Cemetery");
				break;
		#endregion

		#region Plant
			case(Music.plant): // Plant
				_set_bgm_org(mus_plant, _index, 140, 3, 4, 17, 33);
				showMusicTitle("Plant");
				break;
		#endregion

		#region Pulse
			case(Music.pulse): // Pulse
				_set_bgm_org(mus_pulse, _index, 120, 4, 4, 9, 33);
				showMusicTitle("Pulse");
				break;
		#endregion

		#region Boss Fanfare
			case(Music.victory): // Boss Fanfare
				_set_bgm_org(mus_victory, _index, 0, 0, 0, -1, -1);
				break;
		#endregion

		#region Life Fanfare
			case(Music.lifeFanfare): // Life Fanfare
				_set_bgm_org(mus_lifeFanfare, _index, 0, 0, 0, -1, -1);
				break;
		#endregion

		#region Jenka 1
			case(Music.jenka): // Jenka 1
				_set_bgm_org(mus_jenka, _index, 128, 4, 3, 5, 29);
				showMusicTitle("Jenka 1");
				break;
		#endregion

		#region Labyrinth Fight
			case(Music.labyrinthFight): // Labyrinth Fight
				_set_bgm_org(mus_labyrinthFight, _index, 80, 4, 4, 1, 45);
				showMusicTitle("Labyrinth Fight");
				break;
		#endregion

		#region Access
			case(Music.access): // Access
				_set_bgm_org(mus_access, _index, 100, 4, 4, 1, 9);
				showMusicTitle("Access");
				break;
		#endregion

		#region Oppression
			case(Music.oppression): // Oppression
				_set_bgm_org(mus_oppression, _index, 128, 4, 3, 5, 28);
				showMusicTitle("Oppression");
				break;
		#endregion

		#region Geothermal
			case(Music.geothermal): // Geothermal
				_set_bgm_org(mus_geothermal, _index, 140, 4, 4, 9, 33);
				showMusicTitle("Geothermal");
				break;
		#endregion

		#region Moonsong
			case(Music.moonsong): // Moonsong
				if irandom(1) 
				{
					_set_bgm(mus_moonsongMidi, _index, 
						get_musicTime(120, 4, 8), 
						get_musicTime(120, 4, 56));
					showMusicTitle("Moonsong (Midi)");
				}
				else
				{_set_bgm_org(mus_moonsong, _index, 120, 4, 4, 9, 41); showMusicTitle("Moonsong");}
				break;
		#endregion

		#region Scorching Back
			case(Music.scorchingBack): // Scorching Back
				_set_bgm_org(mus_scorchingBack, _index, 94, 4, 4, 13, 45);
				showMusicTitle("Scorching Back");
				break;
		#endregion

		#region Quiet
			case(Music.quiet): // Quiet
				_set_bgm_org(mus_quiet, _index, 200, 4, 4, 9, 21);
				showMusicTitle("Quiet");
				break;
		#endregion

		#region Last Cave
			case(Music.lastCave): // Last Cave
				_set_bgm_org(mus_lastCave, _index, 116, 4, 4, 9, 49);
				showMusicTitle("Last Cave");
				break;
		#endregion

		#region Balcony
			case(Music.balcony): // Balcony
				_set_bgm_org(mus_balcony, _index, 160, 4, 4, 9, 17);
				showMusicTitle("Balcony");
				break;
		#endregion

		#region Jenka 2
			case(Music.jenka2): // Jenka 2
				_set_bgm_org(mus_jenka2, _index, 110, 4, 4, 1, 27);
				showMusicTitle("Jenka 2");
				break;
		#endregion

		#region Living Waterway
			case(Music.livingWaterway): // Living Waterway
				_set_bgm_org(mus_livingWaterway, _index, 128, 4, 4, 1, 33);
				showMusicTitle("Living Waterway");
				break;
		#endregion

		#region Running Hell
			case(Music.runningHell): // Running Hell
				_set_bgm_org(mus_runningHell, _index, 90, 4, 4, 9, 49);
				showMusicTitle("Running Hell");
				break;
		#endregion
	
		#region White
			case(Music.white): // White
				_set_bgm_org(mus_white, _index, 100, 4, 6, 2, 42);
				showMusicTitle("White");
				break;
		#endregion
	
		// =============================================================================

		// GM
		#region Moonsong Midi
			case(Music.moonsongMidi): // Moonsong Midi
				_set_bgm(mus_moonsongMidi, _index, 
					get_musicTime(120, 4, 8), 
					get_musicTime(120, 4, 56))
				showMusicTitle("Moonsong (Midi)");
				break;
		#endregion
		
		#region Mizuno
			case(Music.mizuno): // Mizuno
				_set_bgm(mus_mizuno, _index, 
					7.25, 
					65.62)
				showMusicTitle("Mizuno");
				break;
		#endregion
		}
	}


}
