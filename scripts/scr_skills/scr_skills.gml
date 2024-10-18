function scr_doryuheki(skill_cooldown){
	if(global.player_chakra >= 50){
		skill_cooldown = true;
		hspd = 0;
		instance_create_depth(x+(80*charDirection), y, 99, obj_doryuheki);
		audio_play_sound(snd_jutsu, 0, false);
		global.player_chakra -= 50;
		lastState = "down";
		timer = 10;
		state = "wait";
		
		return 600; //Doryuheki no Jutsu Cooldown (20s)
	} else {
		return 0; //No chakra	
	}
}

function scr_shadowclon(skill_cooldown){
	if(!instance_exists(obj_clon) && global.player_chakra >= 30 && !skill1_cooldown){
		skill_cooldown = true;
		hspd = 0;
		instance_create_depth(x-30, y, 99, obj_clon);
		instance_create_depth(x-30, y, 9, obj_smoke);
		audio_play_sound(snd_jutsu, 0, false);
		audio_play_sound(snd_smoke, 0, false);
		global.player_chakra -= 30;
		lastState = "clon";
		timer = 25;
		state = "wait";
		
		return 0; //Shadow Clon Cooldown (0s)
	} else {
		return 0; //No chakra	
	}
}