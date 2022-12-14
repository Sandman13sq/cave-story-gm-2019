/// @desc 

if keyboard_check_pressed(vk_escape) 
{
	state = 0;
}

switch(state)
{
	#region Change Name (Type)
	
	case(-2):
		if keyboard_check_pressed(vk_tab) 
		{state = 1;}
		
		if keyboard_check_pressed(vk_enter)
		{
			switch(editSelect)
			{
				// Change Group Name
				case(0): 
					var _str = keyboard_string, i = 1;
					
					ds_list_replace(name, groupSelect, "_");
					
					while (ds_list_find_index(name, _str) != -1)
					{
						_str = keyboard_string + "_" + string(i);
						i++;
					}
					
					ds_list_replace(name, groupSelect, _str);
					
					event_user(0);
					
					state = 0;
					break;
					
				case(1): 
					var _list = seqName[| groupSelect],
					_str = keyboard_string, i = 1;
					
					ds_list_replace(_list, sequenceSelect, "_");
					
					while (ds_list_find_index(_list, _str) != -1)
					{
						_str = keyboard_string + "_" + string(i);
						i++;
					}
					
					ds_list_replace(_list, sequenceSelect, _str);
					
					event_user(0);
					
					state = 0;
					break;
			}
			
		}
		break;
		
	#endregion
	
	#region Main Controls
	
	default:
	
		#region Non-Control
		
		if !keyboard_check(vk_control)
		{
			if keyboard_check_pressed(vk_space)
			{
				animationFreeze = !animationFreeze;
			}
			
			#region Frame Navigation
			
			if frameCount > 0
			{
				if keyboard_check_pressed(vk_down)
				{
					frameSelect = loop(frameSelect + 1, 0, frameCount); 
					
					event_user(0); 
					
					// Drag Values
					if keyboard_check(vk_shift)
					{
						var _prop = sequenceCurrent[| loop(frameSelect - 1, 0, frameCount)];
						_prop = _prop[| propertySelect];
						
						frameCurrent[| propertySelect] = _prop;
						event_user(0); 
					}
				}
		
				if keyboard_check_pressed(vk_up)
				{
					frameSelect = loop(frameSelect - 1, 0, frameCount);
					
					event_user(0); 
					
					// Drag Values
					if keyboard_check(vk_shift)
					{
						var _prop = sequenceCurrent[| loop(frameSelect + 1, 0, frameCount)];
						_prop = _prop[| propertySelect];
						
						frameCurrent[| propertySelect] = _prop;
						event_user(0); 
					}
				}
		
				if keyboard_check_pressed(vk_right)
				{propertySelect = loop(propertySelect + 1, 0, propertyCount);}
		
				if keyboard_check_pressed(vk_left)
				{propertySelect = loop(propertySelect - 1, 0, propertyCount);}
			
				// Change Property
				if keyboard_check_pressed(vk_enter) 
				|| keyboard_check_pressed(ord("C")) 
				{
					keyboard_string = string(frameCurrent[| propertySelect]);
					editNarr = "";
					state = -1; 
				}
			
				if keyboard_check_pressed(ord("Z")) 
				{
					frameCurrent[| propertySelect] += 1;
					event_user(3);
				}
			
				if keyboard_check_pressed(ord("X")) 
				{
					frameCurrent[| propertySelect] -= 1;
					event_user(3);
				}
				
				if keyboard_check_pressed(KEY_PLUS)
				{
					if keyboard_check(vk_shift)
					{
						valueBuffer++;
					}
					else 
					{
						frameCurrent[| propertySelect] += valueBuffer;
						event_user(3);
					}
				}
			
				if keyboard_check_pressed(KEY_MINUS)
				{
					if keyboard_check(vk_shift)
					{
						valueBuffer--;
					}
					else 
					{
						frameCurrent[| propertySelect] -= valueBuffer;
						event_user(3);
					}
				}
			}
			
			#endregion
		
			// Navigate Groups
			if keyboard_check_pressed(Key.colon)
			{
				groupSelect = loop(groupSelect - 1, 0, groupCount);
				event_user(0); 
			}

			if keyboard_check_pressed(Key.quote)
			{
				groupSelect = loop(groupSelect + 1, 0, groupCount);
				event_user(0); 
			}
			
			// Navigate Sequences
			if keyboard_check_pressed(Key.bracketLeft)
			{
				sequenceSelect = loop(sequenceSelect - 1, 0, sequenceCount);
				event_user(0); 
			}

			if keyboard_check_pressed(Key.bracketRight)
			{
				sequenceSelect = loop(sequenceSelect + 1, 0, sequenceCount);
				event_user(0); 
			}
		
			if keyboard_check_pressed(vk_tab) {state = 1; editSelect = 0;}
		}
		
		#endregion
		// Control Held
		else
		{
			#region Holding Alt
			
			if keyboard_check(vk_alt)
			{
				if keyboard_check_pressed(ord("C"))
				{
					var _frameCount = ds_list_size(sequenceCurrent);
					
					sequenceBuffer = array_create(_frameCount);
					
					for (var i = 0; i < _frameCount; i++)
					{
						sequenceBuffer[i] = ds_list_to_array(sequenceCurrent[| i]);
					}
					
					sequenceBufferName = ds_list_find_value(seqName[| groupSelect], sequenceSelect);
					
					event_user(0);
				}
			
				if keyboard_check_pressed(ord("V"))
				{
					if is_array(sequenceBuffer)
					{
						ds_list_clear(sequenceCurrent);
					
						var _frameCount = array_length(sequenceBuffer),
						_frame;
					
						for (var i = 0; i < _frameCount; i++)
						{
							_frame = array_to_list(sequenceBuffer[i], list_create());
						
							ds_list_add(sequenceCurrent, _frame);
						}
						
						ds_list_replace(seqName[| groupSelect], sequenceSelect, sequenceBufferName);
					
						event_user(0);
					}
				}
				
			}
			
			#endregion
			
			#region Non-Shift
			
			else if !keyboard_check(vk_shift)
			{
				if keyboard_check_pressed(ord("C"))
				{
					propertyBuffer = frameCurrent[| propertySelect];
					event_user(3);
				}
			
				if keyboard_check_pressed(ord("V"))
				{
					frameCurrent[| propertySelect] = propertyBuffer;
					event_user(3);
				}
				
				if keyboard_check_pressed(ord("R"))
				{
					keyboard_string = ds_list_find_value(seqName[| groupSelect], sequenceSelect); 
					editNarr = "New Sequence Name";
					editSelect = 1;
					state = -2; 
				}
				
				if keyboard_check_pressed(ord("O"))
				{
					var _path = get_open_filename("anim", "animation.anim");
					
					if _path != ""
					{
						jsonPath = _path;
						event_user(2);
					}
				}
				/*
				if keyboard_check_pressed(ord("S"))
				{
					var _path = get_save_filename("anim", jsonPath);
					
					if _path != ""
					{
						jsonPath = _path;
						event_user(1);
						
						hasSaved = true;
					}
					state = 0;
				}
				*/
			}
			
			#endregion
			
			#region Holding Shift
			
			else
			{
				if keyboard_check_pressed(ord("C"))
				{
					frameBuffer = ds_list_to_array(frameCurrent);
					event_user(3);
				}
			
				if keyboard_check_pressed(ord("V"))
				{
					if is_array(frameBuffer)
					{
						array_to_list(frameBuffer, frameCurrent);
						event_user(0); 
					}
				}
				
				if keyboard_check_pressed(ord("R"))
				{
					keyboard_string = name[| groupSelect]; 
					editNarr = "New Group Name";
					editSelect = 0;
					state = -2; 
				}
				
				// Copy Frame Down
				if keyboard_check_pressed(vk_down)
				{
					var _buffer = ds_list_to_array(frameCurrent);
					
					frameSelect = loop(frameSelect + 1, 0, frameCount); 
					event_user(0); 
					array_to_list(_buffer, frameCurrent);
					event_user(0); 
				}
		
				// Copy Frame Up
				if keyboard_check_pressed(vk_up)
				{
					var _buffer = ds_list_to_array(frameCurrent);
					
					frameSelect = loop(frameSelect - 1, 0, frameCount);
					event_user(0); 
					array_to_list(_buffer, frameCurrent);
					event_user(0); 
				}
			}
			
			#endregion
			
			// Export
			if keyboard_check_pressed(ord("E"))
			{
				event_user(4);
			}
			
			// Duplicate
			if keyboard_check_pressed(ord("D"))
			{
				#region Duplicate Group
				
				if keyboard_check(vk_alt)
				{
					var _newGroup = list_create(),
					_newNames = list_create();
					
					for (var i = 0; i < ds_list_size(groupCurrent); i++)
					{
						var _newSequence = list_create(),
						_targetSequence = groupCurrent[| i];
						
						for (var j = 0; j < ds_list_size(_targetSequence); j++)
						{
							var _newFrame = list_create(),
							_targetFrame = _targetSequence[| j];
							
							for (var l = 0; l < ds_list_size(_targetFrame); l++)
							{
								_newFrame[| l] = _targetFrame[| l];
							}
							
							ds_list_add(_newSequence, _newFrame);
						}
						
						ds_list_add(_newGroup, _newSequence);
					}
					
					ds_list_copy(_newNames, seqName[| groupSelect]);
					
					ds_list_insert(group, groupSelect + 1, _newGroup);
					ds_list_insert(name, groupSelect + 1, name[| groupSelect] + string(groupCount));
					ds_list_insert(seqName, groupSelect + 1, _newNames);
				}
				
				#endregion
				
				#region Duplicate Sequence
				
				else if keyboard_check(vk_shift)
				{
					var _newSequence = list_create();
					
					for (var i = 0; i < ds_list_size(sequenceCurrent); i++)
					{
						var _newFrame = list_create(),
						_targetFrame = sequenceCurrent[| i];
						
						for (j = 0; j < ds_list_size(_targetFrame); j++)
						{
							_newFrame[| j] = _targetFrame[| j];
						}
						
						ds_list_add(_newSequence, _newFrame);
					}
					
					var _nameList = seqName[| groupSelect],
					_name = _nameList[| sequenceSelect];
					
					_name += "_" + string(sequenceCount);
					
					ds_list_insert(groupCurrent, sequenceSelect + 1, _newSequence);
					ds_list_insert(_nameList, sequenceSelect + 1, _name);
				}
				
				#endregion
				
				#region Duplicate Frame
				
				else
				{
					var _newFrame = list_create();
					
					ds_list_copy(_newFrame, frameCurrent);
					_newFrame[| 0] = 0;
					ds_list_insert(sequenceCurrent, frameSelect + 1, _newFrame);
				}
				
				#endregion
				
				event_user(0);
			}
			
			// Add Frame
			if keyboard_check_pressed(KEY_PLUS)
			{
				var _newFrame = list_create();
				repeat(propertyCount) {ds_list_add(_newFrame, 0)}
				
				ds_list_insert(sequenceCurrent, frameSelect + 1, _newFrame);
				event_user(0);
			}
			
			// Remove
			if keyboard_check_pressed(KEY_MINUS)
			{
				// Remove Group
				if keyboard_check(vk_alt)
				{
					if groupCount > 1
					{
						ds_list_destroy_chain(groupCurrent, 3);
						ds_list_delete(seqName, groupSelect);
						ds_list_delete(name, groupSelect);
						event_user(0);
					}
				}
				// Remove Sequence
				else if keyboard_check(vk_shift)
				{
					if sequenceCount > 1
					{
						ds_list_destroy_chain(sequenceCurrent, 2);
						ds_list_delete(groupCurrent, sequenceSelect);
						ds_list_delete(seqName[| groupSelect], sequenceSelect);
						event_user(0);
					}
				}
				// Remove Frame
				else if frameCount > 1
				{
					list_free(sequenceCurrent[| frameSelect]);
					ds_list_delete(sequenceCurrent, frameSelect);
					event_user(0);
				}
			}
		}
		
		// Shift
		if keyboard_check_pressed(Key.lessThan)
		|| keyboard_check_pressed(Key.greaterThan)
		{
			var _push = polarize(keyboard_check_pressed(Key.greaterThan));
				
			// Swap Group
			if keyboard_check(vk_alt)
			{
				var _pos = groupSelect;
				groupSelect = loop(groupSelect + _push, 0, groupCount);
					
				ds_list_swap_value(group, groupSelect, _pos);
				ds_list_swap_value(name, groupSelect, _pos);
				ds_list_swap_value(seqName, groupSelect, _pos);
			}
			// Swap Sequence
			else if keyboard_check(vk_shift)
			{
				var _pos = sequenceSelect;
				sequenceSelect = loop(sequenceSelect + _push, 0, sequenceCount);
					
				ds_list_swap_value(groupCurrent, sequenceSelect, _pos);
				ds_list_swap_value(seqName[| groupSelect], sequenceSelect, _pos);
			}
			// Swap Group
			else
			{
				var _pos = frameSelect;
				frameSelect = loop(frameSelect + _push, 0, frameCount);
					
				ds_list_swap_value(sequenceCurrent, frameSelect, _pos);
			}
				
			event_user(0);
		}
		break;
		
	#endregion
	
	#region Change Property
	
	case(-1):
		if keyboard_check_pressed(vk_enter) 
		{
			var _str = frameCurrent[| propertySelect];
			
			if keyboard_string == "" {_str = 0}
			else if string_letters(keyboard_string) != ""
			{
				if asset_get_index(keyboard_string) != -1
				{
					_str = asset_get_index(keyboard_string);
				}
			}
			else {_str = real(keyboard_string)}
			
			frameCurrent[| propertySelect] = _str;
			state = 0;
			event_user(3);
		}
		break;
	
	#endregion
		
	#region Edit Menu
	
	case(1):
		if keyboard_check_pressed(vk_tab) 
		|| keyboard_check_pressed(ord("X"))
		{state = 0;}
		
		#region Navigate
		
		var _max = 6;
		
		if keyboard_check_pressed(vk_right)
		|| keyboard_check_pressed(vk_down)
		{editSelect = editSelect < _max? editSelect + 1: 0}
		
		if keyboard_check_pressed(vk_left)
		|| keyboard_check_pressed(vk_up)
		{editSelect = editSelect > 0? editSelect - 1: _max}
		
		#endregion
		
		if keyboard_check_pressed(vk_enter)
		|| keyboard_check_pressed(ord("Z"))
		{
			switch(editSelect)
			{
				case(0): state = 2; break; // Add
				case(1): state = 3; break; // Remove
				case(2): state = 4; break; // Change Name
				case(3): state = 5; break; // Copy
				case(4): state = 6; break; // JSON
				case(5): event_user(4); state = 0; break; // Convert
				case(6): state = 0; break; // Back
			}
			
			editSelect = 0;
		}
		
		break;
		
	#endregion
	
	#region Add New
	
	case(2):
		if keyboard_check_pressed(vk_tab) 
		|| keyboard_check_pressed(ord("X"))
		{state = 0;}
		
		#region Navigate
		
		var _max = 3;
		
		if keyboard_check_pressed(vk_right)
		|| keyboard_check_pressed(vk_down)
		{editSelect = editSelect < _max? editSelect + 1: 0}
		
		if keyboard_check_pressed(vk_left)
		|| keyboard_check_pressed(vk_up)
		{editSelect = editSelect > 0? editSelect - 1: _max}
		
		#endregion
		
		if keyboard_check_pressed(vk_enter)
		|| keyboard_check_pressed(ord("Z"))
		{
			switch(editSelect)
			{
				case(0): 
					animmaker_createGroup(); 
					break;
					
				case(1): 
					animmaker_createSequence(groupSelect); 
				
					break;
				case(2): animmaker_createFrame(sequenceCurrent); break;
				case(3): state = 1; editSelect = 0; break;
			}
			
			event_user(0);
			
		}
		break;
		
	#endregion
	
	#region Remove
	
	case(3):
		if keyboard_check_pressed(vk_tab) 
		|| keyboard_check_pressed(ord("X"))
		{state = 0;}
		
		#region Navigate
		
		var _max = 4;
		
		if keyboard_check_pressed(vk_right)
		|| keyboard_check_pressed(vk_down)
		{editSelect = editSelect < _max? editSelect + 1: 0}
		
		if keyboard_check_pressed(vk_left)
		|| keyboard_check_pressed(vk_up)
		{editSelect = editSelect > 0? editSelect - 1: _max}
		
		#endregion
		
		if keyboard_check_pressed(vk_enter)
		|| keyboard_check_pressed(ord("Z"))
		{
			switch(editSelect)
			{
				#region Remove Group
				
				case(0):
					var _seqCount = ds_list_size(groupCurrent), _seq;
					
					for (var i = 0; i < _seqCount; i++)
					{
						_seq = ds_list_find_value(groupCurrent, i);
						
						var _frameCount = ds_list_size(_seq);
						
						for (var j = 0; j < _frameCount; j++)
						{
							list_free(_seq[| j]);
						}
					}
					
					// Delete List
					list_free(groupCurrent);
					ds_list_delete(group, groupSelect);
					
					// Delete Name
					ds_list_delete(seqName, groupSelect);
					ds_list_delete(name, groupSelect);
					
					event_user(0);
					break;
					
				#endregion
					
				#region Remove Sequence
				
				case(1): 
					
					var _seq = groupCurrent[| sequenceSelect];
					
					for (var i = 0; i < frameCount; i++)
					{
						list_free(sequenceCurrent[| i]);
					}
					
					// Delete Frames
					list_free(groupCurrent[| sequenceSelect]);
					
					// Delete Name
					ds_list_delete(seqName[| groupSelect], sequenceSelect);
					
					event_user(0);
					
					break;
					
				#endregion
					
				// Remove Frame
				case(2): 
					animmaker_deleteFrame(sequenceCurrent, frameSelect);
					event_user(0); 
					frameSelect = clamp(frameSelect, 0, frameCount - 1);
					event_user(0); 
					break;
					
				// Remove Next Group
				case(-3):
					// Delete List
					list_free(group[| groupSelect + 1]);
					ds_list_delete(group, groupSelect + 1);
					
					// Delete Name
					ds_list_delete(seqName, groupSelect + 1);
					ds_list_delete(name, groupSelect + 1);
					
					event_user(0);
					break;
					
				case(4): 
					state = 1; editSelect = 0; 
					break;
			}
			
			event_user(0);
			
		}
		break;
		
	#endregion
	
	#region Change Name (Choose)
	
	case(4):
		if keyboard_check_pressed(vk_tab) 
		|| keyboard_check_pressed(ord("X"))
		{state = 1;}
		
		#region Navigate
		
		var _max = 2;
		
		if keyboard_check_pressed(vk_right)
		|| keyboard_check_pressed(vk_down)
		{editSelect = editSelect < _max? editSelect + 1: 0}
		
		if keyboard_check_pressed(vk_left)
		|| keyboard_check_pressed(vk_up)
		{editSelect = editSelect > 0? editSelect - 1: _max}
		
		#endregion
		
		if keyboard_check_pressed(vk_enter)
		|| keyboard_check_pressed(ord("Z"))
		{
			switch(editSelect)
			{
				case(0): 
					keyboard_string = name[| groupSelect]; 
					editNarr = "New Group Name";
					state = -2; 
					break;
					
				case(1): 
					keyboard_string = ds_list_find_value(seqName[| groupSelect], sequenceSelect); 
					editNarr = "New Sequence Name";
					state = -2; 
					break;
					
				case(2): state = 1; editSelect = 0; break;
			}
			
		}
		break;
		
	#endregion
	
	#region Copy
	
	case(5):
		if keyboard_check_pressed(vk_tab) 
		|| keyboard_check_pressed(ord("X"))
		{state = 0;}
		
		#region Navigate
		
		var _max = 3;
		
		if keyboard_check_pressed(vk_right)
		|| keyboard_check_pressed(vk_down)
		{editSelect = editSelect < _max? editSelect + 1: 0}
		
		if keyboard_check_pressed(vk_left)
		|| keyboard_check_pressed(vk_up)
		{editSelect = editSelect > 0? editSelect - 1: _max}
		
		#endregion
		
		if keyboard_check_pressed(vk_enter)
		|| keyboard_check_pressed(ord("Z"))
		{
			switch(editSelect)
			{
				#region Copy Group
				
				case(0): 
					var _newGroup = list_create(),
					_newSequence, _newFrame,
					_seqCount = ds_list_size(groupCurrent),
					_frameCount, _targetSeq,
					_newSeqName = list_create(),
					_seqName = seqName[| groupSelect];
					
					for (var i = 0; i < _seqCount; i++)
					{
						_newSequence = list_create();
						
						_targetSeq = groupCurrent[| i];
						
						_frameCount = ds_list_size(_targetSeq);
						
						for (var j = 0; j < _frameCount; j++)
						{
							_newFrame = list_create();
							
							ds_list_copy(_newFrame, _targetSeq[| j]);
							
							ds_list_add(_newSequence, _newFrame);
						}
						
						ds_list_add(_newGroup, _newSequence);
						
						ds_list_add(_newSeqName, _seqName[| i]);
					}
					
					ds_list_insert(group, groupSelect, _newGroup);
					ds_list_insert(name, groupSelect, name[| groupSelect]);
					ds_list_insert(seqName, groupSelect, _newSeqName);
					
					event_user(0);
					break;
					
				#endregion
					
				case(1): 
					animmaker_createSequence(groupSelect); 
					break;
					
				case(2): 
					animmaker_createFrame(sequenceCurrent); 
					break;
					
				case(3):
					state = 1; 
					editSelect = 0; 
					break;
			}
			
			event_user(0);
			
		}
		break;
		
	#endregion
	
	#region JSON
	
	case(6):
		if keyboard_check_pressed(vk_tab) 
		|| keyboard_check_pressed(ord("X"))
		{state = 0;}
		
		#region Navigate
		
		var _max = 2;
		
		if keyboard_check_pressed(vk_right)
		|| keyboard_check_pressed(vk_down)
		{editSelect = editSelect < _max? editSelect + 1: 0}
		
		if keyboard_check_pressed(vk_left)
		|| keyboard_check_pressed(vk_up)
		{editSelect = editSelect > 0? editSelect - 1: _max}
		
		#endregion
		
		if keyboard_check_pressed(vk_enter)
		|| keyboard_check_pressed(ord("Z"))
		{
			switch(editSelect)
			{
				// Save
				case(0): 
					var _path = get_save_filename("animation.ani", jsonPath);
					if _path != ""
					{
						jsonPath = _path;
						//saveStringAsBuffer(jsonPath, json_encode(jsonMap));
						event_user(1);
						hasSaved = false;
					}
					
					state = 1;
					break;
					
				// Open
				case(1): 
					var _path = get_open_filename("json", jsonPath);
					
					if _path != ""
					{
						jsonPath = _path;
						
						if filename_ext(jsonPath) == ".json"
						{
							ds_map_destroy(jsonMap);
						
							jsonPath = _path;
						
							jsonMap = json_decode( loadStringBuffer(jsonPath) );
							group = jsonMap[? "data"];
							name = jsonMap[? "name"];
							seqName = jsonMap[? "sequenceName"];
						}
						else
						{
							event_user(2);
						}
						
						hasSaved = true;
					}
					
					event_user(0);
					
					state = 0;
					break;
				
				case(2):
					state = 0;
					break;
			}
		}
		break;
		
	#endregion
}