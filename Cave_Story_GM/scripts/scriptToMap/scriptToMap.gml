/// @desc Reads String into map
/// @arg string,map
function scriptToMap(argument0, argument1) {

	var _script = string_simplify(argument0), _map = argument1,
	_pos = 0, _str = "CAN'T BE NOTHING", 
	_key, _length = string_length(_script);

	while _pos < _length
	{
		_str = "";
	
		// Search for Event Identifier
		while string_char_at(_script, _pos) != "#" 
		{_pos++; if _pos < _length {break}}
		
		// Read Event Number
		_str += string_char_at(_script, _pos);
		_pos++;
	
		while string_length(string_digits(string_char_at(_script, _pos)))
		{
			_str += string_char_at(_script, _pos);
			_pos++; if _pos > _length {break};
		}
		
		// Store Event Number
		_key = real(string_digits(_str) != ""? string_digits(_str): -1);
		
		if !ds_map_exists(_map, _key)
		{
			_str = ""; // Clear String for next section
		
			// Read Script Code until termination
			while string_char_at(_script, _pos) != "#"
			{
				_str += string_char_at(_script, _pos);
				_pos++; if _pos > _length {break};
			}
	
			// Adds read string to event(s)
			if _key != 0
			{
				_map[? _key] = _str;
			}
		}
	}


}
