/// @desc State Change 

// Inherit the parent event
event_inherited();

switch(state)
{
	case(0):
		setAnimation(Sequence_cthulhu.noSee);
		break;
		
	case(1):
		setAnimation(Sequence_cthulhu.see);
		break;
}