/// @desc 

var _list = list_create(), 
_damage = damage, _rad = radius + 16,
_inst;

collision_ellipse_list(x - _rad, y - _rad, x + _rad, y + _rad, 
	ENTITY, false, true, _list, false);

var _l = ds_list_size(_list);

for (var i = 0; i < _l; i++)
{
	_inst = _list[| i];
	
	if getBit(_inst.flag, Entity_Flag.shootable)
	{
		//msg(x, y, "\n", _list[| i].x + _list[| i].center_x, _list[| i].y + _list[| i].center_y)
		if (
			!tile_collision_line(x, y, _inst.x + _inst.center_x, _inst.y + _inst.center_y, 8, 2)
			&& rectangle_in_circle(
				_inst.x + _inst.x_left,
				_inst.y + _inst.y_up,
				_inst.x + _inst.x_right,
				_inst.y + _inst.y_down,
				x, y, radius
				)
		) || rectangle_in_circle(
				_inst.x + _inst.x_left,
				_inst.y + _inst.y_up,
				_inst.x + _inst.x_right,
				_inst.y + _inst.y_down,
				x, y, UNIT_PX
				)
		{
			with _inst
			{
				addHealth(-_damage);
			}
		}
	}
}

list_free(_list);