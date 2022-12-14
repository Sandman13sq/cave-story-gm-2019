/// @desc 

depth = LyrDepth.foreground;

instance_destroy(obj_pauseScreen);
end_event();

stage_surface = -1;

stage_width = ds_grid_width(COLLMAP);
stage_height = ds_grid_height(COLLMAP);

radar_color[radar.tile_solid] = c_lime;
radar_color[radar.tile_open] = c_green;
radar_color[radar.tile_breakable] = c_fuchsia;
radar_color[radar.tile_danger] = c_red;
radar_color[radar.tile_water] = c_blue;

stage_scale = 8;
cellSize = 4;

stage_drawMaxW = min(stage_width, 64);
stage_drawMaxH = min(stage_height, 48);

maxView = 0;

viewX = 0;
viewY = 0;
viewSpeed = 0.5 * cellSize;

deathTrapList = list_create();
dangerList = list_create();

with obj_entity_deathTrap
{
	ds_list_add(other.deathTrapList, [round(x / UNIT_PX), round(y / UNIT_PX)]);
}

with obj_entity_spikes
{
	ds_list_add(other.dangerList, [round(x / UNIT_PX), round(y / UNIT_PX)]);
}

FREEZE = true;

event_user(0);