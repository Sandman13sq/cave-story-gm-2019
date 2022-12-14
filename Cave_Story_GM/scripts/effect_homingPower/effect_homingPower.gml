/// @desc Creates circle that homes in on position
/// @arg x,y,target_x,target_y,radiusMax,radiusMin,life,depth,color_array,alpha_array
function effect_homingPower(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9) {

	var _inst = instance_create_depth(argument0, argument1, argument7, obj_homingPower);

	with _inst
	{
		target_x = argument2;
		target_y = argument3;
	
		radiusMax = argument4;
		radiusMin = argument5;
	
		lifeMax = argument6;
		life = lifeMax;
	
		color = argument8;
		alpha = argument9;
	}

	return _inst;


}
