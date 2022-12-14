//fade in
if(fadein = true && fadealpha > 0)
    fadealpha -= .05
	
//fade out	
if(fadein = false && fadealpha < 1)
    fadealpha += .05
	
//check for if faded out completely and go to titlescreen if that's the case
if(fadein = false && fadealpha >= 1)
    scr_room_goto(Realtitlescreen)
