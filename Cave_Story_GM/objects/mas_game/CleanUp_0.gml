/// @desc Delete Global Stuffs
destroy_particles();

//list_free(weaponData_list);

clearWeaponData(weaponMap);

ds_map_destroy(TELEPORTER_STAGE);
ds_map_destroy(sampleData);

ds_map_destroy(PROPERTIES);
ds_map_destroy(GLOBAL_SCRIPT);

destroy_playerData();

font_delete(global.DreamFont);
font_delete(global.SmallFont);
font_delete(global.MiniFont);

if datafaces > 0
{
	sprite_delete(datafaces);
}