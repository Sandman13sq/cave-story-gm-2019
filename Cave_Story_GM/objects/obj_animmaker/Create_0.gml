/// @desc 

// loadAnimationGroup();

//var _w = 1100, _h = 800;

//window_set_size(_w, _h);
//window_set_position(20, 20);

// clearMas();

application_surface_draw_enable(true);

filepath = "D:/Dream_Series/Alive_Again/GameFile/Dream_Series/scripts/loadAnimationGroup/loadAnimationGroup.gml";

alarm[0] = 1;

x = 160;
ypos = 96;
y = ypos;

sprite_index = 0;

camera_width = room_width;
camera_height = room_height;

jsonPath = "";
hasSaved = true;

seqKey = "__sequences";

sequenceBuffer = 0;
sequenceBufferName = "";

propertyBuffer = 0;
frameBuffer = 0;
propertyCount = 6;
duration = 0;
valueBuffer = 1;

#region Initialization

jsonMap = ds_map_create();

group = list_create();
name = list_create();
seqName = list_create();

ds_map_add_list(jsonMap, "data", group);
ds_map_add_list(jsonMap, "name", name);
ds_map_add_list(jsonMap, "sequenceName", seqName);

//groupList = list_create(); // List of Group Keys
//groupSequence = list_create(); // List of Lists of Sequence Keys

groupCount = 0;
sequenceCount = 0;
frameCount = 0;

groupSelect = 0;
sequenceSelect = 0;
frameSelect = 0;
propertySelect = 0;

groupPage = 0;
sequencePage = 0;

groupOffset = 0;
sequenceOffset = 0;

groupCurrent = -1;
sequenceCurrent = -1;
frameCurrent = -1;

addedGroups = 0;
addedSequences = 0;

#endregion

#region Strings

groupEnum = "Animation_Group";
sequenceEnum = "Sequence_";

var i = 0;
frameProperty[i] = "Sprite"; framePropertyWidth[i] = 200; i++;
frameProperty[i] = "Sub"; framePropertyWidth[i] = 64; i++;
frameProperty[i] = "Duration"; framePropertyWidth[i] = 64; i++;
frameProperty[i] = "XOff"; framePropertyWidth[i] = 40; i++;
frameProperty[i] = "YOff"; framePropertyWidth[i] = 40; i++;
frameProperty[i] = "Flags"; framePropertyWidth[i] = 200; i++;

var _state = 1, i = 0;
editString[_state, i] = "Add New"; i++;
editString[_state, i] = "Remove"; i++;
editString[_state, i] = "Change Name"; i++;
editString[_state, i] = "Copy"; i++;
editString[_state, i] = "JSON"; i++;
editString[_state, i] = "Convert To Code"; i++;
editString[_state, i] = "Back"; i++;

var _state = 2, i = 0;
editString[_state, i] = "New Group"; i++;
editString[_state, i] = "New Sequence"; i++;
editString[_state, i] = "New Frame"; i++;
editString[_state, i] = "Back"; i++;

var _state = 3, i = 0;
editString[_state, i] = "Remove Group"; i++;
editString[_state, i] = "Remove Sequence"; i++;
editString[_state, i] = "Remove Frame"; i++;
editString[_state, i] = "Remove Next Group"; i++;
editString[_state, i] = "Back"; i++;

var _state = 4, i = 0;
editString[_state, i] = "Change Group Name"; i++;
editString[_state, i] = "Change Sequence Name"; i++;
editString[_state, i] = "Back"; i++;

var _state = 5, i = 0;
editString[_state, i] = "Copy Group"; i++;
editString[_state, i] = "Copy Sequence"; i++;
editString[_state, i] = "Copy Frame"; i++;
editString[_state, i] = "Back"; i++;

var _state = 6, i = 0;
editString[_state, i] = "Save to JSON"; i++;
editString[_state, i] = "Load from JSON"; i++;
editString[_state, i] = "Back"; i++;

editYsep = 14;

#endregion

#region Colors

color[0] = c_white;

color[1] = 0x8B5072;
color[2] = 0x8B5059;

color[3] = 0xAA4AFF;
color[4] = 0x7100FF;

color[5] = 0x006AFF;

color[6] = 0x542A2A;
color[7] = 0x4C2323;

#endregion

#region Animation

animationIndex = -1;

animationKeyframe = 0;
animationData = undefined;
animationSize = 0;
animationStep = 0;
animationFlag = 0;

animationFreeze = 0;
animationXOffset = 0;
animationYOffset = 0;

animationXFlip = 1;
animationColor = c_white;
animationShader = shd_default;

image_xflip = 1;

image_speed = 0;

#endregion

editSelect = 0;
editNarr = "";
state = 0;

animmaker_createGroup();

event_user(0);

//frameCurrent = sequenceCurrent[| frameSelect];