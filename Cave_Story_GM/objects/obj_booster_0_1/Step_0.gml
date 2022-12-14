/// @desc 

if instance_exists(source)
{
	if !getGameplayFlag(Gameplay_Flag.noInput)
	{
		if canBoost
		{	
			if INPUT_JUMP_PRESSED
			{
				with source
				{
					if getFlag(Entity_Flag.inAir)
					{
						y_speed = -other.boostSpeed;
						jump_hold = 1;
						part_particles_create(PART_SYS_PLAYER, 
							MY_X, MY_Y, other.boostParticleType, 4);
			
						sfx(sfx_classic(Sound.booster));
						
						other.canBoost = false;
					}
				}
			}
		}
		else
		{
			if !getBit(SOURCE.flag, Entity_Flag.inAir) {canBoost = true;}
		}
	}
}