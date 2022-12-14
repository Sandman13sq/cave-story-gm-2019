/// @desc 

xoffset -= x_speed;

sep += 0.01;

if timer
{
	x_speed = approach(x_speed, 0.2, 0.05);
	
	timer--;
}
else
{
	x_speed += 0.1;
	
	if alpha > 0 {alpha -= 0.05}
	else {instance_destroy()}
}

x = xoffset + (CAMERA_W / 2);
y = 80;