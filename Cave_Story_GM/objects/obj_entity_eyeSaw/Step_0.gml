/// @desc 

if FREEZE {exit}; // Don't Run code if frozen

// Damage Player
var _inst = collision_circle(x, y, radius, targetInst, 0, true);

if _inst
{
	with _inst 
	{
		addHealth(-other.attackPower);
	}
}

sawAngle = loop(sawAngle + sawSpeed, 0, 360);

switch(state)
{
	// Spinning in Place
	case(0):
		var _range = 300;
		if collision_rectangle(x - _range, y - _range, x + _range, y + _range, targetInst, false, true)
		{
			setEntityState(1);
		}
		break;
		
	// Winding up
	case(1):
		if breakTimer 
		{
			breakTimer--;
			sawSpeed += 0.1;
		}
		else
		{
			setEntityState(2);
		}
		break;
		
	// In Air
	case(2):
		move();
		
		var _coll = tile_collision_index_point(x, y + radius / 4)
		
		if _coll
		{
			setEntityState(3);
		}
		break;
		
	// Moving and Dangerous
	case(3):
		if y_speed > 0
		{
			var _r = radius / 3;
		
			var _pos = tile_position(x, y + _r, 1);
		
			if _pos != NULL
			{
				y_speed = 0;
			
				//while _pos
				{
					y = _pos - _r;
					//_pos = tile_position(x, y + _r - UNIT_PX, 1) - _r;
				}
			
				part_particles_create_region(PART_SYS_MAIN, 
					x - _r, y + _r, x + _r, y + _r, getPartType(Part_Index.smallDust), 1
					);
				
				if tile_collision_index_point(x - _r, y)
				{
					setEntityState(2);
				}
			
			}
		}
		
		move();
		break;
}