/// @desc Health Change Event

if healthChange < 0
{
	if !alarm[10]
	{
		// Deplete Exp
		
		if ds_list_size(weaponList) > 0
		{
			var _mod = getPlayerItem(Item.armsBarrier)? 1: 2;
			weapon_addExperience(healthChange * _mod);
		}
		
		displayHeadNumber(healthChange, Head_Number.type_damage, 
			center_x, y_up + Head_Number.y_off, 0);

		sfx(sfx_classic(Sound.playerDamage));

		alarm[3] = 1;
		alarm[1] = 1; // Skip Damage Show Wait time
		alarm[10] = 120;
			
		y_speed = -4;
		
		healthPoints = max(0, healthPoints + healthChange);
		setPlayerData(Player_Stat.life, healthPoints);
		
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
				healthChangeHold = healthChange; // Makes sure number displays correctly
				instance_destroy();
			}
		}
		
		shakeEntity(false);
	}
}
else
{
	displayHeadNumber(healthChange, Head_Number.type_heal, 
		center_x, y_up + Head_Number.y_off, 0, true);
		
	healthPoints = min(healthPoints + healthChange, healthPointsMax);
	setPlayerData(Player_Stat.life, healthPoints);
}