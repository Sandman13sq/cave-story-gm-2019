/// @desc 

// Inherit the parent event
event_inherited();

sfx_at(snd_missileHit, x, y, 0);

var _range = 32;
part_particles_create_region_wh(PART_SYS_FRONT, 
	x - _range, y - _range, _range * 2, _range * 2,
	getPartType(Part_Index.poof), 4)

var _damage = nextDamage;
with spawn_projectile(obj_projectile_radius, x, y, -1)
{
	set_scale(2);
	set_projectile(_damage, 0, 0, 1, 1);
}