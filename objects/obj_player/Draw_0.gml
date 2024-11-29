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

// Ears & Tail Coordinates
var ears_x = x-(1*charDirection);
var ears_y = y-56;

var tail_x = x-(15*charDirection);
var tail_y = y-15;

switch(state){
	case "free":
		if ((keyboard_check(vk_left)) || ((keyboard_check(vk_right))) && (grounded)){
			if(img_index < 2){
				// Ears 1 Tail
				ears_x = x-(6*charDirection);
				ears_y = y-35;
			} else if (img_index >= 2 && img_index <= 3) {
				// Ears 1 Tail
				ears_x = x+(3*charDirection);
				ears_y = y-35;	
			} else if (img_index > 3 && img_index <= 4) {
				// Ears 1 Tail
				ears_x = x+(7*charDirection);
				ears_y = y-35;
			} else if (img_index > 4 && img_index <= 5) {
				// Ears 1 Tail
				ears_x = x+(7*charDirection);
				ears_y = y-30;
			} else if (img_index > 5 && img_index <= 6) {
				// Ears 1 Tail
				ears_x = x+(3*charDirection);
				ears_y = y-30;
			} else if (img_index > 6 && img_index <= 7) {
				// Ears 1 Tail
				ears_x = x-(4*charDirection);
				ears_y = y-30;
			}
			
			// Cauda
			tail_x = x-(25*charDirection);
			tail_y = y-10;
		} else {
			// Orelhas
			ears_x = x-(5*charDirection);
			ears_y = y-20;
		
			// Cauda
			tail_x = x-(25*charDirection);
			tail_y = y-10;
		}
	break;
	
	case "jumping":
		ears_x = x+(4*charDirection);
		ears_y = y-59;
	break;
	
	case "falling":
		ears_x = x+(4*charDirection);
		ears_y = y-59;
	break;
	
	case "transform":
		if(img_index < 1){
			ears_x = x+(2*charDirection);
			ears_y = y-45;
		} else {
			ears_x = x+(18*charDirection);
			ears_y = y-18;
				
			tail_x = x-(10*charDirection);
			tail_y = y-10;
		}
	break;
}


//Character
if(transformation == 0){
	//Draw
	draw_sprite_ext(head, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
	draw_sprite_ext(hair, img_index, x, y-5, 1*(charDirection), 1, 0, global.hairColor, 1);
	draw_sprite_ext(clothing, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
	if(eyes != noone){
		draw_sprite_ext(eyes, img_index, x, y-5, 1*(charDirection), 1, 0, global.eyesColor, 1);
	}
}

//Jinchuuriki 1 Tail Transformation
if(transformation == 1){
	
	gpu_set_fog(true, jinchuuriki_color, 0, 0);
	draw_sprite_ext(spr_ears, img_index, ears_x, ears_y, 1*(charDirection), 1, 0, c_white, 0.5);
	draw_sprite_ext(spr_tail, img_index, tail_x, tail_y, 1*(charDirection), 1, 0, c_white, 0.5);
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