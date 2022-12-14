/// @desc Follows position smoothly
/// @arg xoffset,yoffset,dest_x,dest_y,speed,mod,maxSpeed
function entityFollow(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {

	var _x = x + argument0, _y = y + argument1,
	_targetX = argument2, _targetY = argument3,
	_spd = argument4, _mod = argument5, 
	_maxSpd = argument6, _minSpd = 0.5;

	if _x != _targetX || _y != _targetY
	{
		if x_speed < (_targetX - _x) / _mod 
			{x_speed = min(x_speed + _spd, (_targetX - _x) / _mod , _maxSpd)}
	
		if x_speed > (_targetX - _x) / _mod 
			{x_speed = max(x_speed - _spd, (_targetX - _x) / _mod , -_maxSpd)}
		
		if y_speed < (_targetY - _y) / _mod 
			{y_speed = min(y_speed + _spd, (_targetY - _y) / _mod , _maxSpd)}
	
		if y_speed > (_targetY - _y) / _mod 
			{y_speed = max(y_speed - _spd, (_targetY - _y) / _mod , -_maxSpd)}
	}


}
