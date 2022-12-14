/// @desc State Change 

// Inherit the parent event
event_inherited();

teleportX = 0;

switch(state)
{
	// In
	case(0):
		setAnimation(Sequence_player.idle);
		timer = 60;
		teleportX = 2;
		y = ystart - 16;
		break;
		
	// Jump
	case(1):
		setAnimation(Sequence_player.rise);
		break;
		
	// On Teleporter
	case(2):
		setAnimation(Sequence_player.idle);
		break;
}