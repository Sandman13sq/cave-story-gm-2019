/// @desc Converts values (bytes) in a list to a string
/// @arg list,start,final,
function list_to_string() {

	var _list = argument[0], _str = "";

	for (var i = argument[1]; i <= argument[2]; i++)
	{
		_str += chr( real(_list[| i]) );
	}

	return _str;


}
