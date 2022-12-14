/// @desc 

var _s = 8,
_inst = collision_rectangle(
	x, y - _s, x + width, y + _s,
	PLAYER, false, true
	);

if _inst
{
	if _inst.y_speed >= 0
	{
		_inst.y_speed = -force;
		_inst.y = y - _inst.height;
		
		image_speed = 1;
		image_index = 1;
		
		sfx(snd_spring);
	}
}