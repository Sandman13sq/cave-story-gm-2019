/// @desc 

// Inherit the parent event
event_inherited();

/*
if instance_exists(obj_ene)
{
	var _inst = instance_nearest(x, y, obj_ene),
	_x1 = x, _y1 = y,
	_x2 = getCenterX(_inst), _y2 = getCenterY(_inst),
	_pixels = 8, 
	_dist = point_distance(_x1, _y1, _x2, _y2), _pos = 0,
	_tile = false;

	while (_pos < _dist)
	{
		if tile_collision_index_point(
			lerp(_x1, _x2, _pos / _dist),
			lerp(_y1, _y2, _pos / _dist)
			)
		{
			_tile = true;
			break;
		}
	
		draw_shape_circle(
			lerp(_x1, _x2, _pos / _dist),
			lerp(_y1, _y2, _pos / _dist),
			2, c_lime, 1
			);
	
		_pos = approach(_pos, _dist, _pixels);
	}
}