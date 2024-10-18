state = "hit";

if (self = obj_anbu){
	sprite_index = spr_anbu_hit;
} else if (self = obj_konohaenemy){
	sprite_index = spr_konohaenemy_hit;	
}

hp -= global.player_intelligence/5;
endAction = false;
alarm[1] = 30;
	
alarm[0]=30;
audio_play_sound(snd_hit, 1, 0);