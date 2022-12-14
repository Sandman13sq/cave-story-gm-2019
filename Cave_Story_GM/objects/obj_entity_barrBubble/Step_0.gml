/// @desc 

if FREEZE {exit;}

bubble = !bubble;

var _inst = obj_entity_toroko;

if instance_exists(_inst)
{
	move_towards_point(
		_inst.x + _inst.center_x,
		_inst.y + _inst.center_y,
		bubbleSpeed
		);
		
	if point_in_circle(
		_inst.x + _inst.center_x,
		_inst.y + _inst.center_y,
		MY_X, MY_Y, 4
		)
	{
		with _inst
		{
			changeEntity(Entity_Type.torokoBubble, Dir.right);
		}
		instance_destroy();
	}
}