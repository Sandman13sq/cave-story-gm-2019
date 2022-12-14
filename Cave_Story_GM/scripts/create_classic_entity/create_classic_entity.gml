/// @desc Creates classic entity
/// @arg x,y,depth,type,event,ID,direction,flags
function create_classic_entity() {

	var _x = argument[0], _y = argument[1], 
	_depth = argument[2], _type = argument[3], 
	_event = argument[4], _ID = argument[5], 
	_dir = argument[6], _flag = argument[7],
	_obj = obj_entity, _inst = -1;

	_obj = getClassicObject(_type);

	if _obj <= 0
	{
		_obj = _type mod 2 == 0? obj_entity_nullBat: obj_entity_nullCritter;
	}

	_inst = instance_create_depth(_x, _y, _depth, _obj);

	with _inst
	{
		ID = _ID;
		event = _event;
		entityType = _type;
	
		var _animates = getBit(flag, Entity_Flag.animates);
	
		flag = flag | _flag;
		//otherFlag(_flag, Entity_Flag.shootable);
		//otherFlag(_flag, Entity_Flag.solid);
	
		/*
		flag = andBit(flag, _flag, 
			Entity_Flag.animates,
			Entity_Flag.deathEvent,
			Entity_Flag.showDamage,
			Entity_Flag.frontHitOnly,
			Entity_Flag.shootable,
			Entity_Flag.solid,
			);
		*/
	
		if !_animates {flag = clearBit(flag, Entity_Flag.animates);}
	
		setEntityDirection(_dir);
	
		event_user(0);
	}

	return _inst;


}
