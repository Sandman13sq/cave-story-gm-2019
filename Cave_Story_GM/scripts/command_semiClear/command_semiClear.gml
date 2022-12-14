/// @desc Clears some event-related things
function command_semiClear() {

	// Use when another event is about to be run

	//with ENTITY {entityCheckEventFlag()};
	//updateHiddenEntity();

	global.InputObj.inputBuffer_alarm = 0;
	is_running = false;


}
