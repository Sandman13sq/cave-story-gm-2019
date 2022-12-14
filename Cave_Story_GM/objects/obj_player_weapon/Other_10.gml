/// @desc Update Position

if instance_exists(source)
{
	flag = SOURCE.flag;
	entityDirection = SOURCE.entityDirection;
	
	direction = SOURCE.direction;
	
	visible = SOURCE.visible && !getBit(SOURCE.flag, Entity_Flag.hide) 
	&& SOURCE.animationIndex != Sequence_player.search
	&& SOURCE.animationIndex != Sequence_player.search_end;
	
	drawDirection = direction != 180? direction * polarize(image_xflip): 0;

	/*
	if animationIndex != SOURCE.animationIndex
	{
		setAnimation(SOURCE.animationIndex);
		
		animationStep = SOURCE.animationStep;
		animationKeyframe = SOURCE.animationKeyframe;
	}
	*/
	
	sprite_offset_x = SOURCE.sprite_offset_x;
	sprite_offset_y = SOURCE.sprite_offset_y;

	if SOURCE.rideObject
	{
		with SOURCE
		{
			other.weapon_drawX = MY_X + rideObject.x - rideObject.xprevious;
			other.weapon_drawY = MY_Y + rideObject.y - rideObject.yprevious;
		}
	}
	else
	{
		weapon_drawX = SOURCE.x + SOURCE.center_x;
		weapon_drawY = SOURCE.y + SOURCE.center_y;
	}
}

//updateAnimation();