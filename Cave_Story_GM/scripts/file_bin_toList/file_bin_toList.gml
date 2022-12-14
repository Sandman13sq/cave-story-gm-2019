/// @desc Converts file data to list
/// @arg file
function file_bin_toList() {

	var _list = list_create(), _file = argument[0], _l = file_bin_size(_file);

	file_bin_seek(_file, 0);

	for (var i = 0; i < _l; i++)
	{
		ds_list_add( _list, file_bin_read_byte(_file) );
	}

	return _list;


}
