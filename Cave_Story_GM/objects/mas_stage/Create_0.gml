/// @desc 

enum Stage_Map
{
	grid,
	type,
	layerFG, foreground = Stage_Map.layerFG,
	layerBG, background = Stage_Map.layerBG,
	tilemapFG,
	tilemapBG,
	tileset,
}

enum Stage_Flag
{
	classic,
	horde,
	doom,
}

name = "";
caption = "";
index = 0;
music = 0;

tileLayerFG = -1;
tileLayerBG = -1;
collisionLayer = -1;

tilemapFG = -1;
tilemapBG = -1;

tileset = -1;

collType = [];
tileType = [];

stageLayerCount = 0;

collisionLayer = -1; // One Layer

flag = 0;

stageLayer = [];

// stageLayer_set()

/*
stage_background = 0;

enum stg
{
	tile,
	collision,
	properties,
	entities,
	script,
	
	conv_background = 0,
	conv_tileset,
	
}

nameConvention[stg.tile] = "";