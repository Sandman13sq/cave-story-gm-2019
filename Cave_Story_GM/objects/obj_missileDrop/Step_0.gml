/// @desc 

if FREEZE {exit;}

if life <= 0 {instance_destroy()}
else
{
	event_inherited();
	
	life--;
	
	if life < blinkTime
	{
		if life mod 4 == 0 {visible = !visible;}
	}
}