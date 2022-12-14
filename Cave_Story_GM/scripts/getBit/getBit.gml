/// @desc Returns true if bit in value is set
/// @arg value,bit_index
function getBit(argument0, argument1) {

	var _flag = argument0;

	return bool(_flag & (1 << argument1));


}
