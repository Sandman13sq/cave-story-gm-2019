/// @desc 

//vspeed *= 0.9;

if instance_exists(sourceObj)
{
	x = sourceObj.x + sourceObj.center_x - 24;
	y = sourceObj.y - 24;
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