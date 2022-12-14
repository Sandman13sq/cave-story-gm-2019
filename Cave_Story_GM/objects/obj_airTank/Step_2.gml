/// @desc 

if FREEZE {exit;}

// Source is player

if instance_exists(SOURCE)
{
	x = getCenterX(SOURCE);
	y = getCenterY(SOURCE);
}
else
{
	instance_destroy();
}