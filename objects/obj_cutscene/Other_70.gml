var _type = async_load[? "type"];

if (_type == "video_start")
{
    display_video = true;
}
else if (_type == "video_end")
{
    display_video = false;
    instance_create_depth(0, 0, -999999, obj_fade);
	video_close();
	room_goto(menu);
}