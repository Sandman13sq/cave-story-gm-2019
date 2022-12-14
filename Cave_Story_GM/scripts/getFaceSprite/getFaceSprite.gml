/// @desc Returns sprite index of face sprite
function getFaceSprite() {

	var _spr;

	if GAME.datafaces
	{
		_spr = getBit(FLAGS_GM, GM_Flag.classicFaces)? 
			spr_faceAll_classic: GAME.datafaces;
	}
	else
	{
		_spr = spr_faceAll_classic;
	}

	return _spr;


}
