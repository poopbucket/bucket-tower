/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for distance_to_pos

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2120
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2618
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|30_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2396
*/
function scr_hillbilly_idle() //scr_hillbilly_idle
{
    sprite_index = idlespr
    if ((global.monsterspeed >= 1 && point_in_camera(x, y, view_camera[0])) || distance_to_pos(x, y, playerinst.x, playerinst.y, 480, 270))
    {
        state = (141 << 0)
        image_xscale = (playerinst.x > x ? 1 : -1)
    }
    return;
}

function scr_hillbilly_chase() //scr_hillbilly_chase
{
    if (hsp != 0)
        sprite_index = chasespr
    else
        sprite_index = chasespr_idle
    hsp = Approach(hsp, (image_xscale * movespeed), accel)
    if (!(distance_to_pos(x, y, playerinst.x, playerinst.y, threshold_idle_x, threshold_idle_y)))
        state = (0 << 0)
    if (playerinst.x > (x - 16) && playerinst.x < (x + 16))
        hsp = 0
    dir = (playerinst.x > x ? 1 : -1)
    if (dir != image_xscale && playerinst.x > (x - slide_threshold_x) && playerinst.x < (x + slide_threshold_x))
    {
        state = (105 << 0)
        hsp = (image_xscale * movespeed)
    }
    return;
}

function scr_hillbilly_machslide() //scr_hillbilly_machslide
{
    sprite_index = skidspr
    if (abs(hsp) > 0)
    {
        if (hsp < 0.5)
            hsp += deccel
        else if (hsp > 0.5)
            hsp -= deccel
        else
            hsp = 0
    }
    else
    {
        image_xscale = (playerinst.x > x ? 1 : -1)
        state = (141 << 0)
    }
    return;
}

function scr_hillbilly_detect() //scr_hillbilly_detect
{
    hsp = 0
    sprite_index = idlespr
    var _col = collision_line(x, y, playerinst.x, playerinst.y, obj_solid, false, true)
    var _player_colX = (playerinst.x > (x - threshold_x) && playerinst.x < (x + threshold_x))
    var _player_colY = (playerinst.y > (y - threshold_y) && playerinst.y < (y + threshold_y))
    if (_col == -4 && _player_colX && _player_colY)
    {
        image_xscale = (playerinst.x > x ? 1 : -1)
        state = (141 << 0)
        sprite_index = chasespr
        image_index = 0
    }
    return;
}

function scr_hillbilly_destroyables() //scr_hillbilly_destroyables
{
    with (obj_woodenwalls)
    {
        if place_meeting((x - other.hsp), y, other.id)
            instance_destroy()
        if place_meeting(x, (y - other.vsp), other.id)
            instance_destroy()
    }
    return;
}

