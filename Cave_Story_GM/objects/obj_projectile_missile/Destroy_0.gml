/// @desc 

// Inherit the parent event
event_inherited();

sfxCut_at(snd_missileHit, x, y, 0);

repeat(4)
{
	var _createRange = 16;
	// Explosion Graphic
	part_particles_create(PART_SYS_FRONT, 
		x + _createRange * signRandom(), 
		y + _createRange * signRandom(), 
		getPartType(Part_Index.poof), 1);
}

spawn_radius(x, y, nextRadius, nextDamage);