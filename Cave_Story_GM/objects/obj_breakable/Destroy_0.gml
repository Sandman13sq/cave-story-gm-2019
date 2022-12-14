/// @desc 
		
part_particles_create(PART_SYS_FRONT, 
	x + sprite_get_width(sprite_index) / 2, 
	y + sprite_get_height(sprite_index) / 2,
	getPartType( Part_Index.poof_still ), 1);
		
//change_tile(COLL_TILEMAP, tileCell_x, tileCell_y, 0);
COLLMAP[# tileCell_x, tileCell_y] = 0;
radar_update_tile(tileCell_x, tileCell_y);
		
sfx_at(snd_blockDestroy, x, y, 0);