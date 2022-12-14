/// @desc 

switch(state)
{
	// Look at Player
	case(Chako_State.idle):
		var _x = x + center_x, _y = y + UNIT_PX, _w = 64, _h = UNIT_PX;
		if getBit(FLAGS_GAMEPLAY, Gameplay_Flag.playerExists)
		{
			if collision_rectangle(_x - _w, _y - _h, _x + _w, _y, PLAYER, false, true)
			entityLookAtPlayer();
		}
		break;
		
	// Snore
	case(Chako_State.resting):
		if snoreStep <= 0
		{
			part_particles_create(PART_SYS_MID, MY_X, MY_Y,
				getPartType(Part_Index.snore), 1
				);
				
			snoreStep = irandom_range(80, 120);
		}
		else {snoreStep--;}
		break;
}

// Inherit the parent event
event_inherited();