/// @desc 

// Don't Do step if Game Freeze
if FREEZE {exit;}

if life {life--}
else {instance_destroy();}

if experience <= 0
{
	instance_destroy();
}

shineTheta = (shineTheta + 1) mod shineThetaMax;
if shineTheta == 0 
{
	shineColor_current = (shineColor_current + 1) mod array_length(shineColor);
	shineColor_next = (shineColor_current + 1) mod array_length(shineColor);
}

image_blend = merge_color(
	shineColor[shineColor_current], 
	shineColor[shineColor_next], 
	shineTheta / shineThetaMax);

if !alarm[1]
{
	var _pos;
	
	if y_speed > 0
	{
		_pos = tile_position(x, bbox_bottom, 1)
		
		if _pos != NULL
		{
			y_speed = -bounceHeight; alarm[1] = 2;
			x_speed *= 0.5;
			sfxCut_at(snd_expBounce, x, y, 0);
		}
	}
	else if y_speed < 0
	{
		
		_pos = tile_position(x, bbox_top, 3);
		
		if _pos != NULL
		{
			y_speed = -y_speed; alarm[1] = 2;
			sfxCut_at(snd_expBounce, x, y, 0);
		}
	}
	
	{
		if x_speed < 0
		{
			_pos = tile_position(bbox_left, y, 0);
			
			if _pos != NULL
			{
				rotation_speed = -rotation_speed;
				x_speed *= -1; alarm[1] = 2;
				sfxCut_at(snd_expBounce, x, y, 0);
			}
		}
		else 
		{
			_pos = tile_position(bbox_right, y, 2);
			
			if _pos != NULL
			{
				rotation_speed = -rotation_speed;
				x_speed *= -1; alarm[1] = 2;
				sfxCut_at(snd_expBounce, x, y, 0);
			}
		}
	}
}

rotation_speed = -10 * polarize(x_speed < 0) * max( abs(x_speed), 0.7); // approach(rotation_speed, x_speed * 3, 1);
image_angle += rotation_speed;
y_speed = min(gravMax, y_speed + grav);

if gravitate
{
	if getBit(FLAGS_GAMEPLAY, Gameplay_Flag.playerExists)
	{
		var _s = 64,
		_inst = collision_rectangle(
			x - _s, y - _s, 
			x + _s, y + _s, 
			PLAYER, false, true);
		if _inst
		{
			x_speed = approach(x_speed, 2 * polarize((_inst.x + _inst.center_x) > x), 0.01)
		}
	}
}

x += x_speed;
y += y_speed;

//size = max( 6 * log10( power(experience, 2) ) + 2, 4)
size = 7 * power(experience, 1/3) + 1;