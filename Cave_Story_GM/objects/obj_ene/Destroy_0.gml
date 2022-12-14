/// @desc 

// Inherit the parent event
event_inherited();

if healthPoints <= 0
{
	switch(irandom(6))
	{
		default:
			dropExp();
			break;
		
		case(0): case(1):
			if irandom(needMissiles())
			{instance_create_depth(x, y, LyrDepth.frontEntities, obj_missileDrop);}
			else {instance_create_depth(x, y, LyrDepth.frontEntities, obj_heartDrop);}
			break;
		
		case(2):
			if irandom(needMissiles())
			{instance_create_depth(x, y, LyrDepth.frontEntities, obj_missileDrop_triple);}
			else {instance_create_depth(x, y, LyrDepth.frontEntities, obj_heartDrop_triple);}
			break;
	}
}