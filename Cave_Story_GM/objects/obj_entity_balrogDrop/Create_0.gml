/// @desc 

event_inherited();

setEntityState(12);

flag = setBit(flag, Entity_Flag.ignoreSolid);

// Wait frames until collision checking so he doesn't get stuck in walls
collisionTimer = 30;