/// @desc 

if life > 0 {life--}
else {instance_destroy()}

var _perc = (lifeMax - life) / lifeMax;

color = merge_color(colorStart, colorEnd, _perc);

image_index = _perc * (image_number - 1);