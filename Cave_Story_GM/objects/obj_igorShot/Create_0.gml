/// @desc 

event_inherited();

flag = setBit(flag,
	Entity_Flag.shootable,
	);
	
init_entity_stats(1, 2, 0);

radius = 16;
radiusDraw = radius + dsin(xstart + CURRENT_FRAME);

var _r = 4;
init_entity_dimensions(
	-radius + _r, -radius + _r, radius - _r, radius - _r, 0, 0
	);