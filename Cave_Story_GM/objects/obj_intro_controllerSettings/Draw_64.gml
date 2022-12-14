/// @desc 

var _in = 64, _ysep = 32, _w = CAMERA_H - _in * 2;

draw_box(_in, _in, CAMERA_W - _in, CAMERA_H - _in, 4,
	beta? Col.betaTextBox: Col.caveTextBox,
	beta? Col.betaTextRim: Col.caveTextRim);

draw_reset();

var _x = x, 
_y = 80, _str, _pos = 0, _scale = 0.6, _w = (_w - 20) / 2,
_textW = _w - 8;

draw_set_halign(1);
draw_set_valign(0);

#region Draw GUI

if state == 0
{
	Dtext(_x, _y, showGpad? "< Gamepad Controls >": "< Keyboard Controls >");
}
else
{
	Dtext(_x, _y, showGpad? "Gamepad Controls": "Keyboard Controls");
}

_y += 32;

draw_update_color(state == 1? c_white: c_gray);

for (var i = 0; i < inputSelectStart; i++)
{
	_str = preStr[i];
	
	if inPre
	{
		if i == preSelect && (CURRENT_FRAME mod 2)
		{
			draw_shape_border(
				_x - _textW, _y - 4, 
				_x + _textW, _y + _ysep - 4, 
				2, c_white, 0.5
				);
		}
	}
		
	Dtext(_x, _y, _str);
			
	_y += _ysep;
}

if selectOffset > 0
{
	Dtext(_x, _y, "...");
}

_y += 32;

var _start = selectOffset, _end = selectOffset + 6;
for (var i = _start; i < _end; i++)
{
	//_x = x + (_pos mod 2 == 0? -_w: _w);
		
	_str = menuStr[i] + 
		(showGpad? inputName_gpad[i]: inputName_keys[i]);
		
	draw_shape_rect(
		_x - _textW, _y - 4, 
		_x + _textW, _y + 20, 
		c_black, 1
		);
		
	if !inPre
	{
		if i == inputSelect && (CURRENT_FRAME mod 2)
		{
			draw_shape_border(
				_x - _textW, _y - 4, 
				_x + _textW, _y + 20, 
				2, c_white, 0.5
				);
		}
	}
		
	Dtext_scale(
		_x, _y, 
		_str, _scale, _scale);
	_pos++;
	
	_y += _ysep;
}

if selectOffset < menuMax - 6
{
	Dtext(_x, _y - 10, "...");
}

#endregion

draw_update_color(c_white);

#region Draw Test Overlay

if state == 2
{
	draw_shape_rect(0, 0, CAMERA_W, CAMERA_H, c_black, 0.4);
	
	var _y = (CAMERA_H / 2) - 64;
	
	if showGpad
	{
		Dtext(x, _y, "Press a button to show its mapping");
		_y += _ysep;
		Dtext(x, _y, activeInput >= 0? inputName_gpad[activeInput]: "--");
		_y += _ysep;
		Dtext(x, _y, "Device: " + string(inputDevice) + " (" + 
			(inputDevice <= 3? "XInput": "DirectInput") + ")");
		_y += _ysep;
		Dtext(x, _y, "Hold two buttons to exit");
	}
	else
	{
		Dtext(x, _y, "Press a key to show its mapping");
		_y += _ysep;
		Dtext(x, _y, activeInput >= 0? inputName_keys[activeInput]: "--");
		_y += _ysep;
		Dtext(x, _y, "Hold two keys to exit");
	}
}

#endregion

#region Draw Change Overlay

if state == 3
{
	draw_shape_rect(0, 0, CAMERA_W, CAMERA_H, c_black, 0.4);
	
	var _y = (CAMERA_H / 2) - 64;
	
	if showGpad
	{
		Dtext(x, _y, "Press a button for " + menuStr[inputSelect]);
		_y += _ysep;
		Dtext(x, _y, input_string_gpad(lastInput));
		_y += _ysep;
		Dtext(x, _y, "Time until exit: " + string( 1 + (alarm[0] div 60) ));
	}
	else
	{
		Dtext(x, _y, "Press a key for " + menuStr[inputSelect]);
		_y += _ysep;
		Dtext(x, _y, input_string_key(lastInput));
		_y += _ysep;
		Dtext(x, _y, "Time until exit: " + string( 1 + (alarm[0] div 60) ));
	}
}

#endregion