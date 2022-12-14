/// Sets base projectile properties
/// @arg damage,speed,direction,life,hitCount
function set_projectile() {

	damage = argument[0];
	var _spd = argument[1];
	direction = argument[2];
	//image_angle = direction;
	life = argument[3];
	hitCount = argument[4];

	x_speed = _spd * dcos(direction);
	y_speed = -_spd * dsin(direction);


}
