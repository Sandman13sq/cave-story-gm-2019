/// @desc 

if mouseMode
{
	var _x = select mod tileWidth, _y = select div tileWidth,
	_s = 2;
	
	if in_range(mouse_x, x, x + tileWidth * tileUnit * _s)
	{
		_x = floor( (mouse_x - x) / (tileWidth * _s));
	}
	
	if in_range(mouse_y, y, y + tileWidth * tileUnit * _s)
	{
		_y = floor( ( (mouse_y - y) / (tileWidth * _s) ));
	}
	
	select = clamp(_x + (_y * tileWidth), 0, ds_list_size(tileType));
	
	if file
	{
		if keyboard_check_pressed(vk_enter)
		{
			var _prev = hex(tileType[| select], 2);
			tileType[| current] = b10(get_string(
				"Enter new value (Prev \"" + _prev + "\"): ", _prev));
		}
	
		if select != current
		{
			if mouse_check_button_pressed(mb_left)
			{
				current = select;
			}
		}
		else
		{
			if mouse_check_button_pressed(mb_left)
			{
				if doubleClick
				{
					var _prev = hex(tileType[| select], 2);
					tileType[| current] = b10(get_string(
						"Enter new value (Prev \"" + _prev + "\"): ", _prev));
				}
				else
				{
					tileType[| current] = loop(tileType[| current] + 1, 0, 256);
					alarm[0] = 15;
					doubleClick = true;
				}
			}
		
			if mouse_check_button_pressed(mb_right)
			{
				tileType[| current] = loop(tileType[| current] - 1, 0, 256);
			}
		}
	}
}

if keyboard_check_pressed(vk_left) {tileset = loop(tileset - 1, 0, tilesetMax);}
if keyboard_check_pressed(vk_right) {tileset = loop(tileset + 1, 0, tilesetMax);}

if keyboard_check(vk_control)
{
	// Open
	if keyboard_check_pressed(ord("O"))
	{
		path = get_open_filename("*.pxa", "");
		
		if path != ""
		{
			file = file_bin_open(path, 0);
			
			var _l = file_bin_size(file);
			
			ds_list_clear(tileType);
			
			for (var i = 0; i < _l; i++)
			{
				ds_list_add(tileType, byteRead_integer(file, 1, false));
			}
			
			file_bin_close(file);
		}
	}
	
	// Save
	if keyboard_check_pressed(ord("S"))
	{
		path = get_save_filename("*.pxa", "");
		
		if path != ""
		{
			file = file_bin_open(path, 1);
			
			var _l = ds_list_size(tileType);
			
			file_bin_rewrite(file);
			
			for (var i = 0; i < _l; i++)
			{
				byteWrite_integer(file, tileType[| i], 1, false);
			}
			
			file_bin_close(file);
		}
	}
	
	if file
	{
		if keyboard_check_pressed(ord("C"))
		{
			copyBuffer = tileType[| current];
		}
		
		if keyboard_check_pressed(ord("V"))
		{
			tileType[| current] = copyBuffer;
		}
	}
}