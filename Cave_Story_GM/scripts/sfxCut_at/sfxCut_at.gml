/// Plays sound effect
/// @arg sound,horiDist,vertiDist,z,*loop?
function sfxCut_at() {

	var _loop = false, _snd; 

	if argument_count > 4 {_loop = argument[4];}

	audio_stop_sound(argument[0]);

	_snd = audio_play_sound_at(argument[0], 
		argument[1], argument[2], argument[3], 400, 500, 1, _loop, 16);
	audio_sound_gain(_snd, VOLUME_SFX, 0);

	return _snd;


}
