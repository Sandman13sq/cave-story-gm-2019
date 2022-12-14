/// @desc Compose Code

var _code = "", _tab = "\t";

_code += "/// @desc Loads animation into main map\n";
_code += "/// @arg group\n";

#region Write Group Enum

_code += "\n#region Group Enum\n\n";

_code += "enum " + groupEnum + "\n";
_code += "{\n";

for (var i = 0; i < groupCount; i++)
{
	_code += "\t" + name[| i] + ",\n";
}

_code += "}\n\n#endregion\n\n";

#endregion

_code += "// Load to memory if not already present\n";
_code += "if !ds_map_exists(ANIMATION_GROUP, argument0)\n{\n";

_tab = "\t";

_code += _tab + "var _group = argument0;\n\n";
_code += _tab + "// Add group to main list\n";
_code += _tab + "ANIMATION_GROUP[? _group] = ds_map_create();\n";
_code += _tab + "ds_list_add(ANIMATION_LIST, ANIMATION_GROUP[? _group]);\n\n";

#region Write Group Sequences

_code += _tab + "switch(_group)\n";
_code += _tab + "{\n";

var _name, _seq, _seqName, _seqCount, 
_frameCount, _frameData, _str;

for (var i = 0; i < groupCount; i++)
{
	_tab = "\t\t";
	
	_name = name[| i];
	
	_code += _tab + "#region " + _name + "\n\n";
	
	_code += _tab + "case( " + groupEnum + "." + _name + " ):\n\n";
	
	_tab = "\t\t\t";
	
	_seq = group[| i]; 
	_seqName = seqName[| i];
	_seqCount = ds_list_size(_seq);
	
	#region Write Sequence Enum
	
	_code += _tab + "#region Sequence Enum \n\n";
	_code += _tab + "enum " + sequenceEnum + _name + "\n";
	_code += _tab + "{\n";
	
	for (var j = 0; j < _seqCount; j++)
	{
		_code += _tab + "\t" + _seqName[| j] + ",\n";
	}
	
	_code += _tab + "}\n\n";
	_code += _tab + "#endregion \n\n";
	
	#endregion
	
	#region Write Sequences
	
	for (var j = 0; j < _seqCount; j++)
	{
		_code += _tab + "ds_map_add(ANIMATION_GROUP[? _group], \n";
		_code += _tab + "\t" + sequenceEnum + _name + "." + _seqName[| j] + ",\n";
		_code += _tab + "\t[\n";
		
		#region Write Frames
		
		_frameCount = ds_list_size(_seq[| j]);
		
		for (var l = 0; l < _frameCount; l++)
		{
			_frameData = ds_list_find_value(_seq[| j], l);
			
			_code += _tab + "\t\t[";
			
			for (var _prop = 0; _prop < propertyCount; _prop++)
			{
				if _prop == 0 {_str = sprite_get_name(_frameData[| _prop])} else 
				{_str = string(_frameData[| _prop])}
				
				_code += _str + (_prop < propertyCount - 1? ", ": "");
			}
			
			_code += (l < _frameCount - 1? "],": "]") + "\n";
		}
		
		#endregion
		
		_code += _tab + "\t]);\n\n";
	}
	
	#endregion
	
	_tab = "\t\t";
	
	_code += _tab + "#endregion\n\n";
}

_tab = "\t";

_code += _tab + "}\n";

#endregion

_code += "}";

if keyboard_check(vk_shift)
{
	clipboard_set_text(_code);
}
else
{
	/*
	
	var _path = filepath;

	if file_exists(filepath)
	{
		var _file = file_text_open_write(_path);
		
		file_text_write_string(_file, _code);
		
		file_text_close(_file);
		
		cout("\"" + filename_name(_path) + "\" Written to Successfully!");
	}
	else
	{
		cout("Error finding file: " + _path);
	}
	
	*/
}