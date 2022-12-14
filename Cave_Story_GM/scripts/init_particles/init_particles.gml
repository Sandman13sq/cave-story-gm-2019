/// @desc Particle Stuffs
function init_particles() {

	// destroy_particles()

	global.PartSys_player = part_system_create();
#macro PART_SYS_PLAYER global.PartSys_player
	part_system_depth(PART_SYS_PLAYER, LyrDepth.player + 1);

	global.PartSys_mid = part_system_create();
#macro PART_SYS_MID global.PartSys_mid
	part_system_depth(PART_SYS_MID, LyrDepth.midEntities + 1);

	global.PartSys_back = part_system_create();
#macro PART_SYS_BACK global.PartSys_back
	part_system_depth(PART_SYS_BACK, LyrDepth.backEntities + 1);

	global.PartSys_front = part_system_create();
#macro PART_SYS_FRONT global.PartSys_front
	part_system_depth(PART_SYS_FRONT, LyrDepth.frontEntities + 1);

	global.PartSys_foreground = part_system_create();
#macro PART_SYS_FOREGROUND global.PartSys_foreground
	part_system_depth(PART_SYS_FOREGROUND, LyrDepth.maxFront - 1);

	global.PartSys_front = part_system_create();
#macro PART_SYS_MAIN global.PartSys_front
	part_system_depth(PART_SYS_MAIN, -100);

	global.PartType = ds_map_create();
#macro PART_TYPE global.PartType

	global.PartType_list = list_create();
#macro PART_TYPE_LIST global.PartType_list

	// REMEMBER!!!!!!!!
	// You can change the settings of a part type at any time in code!


}
