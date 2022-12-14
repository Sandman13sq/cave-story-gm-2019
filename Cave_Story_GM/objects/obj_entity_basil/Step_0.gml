/// @desc 

// Inherit the parent event
event_inherited();

x_speed = approach(x_speed, moveSpeed * polarize(entityDirection == Dir.right), 0.25);

var _range = 448, _inst = nearestPlayer(MY_X, MY_Y);

if _inst
{
	var _x = getCenterX(_inst);
	
	if getBit(collisionDirection, entityDirection == Dir.right? Dir.right: Dir.left)
	{
		flipEntityDirection();
	}
	else if !in_range(MY_X, _x - _range, _x + _range)
	{
		setEntityDirection(MY_X < _x? Dir.right: Dir.left);
	}

	var _range = 128;
	
	if !in_range(MY_X, CAMERA_X - (_range * 2), CAMERA_X + CAMERA_W + (_range * 2))
	{
		x = (MY_X < CAMERA_X? CAMERA_X - _range: CAMERA_X + CAMERA_W + _range) - center_x;
	}
}