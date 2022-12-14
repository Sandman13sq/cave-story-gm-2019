/// @desc 

switch(state)
{
	// No See
	case(0):
		var _inst = nearestPlayer(MY_X, MY_Y);
		
		if _inst
		{
			var _range = 64;
			
			if point_in_rectangle(
				getCenterX(_inst), getCenterY(_inst),
				MY_X - _range, y + y_up - 64,
				MY_X + _range, y + y_down
				)
			{
				setEntityState(1);
			}
		}
		break;
		
	// See
	case(1):
		var _inst = nearestPlayer(MY_X, MY_Y);
		
		if _inst
		{
			var _range = 64;
			
			if !point_in_rectangle(
				getCenterX(_inst), getCenterY(_inst),
				MY_X - _range, y + y_up - 64,
				MY_X + _range, y + y_down
				)
			{
				setEntityState(0);
			}
		}
		break;
}

// Inherit the parent event
event_inherited();