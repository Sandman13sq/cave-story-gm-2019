/// @desc Save Dialog

/*
if !hasSaved
{
	if show_question("You have unsaved changes, would you like to save?")
	{
		var _path = get_save_filename("animation.json", jsonPath);
		if _path != ""
		{
			jsonPath = _path;
			saveStringAsBuffer(jsonPath, json_encode(jsonMap));
			hasSaved = true;
		}
	}
}