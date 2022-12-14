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
		var _inst = nearestPlayer(MY_X, MY_Y);
		
		if _inst
		{
			var _range = 500;
			
			if distance_to_object(_inst) < _range
			{
				var _maxspd = 3, _spd = 0.05;
			
				entityLookAtPlayer()
			
				x_speed = approach(x_speed, _maxspd * polarize(_inst.x > x), _spd);
				y += dsin(hoverTheta);
				hoverTheta = loop(hoverTheta + 2, 0, 360);
				
				if shotTimer 
				{
					shotTimer--;
					if shotTimer == 30 {setAnimation(Sequence_basu.charge)}
				}
				else
				{
					shotTimer = shotInterval;
					setAnimation(Sequence_basu.fly);
				
					with instance_create_depth(MY_X, MY_Y, depth - 1, obj_projectile_basu)
					{
						source = other.id;
					
						direction = point_direction(x, y, 
							_inst.x + _inst.center_x,
							_inst.y + _inst.center_y);
						
						x_speed = lengthdir_x(movespeed, direction);
						y_speed = lengthdir_y(movespeed, direction);
					}
				}
			}
		}
		break;
}