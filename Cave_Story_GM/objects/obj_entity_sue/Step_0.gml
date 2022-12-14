/// @desc 

// Don't Do step if Game Freeze
if FREEZE {exit;}

// Inherit the parent event
event_inherited();

switch(state)
{
	// Look at Player
	case(0):
		var _x = x + center_x, _y = y + UNIT_PX, _w = 64, _h = UNIT_PX;
		if getBit(FLAGS_GAMEPLAY, Gameplay_Flag.playerExists)
		{
			if collision_rectangle(_x - _w, _y - _h, _x + _w, _y, PLAYER, false, true)
			entityLookAtPlayer();
		}
		break;
		
	// Walk
	case(8):
		if !getFlag(Entity_Flag.inAir) && y_speed >= 0
		{
			flipEntityDirection();
			x_speed = 0;
			y_speed = 0;
			setEntityState(10);
		}
		break;
	
	// Walk
	case(3):
		x += entityDirection == Dir.right? 2: -2;
		break;
	
	// Held by Igor
	case(13):
		var _inst = instance_nearest(MY_X, MY_Y, obj_entity_igorCutscene);
		
		if _inst
		{
			setEntityDirection(_inst.entityDirection);
			
			var _in = 4;
			
			x = _inst.x + (entityDirection == Dir.right? _inst.x_right - _in: _inst.x_left + _in) - center_x;
		}
		break;
}