/// @desc 

if entityDirection == Dir.right {sprite_index = spr_curly_R_noWep}
else if entityDirection == Dir.left {sprite_index = spr_curly_L_noWep}

// Inherit the parent event
event_inherited();

switch(state)
{
	// Look at Player
	case(0):
		var _x = x + center_x, _y = y + UNIT_PX, _w = 64, _h = UNIT_PX;
		if getBit(FLAGS_GAMEPLAY, Gameplay_Flag.playerExists)
		{
			if collision_rectangle(_x - _w, _y - _h, _x + _w, _y, PLAYER, false, true)
			entityLookAtPlayer();
		}
		break;
		
	// Knockback
	case(30):
		if getFlag(Entity_Flag.justLanding)
		{
			setAnimation(Sequence_player.ko, true);
			x_speed = 0;
			
			sfx_at(snd_thud, MY_X, MY_Y, 0);
			part_particles_create(PART_SYS_BACK, x + center_x, y + height,
				getPartType(Part_Index.smallDust), 4);
		}
		break;
}