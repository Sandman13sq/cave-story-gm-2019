/// @desc 

#region enum Profile_GUI

enum Profile_GUI
{
	w = 512,
	h = 128,
	ysep = 12,
	
	h2 = 348,
	
	choiceW = 128,
	choiceH = 64,
	
	editX = 64,
	editY = 64,
	editW1 = 400,
	editX2 = Profile_GUI.editX + Profile_GUI.editW1,
	editW2 = 200,
	editH = 400,
}

#endregion

#region enum Profile_State

enum Profile_State
{
	select_save,
	select_load,
	
	saveEdit_new,
	saveEdit_present,
	
	preLoad,
	
	overwrite,
	rename,
	rename_file,
}

#endregion

editString = "";
canSave = true;
backSpaceCheck = false;

y_offset = 0;
y_offset_target = 0;
push = 0;

state = Profile_State.select_save;
select = array_create(16);

sliceSprite = spr_betaSlice;
faceSprite = getFaceSprite();

profileList = list_create();
profileToList(profileList, "");

profileCount = ds_list_size(profileList);
profileSelect = 0;

#region Sort By Date

/*
var _endLoop = false, i = 0, _prof, _nextProf;

while(!_endLoop)
{
	if (i + 1) == profileCount
	{
		_endLoop = true;
	}
	else
	{
		_prof = profileList[| i];
		_nextProf = profileList[| i + 1];
		
	}
}

*/

#endregion

newData = array_create(16);
newDataChoice = [
	"Profile Name",
	"File Name",
	"Prev Face",
	"Next Face",
	"Save Profile",
	"Back",
	];

var _profData;

for (var i = profileCount - 1; i >= 0; i--)
{
	profile_x[i] = CAMERA_W + (i * 200);
	
	_profData = profileList[| i];
	if _profData[Profile.path] == PROFILE_PATH
	{
		profileSelect = i;
		y_offset_target = -(Profile_GUI.h + Profile_GUI.ysep) * clamp(i, 0, profileCount - 2);
	}
}

with TEXT {visible = false;}

x = (CAMERA_W - Profile_GUI.w) / 2;
y = 40 + y_offset_target;