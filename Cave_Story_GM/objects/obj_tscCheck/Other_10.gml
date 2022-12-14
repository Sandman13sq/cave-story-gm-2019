/// @desc Update String
fileString = "";

var _l = ds_list_size(fileList);
for (var i = 0; i < _l; i++)
{
	if i == floor(_l / 2)
	{
		fileString += chr(fileList[| i]);
	}
	else
	{
		fileString += chr(fileList[| i] - byteOffset);
	}
}

fileNLcount = string_count("\n", fileString)