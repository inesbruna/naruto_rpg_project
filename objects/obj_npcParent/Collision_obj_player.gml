var _s = id;

if(!instance_exists(obj_textbox) && keyboard_check_pressed(ord("Z"))){
	with(instance_create_depth(0,0, -999, obj_textbox)){
		scr_game_text(_s.text_id);
	}
}