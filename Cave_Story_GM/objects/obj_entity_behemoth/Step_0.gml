/// @desc 

// Inherit the parent event
event_inherited();

switch(state)
{
	// Walk
	case(0):
		if getBit_multi(collisionDirection, Dir.right, Dir.left)
		{
			flipEntityDirection();
			walkInDirection(walkSpeed);
		}
		break;
		
	// Stun
	case(1):
		if stunTimer > 0 {stunTimer--}
		else
		{
			//if healthPoints > (healthPointsMax / 3)
			if stunHits < 4
			{
				setEntityState(0);
			}
			// Charge
			else
			{
				setEntityState(2);
				chargeTimer = timeToFrames(0, 5);
			}
			
			stunHits = 0;
		}
		break;
		
	// Charge
	case(2):
		if entityDirection == Dir.right
		{
			if getBit(collisionDirection, Dir.right)
			{
				flipEntityDirection();
				walkInDirection(chargeSpeed);
			}
		}
		else
		{
			if getBit(collisionDirection, Dir.left)
			{
				flipEntityDirection();
				walkInDirection(chargeSpeed);
			}
		}
		
		if animationNewFrameIs(0)
		{
			sfx_at(snd_thud, MY_X, MY_Y, 0);
			shakeScreen(3, 2);
			part_particles_create_region(PART_SYS_MAIN, 
				x + x_left, y + y_down,
				x + x_right, y + y_down,
				getPartType(Part_Index.poof), 2
				);
		}
		
		if chargeTimer {chargeTimer--} else {setEntityState(0);}
		break;
}