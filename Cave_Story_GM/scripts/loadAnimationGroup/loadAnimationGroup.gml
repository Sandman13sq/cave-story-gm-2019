/// @desc Loads animation into main map
/// @arg group
function loadAnimationGroup(argument0) {

#region Group Enum

	enum Animation_Group
	{
		player,
		weapon,
		sue,
		colon,
		santa,
		kanpachi,
		chako,
		jack,
		king,
		toroko,
		misery,
		cthulhu,
		tetsuzou,
		chinfish,
		bat,
		critter,
		beetle,
		capsule,
		door,
		sym,
		behemoth,
		blueRobot,
		basu,
		balrog,
		mahin,
		pignon,
		basil,
		igor,
	}

#endregion

	// Load to memory if not already present
	if !ds_map_exists(ANIMATION_GROUP, argument0)
	{
		var _group = argument0;

		// Add group to main list
		ANIMATION_GROUP[? _group] = ds_map_create();
		ds_list_add(ANIMATION_LIST, ANIMATION_GROUP[? _group]);

		switch(_group)
		{
		#region player

			case( Animation_Group.player ):

			#region Sequence Enum 

				enum Sequence_player
				{
					sprite,
					idle,
					idle_back,
					idle_up,
					run,
					run_up,
					run_back,
					rise,
					rise_up,
					rise_down,
					air,
					air_up,
					air_down,
					fall,
					fall_up,
					fall_down,
					search,
					search_end,
					hurt,
					ko,
					knee,
				}

			#endregion 

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_player.sprite,
					[
						[spr_quote_noWep, 0, 20, 0, 0, 0],
						[spr_quote_wep, 0, 20, 0, 0, 0],
						[spr_curly_R_noWep, 0, 20, 0, 0, 0],
						[spr_curly_R, 0, 20, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_player.idle,
					[
						[spr_null, 0, 10, 0, 0, 0],
						[spr_null, 1, 10, 0, 0, 0],
						[spr_null, 2, 10, 0, 0, 0],
						[spr_null, 3, 10, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_player.idle_back,
					[
						[spr_null, 39, 10, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_player.idle_up,
					[
						[spr_null, 4, 10, 0, 0, 0],
						[spr_null, 5, 10, 0, 0, 0],
						[spr_null, 6, 10, 0, 0, 0],
						[spr_null, 7, 10, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_player.run,
					[
						[spr_null, 8, 6, 0, 0, 0],
						[spr_null, 9, 7, 0, 0, 0],
						[spr_null, 8, 6, 0, 0, 0],
						[spr_null, 10, 7, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_player.run_up,
					[
						[spr_null, 12, 6, 0, 0, 0],
						[spr_null, 13, 7, 0, 0, 0],
						[spr_null, 12, 6, 0, 0, 0],
						[spr_null, 14, 7, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_player.run_back,
					[
						[spr_null, 36, 6, 0, 0, 0],
						[spr_null, 37, 7, 0, 0, 0],
						[spr_null, 36, 6, 0, 0, 0],
						[spr_null, 38, 7, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_player.rise,
					[
						[spr_null, 16, 4, 0, 0, 0],
						[spr_null, 17, 4, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_player.rise_up,
					[
						[spr_null, 20, 4, 0, 0, 0],
						[spr_null, 21, 4, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_player.rise_down,
					[
						[spr_null, 24, 4, 0, 0, 0],
						[spr_null, 25, 4, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_player.air,
					[
						[spr_null, 28, 0, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_player.air_up,
					[
						[spr_null, 29, 0, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_player.air_down,
					[
						[spr_null, 30, 0, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_player.fall,
					[
						[spr_null, 18, 4, 0, 0, 0],
						[spr_null, 19, 4, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_player.fall_up,
					[
						[spr_null, 22, 4, 0, 0, 0],
						[spr_null, 23, 4, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_player.fall_down,
					[
						[spr_null, 26, 4, 0, 0, 0],
						[spr_null, 27, 4, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_player.search,
					[
						[spr_null, 32, 6, 0, 0, 0],
						[spr_null, 33, 0, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_player.search_end,
					[
						[spr_null, 33, 0, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_player.hurt,
					[
						[spr_null, 11, 0, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_player.ko,
					[
						[spr_null, 15, 0, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_player.knee,
					[
						[spr_null, 31, 0, 0, 0, 0]
					]);

		#endregion

		#region weapon

			case( Animation_Group.weapon ):

			#region Sequence Enum 

				enum Sequence_weapon
				{
					sprite,
					idle,
					idle_back,
					idle_up,
					run,
					run_up,
					run_back,
					rise,
					rise_up,
					rise_down,
					air,
					air_up,
					air_down,
					fall,
					fall_up,
					fall_down,
					search,
					search_end,
				}

			#endregion 

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_weapon.sprite,
					[
						[spr_wep_polarStar, 0, 0, 0, 0, 0],
						[spr_wep_machineGun, 0, 0, 0, 0, 0],
						[spr_wep_nemesis, 0, 0, 0, 0, 0],
						[spr_wep_missileLauncher, 0, 0, 0, 0, 0],
						[spr_wep_superLauncher, 0, 0, 0, 0, 0],
						[spr_wep_shark, 0, 0, 0, 0, 0],
						[spr_wep_fireball, 0, 0, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_weapon.idle,
					[
						[spr_null, 0, 10, 6, 6, 0],
						[spr_null, 0, 10, 6, 5, 0],
						[spr_null, 0, 10, 6, 5, 0],
						[spr_null, 0, 10, 6, 6, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_weapon.idle_back,
					[
						[spr_null, 0, 10, 5, 5, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_weapon.idle_up,
					[
						[spr_null, 1, 10, 5, -11, 0],
						[spr_null, 1, 10, 5, -12, 0],
						[spr_null, 1, 10, 5, -12, 0],
						[spr_null, 1, 10, 5, -11, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_weapon.run,
					[
						[spr_null, 0, 6, 5, 7, 0],
						[spr_null, 0, 7, 5, 6, 0],
						[spr_null, 0, 6, 5, 7, 0],
						[spr_null, 0, 7, 5, 6, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_weapon.run_up,
					[
						[spr_null, 1, 6, 5, -11, 0],
						[spr_null, 1, 7, 5, -12, 0],
						[spr_null, 1, 6, 5, -11, 0],
						[spr_null, 1, 7, 5, -12, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_weapon.run_back,
					[
						[spr_null, 3, 6, 5, 6, 0],
						[spr_null, 3, 7, 5, 5, 0],
						[spr_null, 3, 6, 5, 6, 0],
						[spr_null, 3, 7, 5, 5, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_weapon.rise,
					[
						[spr_null, 0, 0, 6, 5, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_weapon.rise_up,
					[
						[spr_null, 1, 0, 4, -11, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_weapon.rise_down,
					[
						[spr_null, 2, 0, 0, 13, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_weapon.air,
					[
						[spr_null, 0, 0, 6, 5, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_weapon.air_up,
					[
						[spr_null, 1, 0, 5, -11, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_weapon.air_down,
					[
						[spr_null, 2, 0, 0, 13, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_weapon.fall,
					[
						[spr_null, 0, 0, 6, 5, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_weapon.fall_up,
					[
						[spr_null, 1, 0, 5, -11, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_weapon.fall_down,
					[
						[spr_null, 2, 0, 0, 13, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_weapon.search,
					[
						[spr_null, 0, 3, 6, 6, 0],
						[spr_null, 0, 1, 6, 6, 0],
						[spr_null, 0, 1, 4, 6, 0],
						[spr_null, 0, 0, 4, 6, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_weapon.search_end,
					[
						[spr_null, 0, 0, 4, 6, 0]
					]);

		#endregion

		#region sue

			case( Animation_Group.sue ):

			#region Sequence Enum 

				enum Sequence_sue
				{
					sprite,
					idle,
					walk,
					search,
					sit,
					ko,
					fighty,
					hit,
					held,
				}

			#endregion 

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_sue.sprite,
					[
						[spr_sue, 0, 1, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_sue.idle,
					[
						[spr_null, 0, 9, 0, 0, 0],
						[spr_null, 1, 9, 0, 0, 0],
						[spr_null, 2, 9, 0, 0, 0],
						[spr_null, 3, 9, 0, 0, 0],
						[spr_null, 0, 9, 0, 0, 0],
						[spr_null, 1, 9, 0, 0, 0],
						[spr_null, 2, 9, 0, 0, 0],
						[spr_null, 3, 9, 0, 0, 0],
						[spr_null, 0, 9, 0, 0, 0],
						[spr_null, 4, 9, 0, 0, 0],
						[spr_null, 5, 9, 0, 0, 0],
						[spr_null, 6, 9, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_sue.walk,
					[
						[spr_null, 8, 7, 0, 0, 0],
						[spr_null, 0, 7, 0, 0, 0],
						[spr_null, 9, 7, 0, 0, 0],
						[spr_null, 0, 7, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_sue.search,
					[
						[spr_null, 12, 0, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_sue.sit,
					[
						[spr_null, 10, 10, 0, 0, 0],
						[spr_null, 11, 10, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_sue.ko,
					[
						[spr_null, 13, 0, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_sue.fighty,
					[
						[spr_null, 10, 10, 0, 0, 0],
						[spr_null, 11, 10, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_sue.hit,
					[
						[spr_null, 14, 0, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_sue.held,
					[
						[spr_null, 15, 0, 0, 0, 0]
					]);

		#endregion

		#region colon

			case( Animation_Group.colon ):

			#region Sequence Enum 

				enum Sequence_colon
				{
					idle,
					walk,
					search,
					sit,
					ko,
					fighty,
				}

			#endregion 

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_colon.idle,
					[
						[spr_colon, 0, 9, 0, 0, 0],
						[spr_null, 1, 9, 0, 0, 0],
						[spr_null, 2, 9, 0, 0, 0],
						[spr_null, 3, 9, 0, 0, 0],
						[spr_null, 0, 9, 0, 0, 0],
						[spr_null, 1, 9, 0, 0, 0],
						[spr_null, 2, 9, 0, 0, 0],
						[spr_null, 3, 9, 0, 0, 0],
						[spr_null, 0, 9, 0, 0, 0],
						[spr_null, 4, 9, 0, 0, 0],
						[spr_null, 5, 9, 0, 0, 0],
						[spr_null, 6, 9, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_colon.walk,
					[
						[spr_null, 8, 7, 0, 0, 0],
						[spr_null, 0, 7, 0, 0, 0],
						[spr_null, 9, 7, 0, 0, 0],
						[spr_null, 0, 7, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_colon.search,
					[
						[spr_null, 12, 0, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_colon.sit,
					[
						[spr_null, 11, 130, 0, 0, 0],
						[spr_null, 13, 9, 0, 0, 0],
						[spr_null, 14, 9, 0, 0, 0],
						[spr_null, 13, 9, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_colon.ko,
					[
						[spr_null, 10, 0, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_colon.fighty,
					[
						[spr_null, 10, 10, 0, 0, 0],
						[spr_null, 11, 10, 0, 0, 0]
					]);

		#endregion

		#region santa

			case( Animation_Group.santa ):

			#region Sequence Enum 

				enum Sequence_santa
				{
					idle,
					walk,
				}

			#endregion 

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_santa.idle,
					[
						[spr_santa, 0, 12, 0, 0, 0],
						[spr_null, 1, 12, 0, 0, 0],
						[spr_null, 2, 12, 0, 0, 0],
						[spr_null, 3, 12, 0, 0, 0],
						[spr_null, 0, 12, 0, 0, 0],
						[spr_null, 1, 12, 0, 0, 0],
						[spr_null, 2, 12, 0, 0, 0],
						[spr_null, 3, 12, 0, 0, 0],
						[spr_null, 0, 12, 0, 0, 0],
						[spr_null, 4, 12, 0, 0, 0],
						[spr_null, 5, 12, 0, 0, 0],
						[spr_null, 6, 12, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_santa.walk,
					[
						[spr_null, 8, 7, 0, 0, 0],
						[spr_null, 0, 7, 0, 0, 0],
						[spr_null, 9, 7, 0, 0, 0],
						[spr_null, 0, 7, 0, 0, 0]
					]);

		#endregion

		#region kanpachi

			case( Animation_Group.kanpachi ):

			#region Sequence Enum 

				enum Sequence_kanpachi
				{
					idle,
					walk,
					sit,
				}

			#endregion 

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_kanpachi.idle,
					[
						[spr_kanpachi, 0, 11, 0, 0, 0],
						[spr_null, 1, 11, 0, 0, 0],
						[spr_null, 2, 11, 0, 0, 0],
						[spr_null, 3, 11, 0, 0, 0],
						[spr_null, 0, 11, 0, 0, 0],
						[spr_null, 1, 11, 0, 0, 0],
						[spr_null, 2, 11, 0, 0, 0],
						[spr_null, 3, 11, 0, 0, 0],
						[spr_null, 0, 11, 0, 0, 0],
						[spr_null, 4, 11, 0, 0, 0],
						[spr_null, 5, 11, 0, 0, 0],
						[spr_null, 6, 11, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_kanpachi.walk,
					[
						[spr_null, 8, 7, 0, 0, 0],
						[spr_null, 0, 7, 0, 0, 0],
						[spr_null, 9, 7, 0, 0, 0],
						[spr_null, 0, 7, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_kanpachi.sit,
					[
						[spr_null, 8, 180, 0, 0, 0],
						[spr_null, 9, 11, 0, 0, 0],
						[spr_null, 10, 11, 0, 0, 0],
						[spr_null, 9, 11, 0, 0, 0]
					]);

		#endregion

		#region chako

			case( Animation_Group.chako ):

			#region Sequence Enum 

				enum Sequence_chako
				{
					idle,
					walk,
					rest,
					seq_11,
				}

			#endregion 

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_chako.idle,
					[
						[spr_chako, 0, 10, 0, 0, 0],
						[spr_null, 1, 10, 0, 0, 0],
						[spr_null, 2, 10, 0, 0, 0],
						[spr_null, 3, 10, 0, 0, 0],
						[spr_null, 0, 10, 0, 0, 0],
						[spr_null, 1, 10, 0, 0, 0],
						[spr_null, 2, 10, 0, 0, 0],
						[spr_null, 3, 10, 0, 0, 0],
						[spr_null, 0, 10, 0, 0, 0],
						[spr_null, 4, 10, 0, 0, 0],
						[spr_null, 5, 10, 0, 0, 0],
						[spr_null, 6, 10, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_chako.walk,
					[
						[spr_null, 8, 6, 0, 0, 0],
						[spr_null, 0, 6, 0, 0, 0],
						[spr_null, 9, 6, 0, 0, 0],
						[spr_null, 0, 6, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_chako.rest,
					[
						[spr_null, 10, 0, 0, -14, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_chako.seq_11,
					[
						[spr_null, 0, 1, 0, 0, 0]
					]);

		#endregion

		#region jack

			case( Animation_Group.jack ):

			#region Sequence Enum 

				enum Sequence_jack
				{
					idle,
					walk,
					rest,
					talk,
				}

			#endregion 

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_jack.idle,
					[
						[spr_jack, 0, 10, 0, 0, 0],
						[spr_null, 1, 10, 0, 0, 0],
						[spr_null, 2, 10, 0, 0, 0],
						[spr_null, 3, 10, 0, 0, 0],
						[spr_null, 0, 10, 0, 0, 0],
						[spr_null, 1, 10, 0, 0, 0],
						[spr_null, 2, 10, 0, 0, 0],
						[spr_null, 3, 10, 0, 0, 0],
						[spr_null, 0, 10, 0, 0, 0],
						[spr_null, 4, 10, 0, 0, 0],
						[spr_null, 5, 10, 0, 0, 0],
						[spr_null, 6, 10, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_jack.walk,
					[
						[spr_null, 8, 6, 0, 0, 0],
						[spr_null, 10, 6, 0, 0, 0],
						[spr_null, 9, 6, 0, 0, 0],
						[spr_null, 10, 6, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_jack.rest,
					[
						[spr_null, 10, 0, 0, -14, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_jack.talk,
					[
						[spr_null, 0, 1, 0, 0, 0]
					]);

		#endregion

		#region king

			case( Animation_Group.king ):

			#region Sequence Enum 

				enum Sequence_king
				{
					idle,
					walk,
					hurt,
					ko,
				}

			#endregion 

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_king.idle,
					[
						[spr_king, 0, 11, 0, 0, 0],
						[spr_null, 1, 11, 0, 0, 0],
						[spr_null, 2, 11, 0, 0, 0],
						[spr_null, 3, 11, 0, 0, 0],
						[spr_null, 0, 11, 0, 0, 0],
						[spr_null, 1, 11, 0, 0, 0],
						[spr_null, 2, 11, 0, 0, 0],
						[spr_null, 3, 11, 0, 0, 0],
						[spr_null, 0, 11, 0, 0, 0],
						[spr_null, 4, 11, 0, 0, 0],
						[spr_null, 5, 11, 0, 0, 0],
						[spr_null, 6, 11, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_king.walk,
					[
						[spr_null, 8, 7, 0, 0, 0],
						[spr_null, 0, 7, 0, 0, 0],
						[spr_null, 9, 7, 0, 0, 0],
						[spr_null, 0, 7, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_king.hurt,
					[
						[spr_null, 12, 4, 0, 0, 0],
						[spr_null, 13, 4, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_king.ko,
					[
						[spr_null, 10, 0, 0, 0, 0]
					]);

		#endregion

		#region toroko

			case( Animation_Group.toroko ):

			#region Sequence Enum 

				enum Sequence_toroko
				{
					idle,
					run,
					ko,
				}

			#endregion 

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_toroko.idle,
					[
						[spr_toroko, 0, 9, 0, 0, 0],
						[spr_null, 1, 9, 0, 0, 0],
						[spr_null, 2, 9, 0, 0, 0],
						[spr_null, 3, 9, 0, 0, 0],
						[spr_null, 0, 9, 0, 0, 0],
						[spr_null, 1, 9, 0, 0, 0],
						[spr_null, 2, 9, 0, 0, 0],
						[spr_null, 3, 9, 0, 0, 0],
						[spr_null, 0, 9, 0, 0, 0],
						[spr_null, 4, 9, 0, 0, 0],
						[spr_null, 5, 9, 0, 0, 0],
						[spr_null, 6, 9, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_toroko.run,
					[
						[spr_null, 8, 4, 0, 0, 0],
						[spr_null, 9, 4, 0, 0, 0],
						[spr_null, 10, 4, 0, 0, 0],
						[spr_null, 9, 4, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_toroko.ko,
					[
						[spr_null, 13, 0, 0, 0, 0]
					]);

		#endregion

		#region misery

			case( Animation_Group.misery ):

			#region Sequence Enum 

				enum Sequence_misery
				{
					idle,
					float,
					cast,
					castFlash,
				}

			#endregion 

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_misery.idle,
					[
						[spr_misery, 0, 160, 0, 0, 0],
						[spr_null, 1, 3, 0, 0, 0],
						[spr_null, 2, 3, 0, 0, 0],
						[spr_null, 1, 3, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_misery.float,
					[
						[spr_null, 3, 160, 0, 0, 0],
						[spr_null, 4, 3, 0, 0, 0],
						[spr_null, 5, 3, 0, 0, 0],
						[spr_null, 4, 3, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_misery.cast,
					[
						[spr_null, 6, 6, 0, 0, 0],
						[spr_null, 7, 4, 0, 0, 0],
						[spr_null, 8, 3, 0, 0, 0],
						[spr_null, 9, 3, 0, 0, 0],
						[spr_null, 8, 3, 0, 0, 0],
						[spr_null, 9, 3, 0, 0, 0],
						[spr_null, 8, 3, 0, 0, 0],
						[spr_null, 9, 3, 0, 0, 0],
						[spr_null, 8, 3, 0, 0, 0],
						[spr_null, 9, 3, 0, 0, 0],
						[spr_null, 8, 3, 0, 0, 0],
						[spr_null, 9, 3, 0, 0, 0],
						[spr_null, 8, 3, 0, 0, 0],
						[spr_null, 9, 3, 0, 0, 0],
						[spr_null, 7, 4, 0, 0, 0],
						[spr_null, 6, 5, 0, 0, 0],
						[spr_null, 0, 11, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_misery.castFlash,
					[
						[spr_null, 6, 6, 0, 0, 0],
						[spr_null, 7, 4, 0, 0, 0],
						[spr_null, 8, 3, 0, 0, 0],
						[spr_null, 9, 3, 0, 0, 0],
						[spr_null, 10, 3, 0, 0, 0],
						[spr_null, 11, 3, 0, 0, 0],
						[spr_null, 10, 3, 0, 0, 0],
						[spr_null, 11, 3, 0, 0, 0],
						[spr_null, 10, 3, 0, 0, 0],
						[spr_null, 11, 3, 0, 0, 0],
						[spr_null, 10, 3, 0, 0, 0],
						[spr_null, 11, 3, 0, 0, 0],
						[spr_null, 8, 3, 0, 0, 0],
						[spr_null, 9, 3, 0, 0, 0],
						[spr_null, 7, 4, 0, 0, 0],
						[spr_null, 6, 5, 0, 0, 0],
						[spr_null, 0, 11, 0, 0, 0]
					]);

		#endregion

		#region cthulhu

			case( Animation_Group.cthulhu ):

			#region Sequence Enum 

				enum Sequence_cthulhu
				{
					noSee,
					see,
					cast,
					castFlash,
				}

			#endregion 

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_cthulhu.noSee,
					[
						[spr_cthulhu, 0, 0, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_cthulhu.see,
					[
						[spr_cthulhu, 1, 0, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_cthulhu.cast,
					[
						[spr_null, 6, 6, 0, 0, 0],
						[spr_null, 7, 4, 0, 0, 0],
						[spr_null, 8, 3, 0, 0, 0],
						[spr_null, 9, 3, 0, 0, 0],
						[spr_null, 8, 3, 0, 0, 0],
						[spr_null, 9, 3, 0, 0, 0],
						[spr_null, 8, 3, 0, 0, 0],
						[spr_null, 9, 3, 0, 0, 0],
						[spr_null, 8, 3, 0, 0, 0],
						[spr_null, 9, 3, 0, 0, 0],
						[spr_null, 8, 3, 0, 0, 0],
						[spr_null, 9, 3, 0, 0, 0],
						[spr_null, 8, 3, 0, 0, 0],
						[spr_null, 9, 3, 0, 0, 0],
						[spr_null, 7, 4, 0, 0, 0],
						[spr_null, 6, 5, 0, 0, 0],
						[spr_null, 0, 11, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_cthulhu.castFlash,
					[
						[spr_null, 6, 6, 0, 0, 0],
						[spr_null, 7, 4, 0, 0, 0],
						[spr_null, 8, 3, 0, 0, 0],
						[spr_null, 9, 3, 0, 0, 0],
						[spr_null, 10, 3, 0, 0, 0],
						[spr_null, 11, 3, 0, 0, 0],
						[spr_null, 10, 3, 0, 0, 0],
						[spr_null, 11, 3, 0, 0, 0],
						[spr_null, 10, 3, 0, 0, 0],
						[spr_null, 11, 3, 0, 0, 0],
						[spr_null, 10, 3, 0, 0, 0],
						[spr_null, 11, 3, 0, 0, 0],
						[spr_null, 8, 3, 0, 0, 0],
						[spr_null, 9, 3, 0, 0, 0],
						[spr_null, 7, 4, 0, 0, 0],
						[spr_null, 6, 5, 0, 0, 0],
						[spr_null, 0, 11, 0, 0, 0]
					]);

		#endregion

		#region tetsuzou

			case( Animation_Group.tetsuzou ):

			#region Sequence Enum 

				enum Sequence_tetsuzou
				{
					idle,
					sleep,
					cast,
					castFlash,
				}

			#endregion 

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_tetsuzou.idle,
					[
						[spr_tetsuzou, 0, 15, 0, 0, 0],
						[spr_null, 1, 15, 0, 0, 0],
						[spr_null, 2, 15, 0, 0, 0],
						[spr_null, 3, 15, 0, 0, 0],
						[spr_null, 0, 15, 0, 0, 0],
						[spr_null, 1, 15, 0, 0, 0],
						[spr_null, 2, 15, 0, 0, 0],
						[spr_null, 3, 15, 0, 0, 0],
						[spr_null, 0, 15, 0, 0, 0],
						[spr_null, 1, 15, 0, 0, 0],
						[spr_null, 2, 15, 0, 0, 0],
						[spr_null, 3, 15, 0, 0, 0],
						[spr_null, 0, 15, 0, 0, 0],
						[spr_null, 4, 15, 0, 0, 0],
						[spr_null, 5, 15, 0, 0, 0],
						[spr_null, 6, 15, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_tetsuzou.sleep,
					[
						[spr_tetsuzou, 8, 50, 0, 0, 0],
						[spr_null, 9, 15, 0, 0, 0],
						[spr_null, 10, 50, 0, 0, 0],
						[spr_null, 9, 15, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_tetsuzou.cast,
					[
						[spr_null, 6, 6, 0, 0, 0],
						[spr_null, 7, 4, 0, 0, 0],
						[spr_null, 8, 3, 0, 0, 0],
						[spr_null, 9, 3, 0, 0, 0],
						[spr_null, 8, 3, 0, 0, 0],
						[spr_null, 9, 3, 0, 0, 0],
						[spr_null, 8, 3, 0, 0, 0],
						[spr_null, 9, 3, 0, 0, 0],
						[spr_null, 8, 3, 0, 0, 0],
						[spr_null, 9, 3, 0, 0, 0],
						[spr_null, 8, 3, 0, 0, 0],
						[spr_null, 9, 3, 0, 0, 0],
						[spr_null, 8, 3, 0, 0, 0],
						[spr_null, 9, 3, 0, 0, 0],
						[spr_null, 7, 4, 0, 0, 0],
						[spr_null, 6, 5, 0, 0, 0],
						[spr_null, 0, 11, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_tetsuzou.castFlash,
					[
						[spr_null, 6, 6, 0, 0, 0],
						[spr_null, 7, 4, 0, 0, 0],
						[spr_null, 8, 3, 0, 0, 0],
						[spr_null, 9, 3, 0, 0, 0],
						[spr_null, 10, 3, 0, 0, 0],
						[spr_null, 11, 3, 0, 0, 0],
						[spr_null, 10, 3, 0, 0, 0],
						[spr_null, 11, 3, 0, 0, 0],
						[spr_null, 10, 3, 0, 0, 0],
						[spr_null, 11, 3, 0, 0, 0],
						[spr_null, 10, 3, 0, 0, 0],
						[spr_null, 11, 3, 0, 0, 0],
						[spr_null, 8, 3, 0, 0, 0],
						[spr_null, 9, 3, 0, 0, 0],
						[spr_null, 7, 4, 0, 0, 0],
						[spr_null, 6, 5, 0, 0, 0],
						[spr_null, 0, 11, 0, 0, 0]
					]);

		#endregion

		#region chinfish

			case( Animation_Group.chinfish ):

			#region Sequence Enum 

				enum Sequence_chinfish
				{
					idle,
					hurt,
					cast,
					castFlash,
				}

			#endregion 

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_chinfish.idle,
					[
						[spr_chinfish, 0, 100, 0, 0, 0],
						[spr_null, 1, 3, 0, 0, 0],
						[spr_null, 2, 3, 0, 0, 0],
						[spr_null, 1, 3, 0, 0, 0],
						[spr_null, 2, 3, 0, 0, 0],
						[spr_null, 1, 3, 0, 0, 0],
						[spr_null, 0, 100, 0, 0, 0],
						[spr_null, 4, 2, 0, 0, 0],
						[spr_null, 5, 2, 0, 0, 0],
						[spr_null, 4, 2, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_chinfish.hurt,
					[
						[spr_chinfish, 3, 0, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_chinfish.cast,
					[
						[spr_null, 6, 6, 0, 0, 0],
						[spr_null, 7, 4, 0, 0, 0],
						[spr_null, 8, 3, 0, 0, 0],
						[spr_null, 9, 3, 0, 0, 0],
						[spr_null, 8, 3, 0, 0, 0],
						[spr_null, 9, 3, 0, 0, 0],
						[spr_null, 8, 3, 0, 0, 0],
						[spr_null, 9, 3, 0, 0, 0],
						[spr_null, 8, 3, 0, 0, 0],
						[spr_null, 9, 3, 0, 0, 0],
						[spr_null, 8, 3, 0, 0, 0],
						[spr_null, 9, 3, 0, 0, 0],
						[spr_null, 8, 3, 0, 0, 0],
						[spr_null, 9, 3, 0, 0, 0],
						[spr_null, 7, 4, 0, 0, 0],
						[spr_null, 6, 5, 0, 0, 0],
						[spr_null, 0, 11, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_chinfish.castFlash,
					[
						[spr_null, 6, 6, 0, 0, 0],
						[spr_null, 7, 4, 0, 0, 0],
						[spr_null, 8, 3, 0, 0, 0],
						[spr_null, 9, 3, 0, 0, 0],
						[spr_null, 10, 3, 0, 0, 0],
						[spr_null, 11, 3, 0, 0, 0],
						[spr_null, 10, 3, 0, 0, 0],
						[spr_null, 11, 3, 0, 0, 0],
						[spr_null, 10, 3, 0, 0, 0],
						[spr_null, 11, 3, 0, 0, 0],
						[spr_null, 10, 3, 0, 0, 0],
						[spr_null, 11, 3, 0, 0, 0],
						[spr_null, 8, 3, 0, 0, 0],
						[spr_null, 9, 3, 0, 0, 0],
						[spr_null, 7, 4, 0, 0, 0],
						[spr_null, 6, 5, 0, 0, 0],
						[spr_null, 0, 11, 0, 0, 0]
					]);

		#endregion

		#region bat

			case( Animation_Group.bat ):

			#region Sequence Enum 

				enum Sequence_bat
				{
					sprite,
					air,
				}

			#endregion 

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_bat.sprite,
					[
						[spr_bat, 0, 0, 0, 0, 0],
						[spr_null, 0, 0, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_bat.air,
					[
						[spr_null, 0, 2, 0, 0, 0],
						[spr_null, 1, 2, 0, 1, 0],
						[spr_null, 2, 2, 0, 1, 0],
						[spr_null, 3, 1, 0, 0, 0],
						[spr_null, 4, 1, 0, -1, 0],
						[spr_null, 5, 1, 0, -2, 0],
						[spr_null, 2, 2, 0, -2, 0],
						[spr_null, 1, 2, 0, -1, 0]
					]);

		#endregion

		#region critter

			case( Animation_Group.critter ):

			#region Sequence Enum 

				enum Sequence_critter
				{
					sprite,
					idle,
					look,
					squat,
					jump,
				}

			#endregion 

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_critter.sprite,
					[
						[spr_critter, 0, 0, 0, 0, 0],
						[spr_critter, 0, 0, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_critter.idle,
					[
						[spr_null, 0, 0, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_critter.look,
					[
						[spr_null, 1, 1, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_critter.squat,
					[
						[spr_null, 0, 1, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_critter.jump,
					[
						[spr_null, 2, 1, 0, 0, 0]
					]);

		#endregion

		#region beetle

			case( Animation_Group.beetle ):

			#region Sequence Enum 

				enum Sequence_beetle
				{
					sprite,
					idle,
					flying,
					flyingDark,
					flyingRed,
				}

			#endregion 

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_beetle.sprite,
					[
						[spr_beetle_eggs, 0, 0, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_beetle.idle,
					[
						[spr_null, 0, 1, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_beetle.flying,
					[
						[spr_null, 1, 3, 0, 0, 0],
						[spr_null, 2, 3, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_beetle.flyingDark,
					[
						[spr_null, 5, 3, 0, 0, 0],
						[spr_null, 6, 3, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_beetle.flyingRed,
					[
						[spr_null, 3, 3, 0, 0, 0],
						[spr_null, 4, 3, 0, 0, 0]
					]);

		#endregion

		#region capsule

			case( Animation_Group.capsule ):

			#region Sequence Enum 

				enum Sequence_capsule
				{
					lifeCapsule,
					energyCapsule,
				}

			#endregion 

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_capsule.lifeCapsule,
					[
						[spr_lifeCapsule, 0, 3, 0, 0, 0],
						[spr_null, 1, 3, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_capsule.energyCapsule,
					[
						[spr_energyCapsule, 0, 3, 0, 0, 0],
						[spr_null, 1, 4, 0, 0, 0],
						[spr_null, 2, 5, 0, 0, 0],
						[spr_null, 3, 6, 0, 0, 0],
						[spr_null, 4, 4, 0, 0, 0],
						[spr_null, 5, 3, 0, 0, 0]
					]);

		#endregion

		#region door

			case( Animation_Group.door ):

			#region Sequence Enum 

				enum Sequence_door
				{
					closed,
					open,
					eyeOpen,
					eyeClose,
					eyeBlink,
					hurt,
				}

			#endregion 

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_door.closed,
					[
						[spr_door, 0, 0, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_door.open,
					[
						[spr_door, 1, 0, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_door.eyeOpen,
					[
						[spr_door, 0, 2, 0, 0, 0],
						[spr_enemyDoor, 0, 5, 0, 0, 0],
						[spr_enemyDoor, 1, 0, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_door.eyeClose,
					[
						[spr_enemyDoor, 1, 5, 0, 0, 0],
						[spr_null, 0, 5, 0, 0, 0],
						[spr_door, 0, 0, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_door.eyeBlink,
					[
						[spr_enemyDoor, 0, 3, 0, 0, 0],
						[spr_door, 0, 4, 0, 0, 0],
						[spr_enemyDoor, 0, 3, 0, 0, 0],
						[spr_enemyDoor, 1, 160, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_door.hurt,
					[
						[spr_enemyDoor, 2, 0, 0, 0, 0]
					]);

		#endregion

		#region sym

			case( Animation_Group.sym ):

			#region Sequence Enum 

				enum Sequence_sym
				{
					santaKey,
					computerOff,
					computerOn,
					terminalOff,
					terminalOn,
					terminalRed,
					sprinklerOff,
					sprinklerOn,
				}

			#endregion 

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_sym.santaKey,
					[
						[spr_santaKey, 0, 80, 0, 0, 0],
						[spr_null, 1, 5, 0, 0, 0],
						[spr_null, 2, 50, 0, 0, 0],
						[spr_null, 1, 3, 0, 0, 0],
						[spr_null, 0, 50, 0, 0, 0],
						[spr_null, 1, 3, 0, 0, 0],
						[spr_null, 2, 3, 0, 0, 0],
						[spr_null, 1, 3, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_sym.computerOff,
					[
						[spr_computer, 0, 0, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_sym.computerOn,
					[
						[spr_computer, 1, 3, 0, 0, 0],
						[spr_null, 2, 3, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_sym.terminalOff,
					[
						[spr_terminal, 0, 0, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_sym.terminalOn,
					[
						[spr_terminal, 0, 2, 0, 0, 0],
						[spr_null, 1, 2, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_sym.terminalRed,
					[
						[spr_terminal, 2, 2, 0, 0, 0],
						[spr_null, 3, 2, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_sym.sprinklerOff,
					[
						[spr_sprinkler, 0, 0, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_sym.sprinklerOn,
					[
						[spr_sprinkler, 0, 2, 0, 0, 0],
						[spr_null, 1, 2, 0, 0, 0]
					]);

		#endregion

		#region behemoth

			case( Animation_Group.behemoth ):

			#region Sequence Enum 

				enum Sequence_behemoth
				{
					walk,
					hurt,
					charge,
				}

			#endregion 

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_behemoth.walk,
					[
						[spr_behemoth, 1, 10, 0, 0, 0],
						[spr_null, 0, 10, 0, 0, 0],
						[spr_null, 1, 10, 0, 0, 0],
						[spr_null, 2, 10, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_behemoth.hurt,
					[
						[spr_null, 3, 1, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_behemoth.charge,
					[
						[spr_null, 4, 6, 0, 0, 0],
						[spr_null, 5, 6, 0, 0, 0]
					]);

		#endregion

		#region blueRobot

			case( Animation_Group.blueRobot ):

			#region Sequence Enum 

				enum Sequence_blueRobot
				{
					idle,
					down,
					scrap0,
					scrap1,
				}

			#endregion 

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_blueRobot.idle,
					[
						[spr_blueRobot, 0, 160, 0, 0, 0],
						[spr_null, 1, 6, 0, 0, 0],
						[spr_null, 2, 6, 0, 0, 0],
						[spr_null, 1, 6, 0, 0, 0],
						[spr_null, 0, 160, 0, 0, 0],
						[spr_null, 1, 6, 0, 0, 0],
						[spr_null, 2, 6, 0, 0, 0],
						[spr_null, 1, 6, 0, 0, 0],
						[spr_null, 0, 80, 0, 0, 0],
						[spr_null, 3, 10, 0, 0, 0],
						[spr_null, 0, 10, 0, 0, 0],
						[spr_null, 3, 10, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_blueRobot.down,
					[
						[spr_blueRobot, 4, 0, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_blueRobot.scrap0,
					[
						[spr_blueRobot, 5, 0, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_blueRobot.scrap1,
					[
						[spr_blueRobot, 6, 0, 0, 0, 0]
					]);

		#endregion

		#region basu

			case( Animation_Group.basu ):

			#region Sequence Enum 

				enum Sequence_basu
				{
					fly,
					charge,
				}

			#endregion 

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_basu.fly,
					[
						[spr_basu, 0, 2, 0, 0, 0],
						[spr_null, 1, 2, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_basu.charge,
					[
						[spr_null, 0, 2, 0, 0, 0],
						[spr_null, 2, 2, 0, 0, 0],
						[spr_null, 1, 2, 0, 0, 0],
						[spr_null, 2, 2, 0, 0, 0]
					]);

		#endregion

		#region balrog

			case( Animation_Group.balrog ):

			#region Sequence Enum 

				enum Sequence_balrog
				{
					idle,
					walk,
					jump,
					smile,
					hurt,
					surprise,
					crouch,
				}

			#endregion 

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_balrog.idle,
					[
						[spr_balrog, 0, 10, 0, 0, 0],
						[spr_null, 1, 10, 0, 0, 0],
						[spr_null, 2, 10, 0, 0, 0],
						[spr_null, 3, 10, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_balrog.walk,
					[
						[spr_null, 12, 6, 0, 0, 0],
						[spr_null, 0, 6, 0, 0, 0],
						[spr_null, 13, 6, 0, 0, 0],
						[spr_null, 0, 6, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_balrog.jump,
					[
						[spr_null, 7, 0, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_balrog.smile,
					[
						[spr_null, 10, 0, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_balrog.hurt,
					[
						[spr_null, 9, 0, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_balrog.surprise,
					[
						[spr_null, 11, 0, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_balrog.crouch,
					[
						[spr_null, 6, 1, 0, 0, 0]
					]);

		#endregion

		#region mahin

			case( Animation_Group.mahin ):

			#region Sequence Enum 

				enum Sequence_mahin
				{
					idle,
					eating,
				}

			#endregion 

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_mahin.idle,
					[
						[spr_mahin, 0, 12, 0, 0, 0],
						[spr_null, 1, 12, 0, 0, 0],
						[spr_null, 2, 12, 0, 0, 0],
						[spr_null, 3, 12, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_mahin.eating,
					[
						[spr_null, 8, 8, 0, 0, 0],
						[spr_null, 9, 8, 0, 0, 0]
					]);

		#endregion

		#region pignon

			case( Animation_Group.pignon ):

			#region Sequence Enum 

				enum Sequence_pignon
				{
					sprite,
					idle,
					walk,
					hurt,
				}

			#endregion 

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_pignon.sprite,
					[
						[spr_pignonSmall, 0, 10, 0, 0, 0],
						[spr_pignonBig, 0, 10, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_pignon.idle,
					[
						[spr_null, 0, 100, 0, 0, 0],
						[spr_null, 1, 7, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_pignon.walk,
					[
						[spr_null, 2, 3, 0, 0, 0],
						[spr_null, 3, 5, 0, 0, 0],
						[spr_null, 0, 3, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_pignon.hurt,
					[
						[spr_null, 4, 0, 0, 0, 0]
					]);

		#endregion

		#region basil

			case( Animation_Group.basil ):

			#region Sequence Enum 

				enum Sequence_basil
				{
					moving,
				}

			#endregion 

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_basil.moving,
					[
						[spr_basil, 0, 3, 0, 0, 0],
						[spr_null, 1, 3, 0, 0, 0],
						[spr_null, 2, 3, 0, 0, 0]
					]);

		#endregion

		#region igor

			case( Animation_Group.igor ):

			#region Sequence Enum 

				enum Sequence_igor
				{
					sprite,
					idle,
					walk,
					hit,
					charge,
					fire,
					jump,
					squat,
					hurt,
					transform,
					fallOver,
				}

			#endregion 

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_igor.sprite,
					[
						[spr_igor, 0, 0, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_igor.idle,
					[
						[spr_null, 0, 7, 0, 0, 0],
						[spr_null, 1, 7, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_igor.walk,
					[
						[spr_null, 0, 5, 0, 0, 0],
						[spr_null, 2, 5, 0, 0, 0],
						[spr_null, 0, 5, 0, 0, 0],
						[spr_null, 3, 5, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_igor.hit,
					[
						[spr_null, 4, 10, 0, 0, 0],
						[spr_null, 5, 20, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_igor.charge,
					[
						[spr_null, 6, 1, 0, 0, 0],
						[spr_null, 7, 1, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_igor.fire,
					[
						[spr_null, 6, 0, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_igor.jump,
					[
						[spr_null, 8, 0, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_igor.squat,
					[
						[spr_null, 9, 0, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_igor.hurt,
					[
						[spr_null, 10, 0, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_igor.transform,
					[
						[spr_null, 10, 1, 0, 0, 0],
						[spr_null, 11, 1, 0, 0, 0]
					]);

				ds_map_add(ANIMATION_GROUP[? _group], 
					Sequence_igor.fallOver,
					[
						[spr_null, 11, 100, 0, 0, 0],
						[spr_null, 12, 50, 0, 0, 0],
						[spr_null, 13, 0, 0, 0, 0]
					]);

		#endregion

		}
	}


}
