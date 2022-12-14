/// Resumes last played song
/// @arg time_until_silent
function bgm_fade(argument0) {

	with (Mas.music)
	{
		audio_sound_gain(gameBGM_sound, 0, argument0 * MILLISECOND_TO_FRAME);
		timer = argument0 * MILLISECOND_TO_FRAME;
	}


}
