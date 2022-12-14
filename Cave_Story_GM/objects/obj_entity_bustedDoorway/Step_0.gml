/// @desc 

// Inherit the parent event
event_inherited();

if tileset = -1
{
	if instance_exists(Mas.stage)
	{
		tilemap = stageLayer_get(0, Stage_Map.tilemapFG);
		tileset = tilemap_get_tileset(tilemap);
	}
}