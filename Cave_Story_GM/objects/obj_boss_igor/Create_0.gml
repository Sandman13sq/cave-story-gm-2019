/// @desc 

// Inherit the parent event
event_inherited();

flag = setBit(flag, 
	Entity_Flag.shootable,
	Entity_Flag.showDamage,
	//Entity_Flag.solid,
	);

initAnimation(Animation_Group.igor);

init_entity_movement(0, 0, PLAYER_GRAVITY, PLAYER_GRAVITY_MAX);
init_entity_stats(300, 0, 0);
init_entity_deathData(
	snd_hurtBig, Part_Index.shotCircle, 0, 0
	);

width = diff(x_right, x_left);
center_x = width / 2;

targetDepth = LyrDepth.midEntities + 1;

setEntityState(0);

timer = 100;
attackState = 0;

enum Igor_State
{
	idle,
	walk,
	jump,
	land,
	charge,
	fire,
	punch,
}