/// @desc Changes one entity to another type
/// @arg newType,entityDirection
function changeEntity() {

	var _inst = create_classic_entity(x, y, depth, argument[0], event, ID, argument[1], 
		clearBit(flag, Entity_Flag.flagInvisible, Entity_Flag.flagVisible));
	
	with _inst
	{
	
	}

	//instance_change(getClassicObject(argument0), true);

	instance_destroy(self, 0);

	return _inst;


}
