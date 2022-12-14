/// @desc 

if animationPalSprite != -1
{
	pal_swap_set(animationPalSprite, animationPalIndex, false);
	draw_self();
	pal_swap_reset();
}
else
{
	draw_self();
}