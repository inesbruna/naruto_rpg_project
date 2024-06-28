/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
with(obj_player){
	if(place_meeting(x, y, obj_forest)){
		if(room = training_grounds){
			room_goto(forest);
			obj_player.x = 30;
			obj_player.y = 170;
		}
	}
	if(place_meeting(x, y, obj_trainingGrounds)){
		room_goto(training_grounds);
		if(room == konoha){
			obj_player.x = 68;
			obj_player.y = 214;
		} else {
			obj_player.x = 950;
			obj_player.y = 170;
		}
	}
	if(place_meeting(x, y, obj_konoha)){
		room_goto(konoha);
		obj_player.x = 926;
		obj_player.y = 148;
	}
}