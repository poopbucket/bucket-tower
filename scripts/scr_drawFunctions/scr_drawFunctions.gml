/// @function draw_sprite_ext_flash
/// @param sprite
/// @param subimg
/// @param x 
/// @param y
/// @param xscale
/// @param yscale
/// @param rot
/// @param col
/// @param alpha
function draw_sprite_ext_flash(spr, ind, xx, yy, xsc, ysc, ang, col, alp) {
	gpu_set_fog(true, col, 0, 1);
    draw_sprite_ext(spr, ind, xx, yy, xsc, ysc, ang, col, alp);
    gpu_set_fog(false, c_black, 0, 0);
    return;
}