/// @desc Reads line of bytes as asset
/// @arg file
function byteRead_asset(argument0) {

	var _file = argument0,
	_asset = 0, _ret = 0;

	_asset = byteRead_string(_file);

	_ret = asset_get_index( _asset );

	if _ret == -1
	{
		_ret = byteRead_integer(_file, 8, false);
	}
	else
	{
		byteRead_integer(_file, 8, false);
		//byteSkip(_file, 8);
	}
	//msg(_str)

	return _ret;


}
