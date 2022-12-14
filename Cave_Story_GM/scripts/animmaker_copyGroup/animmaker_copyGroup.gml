/// @desc Copies current group in animmaker
function animmaker_copyGroup() {

	var _source = groupCurrent,
	_dest, _sourceSeq, _destSeq,
	_seqCount = ds_list_size(_source),
	_sourceFrame, _destFrame, 
	_frameCount, _pos = ds_list_size(group),
	_sourceSeqName, _destSeqName;

	_dest = animmaker_createGroup();

	_sourceSeqName = seqName[| groupSelect];
	_destSeqName = seqName[| _pos];

	ds_list_copy(_destSeqName, _sourceSeqName);

	ds_list_clear(_dest);

	for (var i = 0; i < _seqCount; i++)
	{
		_sourceSeq = _source[| i];
	
		ds_list_add(_dest, list_create());
		_destSeq = _dest[| i];
	
		_frameCount = ds_list_size(_sourceSeq);
	
		ds_list_clear(_destSeq);
	
		for (var j = 0; j < _frameCount; j++)
		{
			_sourceFrame = _sourceSeq[| j];
		
			_destFrame = list_create();
		
			ds_list_copy(_destFrame, _sourceFrame);
		
			ds_list_add(_destSeq[| j], _destFrame);
		}
	}


}
