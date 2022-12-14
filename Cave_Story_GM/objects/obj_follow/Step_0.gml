/// @desc 

follow(16, 16, mouse_x, mouse_y, 0.2, 25, 2);

/*
var _x = x, _y = y,
_targetX = mouse_x, _targetY = mouse_y,
_slowDist = 64, 
_spd = 0.25, _mod = 25, 
_maxSpd = 4, _minSpd = 1;

if x != _targetX || y != _targetY
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
