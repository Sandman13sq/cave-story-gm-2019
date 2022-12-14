/// @desc Returns 1 if target is hit, 2 if target is invulnerable
/// @arg collision_list,*decreaseHitcount?
function projectileHitTarget() {

	var _ret = false, _list = argument[0],
	_dec = argument_count > 1? argument[1]: true,
	_l = ds_list_size(_list), _inst,
	_hitAlready = list_create(),
	_damage = damage;

	for (var i = 0; i < _l; i++)
	{
		_inst = _list[| i];
	
		if ds_list_find_index(_hitAlready, _inst) == -1 // Skip if already hit
		{
			// Invulnerable
			if getBit(_inst.flag, Entity_Flag.invulnerable)
			{
				sfx(snd_clink);
				part_particles_create(PART_SYS_FRONT, 
					x,
					y,
					getPartType(Part_Index.clink), 1);
			
				instance_destroy();
				_ret = 2;
				break;
			}
			// Do Damage
			else if getBit(_inst.flag, Entity_Flag.shootable)
			{
				if _dec
				{
					while hitCount > 0 && instance_exists(_inst)
					{
						if damage > 0
						{
							with _inst {addHealth(-_damage);}
						}
			
						hitCount--;
					}
				
					if hitCount <= 0 {break;}
				}
				else
				{
					with _inst {addHealth(-_damage);}
				}
		
				_ret = true;
			}
		
			ds_list_add(_hitAlready, _inst);
		}
	}

	if ds_exists(_list, ds_type_list) {ds_list_clear(_list);}

	list_free(_hitAlready);

	return _ret;


}
