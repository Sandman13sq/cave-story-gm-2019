/// @desc Sets equip flag
/// @arg flag_index
function clearEquipFlag(argument0) {

	FLAGS_EQUIP = FLAGS_EQUIP & ~(power(2, argument0));


}
