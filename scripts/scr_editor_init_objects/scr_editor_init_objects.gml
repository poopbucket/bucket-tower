function scr_editor_init_objects() //scr_editor_init_objects
{
    add_object(0, "SOLID", spr_wall, 312, 16, 16)
    add_object(0, "PLATFORM", spr_baddie, 504, 16, 16)
    add_object(0, "SLOPE", spr_slope, 311, 16, 16)
    add_object(1, "CHEESESLIME", spr_slimemove, 431, 32, 32)
    add_object(1, "FORKNIGHT", spr_forknight_idle, 465, 32, 32)
    return;
}

