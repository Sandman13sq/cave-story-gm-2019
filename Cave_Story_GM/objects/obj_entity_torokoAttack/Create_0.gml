/// @desc 

// Inherit the parent event
event_inherited();

initAnimation(Animation_Group.toroko);
init_entity_movement(0, 0, PLAYER_GRAVITY, PLAYER_GRAVITY_MAX);
	
timer = 0;

init_entity_stats(1, 1, 0);
flag = setBit(flag, Entity_Flag.shootable);

setEntityState(12);