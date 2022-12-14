/// @desc Sets stage tile layers
/// @arg index,foreground_lyr,background_lyr
function setStageTilelayer(argument0, argument1, argument2) {

	with Mas.stage
	{
		var _index = argument0;
	
		tileLayerFG[_index] = argument1;
		tileLayerBG[_index] = argument2;
	
		tilemapFG[_index] = layer_tilemap_get_id(tileLayerFG[_index]);
		tilemapBG[_index] = layer_tilemap_get_id(tileLayerBG[_index]);
	
		tilemap = tilemapFG[_index];
	
		tileset[_index] = tilemap_get_tileset(tilemap[_index]);
	}


}
