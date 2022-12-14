/// @desc 

// Inherit the parent event
event_inherited();

// Vertical
if flag & 1 << Entity_Flag.option2
{
	while (!isSolidTile(tile_collision_index(x div UNIT_PX, axisY1 div UNIT_PX)))
	{
		axisY1 -= UNIT_PX;
		if axisY1 <= 0 {break;}
	}
	
	while (!isSolidTile(tile_collision_index(x div UNIT_PX, axisY2 div UNIT_PX)))
	{
		axisY2 += UNIT_PX;
		if axisY2 >= room_height {break;}
	}
}
// Horizontal
else
{
	while (!isSolidTile(tile_collision_index(axisX1 div UNIT_PX, y div UNIT_PX)))
	{
		axisX1 -= UNIT_PX;
		if axisX1 <= 0 {break;}
	}
	
	while (!isSolidTile(tile_collision_index(axisX2 div UNIT_PX, y div UNIT_PX)))
	{
		axisX2 += UNIT_PX;
		if axisX2 >= room_width {break;}
	}
}