/// @desc Returns path of file matching filename in any case
/// @arg path,filename
function file_get_anyCase(argument0, argument1) {

	var _path = argument0, _name = argument1,
	_ret = "";

	if file_exists(_path + _name)
	{
		_ret = _path + _name;
	}
	else if file_exists(_path + string_capitalize(_name))
	{
		_ret = _path + string_capitalize(_name);
	}
	else if file_exists(_path + string_lower(_name))
	{
		_ret = _path + string_lower(_name);
	}
	else if file_exists(_path + string_upper(_name))
	{
		_ret = _path + string_upper(_name);
	}

	if _ret != "" {cout(_name, "found!")}

	return _ret;


}
