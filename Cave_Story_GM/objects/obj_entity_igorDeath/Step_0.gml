/// @desc 

// Inherit the parent event
event_inherited();

switch(state)
{
	case(0):
		if timer {timer--}
		else
		{
			setEntityState(1);
		}
		break;
		
	case(1):
		if timer 
		{
			timer--;
			
			animationSpeed = approach(animationSpeed, 0, 0.1);
		}
		else
		{
			setEntityState(2);
		}
		break;
		
	case(2):
		
		break;
}