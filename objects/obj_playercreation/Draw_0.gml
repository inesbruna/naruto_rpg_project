//Draw parts
if(animation != 16){
	if(transformation == 0){
		switch(head){
			case 0: draw_sprite_ext(headAnimation, img_index, x, y, 6, 6, 0, c_white, 1);
			break;
		}

		switch(hair){
			case 0: draw_sprite_ext(hair0Animation, img_index, x, y, 6, 6, 0, hairColor, 1);
			break;
			case 1: draw_sprite_ext(hair1Animation, img_index, x, y, 6, 6, 0, hairColor, 1);
			break;
			case 2: draw_sprite_ext(hair2Animation, img_index, x, y, 6, 6, 0, hairColor, 1);
			break;
			case 3: draw_sprite_ext(hair3Animation, img_index, x, y, 6, 6, 0, hairColor, 1);
			break; 
		}
	
		switch(clothing){
			case 0: draw_sprite_ext(clothingAnimation, img_index, x, y, 6, 6, 0, c_white, 1);
			break;
		}
	
		if(animation != 7 && animation != 8){
			draw_sprite_ext(eyesAnimation, img_index, x, y, 6, 6, 0, eyesColor, 1);
		}
	}
} else {
if(transformation == 0){
		switch(clothing){
			case 0: draw_sprite_ext(clothingAnimation, img_index, x, y, 6, 6, 0, c_white, 1);
			break;
		}
	
		switch(head){
			case 0: draw_sprite_ext(headAnimation, img_index, x, y, 6, 6, 0, c_white, 1);
			break;
		}

		switch(hair){
			case 0: draw_sprite_ext(hair0Animation, img_index, x, y, 6, 6, 0, hairColor, 1);
			break;
			case 1: draw_sprite_ext(hair1Animation, img_index, x, y, 6, 6, 0, hairColor, 1);
			break;
			case 2: draw_sprite_ext(hair2Animation, img_index, x, y, 6, 6, 0, hairColor, 1);
			break;
			case 3: draw_sprite_ext(hair3Animation, img_index, x, y, 6, 6, 0, hairColor, 1);
			break; 
		}
	
		if(animation != 7 && animation != 8){
			draw_sprite_ext(eyesAnimation, img_index, x, y, 6, 6, 0, eyesColor, 1);
		}
	}
}

if(devmode){
	draw_text(x-120,y+25,"Image Frame: " + string(img_index));
}
