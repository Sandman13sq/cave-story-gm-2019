/// @desc 

gpu_set_blendmode(waterBlend);

draw_shape_rect(
	waterX1, waterY1, 
	waterX2, waterY2, 
	Col.water, 0.4);

gpu_set_blendmode(bm_normal);

for (var i = 0; i < 32; i++)
{
	draw_sprite(spr_waterLine, 0, 
		loop(-waterLineXDraw + waterX1, -32, waterX2 - 1) + i * 32, 
		waterY1);
}
