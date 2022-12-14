/// @desc 

if life > 0
{
	life--;
	
	setCamera_offset(
		polarize(irandom(1) * magnitude),
		polarize(irandom(1) * magnitude)
		);
	
	if life == 0
	{
		setCamera_offset(0, 0);
		instance_destroy();
	}
}