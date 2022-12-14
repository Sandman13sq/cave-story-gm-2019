/// @desc()
/// @arg sprite,sub
function create_entityKO() {

	var _hmod = image_xflip,
	_inst = instance_create_depth(
		x + sprite_offset_x + sprite_get_width(sprite_index) * !image_xflip, 
		y, depth + 1, obj_entity_ko);

	with _inst
	{
		sprite_index = argument[0];
		image_index = argument[1];
		image_xscale = _hmod;
	
		hspeed = -_hmod;
		vspeed = -2;
	}

	return _inst;


}
