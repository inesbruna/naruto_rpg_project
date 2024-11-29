/// @description Draw Self + Healthbar

//Healthbar
draw_healthbar(x-20, y-65, x+25, y-60, (hp/hpmax)*100, c_black, c_red, c_green, 0, true, true);

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

//Apparence
switch(state){
	case "free":
	if (state == "free"){
		head = headStance;
		hair = hairStance;
		clothing = clothingStance;
		eyes = eyesStance;
	}
	
	break;
	
	case "chase":
		head = headRunning;
		hair = hairRunning;
		clothing = clothingRunning;
		eyes = eyesRunning;
	break;
	
	case "chase_player":
		head = headRunning;
		hair = hairRunning;
		clothing = clothingRunning;
		eyes = eyesRunning;
	break;
	
	case "dead":
		head = headDead;
		hair = hairDead;
		clothing = clothingDead;
		eyes = noone;
	break;
	
	case "wait":
		if(lastState == "attack"){
			head = headAttack;
			hair = hairAttack;
			clothing = clothingAttack;
			eyes = eyesAttack;

		} else if(lastState == "hit"){
			head = headHit;
			hair = hairHit;
			clothing = clothingHit;
			eyes = noone;
		}
	break;
}

//Draw
if(transformation == 0){
	draw_sprite_ext(head, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
	draw_sprite_ext(hair, img_index, x, y-5, 1*(charDirection), 1, 0, global.hairColor, 1);
	draw_sprite_ext(clothing, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
	if(eyes != noone){
		draw_sprite_ext(eyes, img_index, x, y-5, 1*(charDirection), 1, 0, global.eyesColor, 1);
	}
}

//Jinchuuriki 1 Tail Transformation
if(transformation == 1){
	// Jinchuuriki Ears + Tail
	var anim = state;

	if(anim != "wait"){
		anim = state;
	} else {
		anim = lastState;
	}

	if(anim = "free"){
		var ears_x = offsets[$ anim].stance.ears[0];
		var ears_y = offsets[$ anim].stance.ears[1];
		var tail_x = offsets[$ anim].stance.tail[0];
		var tail_y = offsets[$ anim].stance.tail[1];
		
	} else if (anim = "chase" || anim = "chase_player") {
		anim = "free";
		
		var ears_x = offsets[$ anim].running.ears[0];
		var ears_y = offsets[$ anim].running.ears[1];
		var tail_x = offsets[$ anim].running.tail[0];
		var tail_y = offsets[$ anim].running.tail[1];
		
	} else if (anim = "attack"){
		anim = "combo";
		
		var ears_x = offsets[$ anim].combo1.ears[0];
		var ears_y = offsets[$ anim].combo1.ears[1];
		var tail_x = offsets[$ anim].combo1.tail[0];
		var tail_y = offsets[$ anim].combo1.tail[1];
		
	} else {
		var ears_x = offsets[$ anim].ears[0];
		var ears_y = offsets[$ anim].ears[1];
		var tail_x = offsets[$ anim].tail[0];
		var tail_y = offsets[$ anim].tail[1];
	}
	
	gpu_set_fog(true, jinchuuriki_color, 0, 0);
	draw_sprite_ext(spr_ears, img_index, x + ears_x*(charDirection), y + ears_y, 1*(charDirection), 1, 0, c_white, 0.5);
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