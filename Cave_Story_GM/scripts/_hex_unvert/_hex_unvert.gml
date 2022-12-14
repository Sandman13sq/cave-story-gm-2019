function _hex_unvert() {
	var _val = string_upper(argument[0]);

	switch(_val)
	{
		case("A"): _val = 10; break;
		case("B"): _val = 11; break;
		case("C"): _val = 12; break;
		case("D"): _val = 13; break;
		case("E"): _val = 14; break;
		case("F"): _val = 15; break;
		case("G"):
		case("H"):
		case("J"):
		case("K"):
		case("M"):
		case("N"):
		case("P"):
		case("Q"):
		case("R"):
		case("S"):
		case("T"):
		case("V"):
		case("W"):
		case("X"):
		case("Y"):
		case("Z"): _val = 15; break;
	}

	return (real(_val))

	/*
	var _val = argument[0];

	switch(_val)
	{
		case("A"): _val = 10; break;
		case("B"): _val = 11; break;
		case("C"): _val = 12; break;
		case("D"): _val = 13; break;
		case("E"): _val = 14; break;
		case("F"): _val = 15; break;
		case("G"): _val = 16; break;
		case("H"): _val = 17; break;
		case("J"): _val = 18; break;
		case("K"): _val = 19; break;
		case("M"): _val = 20; break;
		case("N"): _val = 21; break;
		case("P"): _val = 22; break;
		case("Q"): _val = 23; break;
		case("R"): _val = 24; break;
		case("S"): _val = 25; break;
		case("T"): _val = 26; break;
		case("V"): _val = 27; break;
		case("W"): _val = 28; break;
		case("X"): _val = 29; break;
		case("Y"): _val = 30; break;
		case("Z"): _val = 31; break;
	}

	return (real(_val))

/* end _hex_unvert */
}
