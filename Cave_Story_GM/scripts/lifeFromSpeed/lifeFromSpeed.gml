/// @desc Calculates life based on speed and range desired (Used for weapons)
/// @arg speed,range_inTiles
function lifeFromSpeed(argument0, argument1) {

	var _spd = argument0, _dist = argument1 * UNIT_PX;

	return floor(_dist / _spd);

	/*

	x = vt
	t = x/v

/* end lifeFromSpeed */
}
