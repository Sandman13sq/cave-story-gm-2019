/// @desc 

//borderStep = (borderStep + 0.25) * ((borderStep + 0.5) < 20);

borderStep = loop(CURRENT_FRAME / 4, 0, 20);

text_y = approach(text_y, text_y_target, text_speed * 5 / text_scale);
if faceXOffset > 0 {faceXOffset = approach_grad(faceXOffset, 0, 4)}

#region Debug

if DEBUG
{
	if keyboard_check_pressed(ord("T")) {visible = !visible};
	if keyboard_check_pressed(ord("Y")) 
		{faceIndex = loop(faceIndex - 1, 0, sprite_get_number(faceSprite))};
	if keyboard_check_pressed(ord("U")) 
		{faceIndex = loop(faceIndex + 1, 0, sprite_get_number(faceSprite))};
}
	
#endregion
	
if text_pos < string_length(text_str)
{
	var _spd = text_speed * (INPUT_SHOOT_HELD? 2: 1);
	text_pos = min(text_pos + _spd, string_length(text_str));
	
	// Skip Text Entirely
	if INPUT_ALT_HELD && INPUT_JUMP_PRESSED
	{
		text_pos = string_length(text_str);
		text_y = text_y_target;
	}
	
	// Text is complete
	if text_pos == string_length(text_str)
	{
		ready = true;
	}
	else
	{
		if alarm[1] < 0 {alarm[1] = 1};
	}
	
	text_newLineCount = string_count("\n", string_copy(text_str, 1, text_pos));
	
	text_y_target = -max(0, (text_newLineCount - 2)) * Text.str_sep / text_scale;
};

event_user(1);