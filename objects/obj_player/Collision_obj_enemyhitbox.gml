/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if(defense = false && transforming = false){
	audio_play_sound(snd_hit, 1, 0);
	global.player_health -= 5;
	hitting = true;
	alarm[1]=30;
	hspd = 0;
	
	if image_xscale=+1 hspd-=2;

	if image_xscale=-1 hspd+=2;
	
	//wall collision
	if(place_meeting(x+hspd, y, obj_wall)){
	while(!place_meeting(x+sign(hspd), y, obj_wall)){
		x = x + sign(hspd);
	} 
		hspd = 0;
	} 
	
	if(selection==0){
		switch(transformation){
			case 0: sprite_index = spr_naruto_hit; break;
			case 1: sprite_index = spr_naruto_sixpaths_hit; break;
		}
	} 

	attacking = false;
	canAttack = true;
} else {
	audio_play_sound(snd_hit2, 1, 0);	
}
