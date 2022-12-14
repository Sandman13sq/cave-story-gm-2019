/// @desc Makes entity jump
/// @arg speed
function jumpWithSpeed(argument0) {

	y_speed = -abs(argument0);

	setFlag(Entity_Flag.inAir);
	collisionDirection = clearBit(collisionDirection, Dir.down);


}
