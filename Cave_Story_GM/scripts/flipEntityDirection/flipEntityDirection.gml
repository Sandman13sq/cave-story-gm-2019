/// @desc Flips direction of entity
function flipEntityDirection() {

	switch(entityDirection)
	{
		case(Dir.right): setEntityDirection(Dir.left); break;
		case(Dir.left): setEntityDirection(Dir.right); break;
	
		case(Dir.up): entityDirection = Dir.down; break;
		case(Dir.down): entityDirection = Dir.up; break;
	}


}
