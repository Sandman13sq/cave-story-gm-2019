///
function draw_weapon() {

	if ds_list_size(animList_weapon)
	{
		if weaponSprite
		{
			var _data = animList_weapon[| animFrame];

			draw_sprite_ext(weaponSprite, _data[0], 
				x + center_x + _data[1] * image_xflip, 
				y + center_y + _data[2],
				image_xscale * image_xflip, image_yscale, 0, image_blend, image_alpha
				);
		}
	}


}
