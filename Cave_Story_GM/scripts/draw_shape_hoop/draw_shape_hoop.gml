/// @desc Draws hoop as a series of rectangles
/// @arg x,y,inner_radius,outer_radius,end_angle,angle_offset,accuracy,alpha
function draw_shape_hoop(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) {

	var _x = argument0, _y = argument1, 
	_rIn = argument2, _rOut = argument3,
	_maxAngle = argument4, 
	_offset = argument5,
	_accuracy = argument6, 
	_alpha = argument7,
	_angleSep = (360 / _accuracy),
	_l = _maxAngle / _angleSep,
	_angle, _prevAngle = 0;

	for (var i = 0; i <= _l; i++)
	{
		_angle = min(_prevAngle + _angleSep, _maxAngle);
	
		draw_sprite_pos(spr_shape_square, 0,
			_x - lengthdir_x(_rIn, _prevAngle + _offset), // Previous Angle
			_y + lengthdir_y(_rIn, _prevAngle + _offset),
		
			_x - lengthdir_x(_rOut, _prevAngle + _offset), // Previous Angle
			_y + lengthdir_y(_rOut, _prevAngle + _offset),
		
			_x - lengthdir_x(_rOut, _angle + _offset), // Current Angle
			_y + lengthdir_y(_rOut, _angle + _offset),
		
			_x - lengthdir_x(_rIn, _angle + _offset), // Previous Angle
			_y + lengthdir_y(_rIn, _angle + _offset),
			_alpha
			);
		
		_prevAngle += _angleSep;
	}


}
