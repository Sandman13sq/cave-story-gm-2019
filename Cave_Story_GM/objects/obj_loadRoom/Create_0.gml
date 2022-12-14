/// @desc 
enum stg
{
	tile,
	collision,
	properties,
	entities,
	script,
}

event = 0;
playerSetX = 0;
playerSetY = 0;

stage_dir = file_dir_string(DATADIR, DATANAME, "Stage");

stage_ext[stg.tile] = ".pxm";
stage_ext[stg.collision] = ".pxa";
stage_ext[stg.properties] = ".pxp";
stage_ext[stg.entities] = ".pxe";
stage_ext[stg.script] = ".tsc";

stage_name = "Cave";
stage_file[stg.tile] = 0;
stage_file[stg.collision] = 0;
stage_file[stg.properties] = 0;
stage_file[stg.entities] = 0;
stage_file[stg.script] = 0;

loadState = 0;
targetRoom = rm_fromFile;
//if room == targetRoom {room_goto(rm_dummy)}