/// @desc Apply X and Y Speeds

if FREEZE {exit;}

image_angle -= rotateSpeed * polarize(x_speed);

var _r = radius,
_l = collision_rectangle_list(
	x - _r, y - _r,
	x + _r, y + _r,
	targetObj, 0, true, targetList, 0
	), _inst, _damage = damage;
	
projectileHitTarget(targetList);

if hitCount <= 0
{
	instance_destroy();
}

x += x_speed;
y += y_speed;