/// @desc Flicker

//image_alpha = image_alpha > 0.5? image_alpha = 0: image_alpha = 1;
if !FREEZE
{
	visible = !visible;
}

alarm[2] = 4;