/// @desc Shows empty text over player
/// @arg inst
function effect_empty(argument0) {

	with argument0 
	{
		sfx_at(snd_gunClick, MY_X, MY_Y, 0);
		instance_create_depth(MY_X, y + y_up, LyrDepth.maxFront, obj_gfxEmpty);
	}


}
