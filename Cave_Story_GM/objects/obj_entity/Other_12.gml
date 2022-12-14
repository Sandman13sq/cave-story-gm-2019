/// @desc Health Change Script

// Runs when damaged

// Apply Damage
if healthChange < 0
{
	// addHealth(-);
	
	shakeEntity(true);
	
	healthPoints = max(0, healthPoints + healthChange);
	
	// Show Damage
	if flag & 1 << Entity_Flag.showDamage
	{
		alarm[1] = 15;
		healthChangeHold += healthChange;
	}
	
	// Hurt Particle/Graphic
	if (deathData >> 16) & FullMask._16 > 0
	{
		part_particles_create(PART_SYS_FRONT, 
			x + center_x, y + center_y,
			getPartType( (deathData >> 16) & FullMask._16 ), 3);
	}
		
	// Hurt Sound
	if !alarm[2] && healthPoints > 0
	{
		if deathData & FullMask._16 > 0
		{
			sfx(deathData & FullMask._16);
		}
		alarm[2] = 5;
	}

	// Kill if dead
	if healthPoints == 0 && healthPointsMax > 0
	{
		if flag & 1 << Entity_Flag.deathEvent {runEvent(event)}
		else
		{
			instance_destroy();
		}
	}
}
// Apply Health
else if healthChange > 0
{
	healthPoints = min(healthPoints + healthChange, healthPointsMax);
	
	displayHeadNumber(healthChange, Head_Number.type_heal, 
		center_x, y_up + Head_Number.y_off, 0, true);
}