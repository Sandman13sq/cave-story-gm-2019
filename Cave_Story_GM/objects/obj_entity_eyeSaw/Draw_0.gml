/// @desc 

// Saw Blade
draw_sprite_ext(
	sprite_index, 1, x, y, 1, 1, sawAngle, color, 1
	);
	
// Saw Disc
draw_sprite_ext(
	sprite_index, 2, x, y, 1, 1, dsin(sawAngle), color, 1
	);
	
// Saw Eye
draw_sprite_ext(
	sprite_index, 0, x, y, 1, 1, 0, color, 1
	);