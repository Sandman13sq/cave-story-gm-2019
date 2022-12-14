/// @desc Creates and destroys equippable objects
function updateEquip() {

#region Radar

	if getEquipFlag(Equip_Flag.radar)
	{
		if !instance_exists(RADAR)
		{
			instance_create_depth(0, 0, 0, RADAR);
		}
	}
	else
	{
		with RADAR {instance_destroy();}
	}

#endregion

#region Booster 0.1

	if getBit(FLAGS_GM, GM_Flag.startWith_booster0_1)
	{
		var _l = instance_number(PLAYER), _inst;
	
		for (var i = 0; i < _l; i++)
		{
			_inst = instance_find(PLAYER, i);
		
			with instance_create_dependent_exclusive(_inst, obj_booster_0_1)
			{
				playerIndex = _inst.playerIndex;
			}
		}
	}
	else
	{
		with obj_booster_0_1 {instance_destroy();}
	}

#endregion

#region Booster 0.8

	if getEquipFlag(Equip_Flag.booster0_8)
	{
		var _l = instance_number(PLAYER), _inst;
	
		for (var i = 0; i < _l; i++)
		{
			_inst = instance_find(PLAYER, i);
		
			with instance_create_dependent_exclusive(_inst, obj_booster_0_8)
			{
				playerIndex = _inst.playerIndex;
			}
		}
	}
	else
	{
		with obj_booster_0_8 {instance_destroy();}
	}

#endregion

#region Booster 2.0

	if getEquipFlag(Equip_Flag.booster2_0)
	{
		var _l = instance_number(PLAYER), _inst;
	
		for (var i = 0; i < _l; i++)
		{
			_inst = instance_find(PLAYER, i);
		
			with instance_create_dependent_exclusive(_inst, obj_booster_2_0)
			{
				playerIndex = _inst.playerIndex;
			}
		}
	}
	else
	{
		with obj_booster_2_0 {instance_destroy();}
	}

#endregion


}
