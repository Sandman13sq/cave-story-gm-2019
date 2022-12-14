/// @desc 

// Inherit the parent event
event_inherited();

var _dir = direction;

draw_sprite_ext(spr_shape_star, 0, 
	weapon_drawX + lengthdir_x(weapon_muzzleSide, _dir), 
	weapon_drawY + lengthdir_y(weapon_muzzleUp, _dir), 
	starRadius / 48, starRadius / 48, starAngle, c_white, starAlpha
	);