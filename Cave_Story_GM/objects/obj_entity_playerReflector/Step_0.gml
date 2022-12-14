/// @desc 

// Inherit the parent event
event_inherited();

shineFrame = loop(shineFrame + 0.25, 1, 4);

if shineBuffer {shineBuffer--;}
else
{
	#region Reflect Projectile
	
	var _inst = collision_circle(MY_X, MY_Y, 
		radius + 2, obj_player_projectile, false, true);
	
	if _inst
	{
		with _inst
		{
			var _dir = point_direction(
				other.x + other.center_x,
				other.y + other.center_y,
				x, y,
				);
			
			direction = _dir;
				
			var _speed = point_distance(0, 0, x_speed, y_speed) * 1.2;
			
			x_speed = lengthdir_x(_speed, direction);
			y_speed = lengthdir_y(_speed, direction);
			
			damage = floor(damage * 2);
		}
		
		var _s = 5;
		part_particles_create_color_region(
			PART_SYS_MAIN, 
			MY_X + lengthdir_x(radius, _dir) - _s, 
			MY_Y + lengthdir_y(radius, _dir) - _s,
			MY_X + lengthdir_x(radius, _dir) + _s, 
			MY_Y + lengthdir_y(radius, _dir) + _s,
			getPartType(Part_Index.twinkle), 4, color
			);
			
		sfxCut_at(snd_expBounce, x, y, 0);
		
		shineBuffer = 4;
	}
	
	#endregion
	
	#region Reflect Player
	
	var _inst = collision_circle(MY_X, MY_Y, 
		radius, obj_player, false, true);
	
	if _inst
	{
		with _inst
		{
			var _dir = point_direction(
				MY_X, MY_Y,
				other.x + other.center_x,
				other.y + other.center_y,
				);
				
			var _speed = -max(2, point_distance(0, 0, x_speed, y_speed));
			
			x_speed = lengthdir_x(_speed, _dir);
			y_speed = lengthdir_y(_speed, _dir);
		}
		
		var _s = radius;
		part_particles_create_color_region(
			PART_SYS_MAIN, 
			MY_X - lengthdir_x(radius, _dir) - _s, 
			MY_Y - lengthdir_y(radius, _dir) - _s,
			MY_X - lengthdir_x(radius, _dir) + _s, 
			MY_Y - lengthdir_y(radius, _dir) + _s,
			getPartType(Part_Index.twinkle), 4, color
			);
			
		sfxCut_at(snd_expBounce, MY_X, MY_X, 0);
		
		shineBuffer = 2;
	}
	
	#endregion
}