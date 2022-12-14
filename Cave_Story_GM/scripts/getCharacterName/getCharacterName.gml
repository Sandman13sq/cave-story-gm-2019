/// @desc Returns random character name
/// @arg char_index
function getCharacterName(argument0) {

	var _name = "";

	switch(loop(argument0, 0, 5))
	{
		default: _name = "Mr Traveller"; break;
	
		case(0): _name = "Quote"; break;
		case(1): _name = "Curly"; break;
		case(2): _name = "Toroko"; break;
		case(3): _name = "King"; break;
	
	}


}
