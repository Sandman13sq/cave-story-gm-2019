/// @desc State Change

// Inherit the parent event
event_inherited();

switch(state)
{
	case(0):
		setAnimation(Sequence_kanpachi.idle);
		break;
		
	case(3):
		setAnimation(Sequence_kanpachi.walk);
		break;
}