/// Returns appropriate sound for footstep;
/// @arg tile_index
function get_snd_footStep() {

	var _tile = argument[0];

	switch(_tile)
	{
		// Original Footstep
		default: return snd_footStep; break;
	
		// Metal
		case(0x48): return snd_footStep_metal; break;
	}


}
