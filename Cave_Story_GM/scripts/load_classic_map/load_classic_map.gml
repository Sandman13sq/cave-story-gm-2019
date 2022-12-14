/// @desc Loads map from file
/// @arg index_or_mapname,event,player_xcell,player_ycell
function load_classic_map() {

	var _map = argument[0];

	if string_length(string_digits(_map)) == string_length(_map)
	&& _map != ""
	{
		setStageID(_map);
	
		_map = get_classic_map(mas_stage.index);
	}

	mas_stage.name = _map;

	room_goto(rm_dummy);

	with instance_create_depth(0, 0, 0, obj_loadRoom)
	{
		stage_name = _map;
		event = argument[1];
		playerSetX = argument[2];
		playerSetY = argument[3];
	};


}
