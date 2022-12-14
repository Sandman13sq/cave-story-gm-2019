/// @desc Runs method
/// @arg method_index,*arg,*arg,...
function runMethod() {

#region Actual Script

	MT_RETURN = NaN;

	MT_FUNCTION = argument[0];
	MT_DATA = array_create(argument_count - 1);

	for (var i = argument_count - 1; i >= 1; i--)
	{
		MT_DATA[i - 1] = argument[i];
	}

	event_user(MT_EVENTUSER);

	MT_DATA = -1;

	return MT_RETURN;

#endregion


}
