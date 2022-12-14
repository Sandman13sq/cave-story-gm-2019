/// @desc Create Next Projectile
if nextProjectile > -1
{
	// Create next projectile
}

if sourceObj != -1
{
	if instance_exists(sourceObj)
	{
		sourceObj.projectileCount = max(sourceObj.projectileCount - 1, 0);
	}
}
