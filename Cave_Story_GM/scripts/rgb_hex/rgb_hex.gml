/// Converts hex to rgb color
/// @arg hex_str
function rgb_hex() {

	var _hex = argument[0];

	return make_color_rgb(hex_read(_hex, 0), hex_read(_hex, 1), hex_read(_hex, 2))


}
