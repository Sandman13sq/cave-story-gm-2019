/// @desc 

if instance_exists(SOURCE)
{
	x = SOURCE.x + x_offset;
	y = SOURCE.y + y_offset;
}
	
for (var i = 0; i < 4; i++)
{
	if active[i]
	{
		// Count down if active
		if timer[i]
		{
			timer[i]--;
		}
		else
		{
			if height[i] > 0
			{
				height[i] = approach(height[i], 0, 0.1);
			}
			else
			{
				active[i] = false;
				count--;
					
				if count == 0
				{
					instance_destroy();
				}
			}
		}
		
		// Flash
		if flash[i]
		{
			flash[i]--;
		}
	}
		
	// Countdown delay if present
	if delay[i]
	{
		delay[i]--;
			
		if !delay[i]
		{
			active[i] = true;
			count++;
		}
	}
}