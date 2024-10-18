state = "air";

if (self = obj_anbu){
	sprite_index = spr_anbu_air;
} else if (self = obj_konohaenemy){
	sprite_index = spr_konohaenemy_air	
}


hp -= global.player_intelligence/6;
endAction = false;
alarm[1] = 30;

vspd -= 2;
if image_xscale=+1 hspd-=3;
if image_xscale=-1 hspd+=3;
	
alarm[0]=30;
audio_play_sound(snd_hit, 1, 0);