/// @desc Returns map property
/// @arg mapname,property
function get_classic_map_property(argument0, argument1) {

	var _prop = PROPERTIES[? argument0], _val, _ret = 0;

	switch(argument1)
	{
		case(Map_Property.tileset):
			_val = string_copy(_prop, 0x00, 0x20);
			_ret = get_classic_tileset(string_replace_all(_val, "!", ""));
			break;
		
		case(Map_Property.tilesetName):
			_val = string_copy(_prop, 0x00, 0x20);
			_ret = string_replace_all(_val, "!", "");
			break;
		
		case(Map_Property.mapName):
			_val = string_copy(_prop, 0x20, 0x20);
			_ret = string_replace_all(_val, "!", "");
			break;
		
		case(Map_Property.backgroundType):
			_val = string_digits(string_copy(_prop, 0x40, 0x4));
			if _val == "" {_val = 0}
			_ret = get_classic_backgroundMode(real(_val));
			break;
		
		case(Map_Property.backgroundSprite):
			_val = string_copy(_prop, 0x44, 0x20);
			_ret = get_classic_background(string_replace_all(_val, "!", ""));
			break;
		
		case(Map_Property.caption):
			_val = string_copy(_prop, 0xA5, 0x20);
			_ret = string_replace_all(_val, "!", "");
			break;
	}

	return _ret;


}
