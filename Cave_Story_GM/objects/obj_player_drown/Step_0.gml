/// @desc 

if alpha < 1 {alpha = approach(alpha, 1, alphaSpeed);}

if playCount < 15
{
	if timer == 0
	{
		timer = 5;
		
		if playCount > 0
		{
			part_particles_create(PART_SYS_FOREGROUND, 
				x + UNIT_PX / 2, y + UNIT_PX / 2, 
				getPartType(Part_Index.drownBubble), 1);
		}
		
		playCount++;
		
		volume *= 0.7;
	}
	
	timer--;
}