//Variables
global.showcollisions = false;
global.showhitboxes = false;

//Fonts
global.bigfont = font_add_sprite_ext(spr_font, "ABCDEFGHIJKLMNOPQRSTUVWXYZ!.1234567890:", 1, 0)
global.collectfont = font_add_sprite_ext(spr_font_collect, "0123456789", 1, 0)
global.combofont = font_add_sprite_ext(spr_font_combo, "0123456789/:", 1, 0)
global.combofont2 = font_add_sprite_ext(spr_tv_combobubbletext, "0123456789", 1, 0)
global.smallfont = font_add_sprite_ext(spr_smallerfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!._:?1234567890", 1, 0)
global.wartimerfont1 = font_add_sprite_ext(spr_wartimer_font1, "1234567890", 1, 0)
global.wartimerfont2 = font_add_sprite_ext(spr_wartimer_font2, "1234567890", 1, 0)

//Scripts
scr_toggleablegameoptions()
