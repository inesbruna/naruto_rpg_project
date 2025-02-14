function scr_set_defaults_for_text(){
	line_break_pos[0, page_number] = 0;
	line_break_num[page_number] = 0;
	line_break_offset[page_number] = 0;
	
	txtb_spr[page_number] = spr_textbox;
	speaker_sprite[page_number] = noone;
	speaker_side[page_number] = 1;
}


/// @param text
/// @param [portrait]
///@param [side]
function scr_text(_text){
	scr_set_defaults_for_text();
	text[page_number] = _text;
	
	//get character info
	if argument_count > 1 {
		switch(argument[1]){
			
		case "Kakashi":
			speaker_sprite[page_number] = spr_kakashi_portrait_stance;
			txtb_spr[page_number] = spr_textbox;
		break;
		
		case "Kakashi Alert":
			speaker_sprite[page_number] = spr_kakashi_portrait_alert;
			txtb_spr[page_number] = spr_textbox;
		break;
		
		case "Kakashi Happy":
			speaker_sprite[page_number] = spr_kakashi_portrait_happy;
			txtb_spr[page_number] = spr_textbox;
		break;
		
		case "Sasuke":
			speaker_sprite[page_number] = spr_sasuke_portrait_stance;
			txtb_spr[page_number] = spr_textbox;
		break;
		
		case "Sasuke Angry":
			speaker_sprite[page_number] = spr_sasuke_portrait_angry;
			txtb_spr[page_number] = spr_textbox;
		break;
		
		case "Naruto Alert":
			speaker_sprite[page_number] = spr_naruto_portrait_alert;
			txtb_spr[page_number] = spr_textbox;
			speaker_side[page_number] = -1;
		break;
		
		}
	}
	//side the caracter is on
	if argument_count > 2{
		speaker_side[page_number] = argument[2];	
	}
	page_number++;
}

function scr_option(_option, _link_id){
	option[option_number] = _option;
	option_link_id[option_number] = _link_id;
	
	option_number++;
}

function create_textbox(_text_id){
	with (instance_create_depth(0, 0, -9999, obj_textbox)){
		scr_game_text(_text_id);	
	}
}