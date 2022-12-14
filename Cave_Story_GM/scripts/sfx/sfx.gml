/// Plays sound effect
/// @arg sound,*loop?
function sfx() {

	var _loop = false, _snd; 

	if argument_count > 1 {_loop = argument[1];}

	_snd = audio_play_sound(argument[0], 16, _loop);
	audio_sound_gain(_snd, VOLUME_SFX, 0);

	return _snd;

	//sfxCut()


}
