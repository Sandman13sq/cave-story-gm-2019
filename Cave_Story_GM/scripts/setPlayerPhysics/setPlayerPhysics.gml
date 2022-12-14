/// @desc Sets player movement physics
/// @arg index,jump_height,move_speed,move_acc,move_dec,air_acc,grav,grav_max,jump_grav
function setPlayerPhysics(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8) {

	var _index = argument0;

	jump_height[_index] = argument1;
	move_speed[_index] = argument2;
	move_acc[_index] = argument3;
	move_dec[_index] = argument4;
	air_acc[_index] = argument5;

	y_acc[_index] = argument6;
	y_acc_max[_index] = argument7;
	jump_acc[_index] = argument8;


}
