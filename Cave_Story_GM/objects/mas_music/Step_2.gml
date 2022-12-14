/// @desc Loop Music

if audio_is_playing(gameBGM_sound)
{
	if gameBGM_loop[0]
	{
		var _time = delta_time / 1000000;
		if audio_sound_get_track_position(gameBGM_sound) > 
			gameBGM_loop[1] - _time
		{
			audio_sound_set_track_position(
				gameBGM_sound, //gameBGM_loop[0] - _time
				audio_sound_get_track_position(gameBGM_sound)
					- gameBGM_loop[1] + gameBGM_loop[0]
				);
		}
	}
}

if timer == 0
{
	audio_pause_sound(gameBGM_sound);
}

timer -= timer > -1;