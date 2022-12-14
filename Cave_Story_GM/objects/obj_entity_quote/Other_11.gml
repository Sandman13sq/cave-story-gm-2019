/// @desc State Change 

// Inherit the parent event
event_inherited();

teleportX = 0;

switch(state)
{
	case(0): case(1):
		setAnimation(Sequence_player.idle);
		break;
		
	case(2):
		setAnimation(Sequence_player.idle_up);
		break;
		
	case(3):
		setAnimation(Sequence_player.run);
		walkInDirection(2);
		break;
		
	// Landing
	case(10):
		setAnimation(Sequence_player.ko);
		part_particles_create_region(
			PART_SYS_PLAYER, 
			x - x_left, y - y_up,
			x + x_right, y + y_down,
			getPartType(Part_Index.poof), 4
			);
		sfx_at( sfx_classic(Sound.littleCrash), MY_X, MY_Y, 0);
		break;
		
	// Teleporting
	case(20):
		teleportX = 2;
		sfx_at(snd_teleport, MY_X, MY_Y, 0);
		break;
}