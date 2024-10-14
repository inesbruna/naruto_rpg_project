/// @description Draw Self + Healthbar

//Healthbar
draw_healthbar(x-20, y-65, x+25, y-60, (hp/hpmax)*100, c_black, c_red, c_green, 0, true, true);

//Apparence
switch(state){
	case "free":
	//Speed Animation
	image_speed = 0.3;
	
	if (state == "free"){
		draw_sprite_ext(headStance, -1, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
		draw_sprite_ext(hairStance, -1, x, y-5, 1*(charDirection), 1, 0, global.hairColor, 1);
		draw_sprite_ext(clothingStance, -1, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
		draw_sprite_ext(eyesStance, -1, x, y-5, 1*(charDirection), 1, 0, global.eyesColor, 1);
	}
	
	break;
	
	case "chase":
		//Speed Animation
		image_speed = 0.3;
		
		draw_sprite_ext(headRunning, -1, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
		draw_sprite_ext(hairRunning, -1, x, y-5, 1*(charDirection), 1, 0, global.hairColor, 1);
		draw_sprite_ext(clothingRunning, -1, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
		draw_sprite_ext(eyesRunning, -1, x, y-5, 1*(charDirection), 1, 0, global.eyesColor, 1);
	break;
	
	case "chase_player":
		//Speed Animation
		image_speed = 0.3;
		
		draw_sprite_ext(headRunning, -1, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
		draw_sprite_ext(hairRunning, -1, x, y-5, 1*(charDirection), 1, 0, global.hairColor, 1);
		draw_sprite_ext(clothingRunning, -1, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
		draw_sprite_ext(eyesRunning, -1, x, y-5, 1*(charDirection), 1, 0, global.eyesColor, 1)
	break;
	
	case "dead":
		//Speed Animation
		image_speed = 0.3;
		
		draw_sprite_ext(headDead, -1, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
		draw_sprite_ext(hairDead, -1, x, y-5, 1*(charDirection), 1, 0, global.hairColor, 1);
		draw_sprite_ext(clothingDead, -1, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
	break;
	
	case "wait":
		if(lastState == "attack"){
			//Speed Animation
			image_speed = 0.4;
				
			draw_sprite_ext(headCombo3, -1, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
			draw_sprite_ext(hairCombo3, -1, x, y-5, 1*(charDirection), 1, 0, global.hairColor, 1);
			draw_sprite_ext(clothingCombo3, -1, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
			draw_sprite_ext(eyesCombo3, -1, x, y-5, 1*(charDirection), 1, 0, global.eyesColor, 1);

		} else if(lastState == "hit"){
			//Speed Animation
			image_speed = 0.3;
			
			draw_sprite_ext(headHit, -1, x, y-5, 1*(charDirection), 1, 0, c_white, 1);
			draw_sprite_ext(hairHit, -1, x, y-5, 1*(charDirection), 1, 0, global.hairColor, 1);
			draw_sprite_ext(clothingHit, -1, x, y-5, 1*(charDirection), 1, 0, c_white, 1);	
		}
	break;
}