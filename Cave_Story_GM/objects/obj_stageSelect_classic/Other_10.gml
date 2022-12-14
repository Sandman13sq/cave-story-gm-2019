/// @desc Update Pos

var _ang = theta - 100, _l;

for (var i = 0; i < stageCount; i++)
{
	stageScale[i] = 1 - ( dsin(_ang) / 8 );
	
	stageX[i] = x - radius * dcos(_ang) + xoff * stageScale[i];
	stageY[i] = y - (radius * dsin(_ang) / 2) - (radius * dcos(_ang) / 4) +
		yoff * stageScale[i];
	
	if i == select
	{
		stageY[i] += dsin(CURRENT_FRAME * 2) * 5;
	}
	_ang += angleSep;
}

for (var i = 0; i < stageCount - 1; i++)
{
	if stageY[ stageDepthIndex[| i] ] > stageY[ stageDepthIndex[| i + 1] ]
	{
		ds_list_swap_value(stageDepthIndex, i, i + 1);
		i = -1;
	}
}