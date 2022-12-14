/// @desc Changes tile index at position
/// @arg tilemap,cell_x,cell_y,new_index
function change_tile() {

	tilemap_set(
		argument[0],
		tile_set_index(
			tilemap_get(argument[0], argument[1], argument[2]),
			argument[3]),
		argument[1], argument[2]
	)


}
