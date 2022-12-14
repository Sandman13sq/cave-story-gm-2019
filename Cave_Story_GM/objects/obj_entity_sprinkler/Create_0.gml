/// @desc 

// Inherit the parent event
event_inherited();

flag = setBit(flag, Entity_Flag.ignoreSolid);

initAnimation(Animation_Group.sym);

getCenterFromSprite();

setEntityState(0);