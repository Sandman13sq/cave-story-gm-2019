/// @desc 

// Inherit the parent event
event_inherited();

init_entity(32, 32, 16, 16, 
	setBit(flag,
		Entity_Flag.solid, 
		Entity_Flag.ignoreSolid,
		)
	);

fanPower = 0.25;
range = UNIT_PX * 4;

fanDirection = 0;