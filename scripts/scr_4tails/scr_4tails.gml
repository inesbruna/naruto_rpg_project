function scr_4tails(){
	var anim = state;

	if(anim != "wait"){
		anim = state;
	} else {
		anim = lastState;
	}
	 
	if(anim = "free"){
		image_speed = 0.15;
		
		if(keyboard_check(vk_left) || keyboard_check(vk_right) && grounded){
			draw_sprite_ext(spr_4Tails_running, -1, x, y, 1*(charDirection), 1, 0, jinchuuriki_color, 1);
		} else {
			draw_sprite_ext(spr_4Tails_stance, -1, x, y, 1*(charDirection), 1, 0, jinchuuriki_color, 1);
		
		}
	} else if (anim = "jumping"){
		draw_sprite_ext(spr_4Tails_jumping, -1, x, y, 1*(charDirection), 1, 0, jinchuuriki_color, 1);
	} else if (anim = "falling"){
		draw_sprite_ext(spr_4Tails_falling, -1, x, y, 1*(charDirection), 1, 0, jinchuuriki_color, 1);
	} else if (anim = "combo"){
		image_speed = 0.2;
		
		if(comboCounter == 0){
			draw_sprite_ext(spr_4Tails_combo1, -1, x, y, 1*(charDirection), 1, 0, jinchuuriki_color, 1);
		} else if (comboCounter == 1){
			draw_sprite_ext(spr_4Tails_combo2, -1, x, y, 1*(charDirection), 1, 0, jinchuuriki_color, 1);
		} else {
			draw_sprite_ext(spr_4Tails_combo3, -1, x, y, 1*(charDirection), 1, 0, jinchuuriki_color, 1);
		}
	} else if (anim = "hit"){
		draw_sprite_ext(spr_4Tails_hit, -1, x, y, 1*(charDirection), 1, 0, jinchuuriki_color, 1);
	} else if (anim = "charge"){
		draw_sprite_ext(spr_4Tails_charging, -1, x, y, 1*(charDirection), 1, 0, jinchuuriki_color, 1);
	} else if (anim = "defense"){
		draw_sprite_ext(spr_4Tails_defense, -1, x, y, 1*(charDirection), 1, 0, jinchuuriki_color, 1);
	}
}