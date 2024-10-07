/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

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