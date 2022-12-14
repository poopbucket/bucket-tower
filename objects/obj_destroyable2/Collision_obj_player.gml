if (other.state != (61 << 0) && other.state != (4 << 0) && other.state != (137 << 0) && other.state != (186 << 0))
    instance_destroy()
var val = heat_calculate(10)
if (other.object_index == obj_player1)
    global.collect += val
else
    global.collectN += val
create_collect(x, y, sprite_index)
with (instance_create((x + 16), y, obj_smallnumber))
    number = string(val)
