/// @desc 

if getGameplayFlag(Gameplay_Flag.cameraChange)
{
	x = (CAMERA_W / 2) - (width / 2);
}

if !instance_exists(obj_fade)
{
	if timer
	{
		y = approach_grad(y, 0, 4);
		timer--;
	}
	else
	{
		vspeed -= 0.1;
	
		if y < -height
		{
			instance_destroy();
		}
	}
}