/// @desc 

// Inherit the parent event
event_inherited();

switch(state)
{
	case(0):
		if collision_rectangle(
			x + x_left, y + y_up,
			x + x_right, y + y_down,
			PLAYER, false, true
			)
		{
			setEntityState(1);
		}
		break;
}