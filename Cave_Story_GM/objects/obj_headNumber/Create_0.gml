/// @desc 

enum Head_Number
{
	y_off = -12,
	flash = 8,
	time = 120,
	
	type_damage = 0,
	type_energy = 1,
	type_heal = 2,
	type_money = 3,
	
	type = 0,
	value,
	
}

var _size = 4, _flash = 8;

value = array_create(_size);
active = array_create(_size);
timer = array_create(_size);
delay = array_create(_size);
height = array_create(_size);
flash = array_create(_size, _flash);

color = [c_hp, c_thirdBar, c_lime, c_orange];

count = 0;

x_offset = 0;
y_offset = 0;