/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
//stance
if(stance){
	//head
	switch(head){
		case 0: draw_sprite_ext(spr_head_stance, -1, x, y, 6, 6, 0, c_white, 1);
		break;
	}

	switch(hair){
		case 0: draw_sprite_ext(spr_hair0_stance, -1, x, y, 6, 6, 0, hairColor, 1);
		break;
		case 1: draw_sprite_ext(spr_hair1_stance, -1, x, y, 6, 6, 0, hairColor, 1);
		break;
		case 2: draw_sprite_ext(spr_hair2_stance, -1, x, y, 6, 6, 0, hairColor, 1);
		break;
		case 3: draw_sprite_ext(spr_hair3_stance, -1, x, y, 6, 6, 0, hairColor, 1);
		break; 
	}
	
	switch(clothing){
		case 0: draw_sprite_ext(spr_clothing0_stance, -1, x, y, 6, 6, 0, c_white, 1);
		break;
	}
	
	draw_sprite_ext(spr_eyes_stance, -1, x, y, 6, 6, 0, eyesColor, 1);
}