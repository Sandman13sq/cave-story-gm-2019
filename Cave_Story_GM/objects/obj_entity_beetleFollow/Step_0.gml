/// @desc 

// Don't Do step if Game Freeze
if FREEZE {exit;}

event_inherited();

switch(state)
{
	// Wait to Spawn Just off screen
	case(0):
		if cameraTimer == 0
		{
			setEntityState(1);
		}
		else
		{
			var _range = 128;
			if !in_range(x, CAMERA_X - _range, CAMERA_X + CAMERA_W + _range)
			{
				cameraTimer--;
			}
			else
			{
				cameraTimer = 2;
			}
		}
		break;
		
	// Follow Player
	case(1):
		var _range = 500;
		
		var _inst = nearestPlayer(MY_X, MY_Y);
		
		if _inst
		{
			if distance_to_object(_inst) < _range
			{
				var _sign = polarize(_inst.x > x), 
				_maxspd = 3, _spd = 0.05;
			
				entityLookAtPlayer()
			
				x_speed = approach(x_speed, _maxspd * polarize(_inst.x > x), _spd);
				y += dsin(hoverTheta);
				hoverTheta = loop(hoverTheta + 2, 0, 360);
			}
		}
		break;
}