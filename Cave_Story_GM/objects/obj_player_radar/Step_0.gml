/// @desc 

if radar_draw
{
	if getBit(FLAGS_GAMEPLAY, Gameplay_Flag.playerExists)
	{
		x = CAMERA_X / UNIT_PX;
		y = CAMERA_Y / UNIT_PX;

		var _l = instance_number(PLAYER), _inst;
		for (var i = 0; i < _l; i++)
		{
			_inst = instance_find(PLAYER, i);
			
			radar_player_x[i] = (_inst.x - CAMERA_X) / (UNIT_PX / radar.unit_size);
			radar_player_y[i] = (_inst.y - CAMERA_Y) / (UNIT_PX / radar.unit_size);	
		}
	}
	
	if getGameplayFlag(Gameplay_Flag.cameraChange)
	{
		radar_width = CAMERA_W div UNIT_PX;
		radar_height = CAMERA_H div UNIT_PX;
	}
}