/// @desc ()
/// @param device
/// @param left_stick->0/right->1
/// @param 0-3/right.up.left.down
function _input_check_gp_axis() {

	switch(argument[1])
	{
		case(0): //Left Stick
			switch(argument[2])
			{
			case(2): return (gamepad_axis_value(argument[0], gp_axislh) >=	input_sensitivity); break; // Right
			case(1): return (gamepad_axis_value(argument[0], gp_axislv) <= -input_sensitivity); break; // Up
			case(0): return (gamepad_axis_value(argument[0], gp_axislh) <= -input_sensitivity); break; // Left
			case(3): return (gamepad_axis_value(argument[0], gp_axislv) >=	input_sensitivity);	break; // Down
			}
			break;
		
		case(1): //Right Stick
			switch(argument[2])
			{
			case(2): return (gamepad_axis_value(argument[0], gp_axisrh) >=	input_sensitivity); break; // Right
			case(1): return (gamepad_axis_value(argument[0], gp_axisrv) <= -input_sensitivity); break; // Up
			case(0): return (gamepad_axis_value(argument[0], gp_axisrh) <= -input_sensitivity); break; // Left
			case(3): return (gamepad_axis_value(argument[0], gp_axisrv) >=	input_sensitivity);	break; // Down
			}
			break;
	}


}
