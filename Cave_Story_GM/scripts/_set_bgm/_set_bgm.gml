/// Actually plays music
/// @arg sound,bgm_index,loop_start,loop_end
function _set_bgm() {

	var _mus = argument[0];

	if !audio_is_playing(_mus)
	{
		with (Mas.music)
		{
			audio_stop_sound(gameBGM_sound);
	
			gameBGM_index = argument[1];
			gameBGM_sound = audio_play_sound(_mus, 0, true);
			audio_sound_gain(gameBGM_sound, VOLUME_BGM, 0);
	
			gameBGM_loop[0] = argument[2]; // In Seconds
			gameBGM_loop[1] = argument[3]; // In Seconds
		}
	
		return true;
	}
	else
	{
		return false;
	}


}
