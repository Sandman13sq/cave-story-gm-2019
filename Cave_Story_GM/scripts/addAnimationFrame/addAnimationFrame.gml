/// @desc Creates animation frame data for animation
/// @arg sprite,subimage,duration,xoffset,yoffset,flags
function addAnimationFrame(argument0, argument1, argument2, argument3, argument4, argument5) {

	return [
		argument0,
		argument1,
		argument2,
		argument3,
		argument4,
		argument5,
		]

	/*
	var _frame = 0, _flag = argument_count > 3? argument[3]: 0;
		_frame = _frame | argument0; // Animation Type
		_frame = _frame | (argument1 << 16); // Sprite Index
		_frame = _frame | (argument2 << 32); // Subimage
		_frame = _frame | (argument3 << 48); // Time until next frame
	
	return _frame;

/* end addAnimationFrame */
}
