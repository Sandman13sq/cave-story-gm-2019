///
function moveOutsideTile() {

	var _option = 
	[
		tile_collision_index_point(x - UNIT_PX / 2, y), // Check Left
		tile_collision_index_point(x + UNIT_PX * 1.5, y), // Check Right
		tile_collision_index_point(x, y  - UNIT_PX), // Check Up
		tile_collision_index_point(x, y + UNIT_PX * 1.5) // Check Down
	];

	for (var i = 0; i < 4; i++)
	{
		if _option[i] 
		{
			switch(i)
			{
				case(0): x += UNIT_PX / 2; break;
				case(1): x -= UNIT_PX * 1.5; break;
				case(2): y += UNIT_PX / 2; break;
				case(3): y -= UNIT_PX * 1.5; break;
			}
			break;
		}
	}


}
