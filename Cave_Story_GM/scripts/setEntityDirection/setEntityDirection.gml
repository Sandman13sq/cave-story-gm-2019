/// @desc Sets direction of entity
/// @arg direction
function setEntityDirection(argument0) {

	if argument0 != Dir.keep
	{
		entityDirection = argument0;
	}

	if entityDirection == Dir.right 
	|| entityDirection == Dir.center
	{
		image_xflip = 1;
	} 

	if entityDirection == Dir.left 
	{
		image_xflip = -1;
	}


}
