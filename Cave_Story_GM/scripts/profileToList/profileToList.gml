/// @desc Populates list with arrays of profile data
/// @arg list,directory
function profileToList(argument0, argument1) {

#region Profile Enum

	enum Profile
	{
		path,
		name,
		modname,
		date,
		time,
	
		stage,
		stageName,
	
		face,
	
		life,
		lifeMax,
	
		currentWeapon,
		weapon,
		weaponData,
		weaponCount,
	
		itemCount,
		item,
	
		flags,
		gmFlags,
		equipFlags,
	
		xpos,
		ypos,
	}

#endregion

	// loadProfile()

	var _list = argument0, _dir = argument1,
	_path = file_find_first(_dir + "*.sav", 0),
	_profile;

	while (_path != "")
	{
		_profile = readProfile(_path);
	
		ds_list_add(_list, _profile);
	
		_path = file_find_next();
	}


}
