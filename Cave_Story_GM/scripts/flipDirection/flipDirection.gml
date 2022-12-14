/// @desc Returns flipped direction
/// @arg direction
function flipDirection(argument0) {

	switch(argument0)
	{
		default: return argument0; break;
		case(Dir.right): return Dir.left; break;
		case(Dir.left): return Dir.right; break;
	
		case(Dir.up): return Dir.down; break;
		case(Dir.down): return Dir.up; break;
	}


}
