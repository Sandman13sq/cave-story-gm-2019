/// @desc Draws a four-sided polygon
/// @arg x1,y1,x2,y2,x3,y3,x4,y4
function draw_polygon_4side() {

	draw_triangle(
		argument[0], argument[1],
		argument[2], argument[3],
		argument[4], argument[5],
		0);
	
	draw_triangle(
		argument[4], argument[5],
		argument[6], argument[7],
		argument[0], argument[1],
		0);


}
