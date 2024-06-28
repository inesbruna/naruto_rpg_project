if(!dead){
	hspd = 0;
	hp -= global.player_intelligence/5;
	state = e_state.hit;
	hitting = true;
	if image_xscale=+1 hspd-=1.5;
	if image_xscale=-1 hspd+=1.5;
	alarm[0]=30;
	sprite_index = spr_konohaenemy_hit;
	audio_play_sound(snd_hit, 1, 0);
}
