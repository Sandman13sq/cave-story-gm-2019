/// @desc Hides instance
function hideInstance() {

	var _inst = self;

	with instance_create_depth(x, y, 0, obj_hiddenEntity)
	{
		hiddenInst = _inst;
		flag = _inst.flag;
		ID = _inst.ID;
	}

	instance_deactivate_object(_inst);


}
