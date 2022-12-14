/// @desc Follows position smoothly
/// @arg xoffset,yoffset,dest_x,dest_y,speed,mod,maxSpeed
function follow(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {

	var _x = x + argument0, _y = y + argument1,
	_targetX = argument2, _targetY = argument3,
	_spd = argument4, _mod = argument5, 
	_maxSpd = argument6, _minSpd = 1;

	if _x != _targetX || _y != _targetY
	{
		if hspeed < (_targetX - _x) / _mod 
			{hspeed = min(hspeed + _spd, (_targetX - _x) / _mod , _maxSpd)}
	
		if hspeed > (_targetX - _x) / _mod 
			{hspeed = max(hspeed - _spd, (_targetX - _x) / _mod , -_maxSpd)}
		
		if vspeed < (_targetY - _y) / _mod 
			{vspeed = min(vspeed + _spd, (_targetY - _y) / _mod , _maxSpd)}
	
		if vspeed > (_targetY - _y) / _mod 
			{vspeed = max(vspeed - _spd, (_targetY - _y) / _mod , -_maxSpd)}
	}


}
