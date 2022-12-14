/// @desc 

event_inherited();

init_entity(0, 0, 0, 0, 
	setBit(flag, Entity_Flag.ignoreSolid),
	LyrDepth.maxFront - 1)
	
depth = targetDepth;

alpha = 1;

color = c_caveBlack;

/*
init_entity_dimensions(
	x, y,
	round(diff(bbox_right, bbox_left) / UNIT_PX) * UNIT_PX,
	round(diff(bbox_top, bbox_bottom) / UNIT_PX) * UNIT_PX
	);