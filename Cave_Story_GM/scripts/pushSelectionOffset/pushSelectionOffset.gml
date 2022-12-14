/// @desc Returns new offset to see selection
/// @arg select,offset,range
function pushSelectionOffset(argument0, argument1, argument2) {

	// Used for menus

	var _select = argument0,
	_offset = argument1,
	_range = argument2,
	_push = sign(_select - _offset);

	while !in_range(_select, 
		_offset, 
		_offset + _range - 1, 
		)
	{
		_offset += _push;
	}

	return _offset;


}
