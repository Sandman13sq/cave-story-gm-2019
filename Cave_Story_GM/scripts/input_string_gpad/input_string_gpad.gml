/// @desc Converts Input to string
/// @arg gpad_button
function input_string_gpad(argument0) {

	var _input = argument0, _ret = "(No Button)";

	switch(_input)
	{
		case(gp_face1): _ret = "Button 1"; break;
		case(gp_face2): _ret = "Button 2"; break;
		case(gp_face3): _ret = "Button 3"; break;
		case(gp_face4): _ret = "Button 4"; break;
	
		case(gp_shoulderl): _ret = "Button 5 (L Bumper)"; break;
		case(gp_shoulderlb): _ret = "Button 6 (L Trigger)"; break;
		case(gp_shoulderr): _ret = "Button 7 (R Bumper)"; break;
		case(gp_shoulderrb): _ret = "Button 8 (R Trigger)"; break;
	
		case(gp_select): _ret = "Button 9"; break;
		case(gp_start): _ret = "Button 10"; break;
	
		case(gp_stickl): _ret = "Button 11 (L Stick)"; break;
		case(gp_stickr): _ret = "Button 12 (R Stick)"; break;
	
		case(gp_padu): _ret = "D-Pad Up"; break;
		case(gp_padd): _ret = "D-Pad Down"; break;
		case(gp_padl): _ret = "D-Pad Left"; break;
		case(gp_padr): _ret = "D-Pad Right"; break;
	}

	return _ret;


}
