/// @desc Saves string to a file
/// @arg filename,string
function saveStringAsBuffer(argument0, argument1) {

	// From Shaun Spalding's Video: "GameMaker - Better Saving & Loading (JSON)"

	var _filename = argument0, _string = argument1,
	_buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);

	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer, _filename);
	buffer_delete(_buffer);


}
