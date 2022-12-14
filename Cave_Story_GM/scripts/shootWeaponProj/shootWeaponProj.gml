/// @desc Fires projectile from weapon
/// @arg x,y,direction
function shootWeaponProj(argument0, argument1, argument2) {

	var _inst = spawn_projectile(projObject, argument0, argument1, self),
	_dir = argument2;

	with _inst
	{
		set_projectile(other.projDamage, 
			other.projSpeed, _dir, other.projLife, other.projHitcount);
		
		set_projectile_sprite(other.projSprite, other.projImagespeed);
	}

	projectileCount++;

	return _inst;


}
