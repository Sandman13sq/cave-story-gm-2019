/// @desc 

if FREEZE {exit}; // Don't Run code if frozen

run_flags();

x += x_speed;
y += y_speed;

if x > (room_width + UNIT_PX) * 8 {instance_destroy()}
if y > (room_height + UNIT_PX) * 8 {instance_destroy()}

if !(flag & 1 << Entity_Flag.ignoreSolid)
{
	var _pos, _lastAir = getFlag(Entity_Flag.inAir);
	
	setFlag(Entity_Flag.inAir);
	clearFlag(Entity_Flag.justLanding);
	
	collisionDirection = 0;
	
	// Ground Collision
	_pos = tile_position(x + center_x, y + y_down - 1, 1);
	
	if _pos != NULL
	{
		y -= 1;
		collisionDirection = setBit(collisionDirection, Dir.down);
		clearFlag(Entity_Flag.inAir);
	}
		
	_pos = tile_position(x + center_x, y + y_down, 1);
	
	if _pos != NULL
	{
		tileCurrent = tile_collision_index_point(x + center_x, y + y_down);
		y = _pos - y_down;
		y_speed = min(y_speed, 0);
		lastColl = 1;
		collisionDirection = setBit(collisionDirection, Dir.down);
		clearFlag(Entity_Flag.inAir);
	}
	else 
	{
		_pos = tile_position(x + center_x, y + y_down + 2, 1);
		
		if _pos != NULL && !getFlag(Entity_Flag.inAir) && y_speed >= 0
		{
			tileCurrent = tile_collision_index_point(x + center_x, y + y_down + 2);
			y = _pos - y_down;
			lastColl = 1;
			collisionDirection = setBit(collisionDirection, Dir.down);
			clearFlag(Entity_Flag.inAir);
		}
	}
		
	// Top Collision
	_pos = tile_position(x + center_x, y + y_up, 3);
	
	if _pos != NULL
	{
		y = _pos - y_up;
		if y_speed < 0 {y_speed = 0};
		lastColl = 3;
		collisionDirection = setBit(collisionDirection, Dir.up);
	}
		
	// Entity Right Side collision
	if x_speed >= 0
	{
		_pos = tile_position(x + x_right, y + center_y, 2);
		
		if _pos != NULL
		{
			x = _pos - x_right;
			x_speed = 0; lastColl = 2;
			collisionDirection = setBit(collisionDirection, Dir.right);
		}
	}
		
	// Entity Left Side collision
	if x_speed <= 0
	{
		_pos = tile_position(x + x_left, y + center_y, 0);
		
		if _pos != NULL
		{
			x = _pos - 1 - x_left;
			x_speed = 0; lastColl = 0;
			collisionDirection = setBit(collisionDirection, Dir.left);
		}
	}
	
	if getFlag(Entity_Flag.inAir)
	{
		if !(flag & 1 << Entity_Flag.skipGrav)
		{
			if y_speed < y_acc_max
			{
				y_speed = min(y_speed + y_acc / (jump_hold * 1.3 + 1), y_acc_max)
			}
		}
		else {flag = flag | 1 << Entity_Flag.skipGrav}
	}
	else
	{
		if _lastAir {setFlag(Entity_Flag.justLanding)}
	}
}