/// @desc Clear Player Memory
event_inherited();

FLAGS_GAMEPLAY = clearBit(FLAGS_GAMEPLAY, Gameplay_Flag.playerExists);

list_free(searchList);

instance_destroy(obj_player_weapon);
instance_destroy(obj_player_weaponSwitch);
instance_destroy(obj_booster);