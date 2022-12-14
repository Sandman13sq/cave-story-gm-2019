/// @desc Writes asset string and integer as bytes
/// @arg file,asset,asset_type
function byteWrite_asset(argument0, argument1, argument2) {

	var _file = argument0,
	_asset = max(0, argument1),
	_type = argument2,
	_ret = 0;

	switch(_type)
	{
		case(asset_sprite):
			_ret += byteWrite_string(_file, sprite_get_name( _asset ) );
			_ret += byteWrite_integer(_file, _asset, 8, false);
			break;
		
		case(asset_timeline):
			_ret += byteWrite_string(_file, timeline_get_name( _asset ) );
			_ret += byteWrite_integer(_file, _asset, 8, false);
			break;
		
		case(asset_room):
			_ret += byteWrite_string(_file, room_get_name( _asset ) );
			_ret += byteWrite_integer(_file, _asset, 8, false);
			break;
		
		case(asset_script):
			_ret += byteWrite_string(_file, script_get_name( _asset ) );
			_ret += byteWrite_integer(_file, _asset, 8, false);
			break;
		
		case(asset_sound):
			_ret += byteWrite_string(_file, audio_get_name( _asset ) );
			_ret += byteWrite_integer(_file, _asset, 8, false);
			break;
	}

	return _ret;


}
