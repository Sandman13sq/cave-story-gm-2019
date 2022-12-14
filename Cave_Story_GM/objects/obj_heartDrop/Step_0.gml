/// @desc 

if FREEZE {exit;}

if life <= 0 {instance_destroy()}
else
{
	event_inherited();
	
	heart_size = 1 + power(dsin(heart_theta), 8) / 8;
	
	life--;
	
	if life < blinkTime
	{
		if life mod 4 == 0 {visible = !visible;}
	}
}