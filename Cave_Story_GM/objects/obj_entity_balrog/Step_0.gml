/// @desc 

// Inherit the parent event
event_inherited();

switch(state)
{
	case(0):
		
		break;
		
	// Smile
	case(30):
		if smileTimer {smileTimer--}
		else
		{
			setEntityState(0);
		}
		break;
		
	// Crouch to Rise
	case(10):
	case(20):
		if jumpTimer == 0
		{
			setAnimation(Sequence_balrog.jump);
			y_speed = -5;
		}
		else {jumpTimer--; y_speed = 0;}
		break;
		
	// Fall
	case(12):
		// Landing
		if getBit(collisionDirection, Dir.down)
		{
			sfx_at(sfx_classic(Sound.quake), MY_X, MY_Y, 0);
			setEntityState(0);
			part_particles_create_region(PART_SYS_PLAYER, 
				x, y + height - 8, x + width, y + height, Part_Index.poof, 6);
			shakeScreen(20, 4);
		}
		break;
		
	// Teleport
	case(70):
		teleportX = -teleportX;
		teleporting++;
		break;
}