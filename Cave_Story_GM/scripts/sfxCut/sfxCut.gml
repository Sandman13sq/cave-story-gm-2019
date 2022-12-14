/// Plays sound effect (Only one plays at a time)
/// @arg sound,*loop?
function sfxCut() {

	var _loop = false, _snd; 

	if argument_count > 1 {_loop = argument[1];}

	audio_stop_sound(argument[0]);

	_snd = audio_play_sound(argument[0], 16, _loop);
	audio_sound_gain(_snd, VOLUME_SFX, 0);

	return _snd;
	//sfx()


}
