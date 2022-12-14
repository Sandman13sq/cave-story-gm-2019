/// @desc Update Input Strings

var _s = Input.maskSize_keys,
_inputObj = global.InputObj;

inputName_keys = [
	// Directions
	input_string_key(getSubmask(_inputObj.inputMap_keys, _s * 0, _s)),
	input_string_key(getSubmask(_inputObj.inputMap_keys, _s * 1, _s)),
	input_string_key(getSubmask(_inputObj.inputMap_keys, _s * 2, _s)),
	input_string_key(getSubmask(_inputObj.inputMap_keys, _s * 3, _s)),
	// Buttons
	input_string_key(getSubmask(_inputObj.inputMap_keys, _s * 4, _s)),
	input_string_key(getSubmask(_inputObj.inputMap_keys, _s * 5, _s)),
	input_string_key(getSubmask(_inputObj.inputMap_keys, _s * 6, _s)),
	input_string_key(getSubmask(_inputObj.inputMap_keys, _s * 7, _s)),
	// Shoulders
	input_string_key(getSubmask(_inputObj.inputMap_keys2, _s * 0, _s)),
	input_string_key(getSubmask(_inputObj.inputMap_keys2, _s * 1, _s)),
	input_string_key(getSubmask(_inputObj.inputMap_keys2, _s * 2, _s)),
	input_string_key(getSubmask(_inputObj.inputMap_keys2, _s * 3, _s)),
	];
	
_s = Input.maskSize_gpad;

inputName_gpad = [
	// Directions
	input_string_gpad(getSubmask(_inputObj.inputMap_Dpad, _s * 0, _s)),
	input_string_gpad(getSubmask(_inputObj.inputMap_Dpad, _s * 1, _s)),
	input_string_gpad(getSubmask(_inputObj.inputMap_Dpad, _s * 2, _s)),
	input_string_gpad(getSubmask(_inputObj.inputMap_Dpad, _s * 3, _s)),
	// Buttons
	input_string_gpad(getSubmask(_inputObj.inputMap_face, _s * 0, _s)),
	input_string_gpad(getSubmask(_inputObj.inputMap_face, _s * 1, _s)),
	input_string_gpad(getSubmask(_inputObj.inputMap_face, _s * 2, _s)),
	input_string_gpad(getSubmask(_inputObj.inputMap_face, _s * 3, _s)),
	// Shoulders
	input_string_gpad(getSubmask(_inputObj.inputMap_shoulder, _s * 0, _s)),
	input_string_gpad(getSubmask(_inputObj.inputMap_shoulder, _s * 1, _s)),
	input_string_gpad(getSubmask(_inputObj.inputMap_shoulder, _s * 2, _s)),
	input_string_gpad(getSubmask(_inputObj.inputMap_shoulder, _s * 3, _s)),
	];