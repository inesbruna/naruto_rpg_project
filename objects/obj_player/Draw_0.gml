/// @description Animations
//Set Speed
if(state == "wait" && lastState == "combo"){
	img_speed = 7;	
} else {
	img_speed = 8;	
}

// Get image_number
switch (state){
	case "free":
		if ((keyboard_check(vk_left)) || ((keyboard_check(vk_right))) && grounded){
			total_frames = sprite_get_number(headRunning);
		} else {
			total_frames = sprite_get_number(headStance);
		}
	break;
	
	case "jumping":
		total_frames = sprite_get_number(headJumping);
	break;
	
	case "falling":
		total_frames = sprite_get_number(headFalling);
	break;
	
	case "hit":
		total_frames = sprite_get_number(headHit);
	break;
	
	case "dead":
		total_frames = sprite_get_number(headDead);
	break;
	
	case "defense":
		total_frames = sprite_get_number(headDefense);
	break;
		
	case "charge":
		total_frames = sprite_get_number(headChargingChakra);
	break;
	
	case "wait":
		switch(lastState){
			case "combo":
				if(comboCounter == 1){
					total_frames = sprite_get_number(headCombo1);
				} else if (comboCounter == 2){
					total_frames = sprite_get_number(headCombo2);
				} else {
					total_frames = sprite_get_number(headCombo3);
				}
			break;
			
			case "hit":
				total_frames = sprite_get_number(headHit);
			break;
			
			case "down":
				total_frames = sprite_get_number(headPickup);
			break;
			
			case "clon":
				total_frames = sprite_get_number(headChargingChakra);
			break;
			
			case "throw":
				total_frames = sprite_get_number(headThrow);
			break;
			
			case "jutsuSpit":
				total_frames = sprite_get_number(headJutsuSpit);
			break;
			
			case "jumpJutsuSpit":
				total_frames = sprite_get_number(headJumpJutsuSpit);
			break;
		}
	break;
}

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

switch(state){
	case "free":
	//Run Animation
	if ((keyboard_check(vk_left)) || ((keyboard_check(vk_right))) && grounded){
		draw_sprite_ext(headRunning, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
		draw_sprite_ext(hairRunning, img_index, x, y-5, 1*(charDirection), 1, 0, global.hairColor, 1);
		draw_sprite_ext(clothingRunning, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
		draw_sprite_ext(eyesRunning, img_index, x, y-5, 1*(charDirection), 1, 0, global.eyesColor, 1);
	} else {	
		draw_sprite_ext(headStance, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
		draw_sprite_ext(hairStance, img_index, x, y-5, 1*(charDirection), 1, 0, global.hairColor, 1);
		draw_sprite_ext(clothingStance, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
		draw_sprite_ext(eyesStance, img_index, x, y-5, 1*(charDirection), 1, 0, global.eyesColor, 1);
	}
	
	break;
	
	case "jumping":
		draw_sprite_ext(headJumping, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
		draw_sprite_ext(hairJumping, img_index, x, y-5, 1*(charDirection), 1, 0, global.hairColor, 1);
		draw_sprite_ext(clothingJumping, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
		draw_sprite_ext(eyesJumping, img_index, x, y-5, 1*(charDirection), 1, 0, global.eyesColor, 1);
	break;
	
	case "falling":
		draw_sprite_ext(headFalling, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
		draw_sprite_ext(hairFalling, img_index, x, y-5, 1*(charDirection), 1, 0, global.hairColor, 1);
		draw_sprite_ext(clothingFalling, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
		draw_sprite_ext(eyesFalling, img_index, x, y-5, 1*(charDirection), 1, 0, global.eyesColor, 1);
	break;
	
	case "hit":
		draw_sprite_ext(headHit, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
		draw_sprite_ext(hairHit, img_index, x, y-5, 1*(charDirection), 1, 0, global.hairColor, 1);
		draw_sprite_ext(clothingHit, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
	break;
	
	case "dead":
		draw_sprite_ext(headDead, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
		draw_sprite_ext(hairDead, img_index, x, y-5, 1*(charDirection), 1, 0, global.hairColor, 1);
		draw_sprite_ext(clothingDead, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
	break;
	
	case "defense":
		draw_sprite_ext(headDefense, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
		draw_sprite_ext(hairDefense, img_index, x, y-5, 1*(charDirection), 1, 0, global.hairColor, 1);
		draw_sprite_ext(clothingDefense, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
		draw_sprite_ext(eyesDefense, img_index, x, y-5, 1*(charDirection), 1, 0, global.eyesColor, 1);
	break
	
	case "wait":
		if(lastState == "combo"){		
			if(comboCounter == 0){
				draw_sprite_ext(headCombo1, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
				draw_sprite_ext(hairCombo1, img_index, x, y-5, 1*(charDirection), 1, 0, global.hairColor, 1);
				draw_sprite_ext(clothingCombo1, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
				draw_sprite_ext(eyesCombo1, img_index, x, y-5, 1*(charDirection), 1, 0, global.eyesColor, 1);
			} else if(comboCounter == 1){
				draw_sprite_ext(headCombo2, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
				draw_sprite_ext(hairCombo2, img_index, x, y-5, 1*(charDirection), 1, 0, global.hairColor, 1);
				draw_sprite_ext(clothingCombo2, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
				draw_sprite_ext(eyesCombo2, img_index, x, y-5, 1*(charDirection), 1, 0, global.eyesColor, 1);
			} else {
				draw_sprite_ext(headCombo3, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
				draw_sprite_ext(hairCombo3, img_index, x, y-5, 1*(charDirection), 1, 0, global.hairColor, 1);
				draw_sprite_ext(clothingCombo3, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
				draw_sprite_ext(eyesCombo3, img_index, x, y-5, 1*(charDirection), 1, 0, global.eyesColor, 1);
			}
		} else if(lastState = "hit"){	
			draw_sprite_ext(headHit, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
			draw_sprite_ext(hairHit, img_index, x, y-5, 1*(charDirection), 1, 0, global.hairColor, 1);
			draw_sprite_ext(clothingHit, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);	
		} else if(lastState = "down"){
			draw_sprite_ext(headPickup, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
			draw_sprite_ext(hairPickup, img_index, x, y-5, 1*(charDirection), 1, 0, global.hairColor, 1);
			draw_sprite_ext(clothingPickup, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
			draw_sprite_ext(eyesPickup, img_index, x, y-5, 1*(charDirection), 1, 0, global.eyesColor, 1);
		} else if(lastState = "clon"){
			draw_sprite_ext(headChargingChakra, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
			draw_sprite_ext(hairChargingChakra, img_index, x, y-5, 1*(charDirection), 1, 0, global.hairColor, 1);
			draw_sprite_ext(clothingChargingChakra, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
			draw_sprite_ext(eyesChargingChakra, img_index, x, y-5, 1*(charDirection), 1, 0, global.eyesColor, 1);
		} else if(lastState = "throw"){
			draw_sprite_ext(headThrow, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
			draw_sprite_ext(hairThrow, img_index, x, y-5, 1*(charDirection), 1, 0, global.hairColor, 1);
			draw_sprite_ext(clothingThrow, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
			draw_sprite_ext(eyesThrow, img_index, x, y-5, 1*(charDirection), 1, 0, global.eyesColor, 1);
		} else if(lastState = "jutsuSpit"){
			draw_sprite_ext(headJutsuSpit, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
			draw_sprite_ext(hairJutsuSpit, img_index, x, y-5, 1*(charDirection), 1, 0, global.hairColor, 1);
			draw_sprite_ext(clothingJutsuSpit, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
			draw_sprite_ext(eyesJutsuSpit, img_index, x, y-5, 1*(charDirection), 1, 0, global.eyesColor, 1);	
		} else if(lastState == "jumpJutsuSpit"){
			draw_sprite_ext(headJumpJutsuSpit, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
			draw_sprite_ext(hairJumpJutsuSpit, img_index, x, y-5, 1*(charDirection), 1, 0, global.hairColor, 1);
			draw_sprite_ext(clothingJumpJutsuSpit, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
			draw_sprite_ext(eyesJumpJutsuSpit, img_index, x, y-5, 1*(charDirection), 1, 0, global.eyesColor, 1);
		}
	break;
	
	case "charge":
		draw_sprite_ext(headChargingChakra, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
		draw_sprite_ext(hairChargingChakra, img_index, x, y-5, 1*(charDirection), 1, 0, global.hairColor, 1);
		draw_sprite_ext(clothingChargingChakra, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
		draw_sprite_ext(eyesChargingChakra, img_index, x, y-5, 1*(charDirection), 1, 0, global.eyesColor, 1);
		draw_sprite(spr_chakra, img_index, x, y); //Effect
	break;
}