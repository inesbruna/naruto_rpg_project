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
			
			case "chargingChakra":
				total_frames = sprite_get_number(headChargingChakra);
			break;
			
			case "jutsuDashFromDown":
				total_frames = sprite_get_number(headJutsuDashFromDown);
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

var ears_x = x-(1*charDirection);
var ears_y = y-56;

switch(state){
	case "free":
	//Run Animation
	if ((keyboard_check(vk_left)) || ((keyboard_check(vk_right))) && grounded){
		head = headRunning;
		hair = hairRunning;
		clothing = clothingRunning;
		eyes = eyesRunning;
		
		var ears_x = x-(6*charDirection);
		var ears_y = y-61;
	} else {	
		head = headStance;
		hair = hairStance;
		clothing = clothingStance;
		eyes = eyesStance;
	}
	
	break;
	
	case "jumping":
		head = headJumping;
		hair = hairJumping;
		clothing = clothingJumping;
		eyes = eyesJumping;
		
		ears_x = x+(4*charDirection);
		ears_y = y-59;
	break;
	
	case "falling":
		head = headFalling;
		hair = hairFalling;
		clothing = clothingFalling;
		eyes = eyesFalling;
		
		ears_x = x+(4*charDirection);
		ears_y = y-59;
	break;
	
	case "hit":
		head = headHit;
		hair = hairHit;
		clothing = clothingHit;
		eyes = noone;
	break;
	
	case "dead":
		head = headDead;
		hair = hairDead;
		clothing = clothingDead;
		eyes = noone;
	break;
	
	case "defense":
		head = headDefense;
		hair = hairDefense;
		clothing = clothingDefense;
		eyes = eyesDefense;
	break
	
	case "wait":
		if(lastState == "combo"){		
			if(comboCounter == 0){
				head = headCombo1;
				hair = hairCombo1;
				clothing = clothingCombo1;
				eyes = eyesCombo1;
			} else if(comboCounter == 1){
				head = headCombo2;
				hair = hairCombo2;
				clothing = clothingCombo2;
				eyes = eyesCombo2;
			} else {
				head = headCombo3;
				hair = hairCombo3;
				clothing = clothingCombo3;
				eyes = eyesCombo3;
			}
		} else if(lastState == "hit"){	
			draw_sprite_ext(headHit, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
			draw_sprite_ext(hairHit, img_index, x, y-5, 1*(charDirection), 1, 0, global.hairColor, 1);
			draw_sprite_ext(clothingHit, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);	
		} else if(lastState == "down"){
			draw_sprite_ext(headPickup, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
			draw_sprite_ext(hairPickup, img_index, x, y-5, 1*(charDirection), 1, 0, global.hairColor, 1);
			draw_sprite_ext(clothingPickup, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
			draw_sprite_ext(eyesPickup, img_index, x, y-5, 1*(charDirection), 1, 0, global.eyesColor, 1);
		} else if(lastState == "clon"){
			draw_sprite_ext(headChargingChakra, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
			draw_sprite_ext(hairChargingChakra, img_index, x, y-5, 1*(charDirection), 1, 0, global.hairColor, 1);
			draw_sprite_ext(clothingChargingChakra, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
			draw_sprite_ext(eyesChargingChakra, img_index, x, y-5, 1*(charDirection), 1, 0, global.eyesColor, 1);
		} else if(lastState == "throw"){
			draw_sprite_ext(headThrow, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
			draw_sprite_ext(hairThrow, img_index, x, y-5, 1*(charDirection), 1, 0, global.hairColor, 1);
			draw_sprite_ext(clothingThrow, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
			draw_sprite_ext(eyesThrow, img_index, x, y-5, 1*(charDirection), 1, 0, global.eyesColor, 1);
		} else if(lastState == "jutsuSpit"){
			draw_sprite_ext(headJutsuSpit, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
			draw_sprite_ext(hairJutsuSpit, img_index, x, y-5, 1*(charDirection), 1, 0, global.hairColor, 1);
			draw_sprite_ext(clothingJutsuSpit, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
			draw_sprite_ext(eyesJutsuSpit, img_index, x, y-5, 1*(charDirection), 1, 0, global.eyesColor, 1);	
		} else if(lastState == "jumpJutsuSpit"){
			draw_sprite_ext(headJumpJutsuSpit, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
			draw_sprite_ext(hairJumpJutsuSpit, img_index, x, y-5, 1*(charDirection), 1, 0, global.hairColor, 1);
			draw_sprite_ext(clothingJumpJutsuSpit, img_index, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
			draw_sprite_ext(eyesJumpJutsuSpit, img_index, x, y-5, 1*(charDirection), 1, 0, global.eyesColor, 1);
		} else if(lastState == "chargingChakra"){
			head = headChargingChakra;
			hair = hairChargingChakra;
			clothing = clothingChargingChakra;
			eyes = eyesChargingChakra;
		} else if(lastState == "jutsuDashFromDown"){
			head = headJutsuDashFromDown;
			hair = hairJutsuDashFromDown;
			clothing = clothingJutsuDashFromDown;
			eyes = eyesJutsuDashFromDown;
		}
	break;
	
	case "charge":
		head = headChargingChakra;
		hair = hairChargingChakra;
		clothing = clothingChargingChakra;
		eyes = eyesChargingChakra;
		
		draw_sprite(spr_chakra, img_index, x, y); //Effect
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
	if(state == "free" && (keyboard_check(vk_right) || keyboard_check(vk_left)) && grounded){
		draw_sprite_ext(spr_ears_running, img_index, ears_x, ears_y, 1*(charDirection), 1, 0, c_white, 0.5);
	} else {
		draw_sprite_ext(spr_ears, img_index, ears_x, ears_y, 1*(charDirection), 1, 0, c_white, 0.5);
	}
	draw_sprite_ext(spr_tail, img_index, x-(15*charDirection), y-15, 1*(charDirection), 1, 0, c_white, 0.5);
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



