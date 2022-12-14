function scr_collide_destructibles() //scr_collide_destructibles
{
    for (var i = 0; i < 2; i++)
    {
        var _obj_player = asset_get_index(concat("obj_player", (i + 1)))
        with (_obj_player)
        {
            if ((state == (92 << 0) && sprite_index == spr_playerN_noisebombspinjump) || state == (165 << 0) || state == (31 << 0) || state == (187 << 0) || state == (198 << 0) || (state == (58 << 0) && pogochargeactive == 1))
            {
                with (instance_place((x + xscale), y, obj_destructibles))
                {
                    GamepadSetVibration(0, 0.8, 0.8, 0.5)
                    instance_destroy()
                }
                with (instance_place(((x + hsp) + xscale), y, obj_destructibles))
                {
                    GamepadSetVibration(0, 0.8, 0.8, 0.5)
                    instance_destroy()
                }
                with (instance_place(x, ((y + vsp) + 1), obj_destructibles))
                {
                    GamepadSetVibration(0, 0.8, 0.8, 0.5)
                    instance_destroy()
                }
                with (instance_place(x, ((y + vsp) - 1), obj_destructibles))
                {
                    GamepadSetVibration(0, 0.8, 0.8, 0.5)
                    instance_destroy()
                }
                with (instance_place(x, (y + 1), obj_destructibles))
                {
                    GamepadSetVibration(0, 0.8, 0.8, 0.5)
                    instance_destroy()
                }
                with (instance_place(x, (y - 1), obj_destructibles))
                {
                    GamepadSetVibration(0, 0.8, 0.8, 0.5)
                    instance_destroy()
                }
            }
            if (state == (5 << 0))
            {
                with (instance_place((x + xscale), y, obj_rollblock))
                    instance_destroy()
            }
            if (state == (121 << 0) && sprite_index == spr_player_fightball)
            {
                with (instance_place((x + xscale), y, obj_fightballblock))
                    instance_destroy()
            }
            if (state == (193 << 0) && place_meeting((x + hsp), y, obj_gustavodestroyable))
            {
                with (instance_place((x + hsp), y, obj_gustavodestroyable))
                {
                    GamepadSetVibration(0, 0.8, 0.8, 0.5)
                    instance_destroy()
                }
            }
            if (state == (211 << 0) || state == (34 << 0) || ratmount_movespeed == 12 || state == (259 << 0) || state == (201 << 0) || state == (80 << 0) || state == (42 << 0) || state == (193 << 0) || state == (43 << 0) || state == (21 << 0) || state == (53 << 0) || state == (184 << 0) || state == (70 << 0) || state == (124 << 0) || state == (94 << 0) || state == (20 << 0) || sprite_index == spr_barrelroll || state == (41 << 0) || state == (121 << 0) || state == (47 << 0) || state == (65 << 0) || state == (38 << 0) || state == (48 << 0) || state == (5 << 0) || state == (19 << 0) || state == (153 << 0))
            {
                if place_meeting((x + hsp), y, obj_destructibles)
                {
                    if (character != "V")
                    {
                        with (instance_place((x + hsp), y, obj_destructibles))
                        {
                            GamepadSetVibration(0, 0.8, 0.8, 0.5)
                            instance_destroy()
                        }
                        if (state == (104 << 0))
                            machpunchAnim = 1
                    }
                }
            }
            if (state == (107 << 0) && thrown == 1)
            {
                if place_meeting((x - hsp), y, obj_destructibles)
                {
                    with (instance_place((x - hsp), y, obj_destructibles))
                    {
                        GamepadSetVibration(0, 0.8, 0.8, 0.5)
                        instance_destroy()
                    }
                }
            }
            if ((state == (47 << 0) || sprite_index == spr_lonegustavo_groundpoundstart || sprite_index == spr_lonegustavo_groundpound || state == (254 << 0) || state == (10 << 0) || state == (165 << 0) || state == (76 << 0) || state == (19 << 0) || (state == (54 << 0) && bombup_dir == 1)) && vsp > 0)
            {
                if place_meeting(x, (y + 1), obj_destructibles)
                {
                    with (instance_place(x, (y + 1), obj_destructibles))
                    {
                        GamepadSetVibration(0, 0.8, 0.8, 0.5)
                        instance_destroy()
                    }
                    if (state == (10 << 0) || state == (254 << 0))
                    {
                        with (instance_place(x, (y + 1), obj_tntblock))
                        {
                            GamepadSetVibration(0, 0.8, 0.8, 0.5)
                            instance_destroy()
                        }
                        if (vsp > -11)
                            vsp = -11
                        jumpstop = 0
                    }
                }
            }
			var num = instance_place_list(x, (y + 1), obj_destructibleplatform, global.instancelist, 0)
            for (var k = 0; k < num; k++)
            {
                with (ds_list_find_value(global.instancelist, k))
                {
                    falling = 1
                    if (falling == 1)
                        image_speed = 0.35
                }
            }
            ds_list_clear(global.instancelist)
            if (vsp <= 0.5 && (state == (92 << 0) || state == (192 << 0) || state == (121 << 0) || state == (104 << 0) || state == (265 << 0) || state == (58 << 0) || (state == (54 << 0) && bombup_dir == -1) || state == (80 << 0) || state == (37 << 0) || state == (9 << 0) || state == (97 << 0) || state == (22 << 0) || state == (121 << 0) || (state == (80 << 0) && (sprite_index == spr_player_breakdanceuppercut || sprite_index == spr_player_breakdanceuppercutend))))
            {
                var vy = -1
                if (state == (80 << 0) && (sprite_index == spr_player_breakdanceuppercut || sprite_index == spr_player_breakdanceuppercutend))
                    vy = vsp
                if place_meeting(x, (y + vy), obj_destructibles)
                {
                    with (instance_place(x, (y + vy), obj_destructibles))
                    {
                        GamepadSetVibration(0, 0.6, 0.6, 0.5)
                        instance_destroy()
                        with (other)
                        {
                            if (state != (97 << 0) && state != (80 << 0) && state != (37 << 0))
                                vsp = 0
                            if (state == (97 << 0))
                                vsp = -11
                        }
                    }
                }
            }
            if (vsp >= 0 && (state == (108 << 0) || state == (76 << 0) || state == (111 << 0) || state == (197 << 0) || (state == (165 << 0) && vsp >= 10)))
            {
                if place_meeting(x, ((y + vsp) + 2), obj_destructibles)
                {
                    with (instance_place(x, ((y + vsp) + 2), obj_destructibles))
                    {
                        with (_obj_player)
                        {
                            if place_meeting(x, ((y + vsp) + 2), obj_bigdestructibles)
                            {
                                var _inst = instance_place(x, ((y + vsp) + 2), obj_bigdestructibles)
                                if instance_exists(_inst)
                                {
                                    var j = 0
                                    var _max = 256
                                    while (!(place_meeting(x, (y + 1), obj_bigdestructibles)))
                                    {
                                        y += 1
                                        j++
                                        if (j >= _max)
                                            break
                                        else
                                            continue
                                    }
                                }
                                if (freefallsmash <= 10 && state != (165 << 0) && (!isgustavo))
                                {
                                    if (shotgunAnim == 0)
                                        sprite_index = spr_bodyslamland
                                    else
                                        sprite_index = spr_shotgunjump2
                                    state = (111 << 0)
                                    image_index = 0
                                }
                            }
                        }
                        instance_destroy()
                    }
                }
            }
            if (state == (108 << 0) || state == (111 << 0) || state == (165 << 0))
            {
                if (place_meeting(x, (y + 1), obj_metalblock) && (freefallsmash >= 10 || state == (165 << 0)))
                {
                    with (instance_place(x, (y + 1), obj_metalblock))
                        instance_destroy()
                }
            }
            if (state == (102 << 0) || state == (65 << 0) || state == (104 << 0) || state == (80 << 0))
            {
                with (obj_destructibles)
                {
                    if place_meeting((x - _obj_player.hsp), y, _obj_player)
                    {
                        var _destroyed = 0
                        with (_obj_player)
                        {
                            if (place_meeting((x + hsp), y, obj_bigdestructibles) && state != (102 << 0) && state != (104 << 0) && state != (65 << 0))
                            {
                                state = (6 << 0)
                                sprite_index = spr_player_lungehit
                                image_index = 0
                                instance_destroy(other)
                                _destroyed = 1
                            }
                            else if (other.object_index != obj_bigdestructibles)
                            {
                                instance_destroy(other)
                                _destroyed = 1
                            }
                            if (_destroyed && state == (43 << 0))
                                hit_connected = 1
                        }
                    }
                }
            }
        }
    }
    return;
}

