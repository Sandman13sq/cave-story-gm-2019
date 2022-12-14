/// @desc 

// Don't Do step if Game Freeze
if FREEZE {exit;}

event_inherited();

switch(state)
{
	// Hanging on wall
	case(0):
		if timer == 0
		{
			setEntityState(1);
		}
		break;
		
	// Fly to next wall
	case(1):
		if abs(x_speed) < max_speed
		{
			x_speed = approach(x_speed, max_speed * polarize(entityDirection == Dir.right), 0.1);
		}
		
		if getBit(collisionDirection, entityDirection == Dir.right? Dir.right: Dir.left)
		{
			flipEntityDirection();
			setEntityState(0);
			timer = 100;
		}
		break;
}

timer = timer > 0? timer - 1: -1;