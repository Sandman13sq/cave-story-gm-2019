/// @desc Returns index of background mode
/// @arg value
function get_classic_backgroundMode(argument0) {

	var _ret = 0;

	switch(argument0)
	{
		// Fixed
		default: _ret = Background_Mode.fixed; break;
	
		// Move Slow
		case(1): _ret = Background_Mode.parallax; break;
	
		// Hide 1
		case(3): _ret = Background_Mode.hide; break;
	
		// Hide 2
		case(4): _ret = Background_Mode.hide2; break;
	
		// Scroll Fast Left (Ironhead) 
		case(5): _ret = Background_Mode.scrollLeft; break;
	
		// Layered Scroll Left with Gravity
		case(6): _ret = Background_Mode.scroll_gravity; break;
	
		// Layered Scroll Left
		case(7): _ret = Background_Mode.scroll_gravity; break;
		
		// Hide 3
		case(8): _ret = Background_Mode.hide; break;
	}

	return _ret;


}
