/// @desc 

direction += (10 + irandom(40)) * polarize(flip);

var _length = 10 + irandom(40),
_count = 10 + irandom(5);

x += lengthdir_x(_length, direction);
y += lengthdir_y(_length, direction);

for (var i = 0; i <= _count; i++)
{
	part_particles_create_color(PART_SYS_PLAYER,
		lerp(xprevious, x, i / _count),
		lerp(yprevious, y, i / _count),
		getPartType(Part_Index.edgeTrail), color, 1);
}

flip = !flip;

if life > 0 {life--}
else
{
	instance_destroy();
}