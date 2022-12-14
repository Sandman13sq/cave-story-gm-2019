/// @desc Set entity dimentions
/// @arg left,up,right,down,*center_x,*center_y
function init_entity_dimensions() {

	x_left = argument[0];
	y_up = argument[1];
	x_right = argument[2];
	y_down = argument[3];

	if argument_count > 4 {center_x = argument[4]}
	if argument_count > 5 {center_y = argument[5]}


}
