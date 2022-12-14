/// @desc Sets equip flag
/// @arg flag_index
function getEquipFlag(argument0) {

	return FLAGS_EQUIP & (power(2, argument0));


}
