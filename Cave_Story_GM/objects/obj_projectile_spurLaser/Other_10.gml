/// @desc Create Segment

cutStep = 0;
	
var _length = point_distance(x, y, cutX, cutY);
	
with instance_create_depth(x, y, depth, obj_projectile_spurSegment)
{
	length = _length;
	lengthStart = _length;
	lengthSpeed = other.lengthSpeed;
	angle = other.direction + 180;
	radius = other.radius;
	life = other.laserLifeMax;
	lifeMax = other.laserLifeMax;
	damage = other.damage;
}
	
cutX = x;
cutY = y;
