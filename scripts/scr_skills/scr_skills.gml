//Skills
function scr_doryuheki(skill){
	if(global.player_chakra >= 50 && grounded){
		img_frame = 0;
		hspd = 0;
		instance_create_depth(x+(80*charDirection), y, 99, obj_doryuheki);
		audio_play_sound(snd_jutsu, 0, false);
		global.player_chakra -= 50;
		lastState = "down";
		timer = 20;
		state = "wait";
		
		scr_cooldown(skill);
		
		return 600; //Doryuheki no Jutsu Cooldown (20s)
	} else {
		return 0; //No chakra	
	}
}

function scr_shadowclon(skill){
	if(!instance_exists(obj_clon) && global.player_chakra >= 30 && !skill1_cooldown && grounded){
		img_frame = 0;
		hspd = 0;
		instance_create_depth(x-30, y, 99, obj_clon);
		instance_create_depth(x-30, y, 9, obj_smoke);
		audio_play_sound(snd_jutsu, 0, false);
		audio_play_sound(snd_smoke, 0, false);
		global.player_chakra -= 30;
		lastState = "clon";
		timer = 25;
		state = "wait";
		
		scr_cooldown(skill);
		
		return 600; //Shadow Clon Cooldown (0s)
	} else {
		return 0; //No chakra	
	}
}

function scr_goukakyuu(skill){
	if(global.player_chakra >= 50 && grounded){
		img_frame = 0;
		hspd = 0;
		audio_play_sound(snd_jutsu, 0, false);
		global.player_chakra -= 50;
		lastState = "jutsuSpit";
		timer = 120;
		state = "wait";

		instance_create_depth(x+(60*charDirection), y-20, 99, obj_goukakyuu);
		
		scr_cooldown(skill);
		
		return 600; //Goukakyuu no Jutsu Cooldown (20s)
	} else {
		return 0; //No chakra	
	}
}

function scr_daitoppa(skill){
	if(global.player_chakra >= 50){
		if(grounded){
			//Jump
			audio_play_sound(snd_jump, 10, false);
		    vspd = vspd - 7;
			wasGrounded = true;
		} else {
			wasGrounded = false;	
		}
		
		//Skill
		hspd = 0;
		audio_play_sound(snd_jutsu, 0, false);
		global.player_chakra -= 50;
		lastState = "jumpJutsuSpit";
		timer = 30;
		state = "wait";

		instance_create_depth(x+(70*charDirection), y-20, 99, obj_daitoppa);
		
		scr_cooldown(skill);
		
		return 600; //Daitoppa no Jutsu Cooldown (20s)
	} else {
		return 0; //No chakra	
	}
}

function scr_suiryuudan(skill){
	if(global.player_chakra >= 50 && grounded){
		img_frame = 0;
		hspd = 0;
		audio_play_sound(snd_jutsu, 0, false);
		global.player_chakra -= 50;
		lastState = "chargingChakra";
		timer = 30;
		state = "wait";

		instance_create_depth(x, y, 99, obj_suiryuudan);
		
		scr_cooldown(skill);
		
		return 600; //Suiryuudan no Jutsu Cooldown (20s)
	} else {
		return 0; //No chakra	
	}
}

function scr_chidori(skill){
	if(global.player_chakra >= 50 && grounded){
		hspd = 0;
		img_frame = 0;
		audio_play_sound(snd_jutsu, 0, false);
		global.player_chakra -= 50;
		lastState = "jutsuDashFromDown";
		timer = 45;
		state = "wait";

		audio_play_sound(snd_chidori, 0, false);
		instance_create_depth(x, y, -99, obj_chidori);

		scr_cooldown(skill);
		
		return 600; //Chidori no Jutsu Cooldown (20s)
		
	} else {
		return 0; //No chakra	
	}
}

//CD
function scr_cooldown(skill){
	switch (skill){
		case 1: skill1_cooldown = true;
		break;
		case 2: skill2_cooldown = true;
		break;
		case 3: skill3_cooldown = true;
		break;
		case 4: skill4_cooldown = true;
		break;
		case 5: skill5_cooldown = true;
		break;
		case 6: skill6_cooldown = true;
		break;
	}
	
	return 0;
}
