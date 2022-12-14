/// @desc 

// Destroy when life is up
if life > 0
{
	if otherSpeed
	{
		x += otherSpeed * dcos(otherDir);
		y += otherSpeed * dsin(otherDir);
		
		otherSpeed = max(otherSpeed - 0.1, 0);
	}
	
	image_yscale = abs(image_yscale) * -polarize(direction > 90);
	
	if canTrack
	{
		var _list = list_create(), _obj, _x, _y, _targetFound = false;
		if collision_ellipse_list(
			x - trackRadius, y - trackRadius, 
			x + trackRadius, y + trackRadius, 
			targetObj, false, true, _list, true)
		{
			var _l = ds_list_size(_list);
			for (var i = 0; i < _l; i++)
			{
				_obj = _list[| i]; _x = _obj.x + _obj.center_x; _y = _obj.y + _obj.center_y;
			
				if !tile_collision_line(x, y, _x, _y, trackRadius div 8, 0)
				{
					if getBit(_obj.flag, Entity_Flag.shootable)
					{
						_targetFound = true; break;
					}
				}
			}
		
			if _targetFound
			{
				direction = trackAngle(direction, x, y, _x, _y, turnSpeed);
			}
		}
		list_free(_list);
	}
	
	var _x = x + lengthdir_x(radius, direction), 
	_y = y + lengthdir_y(radius, direction),
	_tile;
	
	// Collision with block
	_tile = tile_collision_index_point(_x, _y);
	
	if _tile == 0
	{
		_x = x + lengthdir_x(radius / 2, direction + 90);
		_y = y + lengthdir_y(radius / 2, direction + 90);
		_tile = tile_collision_index_point(_x, _y);
	}
	
	if _tile == 0
	{
		_x = x + lengthdir_x(radius / 2, direction - 90);
		_y = y + lengthdir_y(radius / 2, direction - 90);
		_tile = tile_collision_index_point(_x, _y);
	}
	
	if _tile > 0
	{
		destroyBreakable_point(_x, _y);
		
		life = -1;
		
		part_particles_create(PART_SYS_FRONT, _x, _y, 
			getPartType(Part_Index.clink), 1);
		sfxCut_at(snd_shotHit, x, y, 0);
		instance_destroy(); 
		exit;
	}
	
	// Explode on Contact with Shootable
	var _list = list_create(), _inst,
	_l = collision_line_list(
		x + lengthdir_x(radius, direction),
		y + lengthdir_y(radius, direction),
		x - lengthdir_x(radius, direction),
		y - lengthdir_y(radius, direction),
		ENTITY, false, true, _list, false
		);
		
	for (var i = 0; i < _l; i++)
	{
		_inst = _list[| i];
		
		if getBit(_inst.flag, Entity_Flag.shootable)
		&& _inst.healthPointsMax > 0
		{
			if point_in_entity(
				x + lengthdir_x(radius, direction),
				y + lengthdir_y(radius, direction),
				_inst)
			|| point_in_entity(
				x - lengthdir_x(radius, direction),
				y - lengthdir_y(radius, direction),
				_inst)
			{
				instance_destroy();
			}
		}
	}
	
	list_free(_list);
};

x += movespeed * dcos(direction);
y -= movespeed * dsin(direction);