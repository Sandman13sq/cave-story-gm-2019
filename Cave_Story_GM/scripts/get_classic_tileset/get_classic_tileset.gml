/// @desc Returns index of tileset based on string or real
/// @arg value/string
function get_classic_tileset() {

	var _ret = 0;

	switch(argument[0])
	{
		case("Sand"):	_ret = prt_sand; break;
		case("Eggs"):	_ret = prt_egg; break;
		case("Weed"):	_ret = prt_weed; break;
		case("Cave"):	_ret = prt_cave; break;
		case("Cent"):	_ret = prt_cent; break;
		case("Barr"):	_ret = prt_barr; break;
		case("EggIn"):	_ret = prt_eggIn; break;
		case("Gard"):	_ret = prt_gard; break;
		case("Fall"):	_ret = prt_fall; break;
		case("Almond"): _ret = prt_almond; break;
		case("Pens"):	_ret = prt_pens; break;
		case("White"):	_ret = prt_white; break;
		case("Mimi"):	_ret = prt_mimi; break;
		case("Jail"):	_ret = prt_jail; break;
		case("EggX"):	_ret = prt_eggX; break;
		case("Maze"):	_ret = prt_maze; break;
		case("Oside"):	_ret = prt_oside; break;
		case("Hell"):	_ret = prt_hell; break;
		case("Store"):	_ret = prt_store; break;
		case("Labo"):	_ret = prt_labo; break;
		case("River"):	_ret = prt_river; break;
	}

	return _ret;


}
