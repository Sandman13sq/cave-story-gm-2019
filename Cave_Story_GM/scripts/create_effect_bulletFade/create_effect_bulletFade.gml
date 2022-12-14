///
/// @arg sprite,image_speed,direction,life,startColor,endColor
function create_effect_bulletFade(argument0, argument1, argument2, argument3, argument4, argument5) {

	var _inst = instance_create_depth(x, y, depth + 1, obj_effect_bulletFade)

	with _inst
	{
		sprite_index = argument0;
		image_speed = argument1;
		image_angle = argument2;
		life = argument3;
		lifeMax = life;
	
		fadeColor[0] = argument4;
		fadeColor[1] = argument5;
	
		color = merge_color(fadeColor[1], fadeColor[0], (life / lifeMax) );
	}

	return _inst;


}
