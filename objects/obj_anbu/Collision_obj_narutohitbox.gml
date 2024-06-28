/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if(!dead){
	hspd = 0;
	hp -= global.player_strength;
	state = e_state.hit;
	hitting = true;
	if image_xscale=+1 hspd-=1.5;
	if image_xscale=-1 hspd+=1.5;
	alarm[0]=30;
	sprite_index = spr_anbu_hit;
	audio_play_sound(snd_hit, 1, 0);
	draw_sprite(spr_hit, -1, x, y);
}