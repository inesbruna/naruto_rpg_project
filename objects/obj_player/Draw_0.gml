/// @description Animations

/*if(grounded){
	gpu_set_fog(true, c_black, 0, 1);
	draw_sprite_pos(sprite_index, image_index, x-(sprite_width/2)-5, y+42, x+(sprite_width/2)-5, y+42, x+(sprite_width/2), y+26, x-(sprite_width/2), y+26, .5);
	gpu_set_fog(false, c_black, 0, 0);
}*/

switch(state){
	case "free":
	
	//Speed Animation
	image_speed = 0.3;
	
	//Run Animation
	if ((keyboard_check(vk_left)) || ((keyboard_check(vk_right))) && grounded){
		draw_sprite_ext(headRunning, -1, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
		draw_sprite_ext(hairRunning, -1, x, y-5, 1*(charDirection), 1, 0, global.hairColor, 1);
		draw_sprite_ext(clothingRunning, -1, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
		draw_sprite_ext(eyesRunning, -1, x, y-5, 1*(charDirection), 1, 0, global.eyesColor, 1);
	} else {
		draw_sprite_ext(headStance, -1, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
		draw_sprite_ext(hairStance, -1, x, y-5, 1*(charDirection), 1, 0, global.hairColor, 1);
		draw_sprite_ext(clothingStance, -1, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
		draw_sprite_ext(eyesStance, -1, x, y-5, 1*(charDirection), 1, 0, global.eyesColor, 1);
	}
	
	break;
	
	case "jumping":
		draw_sprite_ext(headJumping, -1, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
		draw_sprite_ext(hairJumping, -1, x, y-5, 1*(charDirection), 1, 0, global.hairColor, 1);
		draw_sprite_ext(clothingJumping, -1, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
		draw_sprite_ext(eyesJumping, -1, x, y-5, 1*(charDirection), 1, 0, global.eyesColor, 1);
	break;
	
	case "falling":
		draw_sprite_ext(headFalling, -1, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
		draw_sprite_ext(hairFalling, -1, x, y-5, 1*(charDirection), 1, 0, global.hairColor, 1);
		draw_sprite_ext(clothingFalling, -1, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
		draw_sprite_ext(eyesFalling, -1, x, y-5, 1*(charDirection), 1, 0, global.eyesColor, 1);
	break;
	
	case "hit":
		draw_sprite_ext(headHit, -1, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
		draw_sprite_ext(hairHit, -1, x, y-5, 1*(charDirection), 1, 0, global.hairColor, 1);
		draw_sprite_ext(clothingHit, -1, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
	break;
	
	case "dead":
		draw_sprite_ext(headDead, -1, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
		draw_sprite_ext(hairDead, -1, x, y-5, 1*(charDirection), 1, 0, global.hairColor, 1);
		draw_sprite_ext(clothingDead, -1, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
	break;
	
	case "defense":
		draw_sprite_ext(headDefense, -1, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
		draw_sprite_ext(hairDefense, -1, x, y-5, 1*(charDirection), 1, 0, global.hairColor, 1);
		draw_sprite_ext(clothingDefense, -1, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
		draw_sprite_ext(eyesDefense, -1, x, y-5, 1*(charDirection), 1, 0, global.eyesColor, 1);
	break
	
	case "wait":
		if(lastState == "combo"){
				//Speed Animation
				image_speed = 0.4;
				
			if(comboCounter == 0){
				draw_sprite_ext(headCombo1, -1, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
				draw_sprite_ext(hairCombo1, -1, x, y-5, 1*(charDirection), 1, 0, global.hairColor, 1);
				draw_sprite_ext(clothingCombo1, -1, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
				draw_sprite_ext(eyesCombo1, -1, x, y-5, 1*(charDirection), 1, 0, global.eyesColor, 1);
			} else if(comboCounter == 1){
				draw_sprite_ext(headCombo2, -1, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
				draw_sprite_ext(hairCombo2, -1, x, y-5, 1*(charDirection), 1, 0, global.hairColor, 1);
				draw_sprite_ext(clothingCombo2, -1, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
				draw_sprite_ext(eyesCombo2, -1, x, y-5, 1*(charDirection), 1, 0, global.eyesColor, 1);
			} else {
				draw_sprite_ext(headCombo3, -1, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
				draw_sprite_ext(hairCombo3, -1, x, y-5, 1*(charDirection), 1, 0, global.hairColor, 1);
				draw_sprite_ext(clothingCombo3, -1, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
				draw_sprite_ext(eyesCombo3, -1, x, y-5, 1*(charDirection), 1, 0, global.eyesColor, 1);
			}
		} else if(lastState = "hit"){
			//Speed Animation
			image_speed = 0.3;
			
			draw_sprite_ext(headHit, -1, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
			draw_sprite_ext(hairHit, -1, x, y-5, 1*(charDirection), 1, 0, global.hairColor, 1);
			draw_sprite_ext(clothingHit, -1, x, y-5, 1*(charDirection), 1, 0, c_white, 1);	
		} else if(lastState = "down"){
			//Speed Animation
			image_speed = 0.3;
			
			draw_sprite_ext(headPickup, -1, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
			draw_sprite_ext(hairPickup, -1, x, y-5, 1*(charDirection), 1, 0, global.hairColor, 1);
			draw_sprite_ext(clothingPickup, -1, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
			draw_sprite_ext(eyesPickup, -1, x, y-5, 1*(charDirection), 1, 0, global.eyesColor, 1);
		} else if(lastState = "clon"){
			//Speed Animation
			image_speed = 0.3;
			
			draw_sprite_ext(headChargingChakra, -1, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
			draw_sprite_ext(hairChargingChakra, -1, x, y-5, 1*(charDirection), 1, 0, global.hairColor, 1);
			draw_sprite_ext(clothingChargingChakra, -1, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
			draw_sprite_ext(eyesChargingChakra, -1, x, y-5, 1*(charDirection), 1, 0, global.eyesColor, 1);
		} else if(lastState = "throw"){
			//Speed Animation
			image_speed = 0.3;
			
			draw_sprite_ext(headThrow, -1, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
			draw_sprite_ext(hairThrow, -1, x, y-5, 1*(charDirection), 1, 0, global.hairColor, 1);
			draw_sprite_ext(clothingThrow, -1, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
			draw_sprite_ext(eyesThrow, -1, x, y-5, 1*(charDirection), 1, 0, global.eyesColor, 1);
		}
	break;
	
	case "charge":
		//Speed Animation
		image_speed = 0.3;
			
		draw_sprite_ext(headChargingChakra, -1, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
		draw_sprite_ext(hairChargingChakra, -1, x, y-5, 1*(charDirection), 1, 0, global.hairColor, 1);
		draw_sprite_ext(clothingChargingChakra, -1, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
		draw_sprite_ext(eyesChargingChakra, -1, x, y-5, 1*(charDirection), 1, 0, global.eyesColor, 1);
		draw_sprite(spr_chakra, -1, x, y); //Effect
	break;

}