// Character Creation
function scr_clonchar(){
	//Running
	if(transformation == 0){
		switch(global.head){ //HEAD
			case 0: headRunning = spr_head_running; break;
		}
				
		switch(global.hair){ //HAIR
			case 0: hairRunning = spr_hair0_running; break;
			case 1: hairRunning = spr_hair1_running; break;
			case 2: hairRunning = spr_hair2_running; break;
			case 3: hairRunning = spr_hair3_running; break;
		}
				
		switch(global.clothing){ //CLOTHING
			case 0: clothingRunning = spr_clothing0_running; break;
		}
				
		eyesRunning = spr_eyes_running; // EYES
				
	} else {
		switch(global.head){ //HEAD
			case 0: headRunning = spr_head_running_tail; break;
		}
				
		switch(global.hair){ //HAIR
			case 0: hairRunning = spr_hair0_running_tail; break;
			case 1: hairRunning = spr_hair1_running_tail; break;
			case 2: hairRunning = spr_hair2_running_tail; break;
			case 3: hairRunning = spr_hair3_running_tail; break;
		}
				
		switch(global.clothing){ //CLOTHING
			case 0: clothingRunning = spr_clothing0_running_tail; break;
		}
				
		eyesRunning = spr_eyes_running_tail; // EYES
	}			
	
	//Stance
	switch(global.head){ //HEAD
		case 0: headStance = spr_head_stance; break;
	}
				
	switch(global.hair){ //HAIR
		case 0: hairStance = spr_hair0_stance; break;
		case 1: hairStance = spr_hair1_stance; break;
		case 2: hairStance = spr_hair2_stance; break;
		case 3: hairStance = spr_hair3_stance; break;
	}
				
	switch(global.clothing){ //CLOTHING
		case 0: clothingStance = spr_clothing0_stance; break;
	}
				
	eyesStance = spr_eyes_stance; // EYES
	
	//Hit
	switch(global.head){ //HEAD
			case 0: headHit = spr_head_hit; break;
		}
				
		switch(global.hair){ //HAIR
			case 0: hairHit = spr_hair0_hit; break;
			case 1: hairHit = spr_hair1_hit; break;
			case 2: hairHit = spr_hair2_hit; break;
			case 3: hairHit = spr_hair3_hit; break;
		}
				
		switch(global.clothing){ //CLOTHING
			case 0: clothingHit = spr_clothing0_hit; break;
		}

	//Dead
	switch(global.head){ //HEAD
			case 0: headDead = spr_head_dead; break;
		}
				
		switch(global.hair){ //HAIR
			case 0: hairDead = spr_hair0_dead; break;
			case 1: hairDead = spr_hair1_dead; break;
			case 2: hairDead = spr_hair2_dead; break;
			case 3: hairDead = spr_hair3_dead; break;
		}
				
		switch(global.clothing){ //CLOTHING
			case 0: clothingDead = spr_clothing0_dead; break;
		}

		//Attack
		switch(global.head){ //HEAD
			case 0: headAttack = spr_head_combo1; break;
		}
				
		switch(global.hair){ //HAIR
			case 0: hairAttack = spr_hair0_combo1; break;
			case 1: hairAttack = spr_hair1_combo1; break;
			case 2: hairAttack = spr_hair2_combo1; break;
			case 3: hairAttack = spr_hair3_combo1; break;
		}
				
		switch(global.clothing){ //CLOTHING
			case 0: clothingAttack = spr_clothing0_combo1; break;
		}	
		
		eyesAttack = noone; // EYES
}
