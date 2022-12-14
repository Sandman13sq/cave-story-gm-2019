/// @desc 

collision_line_list(
	x + lengthdir_x(radius, angle + 90),
	y + lengthdir_y(radius, angle + 90),
	x + lengthdir_x(radius, angle + 90) + lengthdir_x(length, angle),
	y + lengthdir_y(radius, angle + 90) + lengthdir_y(length, angle),
	ENTITY, false, true, targetList, false
	);
	
collision_line_list(
	x - lengthdir_x(radius, angle + 90),
	y - lengthdir_y(radius, angle + 90),
	x - lengthdir_x(radius, angle + 90) + lengthdir_x(length, angle),
	y - lengthdir_y(radius, angle + 90) + lengthdir_y(length, angle),
	ENTITY, false, true, targetList, false
	);
	
projectileHitTarget(targetList, false);

if life <= lengthSpeed
{
	length = lerp(0, lengthStart, life / lengthSpeed);
}