/// @desc Clears active input
/// @param button/key
/// @param check_type
/// @param *player?
function input_clear() {

	// Use 'input' enum for arguments
	var _ret = 0;

	switch(argument[1])
	{
		case(Input.type_active):
		default:
			global.inputFlag = global.inputFlag & ~(1 << argument[0]);
			break;
			
		case(Input.type_pressed):
			global.inputFlag_pressed = global.inputFlag_pressed & ~(1 << argument[0]);
			break;
			
		case(Input.type_released):
			global.inputFlag_released = global.inputFlag_released & ~(1 << argument[0]);
			break;
	}

	return _ret > 0


}
