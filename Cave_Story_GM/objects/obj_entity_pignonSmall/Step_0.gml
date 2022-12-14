/// @desc 

if FREEZE {exit}

// Inherit the parent event
event_inherited();

switch(state)
{
	case(0):
		if !irandom(60)
		{
			flipEntityDirection();
		}
		
		if timer {timer--} else {setEntityState(1)}
		break;
		
	case(1):
		if timer {timer--} else {setEntityState(0)}
		
		if getBit_multi(collisionDirection, Dir.left, Dir.right)
		{
			flipEntityDirection();
			walkInDirection(1);
		}
		break;
		
	case(2):
		if !getFlag(Entity_Flag.inAir)
		{
			setEntityState(0);
		}
		break;
}