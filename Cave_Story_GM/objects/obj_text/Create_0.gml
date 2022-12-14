/// @desc 

#region enum Text

enum Text
{
	y1 = 332,
	y2 = 40,
	
	box_borderSize = 2,
	box_x = 0, box_y = 332,
	box_w = 500, box_h = 120, // Needs to be factors of 20
	
	item_x = Text.itemBox_w / 2,
	itemBox_w = 120, itemBox_h = 60, // Needs to be factors of 20
	
	str_border = 16,
	str_x = Text.box_x + Text.str_border, 
		str_xFace = 128,
	str_y = Text.str_border, 
	str_w = 480, str_h = 96,
	str_sep = 32,
	
	face_x = 18,
	face_y = 14,
	faceOffset = 40,
	face_size = 96,
	
	flag_face = 0,
}

#endregion

draw_reset();

ready = false;
text_str = "";

text_pos = 0;
text_newLineCount = 0;
text_speed = 1;
text_sound = snd_talk_0;
text_surf = -1;
text_drawBox = true;

text_y_target = 0;
text_y = text_y_target;

text_scale = FONT_MAIN_SCALE;

flag = 1 << Text.flag_face;

box_col = Col.caveTextBox;
rim_col = Col.caveTextRim;

borderStep = loop(CURRENT_FRAME / 4, 0, 20);

faceSprite = getFaceSprite();

faceIndex = instance_exists(mas_event)? mas_event.faceIndex: 0;
faceXOffset = 0;

anchor = 0;

event_user(1);

//display_text();

// Move the textbox triangles slowly
// either through surfaces or a pre-animated sprite