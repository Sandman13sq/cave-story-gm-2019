/// @desc Sets stage tile layers
/// @arg index,foreground_tmap,background_tmap
function setStageTilemap(argument0, argument1, argument2) {

	with Mas.stage
	{
		var _index = argument0;
	
		tilemapFG[_index] = argument1;
		tilemapBG[_index] = argument2;
	
		tilemap[_index] = tilemapFG[_index];
	
		tileset = tilemap_get_tileset(tilemap[_index]);
	}


}
