/// @desc Returns true if file of any case matches string
/// @arg filepath
function file_exists_anyCase(argument0) {

	var _path = argument0, _pos = string_length(_path),
	_name = filename_name(_path);

	if string_pos("/", _path) != 0
	{
		while (string_char_at(_path, _pos) != "/")
		{
			_pos--;
		}
	}

	_path = string_copy(_path, 1, _pos);


}
