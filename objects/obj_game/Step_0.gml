/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if (room == character_creator){
	if (roomLast == konoha){
		roomLast = character_creator;
	}
}

if (room == konoha){
	if (roomLast == noone){
		if(!instance_exists(obj_player)){
			instance_create_depth(135, 230, -99999, obj_player);
		} else {
			obj_player.x = 135;
			obj_player.y = 230;
		}
		
		roomLast = konoha;
	} else if (roomLast == character_creator){
		if(!instance_exists(obj_player)){
			instance_create_depth(135, 230, -99999, obj_player);
		} else {
			obj_player.x = lastX;
			obj_player.y = lastY;
		}
		
		roomLast = konoha;	
	}
}

if(room == konoha){
	tick += 0.01;
	
	if(tick == 1){
		global.player_health += 1;
		tick = 0;
	}
}

if(room == konoha){
	if(!instance_exists(obj_hud)){
		instance_create_depth(0,0,-99,obj_hud);	
	}

	if(!instance_exists(obj_player)){
		instance_create_depth(85,115,-9,obj_player);	
	}
}

//Soundtrack

if (room == konoha && !audio_is_playing(snd_soundtrackWillOfFire)){
	//remove all the others soundtracks
	audio_stop_all();
	//start soundtrack
	audio_play_sound(snd_soundtrackWillOfFire, 0, true);
} else if ((room == training_grounds || room == forest) && !audio_is_playing(snd_soundtrackRinkai)){
	//remove all the others soundtracks
	audio_stop_all();
	//start soundtrack
	audio_play_sound(snd_soundtrackRinkai, 0, true);
}

//limiter
if (global.player_chakra > global.player_chakramax){
	global.player_chakra = global.player_chakramax;
} else if (global.player_chakra < 0){
	global.player_chakra = 0;	
}

if (global.player_health > global.player_healthmax){
	global.player_health = global.player_healthmax;
} else if (global.player_health < 0){
	global.player_health = 0;	
}

//xp level
if (global.player_xp >= global.player_level * 100){
 global.player_xp = global.player_xp - global.player_level * 100;
 global.player_level++;
 global.player_points++;
}