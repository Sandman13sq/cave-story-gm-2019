/// @desc Loads string from file
/// @arg filename
function loadStringBuffer(argument0) {

	// From Shaun Spalding's Video: "GameMaker - Better Saving & Loading (JSON)"

	var _filename = argument0, 
	_buffer = buffer_load(_filename),
	_string = buffer_read(_buffer, buffer_string);

	buffer_delete(_buffer);

	return _string;


}
