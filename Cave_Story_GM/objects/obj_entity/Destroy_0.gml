/// @desc 

if healthPoints <= 0
{
	// Death Sound
	if (deathData >> 32) & FullMask._16 > 0
	{
		sfxCut_at((deathData >> 32) & FullMask._16, 
			MY_X, MY_Y, 0, false);
	}

	// Show Damage
	if flag & 1 << Entity_Flag.showDamage
	{
		displayHeadNumber(healthChangeHold, Head_Number.type_damage, 
			center_x, y_up + Head_Number.y_off);
	}

	// Run Event on Death
	if flag & 1 << Entity_Flag.deathEvent
	{
		runEvent(event);
	}

	// Death Particle/Graphic
	if (deathData >> 48) & FullMask._16 > 0
	{
		makeDeathCloud( loop( (deathData >> 48) & FullMask._16, 0, 4) );
	}
}