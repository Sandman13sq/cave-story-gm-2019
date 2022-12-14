/// @desc 

// Inherit the parent event
event_inherited();

initAnimation(Animation_Group.igor);
init_entity_movement(0, 0, PLAYER_GRAVITY, PLAYER_GRAVITY_MAX);

width = diff(x_right, x_left);
center_x = width / 2;

targetDepth = LyrDepth.midEntities + 1;