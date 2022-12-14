/// @desc Returns index of background based on string or real
/// @arg value/string
function get_classic_background(argument0) {

	var _ret = 0;

	switch(string_lower(argument0))
	{
		default:
		case("bkblack"): case("bk0"): 
			_ret = bk_black; break;
		
		case("bkblue"): 
			_ret = bk_blue; break;
		
		case("bkfall"): 
			_ret = bk_fall; break;
		
		case("bkfog"): 
			_ret = bk_fog; break;
		
		case("bkgard"): 
			_ret = bk_gard; break;
		
		case("bkgreen"): 
			_ret = bk_green; break;
	
		case("bkmaze"): 
			_ret = bk_maze; break;
		
		case("bkmoon"):
			_ret = bk_moon; break;
		
		case("bkred"): 
			_ret = bk_red; break;
	}

	return _ret;


}
