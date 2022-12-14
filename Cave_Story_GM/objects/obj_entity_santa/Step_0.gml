/// @desc 

// Inherit the parent event
event_inherited();

switch(state)
{
	// Look at Player
	case(0):
		entityLookAtPlayer(64);
		break;
	
	// Walk Left
	case(3):
		x += entityDirection == Dir.right? 2: -2;
		break;
}
