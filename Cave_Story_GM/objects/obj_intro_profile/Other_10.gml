/// @desc Refresh Profiles

profileList = list_create();
profileToList(profileList, "");

profileCount = ds_list_size(profileList);

for (var i = profileCount - 1; i >= 0; i--)
{
	profile_x[i] = CAMERA_W + (i * 200);
}

profileSelect = clamp(profileSelect, 0, profileCount);

selectOffset = pushSelectionOffset(profileSelect, selectOffset, 3);

y_offset_target = -(Profile_GUI.h + Profile_GUI.ysep) * selectOffset;