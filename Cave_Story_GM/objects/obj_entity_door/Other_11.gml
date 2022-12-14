/// @desc State Change

// Inherit the parent event
event_inherited();

//visible = entityDirection != Dir.right;

switch(state)
{
	case(0):
		setAnimation(Sequence_door.open);
		break;
		
	case(1):
		setAnimation(Sequence_door.closed);
		break;
}