/// @desc 

switch(state)
{
	case(1):
		//if (CURRENT_FRAME mod 2)
		{
			draw_sprite_region_v(
				spr_teleporterBeam, 0,
				x, y - 16, y + 16, xstart + CURRENT_FRAME * 2
				);
		}
		break;
}

event_inherited();

/*
draw_sprite(sprite_index, image_index, x, y);

if !(flag & 1 << Entity_Flag.hide)
{
	var _x = x, _y = y - 24, _h = 8, _w = 32;
	
	draw_shape_rect_wh(_x, _y, _w, _h, c_caveBlack, 1);
	draw_shape_rect(
		beamX1, _y, beamX2, _y + _h, c_red, 1);
	
	// Do animation if at least one animation exists
	if getBit(flag, Entity_Flag.animates)
	{
		drawAnimation(
			x + sprite_offset_x + width * !image_xflip, 
			y + sprite_offset_y, 
			);
		
	}
	// Draw Sprite
	else
	{
		if sprite_exists(sprite_index) {draw_self();}
	}
}