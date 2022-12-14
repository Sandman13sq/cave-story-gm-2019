/// Actually plays music
/// @arg sound,bgm_index,wait,steps_per_beat,beats_per_measure,repeat_start,repeat_end
function _set_bgm_org() {

	var _mus = argument[0];

	if !audio_is_playing(_mus)
	{
		with (Mas.music)
		{
			audio_stop_sound(gameBGM_sound);
	
			var _wait = argument[2], 
			_step = argument[3], _beats = argument[4],
			_start = argument[5], _end = argument[6];
		
			gameBGM_index = argument[1];
			gameBGM_sound = audio_play_sound(_mus, 0, _end > 0);
			audio_sound_gain(gameBGM_sound, VOLUME_BGM, 0);
	
			// Spot to resume loop
			gameBGM_loop[0] = get_musicTime_org(_wait, _step, _beats, _start);
			// Spot when song should be looped
			gameBGM_loop[1] = get_musicTime_org(_wait, _step, _beats, _end);
		}
	
		return true;
	}
	else
	{
		return false
	}


}
