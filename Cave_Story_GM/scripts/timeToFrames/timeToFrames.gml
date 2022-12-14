/// @desc ()
/// @param min
/// @param sec
function timeToFrames() {
	var _gamespeed = game_get_speed(gamespeed_fps)

	return ((argument[0]*_gamespeed)+argument[1])*_gamespeed;


}
