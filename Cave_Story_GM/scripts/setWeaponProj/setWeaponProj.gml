/// @desc Sets up projectile
/// @arg object,damage,speed,life,hitcount,*sprite,*image_speed
function setWeaponProj() {

	projObject = argument[0];
	projDamage = argument[1];
	projSpeed = argument[2];
	projLife = argument[3];
	projHitcount = argument[4];

	if argument_count > 5 {projSprite = argument[5];}
	if argument_count > 6 {projImagespeed = argument[6];}


}
