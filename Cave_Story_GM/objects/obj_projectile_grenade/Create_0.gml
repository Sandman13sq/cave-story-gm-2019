/// @desc 

// Inherit the parent event
event_inherited();

flag = flag | 1 << projFlag.destroyOnHit;

// Alarm for Trail
alarm[0] = 1;
	
bounce_x = 4;
bounce_y = 3;
nextDamage = 2;
grav = 0.15;
radius = 8;
rebound = false;