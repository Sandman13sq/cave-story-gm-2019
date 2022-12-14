/// @desc 

with obj_intro
{
	menu_state = Intro_State.options;
	drawChoices = true;
}

with global.InputObj
{
	ini_open("controls.ini");
	
	var _s = Input.maskSize_keys;

	ini_write_real("keyboard", "Left",	getSubmask(inputMap_keys, _s * 0, _s) );
	ini_write_real("keyboard", "Up",	getSubmask(inputMap_keys, _s * 1, _s) );
	ini_write_real("keyboard", "Right", getSubmask(inputMap_keys, _s * 2, _s) );
	ini_write_real("keyboard", "Down",	getSubmask(inputMap_keys, _s * 3, _s) );
	
	ini_write_real("keyboard", "Jump",	getSubmask(inputMap_keys, _s * 4, _s) );
	ini_write_real("keyboard", "Shoot",	getSubmask(inputMap_keys, _s * 5, _s) );
	ini_write_real("keyboard", "Menu",	getSubmask(inputMap_keys, _s * 6, _s) );
	ini_write_real("keyboard", "Select",	getSubmask(inputMap_keys, _s * 7, _s) );
	
	ini_write_real("keyboard", "Previous",	getSubmask(inputMap_keys2, _s * 0, _s) );
	ini_write_real("keyboard", "Next",		getSubmask(inputMap_keys2, _s * 1, _s) );
	ini_write_real("keyboard", "Aim Left",	getSubmask(inputMap_keys2, _s * 2, _s) );
	ini_write_real("keyboard", "Aim Right",	getSubmask(inputMap_keys2, _s * 3, _s) );
	
	var _s = Input.maskSize_gpad;

	ini_write_real("gamepad", "Left",	getSubmask(inputMap_Dpad, _s * 0, _s) );
	ini_write_real("gamepad", "Up",		getSubmask(inputMap_Dpad, _s * 1, _s) );
	ini_write_real("gamepad", "Right",	getSubmask(inputMap_Dpad, _s * 2, _s) );
	ini_write_real("gamepad", "Down",	getSubmask(inputMap_Dpad, _s * 3, _s) );
	
	ini_write_real("gamepad", "Jump",	getSubmask(inputMap_face, _s * 0, _s) );
	ini_write_real("gamepad", "Shoot",	getSubmask(inputMap_face, _s * 1, _s) );
	ini_write_real("gamepad", "Menu",	getSubmask(inputMap_face, _s * 2, _s) );
	ini_write_real("gamepad", "Select",	getSubmask(inputMap_face, _s * 3, _s) );
	
	ini_write_real("gamepad", "Previous",	getSubmask(inputMap_shoulder, _s * 0, _s) );
	ini_write_real("gamepad", "Next",		getSubmask(inputMap_shoulder, _s * 1, _s) );
	ini_write_real("gamepad", "Aim Left",	getSubmask(inputMap_shoulder, _s * 2, _s) );
	ini_write_real("gamepad", "Aim Right",	getSubmask(inputMap_shoulder, _s * 3, _s) );

	ini_close();
}