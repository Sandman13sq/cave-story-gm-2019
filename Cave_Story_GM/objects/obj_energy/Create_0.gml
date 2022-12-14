/// @desc 

event_inherited();

life = timeToFrames(0, 8); // Life
alarm[2] = 2 * life / 3;

grav = 0.12;
gravMax = PLAYER_GRAVITY_MAX;
bounceHeight = 2.2;

// Necessary for FREEZE to work
x_speed = 0;
y_speed = 0;

size = 8;
experience = 3;

rotation_speed = -5 * dcos(direction);
gravitate = getBit(FLAGS_GM, GM_Flag.energyGravitation);

shineThetaMax = 16;
shineTheta = irandom(shineThetaMax);

shineColor[2] = rgb_hex("FFFFF3");
shineColor[1] = rgb_hex("EA7321");
shineColor[0] = rgb_hex("FFB967");

shineColor_current = 0;
shineColor_next = 1;

shineColor_current = irandom(array_length(shineColor) - 1);
shineColor_next = (shineColor_current + 1) mod (array_length(shineColor) - 1);

image_angle = random(360);

// Destroy if in tile
if tile_position(x, bbox_bottom, 1)
&& tile_position(x, bbox_top, 3)
&& tile_position(bbox_left, y, 0)
&& tile_position(bbox_right, y, 2)
{
	var _free = false;
	for (var i = 0; i < 3; i++)
	{
		y -= UNIT_PX;
		if !tile_collision_index_point(x, bbox_top - UNIT_PX)
			{_free = true; break;}
	}
	
	if !_free
	{
		instance_destroy();
	}
}