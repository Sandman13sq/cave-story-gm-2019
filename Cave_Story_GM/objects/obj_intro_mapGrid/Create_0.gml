/// @desc 

mapCount = 0;
drawMapPos = 0;
surf = -1;
mapDataList = list_create();

directory = file_dir_string(DATADIR, DATANAME, "Stage");

mapName = file_find_first(directory + "*.pxm", 0);
done = !directory_exists(directory);

stage_sprite = array_create(256);
state = 0;
select = 0;
beta = obj_intro.beta;
stageArr[100, 6] = "";

alarm[1] = 1;

wait = 1;