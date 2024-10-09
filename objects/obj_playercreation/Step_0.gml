if(animation > 7){
	animation = 0;	
} else if (animation < 0) {
	animation = 7;	
}

image_index = image;

switch(animation){
		case 0:	
	headAnimation = spr_head_stance;
	hair0Animation = spr_hair0_stance;
	hair1Animation = spr_hair1_stance;
	hair2Animation = spr_hair2_stance;
	hair3Animation = spr_hair3_stance;
	clothingAnimation = spr_clothing0_stance;
	eyesAnimation = spr_eyes_stance;
	break;
		case 1:	
	headAnimation = spr_head_running;
	hair0Animation = spr_hair0_running;
	hair1Animation = spr_hair1_running;
	hair2Animation = spr_hair2_running;
	hair3Animation = spr_hair3_running;
	clothingAnimation = spr_clothing0_running;
	eyesAnimation = spr_eyes_running;
	break;
		case 2:	
	headAnimation = spr_head_jumping;
	hair0Animation = spr_hair0_jumping;
	hair1Animation = spr_hair1_jumping;
	hair2Animation = spr_hair2_jumping;
	hair3Animation = spr_hair3_jumping;
	clothingAnimation = spr_clothing0_jumping;
	eyesAnimation = spr_eyes_jumping;
	break;
		case 3:	
	headAnimation = spr_head_falling;
	hair0Animation = spr_hair0_falling;
	hair1Animation = spr_hair1_falling;
	hair2Animation = spr_hair2_falling;
	hair3Animation = spr_hair3_falling;
	clothingAnimation = spr_clothing0_falling;
	eyesAnimation = spr_eyes_falling;
	break;
		case 4:	
	headAnimation = spr_head_combo1;
	hair0Animation = spr_hair0_combo1;
	hair1Animation = spr_hair1_combo1;
	hair2Animation = spr_hair2_combo1;
	hair3Animation = spr_hair3_combo1;
	clothingAnimation = spr_clothing0_combo1;
	eyesAnimation = spr_eyes_combo1;
	break;
		case 5:	
	headAnimation = spr_head_combo2;
	hair0Animation = spr_hair0_combo2;
	hair1Animation = spr_hair1_combo2;
	hair2Animation = spr_hair2_combo2;
	hair3Animation = spr_hair3_combo2;
	clothingAnimation = spr_clothing0_combo2;
	eyesAnimation = spr_eyes_combo2;
	break;
		case 6:	
	headAnimation = spr_head_combo3;
	hair0Animation = spr_hair0_combo3;
	hair1Animation = spr_hair1_combo3;
	hair2Animation = spr_hair2_combo3;
	hair3Animation = spr_hair3_combo3;
	clothingAnimation = spr_clothing0_combo3;
	eyesAnimation = spr_eyes_combo3;
	break;
		case 7:	
	headAnimation = spr_head_hit;
	hair0Animation = spr_hair0_hit;
	hair1Animation = spr_hair1_hit;
	hair2Animation = spr_hair2_hit;
	hair3Animation = spr_hair3_hit;
	clothingAnimation = spr_clothing0_hit;
	break;
}