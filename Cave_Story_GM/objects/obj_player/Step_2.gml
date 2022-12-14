/// @desc Ride Object

#region Run Entity Script
		
if !getFlag(Entity_Flag.inAir) && search_buffer > 0
{
	var _l = collision_line_list(
		PLAYER_X, 
		PLAYER_Y, 
		PLAYER_X, 
		y + y_down - 1, 
		ENTITY, false, true, searchList, false);
				
	// Iterate through each Entity
	for (var i = 0; i < _l; i++)
	{
		if getBit(searchList[| i].flag, Entity_Flag.interactable)
		{
			interactObj = searchList[| i];
			flag = clearBit(flag, Entity_Flag.facingUp, Entity_Flag.facingDown);
			destroy_player_objects();
			
			setAnimation(Sequence_player.search);
			updateAnimation();
			setAnimationPosition(100);
			updateAnimation();
			
			x_speed = 0;
			
			with interactObj
			{
				event_user(3);
			}
	
			search_buffer = 0;
			break;
		}
	}
				
	ds_list_clear(searchList);
}

if search_buffer > 0
{
	search_buffer--;
}
		
#endregion

// Inherit the parent event
event_inherited();

curlySpriteUpdate();

if rideObject
{
	//x += rideObject.x_speed;
	//y += rideObject.y_speed;
	
	x += rideObject.x - rideObject.xprevious;
	y += rideObject.y - rideObject.yprevious;
}

// Update Weapon Animation
with weaponObj
{
	if animationIndex != other.animationIndex
	{
		setAnimation(other.animationIndex);
		updateAnimation();
	}
	
	if animationData != undefined
	{
		animationKeyframe = clamp(other.animationKeyframe, 0, animationSize - 1);
	
		updateAnimationFrame();
	}
	
	event_user(0);
}

// Lower GUI alpha if behind bars
if point_in_rectangle(x, y, CAMERA_X, CAMERA_Y, CAMERA_X + 172, CAMERA_Y + 108)
{
	guiAlpha = approach(guiAlpha, 0.5, 0.05);
}
else
{
	guiAlpha = approach(guiAlpha, 1, 0.05);
}