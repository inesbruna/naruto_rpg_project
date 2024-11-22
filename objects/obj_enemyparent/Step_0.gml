//Skills collision
var chidori_collision = place_meeting(x, y, obj_chidori_hitbox);
var chidoriE_collision = place_meeting(x, y, obj_chidoriExplosion_hitbox);
var daitoppa_collision = place_meeting(x, y, obj_daitoppa_hitbox);
var doryuheki_collision = place_meeting(x, y, obj_doryuheki_hitbox);
var goukakyuu_collision = place_meeting(x, y, obj_goukakyuu_hitbox);
var suiryuudan_collision = place_meeting(x, y, obj_suiryuudan_hitbox);

//Collision
if (chidori_collision || chidoriE_collision || daitoppa_collision || goukakyuu_collision || suiryuudan_collision){
	state = "hit";

	if (self == obj_anbu){
		sprite_index = spr_anbu_hit;
	} else if (self = obj_konohaenemy){
		sprite_index = spr_konohaenemy_hit;	
	}

	hp -= global.player_intelligence/6;
	endAction = false;
	alarm[1] = 30;
	
	alarm[0]=30;
	audio_play_sound(snd_hit, 1, 0);	
}

if (doryuheki_collision){
	state = "air";

	if (self == obj_anbu){
		sprite_index = spr_anbu_air;
	} else if (self = obj_konohaenemy){
		sprite_index = spr_konohaenemy_air	
	}


	hp -= global.player_intelligence/5;
	endAction = false;
	alarm[1] = 30;

	vspd -= 2;
	if image_xscale == 1 hspd-=3;
	if image_xscale == -1 hspd+=3;
	
	alarm[0]=30;
	audio_play_sound(snd_hit, 1, 0);	
}
