/// @desc 
enum projFlag
{
	hurtPlayer,
	hurtEnemy,
	
	breakBreakable,
	destroyOnHit,
	// Hitbox
	hBox_x_bitPos = 16,
}

flag = 0;
sourceObj = -1;
damage = 0;
life = -1;
image_xflip = 1;
hitCount = 1;

x_speed = 0;
y_speed = 0;
radius = 14;

targetObj = obj_entity;
targetList = list_create();

nextProjectile = -1;