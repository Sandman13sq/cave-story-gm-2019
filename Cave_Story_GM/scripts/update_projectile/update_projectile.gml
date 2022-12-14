/// @desc Updates projectile hit count. Returns damage
/// @arg projectile_instance
function update_projectile() {

	with argument[0]
	{
		var _damage = damage;
		hitCount--;
		if hitCount == 0
		{
			if flag & 1 << projFlag.destroyOnHit
			{
				instance_destroy();
			}
		}
	}
	return _damage;


}
