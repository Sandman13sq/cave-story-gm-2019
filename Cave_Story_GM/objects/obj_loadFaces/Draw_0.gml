/// @desc Load Faces

if file_exists(path)
{
	var _face = sprite_add(path, 1, false, false, 0, 0),
	_surf = surface_create(256, 256),
	_perRow = 6,
	_size = sprite_get_width(_face) div _perRow,
	_rowCount = sprite_get_height(_face) div _size,
	_sprite;
	
	surface_set_target(_surf);
	
	draw_clear_alpha(0, 0);
	
	for (var i = 0; i < _perRow * _rowCount; i++)
	{
		draw_sprite(_face, 0, 
			-(i mod _perRow) * _size,
			-(i div _perRow) * _size
			);
				
		if i == 0
		{
			_sprite = sprite_create_from_surface(_surf,
				0, 0, _size, _size, false, false, 0, 0);
		}
		else
		{
			sprite_add_from_surface(_sprite, _surf,
				0, 0, 
				_size, _size, false, false);
		}
	}
	
	surface_reset_target();
	
	GAME.datafaces = _sprite;
	
	surface_free(_surf);
	sprite_delete(_face);
}

instance_destroy();