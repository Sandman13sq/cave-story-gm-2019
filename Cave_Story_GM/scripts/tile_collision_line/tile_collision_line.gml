/// @desc Returns index of closest tile within line
/// @arg x1,y1,x2,y2,accuracy,start
function tile_collision_line() {

	var _ret = 0, _x, _y,
	_step = argument[4], // Amount of checks to be done
	_start = argument[5]; // (From original position (x1, y1)) How many checks to skip

	for (var i = _start; i <= _step; i++)
	{
		_x = argument[0] -
				point_distance(argument[0], argument[1], argument[2], argument[1]) * i / _step
				* sign(argument[0] - argument[2]);
			
		_y = argument[1] -
				point_distance(argument[0], argument[1], argument[0], argument[3]) * i / _step
				* sign(argument[1] - argument[3]);
	
		_ret = tile_collision_index_point(_x, _y);
		/*msg("Step: ", i, "Coll: ", hex(_ret), "\n", 
			argument[0], argument[1], "\n", _x, _y);//*/
		
		if _ret > 0 {break;}
	}

	return _ret;


}
