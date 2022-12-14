/// Resumes last played song
/// @arg *time_until_full_volume
function bgm_resume() {

	with (Mas.music)
	{
		if ds_map_exists(GAME.sampleData, gameBGM_indexLast)
		{
			_set_bgm(gameBGM_stream, gameBGM_indexLast, 
				gameBGM_loopLast[0], gameBGM_loopLast[1]);
		}
		else
		{
			_set_bgm(asset_get_index(gameBGM_soundLast), gameBGM_indexLast, 
				gameBGM_loopLast[0], gameBGM_loopLast[1]);
		}

		audio_sound_set_track_position(gameBGM_sound, gameBGM_positionLast);

		if argument_count > 0
		{
			audio_sound_gain(gameBGM_sound, 0, 0);
			audio_sound_gain(gameBGM_sound, VOLUME_BGM, argument[0]);
		}
	}


}
