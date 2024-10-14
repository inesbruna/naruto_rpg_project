var accept_key = keyboard_check_pressed(ord("Z"));

var textbox_x = 400;
var textbox_y = 600;

//setup
if setup == false{
	setup = true;
	draw_set_font(fnt_textbox);
	draw_set_valign(fa_top)
	draw_set_halign(fa_left);
	
	//loop
	for(var p = 0; p < page_number; p++){
		text_length[p] = string_length(text[p]);
		
		//get the x position for the textbox
		//character on the left
		if speaker_side[p] == 1{
			text_x_offset[p] = 80;
			portrait_x_offset[p] = 8;
		}
		
		//character on the right
		if speaker_side[p] == -1 {
			text_x_offset[p] = 8;
			portrait_x_offset[p] = 1050;
		}
		
		//no character (center the textbox)
		if speaker_sprite[p] == noone {
			text_x_offset[p] = 44;
		}
		
		//setting individual characters and finding where the lines of text should break
		for (var c = 0; c < text_length[p]; c++){
			var _char_pos = c+1;
	
			//store individual characters in the "char" array
			char[c, p] = string_char_at(text[p], _char_pos);
	
			//get current width of the line
			var _txt_up_to_char = string_copy(text[p], 1, _char_pos);
			var _current_txt_w = string_width(_txt_up_to_char) - string_width(char[c, p]);
	
			//get the last free space
			if char[c, p] == " " { last_free_space = _char_pos+1 };
	
			//get the line breaks
			if _current_txt_w - line_break_offset[p] > line_width{
				line_break_pos[line_break_num[p], p] = last_free_space;
				line_break_num[p]++;
				var _txt_up_to_last_space = string_copy(text[p], 1, last_free_space);
				var _last_free_space_string = string_char_at(text[p], last_free_space);
				line_break_offset[p] = string_width(_txt_up_to_last_space) - string_width(_last_free_space_string);
			}
		}
		
		//getting each character coordinates
		for (var c = 0; c < text_length[p]; c++){
			var _char_pos = c+1;
			var _txt_x = textbox_x + text_x_offset[p] + border;
			var _txt_y = textbox_y + border;
			//get current width of the line
			var _txt_up_to_char = string_copy(text[p], 1, _char_pos);
			var _current_txt_w = string_width(_txt_up_to_char) - string_width(char[c, p]);
			var _txt_line = 0;
			
			//compensate for string breaks
			for (var lb = 0; lb < line_break_num[p]; lb++){
				//if the current looping character is after a line break
				if _char_pos >= line_break_pos[lb, p]{
					var _str_copy = string_copy(text[p], line_break_pos[lb, p], _char_pos-line_break_pos[lb, p]);
					_current_txt_w = string_width(_str_copy);
					
					//record the "Line" this character should be on
					_txt_line = lb+1; //+1 since lb starts at 0
				}
			}
			
			//add to the x and y coordinates base on the new info
			char_x[c, p] = _txt_x + _current_txt_w;
			char_y[c, p] = _txt_y + _txt_line*line_sep;
			
		}
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
var txtb_spr_w = sprite_get_width(txtb_spr[page]);
var txtb_spr_h = sprite_get_height(txtb_spr[page]);
//draw the speaker
if speaker_sprite[page] != noone {
	sprite_index = speaker_sprite[page];
	if draw_char == text_length[page] { image_index = 0 };
	var _speaker_x = textbox_x + portrait_x_offset[page];
	if speaker_side[page] == -1 { _speaker_x += sprite_width }
	//draw the speaker
	draw_sprite_ext(txtb_spr[page], txtb_img, textbox_x + portrait_x_offset[page] - 200 , textbox_y, sprite_width/txtb_spr_w, sprite_height/txtb_spr_h, 0, c_white, 1);
	draw_sprite_ext(sprite_index, image_index, _speaker_x - 200, textbox_y, speaker_side[page], 1, 0, c_white, 1);
}

//back of the textbox
draw_sprite_ext(txtb_spr[page], txtb_img, _txtb_x, _txtb_y, textbox_width/txtb_spr_w, textbox_height/txtb_spr_h, 0, c_white, 1);

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
		draw_sprite_ext(txtb_spr[page], txtb_img, _txtb_x + 32, _txtb_y - _op_space*option_number + _op_space*op, _o_w/txtb_spr_w, (_op_space-1)/txtb_spr_h, 0, c_white, 1);
		
		//arrow
		if (option_pos == op){
			draw_sprite(spr_textbox_arrow, 0, _txtb_x, _txtb_y - _op_space*option_number + _op_space*op);	
		}
		
		//the option text
		draw_text(_txtb_x + 32 + _op_bord, _txtb_y - _op_space*option_number + _op_space*op + 2, option[op]);
	}
}

//draw the text
for(var c=0;c<draw_char ;c++){
	draw_text(char_x[c, page], char_y[c, page], char[c, page]);
}