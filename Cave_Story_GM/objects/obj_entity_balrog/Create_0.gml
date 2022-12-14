/// @desc 

event_inherited();

init_entity(UNIT_PX, 48, 32, 24, 
	flag
	);
	
init_entity_movement(0, 0, PLAYER_GRAVITY, PLAYER_GRAVITY_MAX);
init_entity_dimensions(-16, 0, 48, 48);
	
initAnimation(Animation_Group.balrog);
	
setEntityState(0);

jumpTimer = 0;
smileTimer = 0;

teleporting = 0;
teleportX = 0;