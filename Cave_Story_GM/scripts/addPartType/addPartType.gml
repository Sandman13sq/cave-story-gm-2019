/// @desc Creates Particle Type
/// @arg index
function addPartType(argument0) {

	var _pType = 0, i;

#region enum Part_Index

	enum Part_Index
	{
		null = 0,
		shotSpark,
		clink,
		poof,
			poof_still,
		expSparkle,
		twinkle,
		shotCircle,
			shotCircle_still,
		smallDust,
		headBonk,
		drownBubble,
		snore,
	
		boosterJet,
		boosterSpread,
	
		waterDroplet,
		waterSprinkler,
		waterEnter,
	
		debris_pStar,
		edgeTrail,
		tempestTrail,
	
		basuShot,
	}

#endregion

	i = argument0;
	PART_TYPE[? i] = part_type_create();
	_pType = PART_TYPE[? i];

	// Add Index to List
	ds_list_add(PART_TYPE_LIST, argument0);

	switch(i)
	{
	#region Shot Spark

		case(Part_Index.shotSpark):
			part_type_sprite(_pType, spr_shotSpark, true, true, false);
			part_type_life(_pType, 8, 8);
			break;
	
	#endregion

	#region Clink

		case(Part_Index.clink):
			part_type_sprite(_pType, spr_clink, true, true, false);
			part_type_life(_pType, 8, 8);
			break;
	
	#endregion

	#region Poof (With Speed)

		case(Part_Index.poof):
			part_type_sprite(_pType, spr_poof, true, true, false);
			part_type_direction(_pType, 0, 360, 0, 0);
			part_type_speed(_pType, 1, 5, -0.2, 0);
			part_type_life(_pType, 20, 24);
			break;
	
	#endregion

	#region Poof (Still)

		case(Part_Index.poof_still):
			part_type_sprite(_pType, spr_poof, true, true, false);
			part_type_life(_pType, 20, 24);
			break;
	
	#endregion

	#region Exp Sparkle

		case(Part_Index.expSparkle):
			part_type_sprite(_pType, spr_sparkle, true, true, false);
			part_type_direction(_pType, 0, 360, 0, 0);
			part_type_speed(_pType, 1, 2, -0.1, 0);
			part_type_size(_pType, 1, 2, 0, 0);
			part_type_life(_pType, 12, 20);
			break;
	
	#endregion

	#region Twinkle

		case(Part_Index.twinkle):
			part_type_sprite(_pType, spr_sparkle, true, true, false);
			part_type_direction(_pType, 0, 360, 5, 0);
			part_type_size(_pType, 1, 2, 0, 0);
			part_type_life(_pType, 12, 20);
			break;
	
	#endregion

	#region Shot Circle (With Speed)

		case(Part_Index.shotCircle):
			part_type_sprite(_pType, spr_shotCircle, true, true, false);
			part_type_direction(_pType, 0, 360, 0, 0);
			part_type_speed(_pType, 2, 6, -0.1, 0);
			part_type_size(_pType, 0.8, 1.2, 0, 0);
			part_type_life(_pType, 12, 20);
			break;
	
	#endregion

	#region Shot Circle (Still)

		case(Part_Index.shotCircle_still):
			part_type_sprite(_pType, spr_shotCircle, true, true, false);
			part_type_direction(_pType, 0, 360, 0, 0);
			part_type_size(_pType, 0.8, 1.2, 0, 0);
			part_type_life(_pType, 12, 24);
			break;
	
	#endregion

	#region Small Dust

		case(Part_Index.smallDust):
			part_type_direction(_pType, 0, 180, 0, 0);
			part_type_speed(_pType, 0.8, 1.1, -0.01, 0);
			part_type_shape(_pType, ps_shape_ellipse);
			part_type_scale(_pType, 0.1, 0.1);
			part_type_size(_pType, 1, 2, -0.01, 0);
			part_type_alpha2(_pType, 1, 0);
			part_type_life(_pType, 10, 10);
			break;
	
	#endregion
	
	#region Head Bonk

		case(Part_Index.headBonk):
			part_type_direction(_pType, 180, 360, 0, 0);
			part_type_speed(_pType, 0.8, 1.1, -0.01, 0);
			part_type_sprite(_pType, spr_headbonk, true, false, false);
			part_type_scale(_pType, 1, 1);
			part_type_size(_pType, 1, 0.9, -0.005, 0);
			part_type_life(_pType, 40, 40);
			break;
	
	#endregion
	
	#region Drown Bubble

		case(Part_Index.drownBubble):
			part_type_sprite(_pType, spr_bubble, false, false, true);
			part_type_gravity(_pType, -0.05, 270);
			part_type_size(_pType, 0.1, 0.5, 0, 0);
			part_type_alpha3(_pType, 1, 1, 0);
			part_type_speed(_pType, 0.7, 2, -0.05, 0.5);
			part_type_direction(_pType, 45, 135, 0, 10);
			part_type_life(_pType, 120, 120);
			break;
	
	#endregion
	
	#region Snore

		case(Part_Index.snore):
			part_type_sprite(_pType, spr_snore, false, false, true);
			part_type_size(_pType, 0.2, 0.3, 0.01, 0);
			part_type_scale(_pType, 0.2, 0.2);
			part_type_alpha3(_pType, 1, 1, 0);
			part_type_speed(_pType, 0.15, 0.2, 0.002, 0.05);
			part_type_direction(_pType, 40, 70, 0, 10);
			part_type_life(_pType, 180, 180);
			break;
	
	#endregion

	#region Water Droplet

		case(Part_Index.waterDroplet):
			part_type_sprite(_pType, spr_waterDroplet, true, false, false);
			part_type_gravity(_pType, 0.05, 270);
			part_type_size(_pType, 0.8, 1, 0, 0);
			part_type_alpha3(_pType, 1, 1, 0);
			part_type_life(_pType, 120, 120);
			break;
	
	#endregion
	
	#region Water Sprinkler

		case(Part_Index.waterSprinkler):
			part_type_sprite(_pType, spr_waterDroplet, true, false, false);
			part_type_gravity(_pType, 0.05, 270);
			part_type_direction(_pType, 45, 135, 0, 0);
			part_type_speed(_pType, 3, 4, 0, 0);
			part_type_size(_pType, 0.8, 1, 0, 0);
			part_type_alpha3(_pType, 1, 1, 0);
			part_type_life(_pType, 120, 120);
			break;
	
	#endregion
	
	#region Water Enter

		case(Part_Index.waterEnter):
			part_type_sprite(_pType, spr_waterDroplet, true, false, false);
			part_type_gravity(_pType, 0.07, 270);
			part_type_direction(_pType, 30, 150, 0, 0);
			part_type_speed(_pType, 2, 4, 0, 0);
			part_type_size(_pType, 0.8, 1, 0, 0);
			part_type_alpha3(_pType, 1, 1, 0);
			part_type_life(_pType, 120, 120);
			break;
	
	#endregion
	
	#region Booster Jet

		case(Part_Index.boosterJet):
			part_type_sprite(_pType, spr_shotCircle, true, true, false);
			part_type_size(_pType, 0.8, 1.2, 0, 0);
			part_type_life(_pType, 12, 24);
			break;
	
	#endregion
	
	#region Booster Spread

		case(Part_Index.boosterSpread):
			part_type_sprite(_pType, spr_shotCircle, true, true, false);
			part_type_direction(_pType, 260, 280, 0, 0);
			part_type_size(_pType, 0.8, 1.2, 0, 0);
			part_type_speed(_pType, 5, 7, -0.5, 0);
			part_type_life(_pType, 12, 24);
			break;
	
	#endregion
	
	#region Polar Star Debris

		case(Part_Index.debris_pStar):
			part_type_sprite(_pType, spr_shape_circle, true, true, false);
			part_type_direction(_pType, 0, 360, 0, 1);
			part_type_scale(_pType, 3 / SHAPE_CIRCLE_SIZE, 3 / SHAPE_CIRCLE_SIZE);
			part_type_size(_pType, 0.8, 2, -0.01, 0);
			part_type_speed(_pType, 2, 5, -0.2, 0);
			part_type_life(_pType, 10, 14);
			break;
	
	#endregion
	
	#region Edge Trail

		case(Part_Index.edgeTrail):
			part_type_sprite(_pType, spr_shape_circle, true, true, false);
			part_type_direction(_pType, 0, 360, 0, 1);
			part_type_scale(_pType, 2 / SHAPE_CIRCLE_SIZE, 2 / SHAPE_CIRCLE_SIZE);
			part_type_size(_pType, 0.8, 2, -0.01, 0);
			part_type_speed(_pType, 0, 1, -0.2, 0);
			part_type_life(_pType, 20, 30);
			break;
	
	#endregion
	
	#region Basu Shot

		case(Part_Index.basuShot):
			part_type_sprite(_pType, spr_shape_circle, true, true, false);
			part_type_direction(_pType, 80, 100, 0, 1);
			part_type_scale(_pType, 2 / SHAPE_CIRCLE_SIZE, 2 / SHAPE_CIRCLE_SIZE);
			part_type_size(_pType, 0.8, 2, -0.01, 0);
			part_type_speed(_pType, 0, 1, 0, 0);
			part_type_life(_pType, 20, 30);
			break;
	
	#endregion
	
	#region Tempest Trail

		case(Part_Index.tempestTrail):
			part_type_sprite(_pType, spr_shape_circle, true, true, false);
			part_type_scale(_pType, 2 / SHAPE_CIRCLE_SIZE, 2 / SHAPE_CIRCLE_SIZE);
			part_type_size(_pType, 0.8, 2, -0.01, 0);
			part_type_life(_pType, 20, 30);
			break;
	
	#endregion
	}


}
