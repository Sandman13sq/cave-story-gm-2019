/// @desc State Change 

// Inherit the parent event
event_inherited();

teleportX = 0;

switch(state)
{
	case(0):
		setAnimation(Sequence_player.idle);
		timer = 20;
		break;
	
	// Hop
	case(1):
		setAnimation(Sequence_player.rise);
		ystart = y;
		y_speed = -3;
		break;
	
	// Wait
	case(2):
		setAnimation(Sequence_player.idle);
		timer = 30;
		break;
		
	// Teleport Out
	case(3):
		sfx_at(snd_teleport, MY_X, MY_Y, 0);
		teleportX = 2;
		break;
}