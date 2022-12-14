/// @desc Returns mask of tile coordinates if point is in tile
/// @arg cell_x,cell_y
function tile_collision_index() {

	return COLLMAP[# argument[0], argument[1]]


}
