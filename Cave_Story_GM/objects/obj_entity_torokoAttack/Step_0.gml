/// @desc 

// Inherit the parent event
event_inherited();

switch(state)
{
	// Hurt
	case(11):
		if !getFlag(Entity_Flag.inAir) 
		{
			setEntityState(10);
		}
		break;
	
	// Attacking
	case(12):
		if !getFlag(Entity_Flag.inAir) 
		{
			if timer == 0
			{
				flipEntityDirection();
				x_speed = abs(x_speed) * polarize(entityDirection == Dir.right);
				
				timer = UNIT_PX / 2;
			}
			else {timer--}
		}
		
		if healthPoints == 0
		{
			setEntityState(11);
		}
		
		break;
}