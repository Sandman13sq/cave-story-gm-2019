/// @desc 

if instance_exists(PLAYER)
{
	visible = !getBit(PLAYER.flag, Entity_Flag.hide);
}

flag = 0;

source = noone;

initAnimation(Animation_Group.weapon);

weapon_muzzleSide = 12;
weapon_muzzleUp = 10;
weapon_muzzleDown = 0;

projectileCount = 0;
projectileMax = 0;

playerExists = getBit(FLAGS_GAMEPLAY, Gameplay_Flag.playerExists);
playerIndex = 0;

direction = 0;
entityDirection = 0;
drawDirection = 0;

//animStep++;

// Set to 1 if facing right, -1 if facing left
image_xflip = 0;
	
weapon_drawX = 0;
weapon_drawY = 0;

target = obj_entity;

// event_user(0);