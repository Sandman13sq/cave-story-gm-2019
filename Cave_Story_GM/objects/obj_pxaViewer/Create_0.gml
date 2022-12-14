/// @desc 

tileType = list_create();

tileset = 0;
tilesetMax = 0;

while (asset_get_type( tileset_get_name(tilesetMax) ) != asset_unknown)
{
	tilesetMax++;
}

drawColl = true;

copyBuffer = 0;

tileUnit = UNIT_PX;
tileWidth = 16;
tileCount = 256;

file = -1;
path = "";

select = 0;
current = 0;

doubleClick = false;

mouseMode = true;

x = 0;
y = 64;