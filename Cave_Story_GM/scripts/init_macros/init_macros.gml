/// Initializes macros for the game
function init_macros() {

#macro T true
#macro F false

#macro c_snes $262626

#macro KEY_PLUS 187
#macro KEY_MINUS 189

#macro SHAPE_CIRCLE_SIZE 128
#macro SHAPE_SQUARE_SIZE 31

#macro NUMSIZE 64
#macro MILLISECOND_TO_FRAME 1000 / 60

#macro GAME mas_game
#macro EVENT mas_event
#macro TEXT obj_text
#macro STAGE mas_stage

#macro SETTINGS_PATH "gameSettings.ini"

#macro PLAYER obj_player
#macro PLAYER_X (obj_player.x + obj_player.center_x)
#macro PLAYER_Y (obj_player.y + obj_player.center_y)
#macro MY_X (x + center_x)
#macro MY_Y (y + center_y)
#macro RADAR obj_player_radar

#macro ENTITY obj_entity
#macro SOURCE source

#macro COLLISION_DEPTH 9

#macro CAMERA Mas.camera

#macro VOLUME_MASTER audio_get_master_gain(0)
#macro VOLUME_BGM ( ((Mas.music).gameSound & FullMask._8) / 100 ) 
#macro VOLUME_SFX ( ((Mas.music).gameSound >> 8 & FullMask._8) / 100 )

#macro COLL_LAYER GAME.collision_layer
#macro COLL_TILEMAP GAME.collision_tilemap

#macro infinity $FFFFFFFF
#macro DNE infinity
#macro NULL undefined

#macro FPS 60
#macro UNIT_PX 32
#macro WAIT 50 / 50

#macro CAM_WIDTH_OFFSET mas_game.camWidthOffset

#macro TSC_BYTE_OFFSET 0x4C


}
