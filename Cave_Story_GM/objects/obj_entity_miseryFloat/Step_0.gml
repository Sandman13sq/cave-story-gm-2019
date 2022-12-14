/// @desc 

// Inherit the parent event
event_inherited();

switch(state)
{
	// Float
	case(8):
		y_speed = dsin(hoverTheta);
		hoverTheta = loop(hoverTheta + hoverSpeed, 0, 360);
		setFlag(Entity_Flag.inAir);
		break;
		
	// Cast
	case(15):
		if timer 
		{
			timer--;
			
			if !timer
			{
				instance_create_depth(x + x_right, y, depth, obj_entity_barrBubble);
			}
		}
		
		if animationIsOver()
		{
			setEntityState(0);
		}
		break;
		
	// Float Up
	case(20):
		y_speed = approach(y_speed, -8, 0.1);
		if y < -64 {instance_destroy(self, false)}
		break;
		
	// Drop
	case(13):
		if getFlag(Entity_Flag.justLanding)
		{
			sfx_at(snd_thud, MY_X, MY_Y, 0);
			setEntityState(0);
		}
		break;
}

if teleporting 
{
	teleporting--; 
	
	teleportX = -teleportX;
	
	if !teleporting
	{
		teleportX = 0;
	}
};