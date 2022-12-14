/// @desc Update Current

// Find Target Group
groupCount = ds_list_size(group);
groupSelect = loop(groupSelect, 0, groupCount);
groupCurrent = group[| groupSelect];

if !ds_exists(groupCurrent, ds_type_list)
{
	sequenceCount = 0;
	sequenceSelect = 0;
	
	frameCount = 0;
	frameSelect = 0;
}
else
{
	// Find Target Sequence
	sequenceCount = ds_list_size(groupCurrent);

	sequenceSelect = clamp(sequenceSelect, 0, sequenceCount - 1);
	sequenceCurrent = groupCurrent[| sequenceSelect];

	frameCount = ds_list_size(sequenceCurrent);
	frameSelect = clamp(frameSelect, 0, frameCount - 1);

	frameCurrent = sequenceCurrent[| frameSelect];
	
	for (var i = 0; i < frameCount; i++)
	{
		if !ds_exists(sequenceCurrent[| i], ds_type_list)
		{
			//msg("Error at Frame:", i + 1)
		}
	}
	
	event_user(3);
}

groupOffset = pushSelectionOffset(groupSelect, groupOffset, 8);
sequenceOffset = pushSelectionOffset(sequenceSelect, sequenceOffset, 8);

duration = 0;

for (var i = 0; i < frameCount; i++)
{
	duration += ds_list_find_value(sequenceCurrent[| i], 2);
}

event_user(3);