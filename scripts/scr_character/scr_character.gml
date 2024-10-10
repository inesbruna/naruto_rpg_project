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
		headHit = spr_head_hit;
		headDead = spr_head_dead;
		headDefense = spr_head_defense;
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
		hairHit = spr_hair0_hit;
		hairDead = spr_hair0_dead;
		hairDefense = spr_hair0_defense;
		break;
		case 1: 
		hairStance = spr_hair1_stance;
		hairRunning = spr_hair1_running;
		hairJumping = spr_hair1_jumping;
		hairFalling = spr_hair1_falling;
		hairCombo1 = spr_hair1_combo1;
		hairCombo2 = spr_hair1_combo2;
		hairCombo3 = spr_hair1_combo3;
		hairHit = spr_hair1_hit;
		hairDead = spr_hair1_dead;
		hairDefense = spr_hair1_defense;
		break;
		case 2: 
		hairStance = spr_hair2_stance;
		hairRunning = spr_hair2_running;
		hairJumping = spr_hair2_jumping;
		hairFalling = spr_hair2_falling;
		hairCombo1 = spr_hair2_combo1;
		hairCombo2 = spr_hair2_combo2;
		hairCombo3 = spr_hair2_combo3;
		hairHit = spr_hair2_hit;
		hairDead = spr_hair2_dead;
		hairDefense = spr_hair2_defense;
		break;
		case 3: 
		hairStance = spr_hair3_stance;
		hairRunning = spr_hair3_running;
		hairJumping = spr_hair3_jumping;
		hairFalling = spr_hair3_falling;
		hairCombo1 = spr_hair3_combo1;
		hairCombo2 = spr_hair3_combo2;
		hairCombo3 = spr_hair3_combo3;
		hairHit = spr_hair3_hit;
		hairDead = spr_hair3_dead;
		hairDefense = spr_hair3_defense;
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
		clothingHit = spr_clothing0_hit;
		clothingDead = spr_clothing0_dead;
		clothingDefense = spr_clothing0_defense;
		break;
	}
	
	eyesStance = spr_eyes_stance;
	eyesRunning = spr_eyes_running;
	eyesJumping = spr_eyes_jumping;
	eyesFalling = spr_eyes_falling;
	eyesCombo1 = spr_eyes_combo1;
	eyesCombo2 = spr_eyes_combo2;
	eyesCombo3 = spr_eyes_combo3;
	eyesDefense = spr_eyes_defense;
		
}