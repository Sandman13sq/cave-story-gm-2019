/// @desc 

// Inherit the parent event
event_inherited();

// Moving
if moving
{
	if y == targetY
	{
		moving = false;
		image_speed = 0;
		timer = timeToFrames(0, 4);
		y_speed = 0;
	}
}
// Waiting to move
else
{
	if timer {timer--}
	else
	{
		if position == 0 {positionPush = 1}
		else if position == positionMax {positionPush = -1}
		
		targetY = y - ( (UNIT_PX * 4) * positionPush );
		
		y_speed = sign(targetY - y) * 2;
		
		position += positionPush;
		
		image_speed = sign(targetY - y);
		
		moving = true;
	}
}