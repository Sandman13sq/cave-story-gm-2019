/// @desc (Returns true if input is active)
/// @param button/key
/// @param check_type
/// @param *player?
function input_check() {

	// Use 'input' enum for arguments
	var _ret = 0;

	switch(argument[1])
	{
		case(Input.type_active):
		default:
			_ret = global.inputFlag & 1 << argument[0];
			break;
			
		case(Input.type_pressed):
			_ret = global.inputFlag_pressed & 1 << argument[0];
			break;
			
		case(Input.type_released):
			_ret = global.inputFlag_released & 1 << argument[0];
			break;
	}

	return _ret > 0


}
