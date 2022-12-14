/// @desc 

// Inherit the parent event
event_inherited();

initAnimation(Animation_Group.toroko);
init_entity_movement(2, 0, -0.05, 0);

flag = setBit(flag, Entity_Flag.ignoreSolid);
	
timer = 0;
bubble = 0;

setEntityState(0);