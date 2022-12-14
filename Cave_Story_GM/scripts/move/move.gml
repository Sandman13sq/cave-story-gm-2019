/// @desc Adds speeds to x and y
function move() {

	if !FREEZE
	{
		x += x_speed;
		y += y_speed;

		y_speed = min(y_speed + y_acc, y_acc_max);
	}


}
