/// @desc 

draw_reset();
	
draw_shape_rect(0, 0, CAMERA_W, CAMERA_H, 0, alpha);
	
if !state
{
	if stageCount
	{
		var _spr = sprite_index, _scale, _pos;

		for (var i = 0; i < stageCount; i++)
		{
			_pos = stageDepthIndex[| i];
			
			_scale = stageScale[_pos];
	
			draw_sprite_ext(_spr, stageIndex[_pos], stageX[_pos], stageY[_pos],
				_scale, _scale, 0, _pos == select? c_white: c_gray, 1);
		}
	}
}