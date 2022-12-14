/// Returns number as binary string
/// @arg value,*bitcount,*reversePrint?
function bitString() {

	var _value = argument[0], _start = NUMSIZE, _end = 0,
	_str = "", _printForward = false;

	if argument_count > 1 {_start = argument[1]}
	if argument_count > 2 {_printForward = argument[2]}

	// Lowest to Largest
	if _printForward
	{
		for (var i = _end; i < _start; i++)
		{
			if i > 0
			{
				if (i mod 8) == 0
					{_str += " ";}
			}
			if i == 32 {_str += "\n"}
		
			if _value & (1 << i)
				{_str += chr(Char.on);}
			else
				{_str += chr(Char.off);}
		}
	}
	// Largest to Lowest
	else
	{
		for (var i = _start - 1; i >= _end; i--)
		{
			if _value & (1 << i)
				{_str += chr(Char.on);}
			else
				{_str += chr(Char.off);}
		
			if i > 0
			{
				if (i mod 8) == 0
					{_str += " "}
			}
			if i == 32 {_str += "\n"}
		}
	}



	return _str


}
