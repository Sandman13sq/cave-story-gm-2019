/// @desc Returns angle from entity direction
/// @arg entityDir
function dirAngle(argument0) {

	switch(argument0)
	{
		case(Dir.right): return 0; break;
		case(Dir.up): return 90; break;
		case(Dir.left): return 180; break;
		case(Dir.down): return 270; break;
	}


}
