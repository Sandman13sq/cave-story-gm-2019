/// @description (Returns hex string using least possible number of characters) 
/// @param value,*digits
function hex() {

	var _dec = argument[0], _str = "", _digits = 2;

	if argument_count > 1 {_digits = argument[1]} // Digits is given

	while ((_dec / 16) > 0)
	{
		_str = string_insert(_hex_convert(_dec mod 16),_str,1);
		_dec = (_dec div 16);
	}

	while (string_length(_str) < _digits)
	{
		_str = string_insert("0",_str,1);
	}

	//while string_length(_str) < 2 {_str += "0"}

	return (_str)

	/*
	var _dec = argument[0], 
	_hex1 = (_dec div 16), 
	_hex2 = (_dec-(16*(_hex1)));

	_hex1 = _hex_convert(_hex1);
	_hex2 = _hex_convert(_hex2);

	return (_hex1+_hex2)

/* end hex */
}
