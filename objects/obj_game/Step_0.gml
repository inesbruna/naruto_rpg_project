/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if(!instance_exists(obj_hud)){
	instance_create_depth(0,0,-99,obj_hud);	
}

if(!instance_exists(obj_player)){
	instance_create_depth(85,115,-9,obj_player);	
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