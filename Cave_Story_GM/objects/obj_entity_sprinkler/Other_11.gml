/// @desc 

// Inherit the parent event
event_inherited();

switch(state)
{
	case(0):
		setAnimation(Sequence_sym.sprinklerOn);
		break;
		
	case(1):
		setAnimation(Sequence_sym.sprinklerOff);
		break;
}