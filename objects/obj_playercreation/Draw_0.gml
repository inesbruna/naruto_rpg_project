//stance
if(stance){
	//head
	switch(head){
		case 0: draw_sprite_ext(headAnimation, -1, x, y, 6, 6, 0, c_white, 1);
		break;
	}

	switch(hair){
		case 0: draw_sprite_ext(hair0Animation, -1, x, y, 6, 6, 0, hairColor, 1);
		break;
		case 1: draw_sprite_ext(hair1Animation, -1, x, y, 6, 6, 0, hairColor, 1);
		break;
		case 2: draw_sprite_ext(hair2Animation, -1, x, y, 6, 6, 0, hairColor, 1);
		break;
		case 3: draw_sprite_ext(hair3Animation, -1, x, y, 6, 6, 0, hairColor, 1);
		break; 
	}
	
	switch(clothing){
		case 0: draw_sprite_ext(clothingAnimation, -1, x, y, 6, 6, 0, c_white, 1);
		break;
	}
	
	if(animation != 7 && animation != 8){
		draw_sprite_ext(eyesAnimation, -1, x, y, 6, 6, 0, eyesColor, 1);
	}
	
	draw_text(x,y-50,image_index);
}