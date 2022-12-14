/// @desc 

// Inherit the parent event
event_inherited();

switch(state)
{
	case(0):
		setAnimation(Sequence_chako.idle);
		break;
		
	// Walk
	case(Chako_State.walking):
		setAnimation(Sequence_chako.walk);
		walkInDirection(2);
		break;
		
	// Laying Down on Bed
	case(Chako_State.resting):
		setAnimation(Sequence_chako.rest);
		break;
}