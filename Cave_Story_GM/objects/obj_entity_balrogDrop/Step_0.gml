/// @desc 

if collisionTimer 
{
	collisionTimer--;
	
	x += x_speed;
	y += y_speed;
	
	y_speed = min(y_acc_max, y_speed + y_acc);
	
	if collisionTimer == 0
	{
		flag = clearBit(flag, Entity_Flag.ignoreSolid);
	}
}
else
{
	// Inherit the parent event
	event_inherited();
}