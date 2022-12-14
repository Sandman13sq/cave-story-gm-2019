/// @desc Returns direction to track object
/// @arg direction,x1,y1,x2,y2,turn_speed
function trackAngle() {

	return argument[0] - clamp(
		angle_difference(argument[0], 
			point_direction(argument[1], argument[2], argument[3], argument[4])),
			-argument[5], argument[5]);


}
