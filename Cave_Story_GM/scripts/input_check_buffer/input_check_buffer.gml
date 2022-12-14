/// Returns true if buffer for input is active
/// @arg button/key
function input_check_buffer(argument0) {

	if (global.inputBuffer_button & 1 << argument0)// && global.inputBuffer_alarm > 0
	{
		//global.inputBuffer_alarm = 1;
		return true
	}
	else {return false}


}
