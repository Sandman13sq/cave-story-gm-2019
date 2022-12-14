/// @desc 
if !done
{
	done = true;
	file_find_close();
}

if surface_exists(surf)
{
	surface_free(surf);
}

if mapDataList != -1
{
	list_free(mapDataList);
}

var _l = array_length(stage_sprite);
 
for (var i = 0; i < _l; i++) // For each 
{
	if stage_sprite[i] > 0 && sprite_exists(stage_sprite[i])
	{
		sprite_delete(stage_sprite[i]);
	}
}