/// @desc 

if !FREEZE
{
	x += lengthdir_x(movespeed, direction);
	y += lengthdir_y(movespeed, direction);
}

alpha = lerp(0, 1, life / lifeMax);

if life > 0 {life--}
else {instance_destroy()}