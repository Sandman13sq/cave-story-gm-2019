/// @desc Draws two rectangles as a meter
/// @arg x,y,w,h,value,max,meterCol,backCol,alpha
function draw_meter_wh(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8) {

	var _x = argument0, _y = argument1,
	_w = argument2,
	_h = argument3,
	_max = argument5, _size = (argument4 / _max) * _w;

	draw_sprite_ext(spr_shape_pixel, 0, _x, _y, _w, _h, 0, argument7, argument8);
	draw_sprite_ext(spr_shape_pixel, 0, _x, _y, _size, _h, 0, argument6, argument8);


}
