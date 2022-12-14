/// @desc 

// Inherit the parent event
event_inherited();

switch(state)
{
	case(4):
		if animationIsOver()
		{
			setEntityState(0);
		}
		break;
}