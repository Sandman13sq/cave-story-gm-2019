/// @desc 

var _perc, _pos = 0, _sub, _x = 0, _y = 0;

switch(fadeMode)
{
	#region Fade Right
	
	case(Dir.right):
		for (var i = 0; i < fadeCellMaxX; i++)
		{
			_perc = lerp(0, subimageMax, (fadeStep - _pos) / fadeCellMaxX);
			_sub = clamp(_perc, 0, subimageMax);
			
			_x = i * sprite_width;
			_y = 0;
			
			repeat(fadeCellMaxY)
			{
				draw_sprite(sprite_index, _sub, _x, _y);
				_y += sprite_height;
			}
			
			_pos++;
		}
		break;
		
	#endregion
	
	#region Fade Left
	
	case(Dir.left):
		for (var i = fadeCellMaxX; i >= 0; i--)
		{
			_perc = lerp(0, subimageMax, (fadeStep - _pos) / fadeCellMaxX);
			_sub = clamp(_perc, 0, subimageMax);
			
			_x = i * sprite_width;
			_y = 0;
			
			repeat(fadeCellMaxY)
			{
				draw_sprite(sprite_index, _sub, _x, _y);
				_y += sprite_height;
			}
			
			_pos++;
		}
		break;
		
	#endregion
	
	#region Fade Down
	
	case(Dir.down):
		for (var i = 0; i < fadeCellMaxY; i++)
		{
			_perc = lerp(0, subimageMax, (fadeStep - _pos) / fadeCellMaxY);
			_sub = clamp(_perc, 0, subimageMax);
			
			_x = 0;
			_y = i * sprite_height;
			
			repeat(fadeCellMaxX)
			{
				draw_sprite(sprite_index, _sub, _x, _y);
				_x += sprite_width;
			}
			
			_pos++;
		}
		break;
		
	#endregion
	
	#region Fade Up
	
	default:
	case(Dir.up):
		for (var i = fadeCellMaxY - 1; i >= 0; i--)
		{
			_perc = lerp(0, subimageMax, (fadeStep - _pos) / fadeCellMaxY);
			_sub = clamp(_perc, 0, subimageMax);
			
			_x = 0;
			_y = i * sprite_height;
			
			repeat(fadeCellMaxX)
			{
				draw_sprite(sprite_index, _sub, _x, _y);
				_x += sprite_width;
			}
			
			_pos++;
		}
		break;
		
	#endregion
	
	#region Fade Center
	
	case(Dir.center):
		var _distX = (CAMERA_W / 2), _distY = (CAMERA_H / 2), 
		_halfX = sprite_width / 2, _halfY = sprite_height / 2, _mod = 4, _point;
		_perc = lerp(-_mod, subimageMax, (fadeStepMax - fadeStep) / fadeStepMax);
		
		for (var i = 0; i <= fadeCellMaxX; i++)
		{
			_x = (i * sprite_width) - _halfX;
			
			for (var j = 0; j <= fadeCellMaxY; j++)
			{	
				_y = (j * sprite_height) - _halfY;
				
				_point = mean(
					point_distance(_distX, 0, _x + _halfX, 0) / sprite_width,
					point_distance(0, _distY, 0, _y + _halfY) / sprite_height
					)
				
				_sub = clamp(lerp(0, subimageMax, 
					(_point - _perc) / _mod
					), 0, subimageMax);
			
				draw_sprite(sprite_index, _sub, _x, _y);
				
				// if (_point) < 2 {draw_sprite(spr_nullEntity, 0, _x, _y);}
			}
		}
		break;
		
	#endregion
}