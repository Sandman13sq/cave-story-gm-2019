/// @desc 

// Destroy when life is up
if life > 0
{
	movespeed = min(movespeed + 0.2, movespeedMax);
	
	if otherSpeed
	{
		x += otherSpeed * dcos(otherDir);
		y += otherSpeed * dsin(otherDir);
		
		otherSpeed = max(otherSpeed - 0.1, 0);
	}
	
	var _tile = tile_collision_index_point(
		x + lengthdir_x(radius, direction), 
		y + lengthdir_y(radius, direction)
		);
		
	if _tile == 0
	{
		_tile = tile_collision_index_point(
			x - lengthdir_x(radius, direction), 
			y - lengthdir_y(radius, direction)
			);
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
	
	// Explode on Contact
	var _list = list_create(), _inst,
	_l = collision_line_list(
		x + lengthdir_x(radius, direction), 
		y + lengthdir_y(radius, direction),
		x - lengthdir_x(radius, direction), 
		y - lengthdir_y(radius, direction),
		targetObj, false, true, _list, false);
		
	for (var i = 0; i < _l; i++)
	{
		_inst = _list[| i];
		
		if point_in_entity(
			x + lengthdir_x(radius, direction), 
			y + lengthdir_y(radius, direction),
			_inst)
		|| point_in_entity(
			x - lengthdir_x(radius, direction), 
			y - lengthdir_y(radius, direction),
			_inst)
		{
			if getBit(_inst.flag, Entity_Flag.shootable)
			{
				instance_destroy();
			}
		}
	}
	
	list_free(_list);
};

x += movespeed * dcos(direction);
y -= movespeed * dsin(direction);