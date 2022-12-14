/// @desc Returns true if index is a water tile
/// @arg index
function isWaterTile(argument0) {

	return (
	argument0 == 0x60 ||
	argument0 == 0x62 ||
	(argument0 >= 0x70 && argument0 <= 0x77)
	)


}
