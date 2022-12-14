/// @desc 

// Inherit the parent event
event_inherited();

switch(state)
{
	// Float Up
	case(20):
		y_speed = approach(y_speed, -6, 0.1);
		if y < -64 {instance_destroy(self, false)}
		break;
		
	// Cast
	case(30):
		if animationIsOver()
		{
			setEntityState(0);
		}
		break;
}