/// @desc 

list_free(titleList);
ds_map_destroy(sampleData);

if gameBGM_stream != -1
{
	audio_destroy_stream(gameBGM_stream);
	gameBGM_stream = -1;
}