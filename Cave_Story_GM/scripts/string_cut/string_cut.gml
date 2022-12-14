/// @desc Cuts off a number of characters from a string
/// @arg string,charsFromStart,charsFromEnd
function string_cut() {

	return string_copy(argument[0], argument[1] + 1, string_length(argument[0]) - argument[2]);


}
