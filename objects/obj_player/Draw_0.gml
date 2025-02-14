/// @description Animations

//Set Speed
if(state == "wait" && lastState == "combo"){
	img_speed = 7;	
} else {
	img_speed = 8;	
}

// Get image_number
total_frames = sprite_get_number(head);

//Image Index
img_index = ++img_frame div img_speed;

//Reset img_frame
if (img_index > total_frames - 1) { //End animation
	if(state == "wait" && lastState == "jutsuSpit"){
		img_index = total_frames - 2; //Return 2 frames
		
		//Update image frame
		img_frame = img_index * img_speed;
	} else {
		img_frame = 0;
		//Update image index
		img_index = img_frame div img_speed;
	}
}

if (room != character_creator){
	//Character
	if(transformation == 0){
		if(state = "wait" && (lastState = "transform" || lastState = "detransform" )){
			//Draw
			draw_sprite_ext(clothing, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
			draw_sprite_ext(head, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
			if(eyes != noone){
				draw_sprite_ext(eyes, img_index, x, y-5, 1*(charDirection), 1, 0, global.eyesColor, 1);
			}
			draw_sprite_ext(hair, img_index, x, y-5, 1*(charDirection), 1, 0, global.hairColor, 1);
		} else {
			//Draw
			draw_sprite_ext(head, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
			if(eyes != noone){
				draw_sprite_ext(eyes, img_index, x, y-5, 1*(charDirection), 1, 0, global.eyesColor, 1);
			}
			draw_sprite_ext(hair, img_index, x, y-5, 1*(charDirection), 1, 0, global.hairColor, 1);
			draw_sprite_ext(clothing, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
		}
	} 


	//Jinchuuriki 1 Tail Transformation
	if(transformation == 1){
		// Jinchuuriki Ears + Tail
		var anim = state;
		var _ears = spr_ears;

		if(anim != "wait"){
			anim = state;
		} else {
			anim = lastState;
		}

		if(anim = "free"){
			if(keyboard_check(vk_left) || keyboard_check(vk_right) && grounded){
				_ears = spr_ears_running;
			
				var ears_x = offsets[$ anim].running.ears[0];
				var ears_y = offsets[$ anim].running.ears[1];
				var tail_x = offsets[$ anim].running.tail[0];
				var tail_y = offsets[$ anim].running.tail[1];
			} else {
				var ears_x = offsets[$ anim].stance.ears[0];
				var ears_y = offsets[$ anim].stance.ears[1];
				var tail_x = offsets[$ anim].stance.tail[0];
				var tail_y = offsets[$ anim].stance.tail[1];
			}
		} else if (anim = "combo"){
			if(comboCounter == 0){
				var ears_x = offsets[$ anim].combo1.ears[0];
				var ears_y = offsets[$ anim].combo1.ears[1];
				var tail_x = offsets[$ anim].combo1.tail[0];
				var tail_y = offsets[$ anim].combo1.tail[1];
			} else if (comboCounter == 1){
				var ears_x = offsets[$ anim].combo2.ears[0];
				var ears_y = offsets[$ anim].combo2.ears[1];
				var tail_x = offsets[$ anim].combo2.tail[0];
				var tail_y = offsets[$ anim].combo2.tail[1];
			} else {
				var ears_x = offsets[$ anim].combo3.ears[0];
				var ears_y = offsets[$ anim].combo3.ears[1];
				var tail_x = offsets[$ anim].combo3.tail[0];
				var tail_y = offsets[$ anim].combo3.tail[1];
			}
		} else {
			var ears_x = offsets[$ anim].ears[0];
			var ears_y = offsets[$ anim].ears[1];
			var tail_x = offsets[$ anim].tail[0];
			var tail_y = offsets[$ anim].tail[1];
		}
	
		if(state = "wait" && (lastState = "transform" || lastState = "detransform" )){
			draw_sprite_ext(clothing, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
	
			gpu_set_fog(true, jinchuuriki_color, 0, 0);
			draw_sprite_ext(clothing, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 0.5);
			gpu_set_fog(false, jinchuuriki_color, 0, 0);
	
			gpu_set_fog(true, jinchuuriki_color, 0, 0);
			draw_sprite_ext(_ears, img_index, x + ears_x*(charDirection), y + ears_y, 1*(charDirection), 1, 0, c_white, 0.5);
			draw_sprite_ext(spr_tail, img_index, x + tail_x*(charDirection), y + tail_y, 1*(charDirection), 1, 0, c_white, 0.5);
			gpu_set_fog(false, jinchuuriki_color, 0, 0);
	
			draw_sprite_ext(head, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
	
			gpu_set_fog(true, jinchuuriki_color, 0, 0);
			draw_sprite_ext(head, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 0.5);
			gpu_set_fog(false, jinchuuriki_color, 0, 0);
	
			draw_sprite_ext(hair, img_index, x, y-5, 1*(charDirection), 1, 0, global.hairColor, 1);
	
			gpu_set_fog(true, jinchuuriki_color, 0, 0);
			draw_sprite_ext(hair, img_index, x, y-5, 1*(charDirection), 1, 0, global.hairColor, 0.5);
			gpu_set_fog(false, jinchuuriki_color, 0, 0);
	
			if(eyes != noone){
				draw_sprite_ext(eyes, img_index, x, y-5, 1*(charDirection), 1, 0, global.eyesColor, 1);
			}
	
			gpu_set_fog(true, jinchuuriki_color, 0, 0);
			if(eyes != noone){
				draw_sprite_ext(eyes, img_index, x, y-5, 1*(charDirection), 1, 0, global.eyesColor, 1);
			}
			gpu_set_fog(false, jinchuuriki_color, 0, 0);
		
		} else {
			gpu_set_fog(true, jinchuuriki_color, 0, 0);
			draw_sprite_ext(_ears, img_index, x + ears_x*(charDirection), y + ears_y, 1*(charDirection), 1, 0, c_white, 0.5);
			draw_sprite_ext(spr_tail, img_index, x + tail_x*(charDirection), y + tail_y, 1*(charDirection), 1, 0, c_white, 0.5);
			gpu_set_fog(false, jinchuuriki_color, 0, 0);
	
			draw_sprite_ext(head, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
	
			gpu_set_fog(true, jinchuuriki_color, 0, 0);
			draw_sprite_ext(head, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 0.5);
			gpu_set_fog(false, jinchuuriki_color, 0, 0);
	
			draw_sprite_ext(hair, img_index, x, y-5, 1*(charDirection), 1, 0, global.hairColor, 1);
	
			gpu_set_fog(true, jinchuuriki_color, 0, 0);
			draw_sprite_ext(hair, img_index, x, y-5, 1*(charDirection), 1, 0, global.hairColor, 0.5);
			gpu_set_fog(false, jinchuuriki_color, 0, 0);
	
			draw_sprite_ext(clothing, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
	
			gpu_set_fog(true, jinchuuriki_color, 0, 0);
			draw_sprite_ext(clothing, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 0.5);
			gpu_set_fog(false, jinchuuriki_color, 0, 0);
	
			if(eyes != noone){
				draw_sprite_ext(eyes, img_index, x, y-5, 1*(charDirection), 1, 0, global.eyesColor, 1);
			}
	
			gpu_set_fog(true, jinchuuriki_color, 0, 0);
			if(eyes != noone){
				draw_sprite_ext(eyes, img_index, x, y-5, 1*(charDirection), 1, 0, global.eyesColor, 1);
			}
			gpu_set_fog(false, jinchuuriki_color, 0, 0);
		}
	}

	if(transformation == 2){
		// Jinchuuriki 4 Tails
		scr_4tails();
	}

	//FX
	if(state == "charge"){
		draw_sprite(spr_chakra, img_index, x, y); //Effect
	}

	if(state == "wait" && (lastState == "transform" || lastState == "detransform")){
		draw_sprite_ext(spr_transform, img_index, x, y, 1, 1, 0, c_white, 1); //Effect
	}

	if (transformation == 1 || transformation == 2){
		draw_sprite_ext(spr_effects, img_index, x, y, 1*(charDirection), 1, 0, jinchuuriki_color, 1); //Effect
	}
}