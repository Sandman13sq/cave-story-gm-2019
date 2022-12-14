/// @desc Remove dynamic memory

var _groupCount, _seqCount, _frameCount,
_group, _seq;

_groupCount = ds_list_size(group);

for (var i = 0; i < _groupCount; i++)
{
	_group = group[| i];
	
	_seqCount = ds_list_size(_group);
	
	for (var j = 0; j < _seqCount; j++)
	{
		_seq = _group[| j];
		
		_frameCount = ds_list_size(_seq);
		
		for (var l = 0; l < _frameCount; l++)
		{
			list_free(_seq[| l]);
		}
		
		list_free(_seq);
	}
	list_free(seqName[| i]);
	list_free(_group);
}

list_free(group);
list_free(name);
list_free(seqName);

ds_map_destroy(jsonMap);

list_free(sequenceBuffer);