var max_animations = 17;

//Devmode
if(keyboard_check_pressed(vk_f1)){
	if(!devmode){
		devmode = true;	
	} else {
		devmode = false;
	}
}

if(keyboard_check_pressed(vk_f2)){
	if(transformation == 0){
		transformation = 1;
	} else {
		transformation = 0;
	}	
}

// Get image_number
total_frames = sprite_get_number(headAnimation);

if(!devmode){
	//Image Index
	img_index = ++img_frame div img_speed;
}

//Reset img_frame
if (img_index > total_frames - 1) { //End animation
	img_frame = 0;
	//Update image index
	img_index = img_frame div img_speed;
}

if(devmode){	
	//Frame Control		
	if(keyboard_check_pressed(vk_up)){
		img_index++;
	}
		
	if(keyboard_check_pressed(vk_down)){
		img_index--;
	}
}

//Animation Control
if(animation > max_animations){
	animation = 0;	
} else if (animation < 0) {
	animation = max_animations;	
}

if(keyboard_check_pressed(vk_left)){
	animation--;
}
	
if(keyboard_check_pressed(vk_right)){
	animation++;
}

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
	eyesAnimation = noone;
	break;
		case 8:	
	headAnimation = spr_head_dead;
	hair0Animation = spr_hair0_dead;
	hair1Animation = spr_hair1_dead;
	hair2Animation = spr_hair2_dead;
	hair3Animation = spr_hair3_dead;
	clothingAnimation = spr_clothing0_dead;
	eyesAnimation = noone;
	break;
		case 9:	
	headAnimation = spr_head_defense;
	hair0Animation = spr_hair0_defense;
	hair1Animation = spr_hair1_defense;
	hair2Animation = spr_hair2_defense;
	hair3Animation = spr_hair3_defense;
	clothingAnimation = spr_clothing0_defense;
	eyesAnimation = spr_eyes_defense;
	break;
		case 10:	
	headAnimation = spr_head_down;
	hair0Animation = spr_hair0_down;
	hair1Animation = spr_hair1_down;
	hair2Animation = spr_hair2_down;
	hair3Animation = spr_hair3_down;
	clothingAnimation = spr_clothing0_down;
	eyesAnimation = spr_eyes_down;
	break;
		case 11:	
	headAnimation = spr_head_chargingChakra;
	hair0Animation = spr_hair0_chargingChakra;
	hair1Animation = spr_hair1_chargingChakra;
	hair2Animation = spr_hair2_chargingChakra;
	hair3Animation = spr_hair3_chargingChakra;
	clothingAnimation = spr_clothing0_chargingChakra;
	eyesAnimation = spr_eyes_chargingChakra;
	break;
		case 12:	
	headAnimation = spr_head_throw;
	hair0Animation = spr_hair0_throw;
	hair1Animation = spr_hair1_throw;
	hair2Animation = spr_hair2_throw;
	hair3Animation = spr_hair3_throw;
	clothingAnimation = spr_clothing0_throw;
	eyesAnimation = spr_eyes_throw;
	break;
		case 13:	
	headAnimation = spr_head_jutsuSpit;
	hair0Animation = spr_hair0_jutsuSpit;
	hair1Animation = spr_hair1_jutsuSpit;
	hair2Animation = spr_hair2_jutsuSpit;
	hair3Animation = spr_hair3_jutsuSpit;
	clothingAnimation = spr_clothing0_jutsuSpit;
	eyesAnimation = spr_eyes_jutsuSpit;
	break;
		case 14:	
	headAnimation = spr_head_jumpJutsuSpit;
	hair0Animation = spr_hair0_jumpJutsuSpit;
	hair1Animation = spr_hair1_jumpJutsuSpit;
	hair2Animation = spr_hair2_jumpJutsuSpit;
	hair3Animation = spr_hair3_jumpJutsuSpit;
	clothingAnimation = spr_clothing0_jumpJutsuSpit;
	eyesAnimation = spr_eyes_jumpJutsuSpit;
	break;
		case 15:	
	headAnimation = spr_head_jutsuDashFromDown;
	hair0Animation = spr_hair0_jutsuDashFromDown;
	hair1Animation = spr_hair1_jutsuDashFromDown;
	hair2Animation = spr_hair2_jutsuDashFromDown;
	hair3Animation = spr_hair3_jutsuDashFromDown;
	clothingAnimation = spr_clothing0_jutsuDashFromDown;
	eyesAnimation = spr_eyes_jutsuDashFromDown;
	break;
		case 16:	
	headAnimation = spr_head_transform1tail;
	hair0Animation = spr_hair0_transform1tail;
	hair1Animation = spr_hair1_transform1tail;
	hair2Animation = spr_hair2_transform1tail;
	hair3Animation = spr_hair3_transform1tail;
	clothingAnimation = spr_clothing0_transform1tail;
	eyesAnimation = spr_eyes_transform1tail;
	break;
		case 17:	
	headAnimation = spr_head_running_tail;
	hair0Animation = spr_hair0_running_tail;
	hair1Animation = spr_hair1_running_tail;
	hair2Animation = spr_hair2_running_tail;
	hair3Animation = spr_hair3_running_tail;
	clothingAnimation = spr_clothing0_running_tail;
	eyesAnimation = spr_eyes_running_tail;
	break;
}
