/// @desc 

// Inherit the parent event
//event_inherited();

switch(state)
{
	case(0):
		if collision_rectangle(
			bbox_left, bbox_top, bbox_right, bbox_bottom, PLAYER, false, true)
		{
			state = 1;
		}
		break;
		
	case(1):
		if alpha > 0 
		{
			alpha = approach(alpha, 0, 0.05);
		}
		else
		{
			state = 2;
		}
		break;
		
	case(2):
		
		break;
}