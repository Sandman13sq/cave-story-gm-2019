/// @desc Creates group in animmaker
function animmaker_createGroup() {

	var _group = list_create(),
	_name = "group_" + string(addedGroups),
	_seqNameList = list_create(),
	_index;

	// Add Group to Group List
	_index = ds_list_add(group, _group);

	// Add Name to Name List
	ds_list_add(name, _name);

	ds_list_add(seqName, _seqNameList);

	animmaker_createSequence(_index);

	addedGroups++;

	return _group;

	/*
	var _group = ds_map_create(),
	_key = "newGroup_" + string(addedGroups),
	_seqList = list_create();

	// Add Sequence List to keep track of keys
	ds_map_add_list(_group, seqKey, _seqList);

	animmaker_createSequence(_group);

	ds_map_add_map(jsonMap, _key, _group);

	ds_list_add(groupList, _key);

	addedGroups++;

	groupCount = ds_list_size(groupList);

	return _group;

/* end animmaker_createGroup */
}
