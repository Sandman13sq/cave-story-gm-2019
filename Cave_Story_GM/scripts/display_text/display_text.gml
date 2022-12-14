/// @desc Creates text object and sets string
/// @arg type,string
function display_text() {

	with TEXT
	{
		visible = true;
		text_str += string(argument[1]);
		ready = false;
	}


}
