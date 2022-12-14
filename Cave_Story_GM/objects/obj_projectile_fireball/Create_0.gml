/// @desc 

// Inherit the parent event
event_inherited();

flag = flag | 1 << projFlag.destroyOnHit;

// Alarm for Trail
alarm[0] = 1;

part_particles_create(PART_SYS_BACK, x, y, 
	getPartType(Part_Index.shotSpark), 1);
	
bounce_x = 3;
bounce_y = 2;
x_speed = 0;
y_speed = 0;
radius = 12;
grav = 0.2;
gravityMax = 4;