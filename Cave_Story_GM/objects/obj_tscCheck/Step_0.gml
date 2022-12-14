/// @desc 
if keyboard_check_pressed(ord("F"))
{
	fileCurrent = get_open_filename("Script File|*.tsc", "");
	
	if file_exists(fileCurrent) 
	{
		var _file = file_bin_open(fileCurrent, 0);
		list_free(fileList);
		fileName = filename_name(_file);
		fileList = file_bin_toList(_file);
		file_bin_close(_file);
		
		byteOffset = fileList[| floor(ds_list_size(fileList) / 2)];
		event_user(0);
	}
}

if !keyboard_check(vk_shift)
{
	if keyboard_check_pressed(vk_right) {byteOffset++; event_user(0);}
	if keyboard_check_pressed(vk_left) {byteOffset--; event_user(0);}
}
else
{
	if keyboard_check(vk_right) {byteOffset++; event_user(0);}
	if keyboard_check(vk_left) {byteOffset--; event_user(0);}
}

if keyboard_check(vk_up) {y += 8};
if keyboard_check(vk_down) {y -= 8};