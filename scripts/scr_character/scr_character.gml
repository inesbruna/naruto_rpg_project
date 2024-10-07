// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_character(){
	//STANCE
	switch(global.head){
		case 0: 
		headStance = spr_head_stance;
		headRunning = spr_head_running;
		headJumping = spr_head_jumping;
		headFalling = spr_head_falling;
		headCombo1 = spr_head_combo1;
		headCombo2 = spr_head_combo2;
		headCombo3 = spr_head_combo3;
		break;
	}
	
	switch(global.hair){
		case 0: 
		hairStance = spr_hair0_stance;
		hairRunning = spr_hair0_running;
		hairJumping = spr_hair0_jumping;
		hairFalling = spr_hair0_falling;
		hairCombo1 = spr_hair0_combo1;
		hairCombo2 = spr_hair0_combo2;
		hairCombo3 = spr_hair0_combo3;
		break;
		case 1: 
		hairStance = spr_hair1_stance;
		hairRunning = spr_hair1_running;
		hairJumping = spr_hair1_jumping;
		hairFalling = spr_hair1_falling;
		break;
		case 2: 
		hairStance = spr_hair2_stance;
		hairRunning = spr_hair2_running;
		hairJumping = spr_hair2_jumping;
		hairFalling = spr_hair2_falling;
		break;
		case 3: 
		hairStance = spr_hair3_stance;
		hairRunning = spr_hair3_running;
		hairJumping = spr_hair3_jumping;
		hairFalling = spr_hair3_falling;
		break;
	}
	
	switch(global.clothing){
		case 0: 
		clothingStance = spr_clothing0_stance;
		clothingRunning = spr_clothing0_running;
		clothingJumping = spr_clothing0_jumping;
		clothingFalling = spr_clothing0_falling;
		clothingCombo1 = spr_clothing0_combo1;
		clothingCombo2 = spr_clothing0_combo2;
		clothingCombo3 = spr_clothing0_combo3;
		break;
	}
	
	eyesStance = spr_eyes_stance;
	eyesRunning = spr_eyes_running;
	eyesJumping = spr_eyes_jumping;
	eyesFalling = spr_eyes_falling;
	eyesCombo1 = spr_eyes_combo1;
	eyesCombo2 = spr_eyes_combo2;
	eyesCombo3 = spr_eyes_combo3;
		
}