/// @desc Takes over tilemap drawing for tile layer
/// @arg tilemap,depth
function tilemapTakeover(argument0, argument1) {

	var _tmap = argument0;

	with instance_create_depth(0, 0, argument1, obj_tilemapDraw)
	{
		tilemap = _tmap;
		tileset = tilemap_get_tileset(tilemap);
		
		width = tilemap_get_width(tilemap);
		height = tilemap_get_height(tilemap);
	}
	



}
