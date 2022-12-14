/// @desc 

if hitTimer {hitTimer--;}
else
{
	//hitTimer = 4;
	
	var _r = radius, _angle = 0, _stopLaser = false;

	repeat(4)
	{
		collision_line_list(
			cutX + lengthdir_x(radius, _angle),
			cutY + lengthdir_y(radius, _angle),
			x + lengthdir_x(radius, _angle),
			y + lengthdir_y(radius, _angle),
			ENTITY, false, true, targetList, false
			);
			
		if destroyBreakable_point(
			x + lengthdir_x(radius, _angle),
			y + lengthdir_y(radius, _angle)
			)
		{
			if !pierce {_stopLaser = true;}
		}
	
		if isSolidTile( tile_collision_index_point(
			x + lengthdir_x(radius, _angle),
			y + lengthdir_y(radius, _angle)
			) )
		{
			_stopLaser = true;
		}
		
		_angle += 90;
	}
	
	if projectileHitTarget(targetList, false)
	{
		if !pierce {_stopLaser = true;}
		if hitCount == 0 {_stopLaser = true;}
	}
	
	if _stopLaser {lengthTarget = lengthEnd;}
}