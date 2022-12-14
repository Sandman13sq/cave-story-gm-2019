/// @desc 

pulseRadius = radius + ( dsin(pulseTheta) + 1) * 2;
pulseTheta = loop(pulseTheta + 45, 0, 360)

if laserLife
{
	laserLife--;
	pulseColor = merge_color(Col.bulletMid, Col.bulletDark, lerp(0, 1, 0));
}
else
{
	if lengthStart == lengthEnd
	{
		instance_destroy();
	}
	lengthStart = approach(lengthStart, lengthEnd, lengthSpeed);
}

if lengthEnd != lengthTarget
{
	lengthEnd = approach(lengthEnd, lengthTarget, lengthSpeed);
	x += x_speed;
	y += y_speed;
	
	if lastDirection != direction {event_user(0);}
	
	lastDirection = direction;
	
	/// Create Projectile
	if cutStep < cutLength
	{
		cutStep++;
	}
	else
	{
		event_user(0);
	}
}
else
{
	part_particles_create(PART_SYS_FRONT, x, y,
		getPartType(Part_Index.debris_pStar), irandom(4) + radius div 4);
}