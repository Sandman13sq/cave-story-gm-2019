/// @desc 
draw_reset();

#region Draw Hud

draw_shape_rect_wh(x - 4, 0, 1, camera_height, c_white, 1);

#region Left Bar

// Draw Group Names
var _y = 0, _h = 16, _pos = 0, _range = 8, 
_start = groupOffset, _end = min(_start + _range, groupCount);
for (var i = _start; i < _end; i++)
{
	draw_update_color(i == groupSelect? color[3]: c_white)
	draw_text(0, (_pos * _h), name[| i] );
	
	if i == _start && _start > 0 {draw_text(x - 16, (_pos * _h) + _y, "-")}
	if i == (_end - 1) && _end != groupCount {draw_text(x - 16, (_pos * _h) + _y, "+")}
		
	_pos++;
}

draw_shape_rect_wh(0, _y + (_pos * _h), x - 4, 1, color[1], 1);

// Draw Sequence Names
var _y = 140, _h = 16, _pos = 0, _range = 8, 
_start = sequenceOffset, _end = min(_start + _range, sequenceCount);
for (var i = _start; i < _end; i++)
{
	if !is_undefined(ds_list_find_value(seqName[| groupSelect], i))
	{
		draw_update_color(i == sequenceSelect? color[3]: c_white);
		draw_text(0, (_pos * _h) + _y, ds_list_find_value(seqName[| groupSelect], i) );
		
		if i == _start && _start > 0 {draw_text(x - 16, (_pos * _h) + _y, "-")}
		if i == (_end - 1) && _end != sequenceCount {draw_text(x - 16, (_pos * _h) + _y, "+")}
			
		_pos++;
	}
}
draw_shape_rect_wh(0, _y - 1, x - 4, 1, color[1], 1);
draw_shape_rect_wh(0, _y + (_pos * _h), x - 4, 1, color[1], 1);

draw_reset();

draw_text(2, 300, 
	"Tab - Edit Menu\n" + 
	"\n" + 
	": - Prev Group\n" + 
	"'' - Next Group\n" + 
	"[ - Prev Sequence\n" + 
	"] - Next Sequence\n" +
	"< - Shift Left\n" +
	"> - Shift Right\n" +
	"+ - Add by Buffer\n" +
	"- - Subtract by Buffer\n" +
	"\n" + 
	chr(Char.up) + " - Prev Frame\n" + 
	chr(Char.down) + " - Next Frame\n" +
	chr(Char.left) + " - Prev Property\n" + 
	chr(Char.right) + " - Next Property\n",
	);
	
#endregion

#region Top Bar

draw_text(x, 2, 
	"Group: " + name[| groupSelect] + "\n" +
	"Sequence: " + ds_list_find_value(seqName[| groupSelect], sequenceSelect) + "\n" +
	"Frame: " + string(frameSelect + (frameCount > 0)) + " / " + string(frameCount) + "\n"
	);
	
var _d = 0, _start = 0, _end = 0, _frame;

for (var i = 0; i < frameCount; i++)
{
	_frame = sequenceCurrent[| i];
	_d += _frame[| 2];
	
	if i == frameSelect - 1 {_start = _d;}
	if i == frameSelect {_end = _d;}
}

draw_text(x + 200, 2, 
	"Duration Before Frame: " + string(_start) + "\n" +
	"Duration After Frame: " + string(_end) + "\n" +
	"Duration Total: " + string(_d) + "\n"
	);

#endregion

var _l = propertyCount, _x = x;

for (var i = 0; i < _l; i++)
{
	draw_update_color(i == propertySelect? color[3]: c_white);
	
	draw_text(_x, 80, frameProperty[i]);
	
	if i == propertySelect
	{
		draw_shape_rect(
			_x, 
			ypos, 
			_x + framePropertyWidth[i], 
			camera_height, 
			color[7], 0.5);
	}
	
	_x += framePropertyWidth[i];
}
	
// Draw Frame Properties
var _sep = 20, _x = x, _y, _str, _frame,
_range = 16, _page = frameSelect div _range, _pos = 0,
_start = _range * _page, 
_end = min(_start + _range, frameCount);

for (var i = _start; i < _end; i++)
{
	_y = (_pos * _sep) + y;
	_x = x;
	_frame = sequenceCurrent[| i];
	
	if i == frameSelect
	{
		draw_shape_rect(
			x, _y, camera_width, _y + _sep, 
			color[6], 0.5);
	}
	
	if !ds_exists(_frame, ds_type_list)
	{
		draw_text(_x, _y, "ERROR");
	}
	else
	{
		for (var j = 0; j < _l; j++)
		{
			switch(j)
			{
				default: _str = _frame[| j]; break;
				case(0): _str = sprite_get_name(_frame[| j]); break;
				case(5): _str = bitString(_frame[| j], 8, true); break;
			}
		
			if i == animationKeyframe
			{
				draw_update_color(color[5]);
			}
			else
			{
				draw_update_color((i == frameSelect && j == propertySelect)? 
					color[3]: c_white);
			}
		
			draw_text(_x, _y, _str);
		
			_x += framePropertyWidth[j];
		}
	}
	
	_pos++;
}

if _end < frameCount
{
	_y = (_pos * _sep) + y;
	draw_text(x, _y, "+");
}

draw_shape_rect_wh(x - 4, 94, camera_width, 1, c_white, 1);

#endregion

var _x = camera_width - 160, _y = camera_height - 128, _scale = 2;

draw_set_halign(0);

//drawAnimation(_x, 72);

// Draw Entity
draw_sprite_ext(
	sprite_index, image_index, 
	_x + animationXOffset * _scale, 
	_y + animationYOffset * _scale,
	image_xscale * animationXFlip * _scale, 
	image_yscale * _scale, 0, 
	animationColor, image_alpha
	);
draw_text(_x - 100, _y, 
	"Frame: " + string(animationKeyframe) + 
	"\nStep: " + string(animationStep) + "\n" +
	"Duration: " + string(duration) + "\n"
	);
	
draw_reset();
	
draw_text(CAMERA_W - 100, _y, 
	"Value Buffer: " + string(valueBuffer)
	);

#region Draw Input

if state != 0
{
	draw_reset();
	
	draw_set_halign(1);
	draw_set_valign(1);
	
	var _w = 80, _h = 64, _x = camera_width / 2, _y = camera_height / 2;
	draw_box(_x - _w, _y - _h, _x + _w, _y + _h, 
		4, c_black, c_white, 1
		);
	
	switch(state)
	{
		default:
			var _l = array_length_2d(editString, state);
			for (var i = 0; i < _l; i++)
			{
				draw_update_color(i == editSelect? c_aqua: c_white);
				draw_text(_x, _y + (i * editYsep) - ((_l / 2) * editYsep), editString[state, i]);
			}
			break;
			
		case(-1): case(-2): case(-3):
			draw_text(_x, _y - 24, editNarr);
			draw_text(_x, _y, keyboard_string);
			draw_shape_rect_wh(_x + string_width(keyboard_string) / 2, _y - 6, 2, 12, color[5], 1);
			break;
	}
}

#endregion