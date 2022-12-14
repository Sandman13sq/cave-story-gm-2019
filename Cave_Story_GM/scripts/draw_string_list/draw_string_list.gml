/// @desc ()
/// @param x,y,str0,str1,str2...
function draw_string_list() {

	var _x = argument[0], _y = argument[1], 
	i, _l = argument_count - 2,
	_str = "";

	for (i = 0; i < _l; i++)
	{
		_str += string(argument[i + 2]) + "\n";
	}

	Dtext(_x, _y, _str);


}
