/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if(keyboard_check_pressed(ord("Z"))){
	if (InventoryAdd(obj_hud, item)){
		instance_destroy();	
		audio_play_sound(snd_item, 0, false);
	} else {
		audio_play_sound(snd_denied, 0, false);	
	}
}