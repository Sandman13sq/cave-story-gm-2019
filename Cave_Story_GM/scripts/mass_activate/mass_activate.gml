/// @desc Activates or Deactivates all entities and related game objects
/// @arg activate?
function mass_activate() {

	if argument[0]
	{
		instance_activate_object(obj_entity);
		instance_activate_object(mas_projectile);
		instance_activate_object(obj_player_weapon);
	}
	else
	{
		instance_deactivate_object(obj_entity);
		instance_deactivate_object(mas_projectile);
		//instance_deactivate_object(obj_player_weapon);
		instance_destroy(obj_player_weaponSwitch);
	}


}
