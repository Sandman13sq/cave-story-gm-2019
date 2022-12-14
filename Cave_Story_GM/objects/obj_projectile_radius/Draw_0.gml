/// @desc 
draw_reset();
draw_shape_circle(x, y, radius, c_white, 1);

#region Draw Collisions with entities

if DEBUG
{
	draw_update_color(c_fuchsia);
	var _step = 8;

	var _list = list_create(), _col;
	collision_ellipse_list(x - radius, y - radius, x + radius, y + radius, 
		obj_ene, false, true, _list, false);

	var _l = ds_list_size(_list);
	for (var j = 0; j < _l; j++)
	{
		for (var i = 0; i <= _step; i++)
		{
			if tile_collision_index_point(
				x -
					point_distance(x, y, _list[| j].x + _list[| j].center_x, y) * i / _step
					* sign(x - _list[| j].x - _list[| j].center_x),
				y - 
					point_distance(x, y, x, _list[| j].y + _list[| j].center_y) * i / _step
					* sign(y - _list[| j].y - _list[| j].center_y)
				)
			{_col = c_green} else {_col = c_fuchsia};
		
			draw_shape_circle(
				x -
					point_distance(x, y, _list[| j].x + _list[| j].center_x, y) * i / _step
					* sign(x - _list[| j].x - _list[| j].center_x),
				y - 
					point_distance(x, y, x, _list[| j].y + _list[| j].center_y) * i / _step
					* sign(y - _list[| j].y - _list[| j].center_y), 
				2, _col, 1);
		}
	}

	list_free(_list);
}

#endregion