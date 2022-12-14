/// @desc 

// Inherit the parent event
event_inherited();

switch(state)
{
	// Pause
	case(0):
		if timer > 0 
		{
			timer--;
			x_speed = approach(x_speed, 0, 0.2);
		}
		else
		{
			setEntityState(1);
		}
		break;
		
	// Walk
	case(1):
		if timer > 0 
		{
			timer--;
			
			if animationNewFrameIs(0, 2)
			{
				sfx_at(snd_footStep, MY_X, MY_Y, 0)
			}
			
			x_speed = approach(x_speed, 2 * polarize(entityDirection == Dir.right), 0.2);
		}
		else
		{
			if jumpState >= 2
			{
				setEntityState(2);
			}
			else
			{
				setEntityState(0);
			}
		}
		break;
		
	// Jump
	case(2):
		if !getFlag(Entity_Flag.inAir)
		{
			shakeScreen(10, 3);
			sfx_at(sfx_classic(Sound.quake), MY_X, MY_Y, 0);
			part_particles_create_region(
				PART_SYS_MID, 
				x + x_left, y + y_down - 8, 
				x + x_right, y + y_down,
				getPartType(Part_Index.poof), 6
				);
			setEntityState(0);
		}
		break;
}