var accept_key = keyboard_check_pressed(vk_enter);

var textbox_x = 400;
var textbox_y = 600;

//setup
if setup == false{
	setup = true;

	//
	draw_set_font(fnt_textbox);
	draw_set_valign(fa_top)
	draw_set_halign(fa_left);
	
	//loop
	for(var p = 0; p < page_number; p++){
		text_length[p] = string_length(text[p]);
		
		text_x_offset[p] = 44;
	}
	
}
	
//typing text
if draw_char < text_length[page]{
	draw_char += text_spd;
	draw_char = clamp(draw_char, 0, text_length[page]);	
}

//flip through pages
if (accept_key){
	if (draw_char == text_length[page]){
		if (page < page_number-1){
			page++;
			draw_char = 0;
		}
		else{
			if (option_number > 0) {
				create_textbox(option_link_id[option_pos]);
			}
			instance_destroy();	
		}
	}
	else{
		draw_char = text_length[page];	
	}
}
	
//draw the textbox
var _txtb_x = textbox_x + text_x_offset[page];
var _txtb_y = textbox_y;
txtb_img += txtb_img_spd;
var txtb_spr_w = sprite_get_width(txtb_spr);
var txtb_spr_h = sprite_get_height(txtb_spr);
//back of the textbox
draw_sprite_ext(txtb_spr, txtb_img, _txtb_x, _txtb_y, textbox_width/txtb_spr_w, textbox_height/txtb_spr_h, 0, c_white, 1);

//options
if (draw_char == text_length[page] && page == page_number -1){
	
	//option selection
	option_pos += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
	option_pos = clamp(option_pos, 0, option_number-1);
	
	//draw the option
	var _op_space = 45;
	var _op_bord = 16;
	for (var op = 0; op < option_number; op++){
		//the option box
		var _o_w = string_width(option[op]) + _op_bord*2;
		draw_sprite_ext(txtb_spr, txtb_img, _txtb_x + 32, _txtb_y - _op_space*option_number + _op_space*op, _o_w/txtb_spr_w, (_op_space-1)/txtb_spr_h, 0, c_white, 1);
		
		//arrow
		if (option_pos == op){
			draw_sprite(spr_textbox_arrow, 0, _txtb_x, _txtb_y - _op_space*option_number + _op_space*op);	
		}
		
		//the option text
		draw_text(_txtb_x + 32 + _op_bord, _txtb_y - _op_space*option_number + _op_space*op + 2, option[op]);
	}
}

//draw the text
var _drawtext = string_copy(text[page], 1, draw_char);
draw_text_ext(textbox_x + text_x_offset[page] + border, textbox_y + border, _drawtext, line_sep, line_width);