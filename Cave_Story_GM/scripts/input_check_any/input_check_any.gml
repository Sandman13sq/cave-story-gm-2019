/// @desc (Returns true if any input is active)
/// @param check_type
function input_check_any() {

	// Use 'input' enum for arguments
	switch(argument[0])
	{
		default:
		case(Input.type_active): return global.inputFlag > 0; break;
			
		case(Input.type_pressed): return global.inputFlag_pressed > 0; break;
			
		case(Input.type_released): return global.inputFlag_released > 0; break;
	}


}
