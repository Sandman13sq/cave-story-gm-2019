/// @desc 

var _perc = life / lifeMax;

x = lerp(target_x, xstart, _perc);
y = lerp(target_y, ystart, _perc);

radius = lerp(radiusMin, radiusMax, _perc);

//drawColor = color[round( _val * (lifeMax / array_length(color)) )];
//drawAlpha = alpha[round( _val * (lifeMax / array_length(alpha)) )];

if life > 0 {life--}
else
{
	instance_destroy();
}

