/// @desc 

//vspeed *= 0.9;

if instance_exists(SOURCE)
{
	x = SOURCE.x + SOURCE.center_x + 24;
	y = SOURCE.y - 24;
}

if !alarm[0]
{
	if wipeHeight
	{
		wipeHeight -= 0.1;
	}
	else
	{
		instance_destroy();
	}
}
else
{
	wipeHeight = 1;
}