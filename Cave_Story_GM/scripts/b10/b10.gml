/// @description b10(value)
/// @param value
function b10() {
	// Decimal (base 10 [100])

	var _val = 0, _l = string_length(argument[0]);
	for (var i = 0; i < _l; i++)
	{
		_val += _hex_unvert(string_char_at(argument[0],i+1))*power(16,_l-i-1);
	}

	return (_val)


}
