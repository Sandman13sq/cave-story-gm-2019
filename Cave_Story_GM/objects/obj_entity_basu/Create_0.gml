/// @desc 

// Inherit the parent event
event_inherited();

init_entity(48, 48, 24, 24, 0);

init_entity_deathData(
	snd_hurtBig, Part_Index.shotCircle, 
	snd_explosionSmall, Death_Cloud.medium);
	
initAnimation(Animation_Group.basu);

setEntityState(0);
	
hoverTheta = irandom(360);

shotTimer = irandom(400);
shotInterval = 180;

cameraTimer = 2;

visible = false;