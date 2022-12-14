/// @desc Frees particle Stuffs
function destroy_particles() {

	part_system_destroy(PART_SYS_PLAYER);
	part_system_destroy(PART_SYS_FRONT);
	part_system_destroy(PART_SYS_MID);
	part_system_destroy(PART_SYS_BACK);
	part_system_destroy(PART_SYS_MAIN);
	part_system_destroy(PART_SYS_FOREGROUND);

	refreshPartType();
	list_free(PART_TYPE_LIST);
	ds_map_destroy(PART_TYPE);


}
