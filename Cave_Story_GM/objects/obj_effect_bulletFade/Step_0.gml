/// @desc 
//image_alpha = life / alarm[0];

color = merge_color(fadeColor[1], fadeColor[0], (life / lifeMax) );

image_xscale -= 0.05;
image_yscale -= 0.05;

depth++;

if life >= 0 {life--} else {instance_destroy()}