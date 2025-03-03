// Character Creation
function scr_character(){
	switch(state){
		case "free":
		//Run Animation
		if ((keyboard_check(vk_left)) || ((keyboard_check(vk_right))) && (grounded)){
			if(transformation == 0){
				switch(global.head){ //HEAD
					case 0: head = spr_head_running; break;
				}
				
				switch(global.hair){ //HAIR
					case 0: hair = spr_hair0_running; break;
					case 1: hair = spr_hair1_running; break;
					case 2: hair = spr_hair2_running; break;
					case 3: hair = spr_hair3_running; break;
				}
				
				switch(global.clothing){ //CLOTHING
					case 0: clothing = spr_clothing0_running; break;
				}
				
				eyes = spr_eyes_running; // EYES
				
			} else {
				switch(global.head){ //HEAD
					case 0: head = spr_head_running_tail; break;
				}
				
				switch(global.hair){ //HAIR
					case 0: hair = spr_hair0_running_tail; break;
					case 1: hair = spr_hair1_running_tail; break;
					case 2: hair = spr_hair2_running_tail; break;
					case 3: hair = spr_hair3_running_tail; break;
				}
				
				switch(global.clothing){ //CLOTHING
					case 0: clothing = spr_clothing0_running_tail; break;
				}
				
				eyes = spr_eyes_running_tail; // EYES
			}
				
			} else {
				switch(global.head){ //HEAD
					case 0: head = spr_head_stance; break;
				}
				
				switch(global.hair){ //HAIR
					case 0: hair = spr_hair0_stance; break;
					case 1: hair = spr_hair1_stance; break;
					case 2: hair = spr_hair2_stance; break;
					case 3: hair = spr_hair3_stance; break;
				}
				
				switch(global.clothing){ //CLOTHING
					case 0: clothing = spr_clothing0_stance; break;
				}
				
				eyes = spr_eyes_stance; // EYES
		
			}
		break;
				
		case "jumping":
			switch(global.head){ //HEAD
					case 0: head = spr_head_jumping; break;
				}
				
				switch(global.hair){ //HAIR
					case 0: hair = spr_hair0_jumping; break;
					case 1: hair = spr_hair1_jumping; break;
					case 2: hair = spr_hair2_jumping; break;
					case 3: hair = spr_hair3_jumping; break;
				}
				
				switch(global.clothing){ //CLOTHING
					case 0: clothing = spr_clothing0_jumping; break;
				}
				
				eyes = spr_eyes_jumping; // EYES
				
		break;
	
		case "falling":
			switch(global.head){ //HEAD
					case 0: head = spr_head_falling; break;
				}
				
				switch(global.hair){ //HAIR
					case 0: hair = spr_hair0_falling; break;
					case 1: hair = spr_hair1_falling; break;
					case 2: hair = spr_hair2_falling; break;
					case 3: hair = spr_hair3_falling; break;
				}
				
				switch(global.clothing){ //CLOTHING
					case 0: clothing = spr_clothing0_falling; break;
				}
				
				eyes = spr_eyes_falling; // EYES

		break;
	
		case "hit":
			switch(global.head){ //HEAD
					case 0: head = spr_head_hit; break;
				}
				
				switch(global.hair){ //HAIR
					case 0: hair = spr_hair0_hit; break;
					case 1: hair = spr_hair1_hit; break;
					case 2: hair = spr_hair2_hit; break;
					case 3: hair = spr_hair3_hit; break;
				}
				
				switch(global.clothing){ //CLOTHING
					case 0: clothing = spr_clothing0_hit; break;
				}
				
				eyes = noone; // EYES

		break;
	
		case "dead":
			switch(global.head){ //HEAD
					case 0: head = spr_head_dead; break;
				}
				
				switch(global.hair){ //HAIR
					case 0: hair = spr_hair0_dead; break;
					case 1: hair = spr_hair1_dead; break;
					case 2: hair = spr_hair2_dead; break;
					case 3: hair = spr_hair3_dead; break;
				}
				
				switch(global.clothing){ //CLOTHING
					case 0: clothing = spr_clothing0_dead; break;
				}
				
				eyes = noone; // EYES

		break;
	
		case "defense":
			switch(global.head){ //HEAD
					case 0: head = spr_head_defense; break;
				}
				
				switch(global.hair){ //HAIR
					case 0: hair = spr_hair0_defense; break;
					case 1: hair = spr_hair1_defense; break;
					case 2: hair = spr_hair2_defense; break;
					case 3: hair = spr_hair3_defense; break;
				}
				
				switch(global.clothing){ //CLOTHING
					case 0: clothing = spr_clothing0_defense; break;
				}
				
				eyes = spr_eyes_defense; // EYES

		break;
		
		case "charge":
			switch(global.head){ //HEAD
					case 0: head = spr_head_chargingChakra; break;
				}
				
				switch(global.hair){ //HAIR
					case 0: hair = spr_hair0_chargingChakra; break;
					case 1: hair = spr_hair1_chargingChakra; break;
					case 2: hair = spr_hair2_chargingChakra; break;
					case 3: hair = spr_hair3_chargingChakra; break;
				}
				
				switch(global.clothing){ //CLOTHING
					case 0: clothing = spr_clothing0_chargingChakra; break;
				}
				
				eyes = spr_eyes_chargingChakra; // EYES
							
			draw_sprite(spr_chakra, img_index, x, y); //Effect
		break;
	
		case "wait":
			switch(lastState){
				case "combo":
					if(comboCounter == 0){
						switch(global.head){ //HEAD
							case 0: head = spr_head_combo1; break;
						}
				
						switch(global.hair){ //HAIR
							case 0: hair = spr_hair0_combo1; break;
							case 1: hair = spr_hair1_combo1; break;
							case 2: hair = spr_hair2_combo1; break;
							case 3: hair = spr_hair3_combo1; break;
						}
				
						switch(global.clothing){ //CLOTHING
							case 0: clothing = spr_clothing0_combo1; break;
						}
				
						eyes = spr_eyes_combo1; // EYES
					} else if(comboCounter == 1){
						switch(global.head){ //HEAD
							case 0: head = spr_head_combo2; break;
						}
				
						switch(global.hair){ //HAIR
							case 0: hair = spr_hair0_combo2; break;
							case 1: hair = spr_hair1_combo2; break;
							case 2: hair = spr_hair2_combo2; break;
							case 3: hair = spr_hair3_combo2; break;
						}
				
						switch(global.clothing){ //CLOTHING
							case 0: clothing = spr_clothing0_combo2; break;
						}
						
						eyes = spr_eyes_combo2; // EYES
					} else {
						switch(global.head){ //HEAD
							case 0: head = spr_head_combo3; break;
						}
				
						switch(global.hair){ //HAIR
							case 0: hair = spr_hair0_combo3; break;
							case 1: hair = spr_hair1_combo3; break;
							case 2: hair = spr_hair2_combo3; break;
							case 3: hair = spr_hair3_combo3; break;
						}
				
						switch(global.clothing){ //CLOTHING
							case 0: clothing = spr_clothing0_combo3; break;
						}
				
						eyes = spr_eyes_combo3; // EYES
					}
				break;
						
				case "hit":
					switch(global.head){ //HEAD
							case 0: head = spr_head_hit; break;
						}
				
						switch(global.hair){ //HAIR
							case 0: hair = spr_hair0_hit; break;
							case 1: hair = spr_hair1_hit; break;
							case 2: hair = spr_hair2_hit; break;
							case 3: hair = spr_hair3_hit; break;
						}
				
						switch(global.clothing){ //CLOTHING
							case 0: clothing = spr_clothing0_hit; break;
						}
				
						eyes = noone; // EYES
				break;
						
				case "down":
					switch(global.head){ //HEAD
							case 0: head = spr_head_down; break;
						}
				
						switch(global.hair){ //HAIR
							case 0: hair = spr_hair0_down; break;
							case 1: hair = spr_hair1_down; break;
							case 2: hair = spr_hair2_down; break;
							case 3: hair = spr_hair3_down; break;
						}
				
						switch(global.clothing){ //CLOTHING
							case 0: clothing = spr_clothing0_down; break;
						}
				
						eyes = spr_eyes_down; // EYES
				break;
						
				case "clon":
					switch(global.head){ //HEAD
							case 0: head = spr_head_chargingChakra; break;
						}
				
						switch(global.hair){ //HAIR
							case 0: hair = spr_hair0_chargingChakra; break;
							case 1: hair = spr_hair1_chargingChakra; break;
							case 2: hair = spr_hair2_chargingChakra; break;
							case 3: hair = spr_hair3_chargingChakra; break;
						}
				
						switch(global.clothing){ //CLOTHING
							case 0: clothing = spr_clothing0_chargingChakra; break;
						}
				
						eyes = spr_eyes_chargingChakra; // EYES
				break;
						
				case "throw":
					switch(global.head){ //HEAD
							case 0: head = spr_head_throw; break;
						}
				
						switch(global.hair){ //HAIR
							case 0: hair = spr_hair0_throw; break;
							case 1: hair = spr_hair1_throw; break;
							case 2: hair = spr_hair2_throw; break;
							case 3: hair = spr_hair3_throw; break;
						}
				
						switch(global.clothing){ //CLOTHING
							case 0: clothing = spr_clothing0_throw; break;
						}
				
						eyes = spr_eyes_throw; // EYES
				break;
						
				case "jutsuSpit":
					switch(global.head){ //HEAD
							case 0: head = spr_head_jutsuSpit; break;
						}
				
						switch(global.hair){ //HAIR
							case 0: hair = spr_hair0_jutsuSpit; break;
							case 1: hair = spr_hair1_jutsuSpit; break;
							case 2: hair = spr_hair2_jutsuSpit; break;
							case 3: hair = spr_hair3_jutsuSpit; break;
						}
				
						switch(global.clothing){ //CLOTHING
							case 0: clothing = spr_clothing0_jutsuSpit; break;
						}
				
						eyes = spr_eyes_jutsuSpit; // EYES
				break;
						
				case "jumpJutsuSpit":
					switch(global.head){ //HEAD
							case 0: head = spr_head_jumpJutsuSpit; break;
						}
				
						switch(global.hair){ //HAIR
							case 0: hair = spr_hair0_jumpJutsuSpit; break;
							case 1: hair = spr_hair1_jumpJutsuSpit; break;
							case 2: hair = spr_hair2_jumpJutsuSpit; break;
							case 3: hair = spr_hair3_jumpJutsuSpit; break;
						}
				
						switch(global.clothing){ //CLOTHING
							case 0: clothing = spr_clothing0_jumpJutsuSpit; break;
						}
				
						eyes = spr_eyes_jumpJutsuSpit; // EYES
				break;
						
				case "chargingChakra":
					switch(global.head){ //HEAD
							case 0: head = spr_head_chargingChakra; break;
						}
				
						switch(global.hair){ //HAIR
							case 0: hair = spr_hair0_chargingChakra; break;
							case 1: hair = spr_hair1_chargingChakra; break;
							case 2: hair = spr_hair2_chargingChakra; break;
							case 3: hair = spr_hair3_chargingChakra; break;
						}
				
						switch(global.clothing){ //CLOTHING
							case 0: clothing = spr_clothing0_chargingChakra; break;
						}
				
						eyes = spr_eyes_chargingChakra; // EYES
							
					draw_sprite(spr_chakra, img_index, x, y); //Effect
				break;
						
				case "jutsuDashFromDown":
					switch(global.head){ //HEAD
							case 0: head = spr_head_jutsuDashFromDown; break;
						}
				
						switch(global.hair){ //HAIR
							case 0: hair = spr_hair0_jutsuDashFromDown; break;
							case 1: hair = spr_hair1_jutsuDashFromDown; break;
							case 2: hair = spr_hair2_jutsuDashFromDown; break;
							case 3: hair = spr_hair3_jutsuDashFromDown; break;
						}
				
						switch(global.clothing){ //CLOTHING
							case 0: clothing = spr_clothing0_jutsuDashFromDown; break;
						}
				
						eyes = spr_eyes_jutsuDashFromDown; // EYES
				break;
						
				case "transform":
					if(transformation == 1){
						switch(global.head){ //HEAD
								case 0: head = spr_head_transform1tail; break;
							}
				
							switch(global.hair){ //HAIR
								case 0: hair = spr_hair0_transform1tail; break;
								case 1: hair = spr_hair1_transform1tail; break;
								case 2: hair = spr_hair2_transform1tail; break;
								case 3: hair = spr_hair3_transform1tail; break;
							}
				
							switch(global.clothing){ //CLOTHING
								case 0: clothing = spr_clothing0_transform1tail; break;
							}
				
							eyes = spr_eyes_transform1tail; // EYES
					} else if (transformation == 2) {
						draw_sprite_ext(spr_4Tails_transform, -1, x, y, 1*(charDirection), 1, 0, jinchuuriki_color, 1);
					}
									
				break;
						
				case "detransform":
					switch(global.head){ //HEAD
							case 0: head = spr_head_transform1tail; break;
						}
				
						switch(global.hair){ //HAIR
							case 0: hair = spr_hair0_transform1tail; break;
							case 1: hair = spr_hair1_transform1tail; break;
							case 2: hair = spr_hair2_transform1tail; break;
							case 3: hair = spr_hair3_transform1tail; break;
						}
				
						switch(global.clothing){ //CLOTHING
							case 0: clothing = spr_clothing0_transform1tail; break;
						}
				
						eyes = spr_eyes_transform1tail; // EYES
				break;
			}
	}
	
	//Send Stance for Icon
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
}
