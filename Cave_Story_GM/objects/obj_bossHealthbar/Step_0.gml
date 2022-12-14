/// @desc 

if instance_exists(SOURCE)
{
	x = (CAMERA_W - width) / 2;
	y = CAMERA_H - 64;
	
	healthPoints = SOURCE.healthPoints;
	healthPointsMax = max(SOURCE.healthPointsMax, 1);
	
	healthReal = (healthPoints / healthPointsMax) * width;
	
	if healthShow != healthReal
	{
		if healthShow < healthReal
		{
			healthShow = healthReal;
		}
		else
		{
			healthShow = approach(healthShow, healthReal, 
				1000 / healthPointsMax
				);
		}
	}
}
else
{
	instance_destroy();
}