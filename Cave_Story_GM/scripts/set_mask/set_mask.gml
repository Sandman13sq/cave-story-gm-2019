/// Sets mask for use with collision
/// @arg sprite,w,h
function set_mask() {

	var _spr = argument[0], 
	_w = argument[1], _h = argument[2];

	mask_index = _spr;

	image_xscale = (_w / sprite_get_width(_spr));
	image_yscale = (_h / sprite_get_height(_spr));


}
