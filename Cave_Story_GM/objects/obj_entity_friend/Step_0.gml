/// @desc 

// Inherit the parent event
event_inherited();

if !getBit(flag, Entity_Flag.noTile44)
{
	var _tile = tile_collision_line(x, y, x, y + 4, 2, 0);
	
	if _tile == 0x44
	{
		tileCurrent = _tile;
		y = (y div UNIT_PX) * UNIT_PX;
		lastColl = 1;
		collisionDirection = setBit(collisionDirection, Dir.down);
	}
}