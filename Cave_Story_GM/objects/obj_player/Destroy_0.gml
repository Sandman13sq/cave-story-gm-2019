/// @desc Run Death Event

// Inherit the parent event
event_inherited();

#region Death from health

if healthPoints == 0
{
	setAnimation(Sequence_player.hurt);
	updateAnimation();
	
	with instance_create_depth(
		x, 
		y, 
		0, obj_player_death)
	{
		sprite_index = other.sprite_index;
		image_index = other.image_index;
		image_xscale = other.image_xscale;
		image_yscale = other.image_yscale;
		
		animationXFlip = other.animationXFlip;
		animationXOffset = other.animationXOffset;
		animationYOffset = other.animationYOffset;
		animationColor = other.animationColor;
		animationPalIndex = other.animationPalIndex;
		animationPalSprite = other.animationPalSprite;
		image_xflip = other.image_xflip;
		
		x_offset = other.sprite_offset_x + other.width * !other.image_xflip;
		y_offset = other.sprite_offset_y;
		
		center_x = other.center_x;
		center_y = other.center_y;
	}
	
	// Classic Poof on Death
	/*
	part_particles_create_region_wh(PART_SYS_PLAYER, x, y, 
		width, height, getPartType(Part_Index.poof), 6);
	*/
}

#endregion

