/// @desc Shows music title at top of screen
/// @arg name
function showMusicTitle(argument0) {

	with (Mas.music)
	{
		if gameBGM_indexLast != gameBGM_index
		{
			var _l = ds_list_size(titleList);
	
			// "Pop" from list if size is at it's max
			if _l == MUSIC_QUEUE_SIZE 
			{
				ds_list_delete(titleList, _l - 1);
				_l--;
			}
		
			// If Index exists in list, don't show title
			if ds_list_find_index(titleList, gameBGM_index) == -1
			{
				with instance_create_depth(0, 0, 0, obj_musicTitle)
				{
					draw_reset();
			
					musicString = "Now Playing: " + string(argument0);
			
					width = (string_width(musicString) * FONT_MAIN_SCALE) + 32;
					x = (CAMERA_W / 2) - (width / 2);
					xstart = x;
				}
			}
		
			// "Push" to list
			ds_list_insert(titleList, 0, gameBGM_index);
		}
	}


}
