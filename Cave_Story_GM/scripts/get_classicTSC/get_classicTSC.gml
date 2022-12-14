/// @desc Returns string from classic TSC files
function get_classicTSC() {

	var _str = "", _path = file_dir_string(DATADIR, DATANAME);

	_str += string_simplify(get_TSC_string(_path + "ArmsItem.tsc"));
	_str += string_simplify(get_TSC_string(_path + "StageSelect.tsc"));
	_str += string_simplify(get_TSC_string(_path + "Head.tsc"));

	return _str;


}
