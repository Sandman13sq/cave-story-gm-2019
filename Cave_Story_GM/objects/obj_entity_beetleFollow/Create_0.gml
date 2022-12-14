/// @desc 

// Inherit the parent event
event_inherited();

init_entity(32, 32, 16, 16, 0
	);
	
init_entity_deathData(
	snd_hurtSmall, Part_Index.shotCircle, 
	snd_explosionSmall, Death_Cloud.medium);
	
initAnimation(Animation_Group.beetle);

setEntityState(0);

cameraTimer = 2;
	
hoverTheta = irandom(360);

visible = false;