
set_background(bk_storm, Background_Mode.scroll_inv);
bgm(Music.geothermal);

addEvent(0000,
	"<END");

addEvent(0200, 
	"<KEY<AMJ<MSG"
	);
	
addEvent(0201, 
	"<EQJ" + equipString(Equip_Flag.curly) + ":0301" +
	"<KEY<FAC0019<MSGWanna tag me in?<YNJ0000<CLO<EQ+" + equipString(Equip_Flag.curly) + 
	"<CNP0201:" + value_to_string(Entity_Type.quote, 4) + ":0000<END"
	);
	
addEvent(0301, 
	"<KEY<FAC0019<MSGShould I switch out?<YNJ0000<CLO<EQ-" + equipString(Equip_Flag.curly) + 
	"<CNP0201:" + value_to_string(Entity_Type.curly, 4) + ":0000<END"
	);
	
addEvent(0202, 
	"<KEY<FAC0001<MSGYou done here?<YNJ0000<CLO<FAO0004<ESC<END"
	);
	
var _str = value_to_string(Weapon.tempest, 4);
addEvent(0204,
	"<KEY<AM+" + _str + ":0000<GIT" + _str + "<MSGGot the Tempest<NOD<END"
	);