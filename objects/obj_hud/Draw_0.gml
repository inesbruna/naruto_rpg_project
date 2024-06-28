/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
with(obj_player){
	if(place_meeting(x, y, obj_forest)){
		draw_sprite(spr_arrow, 0, obj_player.x-15 , obj_player.y-70);	
	}

	if(place_meeting(x, y, obj_trainingGrounds)){
		if(room == konoha){
			draw_sprite(spr_arrow, 0, obj_player.x-15 , obj_player.y-70);	
		} else {
			draw_sprite(spr_arrow, 1, obj_player.x-15 , obj_player.y-70);	
		}
	}
	if(place_meeting(x, y, obj_konoha)){
		draw_sprite(spr_arrow, 1, obj_player.x-15 , obj_player.y-70);	
	}
}