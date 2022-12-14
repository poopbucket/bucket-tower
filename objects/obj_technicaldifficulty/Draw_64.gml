shader_set(global.Pal_Shader)

draw_sprite(spr_technicaldifficulty_bg, 0, 0, 0)
pal_swap_set(spr_peppalette, obj_player.paletteselect, 0)
draw_sprite(sprite, 0, 300, 352)
	
if use_static
	draw_sprite(spr_staticjumpscare, static_index, 0, 0)
shader_reset()
