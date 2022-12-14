function scr_player_mach3() { //scr_player_mach3
	if (windingAnim < 2000)
		windingAnim++
	if place_meeting(x, (y + 1), obj_railparent)
	{
		var _railinst = instance_place(x, (y + 1), obj_railparent)
		railmovespeed = _railinst.movespeed
		raildir = _railinst.dir
	}
	hsp = ((xscale * movespeed) + (railmovespeed * raildir))
	if grounded
    {
		if global.slopemomentum = false
		{
			if (scr_slope() && hsp != 0 && movespeed > 10)
				scr_player_addslopemomentumold(0.1, 0.2)
		}
		else if global.slopemomentum = true
		{
			if (scr_slope() && hsp != 0)
				scr_player_addslopemomentum(0.1, 0.2, 11)
		}
	}
	if (move == xscale && grounded)
	{
		if (movespeed < 20)
		{
			if (mach4mode == 0)
				movespeed += 0.025
			else
				movespeed += 0.1
		}
	}
	mach2 = 100
	momemtum = 1
	move = (key_right + key_left)
	move2 = (key_right2 + key_left2)
	if ((fightball == 1) && (global.coop == 1))
	{
	    if (object_index == obj_player1)
	    {
	        x = obj_player2.x
	        y = obj_player2.y
	    }
	    if (object_index == obj_player2)
	    {
	        x = obj_player1.x
	        y = obj_player1.y
	    }
	}
	if (sprite_index == spr_crazyrun)
	{
		if (flamecloud_buffer > 0)
			flamecloud_buffer--
		else
		{
			flamecloud_buffer = 10
			with (instance_create(x, y, obj_dashcloud))
			{
				image_xscale = other.xscale
				sprite_index = spr_flamecloud
			}
		}
	}
	if (movespeed < 20)  //Comment this section out to gain the old speed momentum
	{
		if move == xscale
		{
			movespeed += 0.02
		}
	}					// Up to here btw
	crouchslideAnim = 1
	if ((!key_jump2) && ((jumpstop == 0) && (vsp < 0.5)))
	{
	    vsp /= 10
	    jumpstop = 1
	}
	if (grounded && (vsp > 0))
	    jumpstop = 0
	if ((input_buffer_jump < 8) && (grounded && ((!((move == 1) && (xscale == -1))) && (!((move == -1) && (xscale == 1))))))
	{
	    scr_soundeffect(sfx_jump)
	    if (sprite_index != spr_fightball)
	    {
	        image_index = 0
	        sprite_index = spr_mach3jump
	    }
	    if (character == "P")
	        vsp = -11
	    else
	        vsp = -13
	}
	if (fightball == 0)
	{
		if (sprite_index == spr_mach3jump && floor(image_index) == (image_number - 1))
			sprite_index = spr_mach4
		if (floor(image_index) == (image_number - 1) && (sprite_index == spr_rollgetup || sprite_index == spr_mach3hit || sprite_index == spr_dashpadmach))
			sprite_index = spr_mach4
		if (sprite_index == spr_mach2jump && grounded && vsp > 0)
			sprite_index = spr_mach4
		if (movespeed > 16 && sprite_index != spr_crazyrun && sprite_index != spr_player_Sjumpcancelstart && sprite_index != spr_taunt)
		{
			mach4mode = 1
			flash = 1
			sprite_index = spr_crazyrun
			with (create_debris(x, y, spr_slapstar))
			{
				hsp = random_range(-5, 5)
				vsp = random_range(-10, 10)
			}
		}
		else if (movespeed <= 16 && sprite_index == spr_crazyrun)
			sprite_index = spr_mach4
	}
	if ((sprite_index == spr_crazyrun) && (!instance_exists(crazyruneffectid)))
	{
	    with (instance_create(x, y, obj_crazyrunothereffect))
	    {
	        playerid = other.object_index
	        other.crazyruneffectid = id
	    }
	}
	if ((sprite_index == spr_mach4) || (sprite_index == spr_mach3jump) || (sprite_index == spr_fightball) || (sprite_index = spr_player_dashpad))
	    image_speed = 0.4
	if (sprite_index == spr_crazyrun)
	    image_speed = 0.75
	if ((sprite_index == spr_rollgetup) || (sprite_index == spr_mach3hit))
	    image_speed = 0.4
	if key_jump
	    input_buffer_jump = 0
	if (key_up && fightball == 0 && character == "P" && grounded && sprite_index != spr_dashpadmach && (!(place_meeting(x, y, obj_dashpad))))
	{
		sprite_index = spr_superjumpprep
		state = (99 << 0)
		hsp = 0
		image_index = 0
	}
	if (global.attackstyle == 2 && key_slap2)
	{
		randomize_animations([spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, 557, 556, 555, spr_punch])
		image_index = 0
		state = (43 << 0)
	}
	if ((((!key_attack) && (fightball == 0) && sprite_index != spr_player_dashpad) && (grounded && ((character == "P") || (character == "N")))) || (((character == "S") && (((move == 0) || (move != xscale)) && grounded)) && (fightball == 0)))
	{
	    sprite_index = spr_machslidestart
	    scr_soundeffect(sfx_break)
	    state = (105 << 0)
	    image_index = 0
	}
	if ((move == (-xscale)) && (grounded && sprite_index != spr_player_dashpad &&  (((character == "P") || (character == "N")) && (fightball == 0))))
	{
	    scr_soundeffect(sfx_machslideboost)
	    sprite_index = spr_mach3boost
	    state = (105 << 0)
	    image_index = 0
	}
	if (key_down && ((fightball == 0) && (!place_meeting(x, y, obj_dashpad))))
	{
	    with (instance_create(x, y, obj_jumpdust))
	        image_xscale = other.xscale
	    flash = 0
        flash = 0
        state = (5 << 0)
        vsp = 10
        image_index = 0
        if (!grounded)
            sprite_index = spr_dive
        else
            sprite_index = spr_player_machroll
	}
	if (key_slap2 && (!((shotgunAnim == 1) && key_up)))
	{
	    alarm[8] = 60
		flash = 1
	    suplexmove = 1
	    suplexdashsnd = audio_play_sound(sfx_suplexdash, 1, false)
		sfx_gain(suplexdashsnd)
	    state = (42 << 0)
	    image_index = 0
	    if (shotgunAnim == 0)
	        sprite_index = spr_suplexdash
	    else
	        sprite_index = spr_shotgunsuplexdash
	}
	if (((!grounded) && (place_meeting((x + hsp), y, obj_solid) || scr_solid_slope((x + hsp), y)) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting((x + hsp), y, obj_mach3solid))) && (!(place_meeting((x + hsp), y, obj_metalblock)))) || (grounded && (place_meeting((x + sign(hsp)), (y - 16), obj_solid) || scr_solid_slope((x + sign(hsp)), (y - 16))) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting((x + hsp), y, obj_mach3solid))) && (!(place_meeting((x + hsp), y, obj_metalblock))) && place_meeting(x, (y + 1), obj_slope)))
	{
		wallspeed = movespeed
		if (vsp > 0)
			wallspeed -= vsp
		state = (37 << 0)
	}
	if ((!grounded) && place_meeting((x + sign(hsp)), y, obj_climbablewall) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))) && (!(place_meeting((x + sign(hsp)), y, obj_metalblock))))
	{
		wallspeed = movespeed
		state = (37 << 0)
	}
	if ((scr_solid((x + 1), y) && (xscale == 1)) && ((!scr_slope()) && ((!place_meeting((x + sign(hsp)), y, obj_slope)) && ((!place_meeting((x + sign(hsp)), y, obj_metalblock)) && ((!place_meeting((x + sign(hsp)), y, obj_destructibles)) && (grounded || (fightball == 1)))))))
	{
	    if (fightball == 0)
	    {
	        sprite_index = spr_hitwall
	        scr_soundeffect(sfx_groundpound)
	        scr_soundeffect(sfx_bumpwall)
	        with (obj_camera)
	        {
	            shake_mag = 20
	            shake_mag_acc = (40 / room_speed)
	        }
	        hsp = 0
	        image_speed = 0.35
	        with (obj_baddie)
	        {
	            if point_in_rectangle(x, y, __view_get(0, 0), __view_get(1, 0), (__view_get(0, 0) + __view_get(2, 0)), (__view_get(1, 0) + __view_get(3, 0)))
	            {
	                stun = 1
	                alarm[0] = 200
	                ministun = 0
	                vsp = -5
	                hsp = 0
	            }
	        }
	        flash = 0
	        state = (106 << 0)
	        hsp = -4.5
	        vsp = -6
	        mach2 = 0
	        image_index = 0
	        instance_create((x + 10), (y + 10), obj_bumpeffect)
	    }
	    else if (fightball == 1)
	    {
	        with (obj_player)
	        {
	            sprite_index = spr_hitwall
	            scr_soundeffect(sfx_groundpound)
	            scr_soundeffect(sfx_bumpwall)
	            with (obj_camera)
	            {
	                shake_mag = 20
	                shake_mag_acc = (40 / room_speed)
	            }
	            hsp = 0
	            image_speed = 0.35
	            with (obj_baddie)
	            {
	                if point_in_rectangle(x, y, __view_get(0, 0), __view_get(1, 0), (__view_get(0, 0) + __view_get(2, 0)), (__view_get(1, 0) + __view_get(3, 0)))
	                {
	                    stun = 1
	                    alarm[0] = 200
	                    ministun = 0
	                    vsp = -5
	                    hsp = 0
	                }
	            }
	            flash = 0
	            state = (106 << 0)
	            hsp = -2.5
	            vsp = -3
	            mach2 = 0
	            image_index = 0
	            instance_create((x + 10), (y + 10), obj_bumpeffect)
	        }
	        fightball = 0
	    }
	}
	if ((scr_solid((x - 1), y) && (xscale == -1)) && ((!scr_slope()) && ((!place_meeting((x + sign(hsp)), y, obj_slope)) && ((!place_meeting((x + sign(hsp)), y, obj_metalblock)) && ((!place_meeting((x + sign(hsp)), y, obj_destructibles)) && (grounded || (fightball == 1)))))))
	{
	    if (fightball == 0)
	    {
	        sprite_index = spr_hitwall
	        scr_soundeffect(sfx_groundpound)
	        scr_soundeffect(sfx_bumpwall)
	        with (obj_camera)
	        {
	            shake_mag = 20
	            shake_mag_acc = (40 / room_speed)
	        }
	        hsp = 0
	        image_speed = 0.35
	        with (obj_baddie)
	        {
	            if point_in_rectangle(x, y, __view_get(0, 0), __view_get(1, 0), (__view_get(0, 0) + __view_get(2, 0)), (__view_get(1, 0) + __view_get(3, 0)))
	            {
	                stun = 1
	                alarm[0] = 200
	                ministun = 0
	                vsp = -5
	                hsp = 0
	            }
	        }
	        flash = 0
	        state = (106 << 0)
	        hsp = 4.5
	        vsp = -6
	        mach2 = 0
	        image_index = 0
	        instance_create((x - 10), (y + 10), obj_bumpeffect)
	    }
	    else if (fightball == 1)
	    {
	        with (obj_player)
	        {
	            sprite_index = spr_hitwall
	            scr_soundeffect(sfx_groundpound)
	            scr_soundeffect(sfx_bumpwall)
	            with (obj_camera)
	            {
	                shake_mag = 20
	                shake_mag_acc = (40 / room_speed)
	            }
	            hsp = 0
	            image_speed = 0.35
	            with (obj_baddie)
	            {
	                if point_in_rectangle(x, y, __view_get(0, 0), __view_get(1, 0), (__view_get(0, 0) + __view_get(2, 0)), (__view_get(1, 0) + __view_get(3, 0)))
	                {
	                    stun = 1
	                    alarm[0] = 200
	                    ministun = 0
	                    vsp = -5
	                    hsp = 0
	                }
	            }
	            flash = 0
	            state = (106 << 0)
	            hsp = -2.5
	            vsp = -3
	            mach2 = 0
	            image_index = 0
	            instance_create((x + 10), (y + 10), obj_bumpeffect)
	        }
	        fightball = 0
	    }
	}
	if ((!instance_exists(dashcloudid)) && (grounded))
	{
	    with (instance_create(x, y, obj_superdashcloud))
	    {
			if (other.fightball == 1)
			{
				instance_create(obj_player.x, obj_player.y, obj_slapstar)
			}
	        image_xscale = other.xscale
	        other.dashcloudid = id
	    }
	}
	scr_dotaunt()
	if (!instance_exists(chargeeffectid))
	{
	    with (instance_create(x, y, obj_chargeeffect))
	    {
	        playerid = other.object_index
	        other.chargeeffectid = id
	    }
	}
}
