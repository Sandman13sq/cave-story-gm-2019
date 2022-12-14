/// @desc 
if !getGameplayFlag(Gameplay_Flag.noInput)
{
	if boostLife
	{
		if INPUT_JUMP_HELD && canBoost
		{
			if getBit(PLAYER.flag, Entity_Flag.inAir)
			{
				if PLAYER.y_speed > -3
				{
					PLAYER.y_speed -= boostSpeed;
					PLAYER.jump_hold = 1;
				
					boostLife--;
				
					if !alarm[0]
					{
						sfxCut(sfx_classic(Sound.booster));
						part_particles_create(PART_SYS_PLAYER, 
						PLAYER_X, PLAYER_Y, boostParticleType, 1);
						alarm[0] = 3;
					}
				}
			}
		}
	}

	if !getBit(PLAYER.flag, Entity_Flag.inAir)
	{canBoost = false; boostLife = boostLifeMax;}

	if INPUT_JUMP_RELEASED
	{
		canBoost = true;
	}
}