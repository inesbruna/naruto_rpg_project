/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if(!dead){
	hspd = 0;
	hp -= global.player_strength;
	state = "hit";
	hitting = true;
	if image_xscale=+1 hspd-=2;
	if image_xscale=-1 hspd+=2;
	
	
	
	alarm[0]=30;
	sprite_index = spr_konohaenemy_hit;
	audio_play_sound(snd_hit, 1, 0);
	draw_sprite(spr_hit, -1, x, y);
}