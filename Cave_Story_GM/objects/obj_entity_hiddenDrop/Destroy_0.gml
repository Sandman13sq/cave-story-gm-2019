/// @desc 

// Inherit the parent event
event_inherited();

if getBit(flag, Entity_Flag.option2)
{
	instance_create_depth(x, y, depth, obj_entity_missile);
}
else
{
	instance_create_depth(x, y, depth, obj_entity_heart);
}