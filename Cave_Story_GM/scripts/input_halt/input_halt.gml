/// @desc Halts input for a number of frames
/// @arg input_index,time
function input_halt(argument0, argument1) {

	var _input = argument0;

	with instance_create_depth(0, 0, 0, obj_haltInput)
	{
		inputIndex = _input;
		timer = argument1;
	}

	global.inputFlag = clearBit(global.inputFlag, _input);
	global.inputFlag_pressed = clearBit(global.inputFlag_pressed, _input);
	global.inputFlag_released = clearBit(global.inputFlag_released, _input);
	global.inputBuffer_button = clearBit(global.inputBuffer_button, _input);

	global.inputFlag_locked = setBit(global.inputFlag, _input);


}
