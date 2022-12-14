/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for distance_to_pos

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2120
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2618
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|30_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2396
*/
switch state
{
    case 0:
        if (!global.panic)
        {
            visible = false
            instance_deactivate_object(baddieID)
            with (obj_baddiecollisionbox)
            {
                if (baddieID == other.baddieID)
                    instance_destroy()
            }
        }
        else
            state = 1
        break
    case 1:
        var p = instance_nearest(x, y, obj_player)
        visible = false
        image_index = 0
        if distance_to_pos(x, y, p.x, p.y, 500, 100)
        {
            state = 2
            visible = true
        }
        break
    case 2:
        if (floor(image_index) > 5)
        {
            instance_activate_object(baddieID)
            with (baddieID)
            {
                x = other.x
                y = other.y
                state = (138 << 0)
                sprite_index = stunfallspr
                stunned = 20
                boundbox = 0
                create_particle(x, y, (9 << 0))
            }
            state = 3
        }
        break
    case 3:
        if (floor(image_index) == (image_number - 1))
            visible = false
        break
}


