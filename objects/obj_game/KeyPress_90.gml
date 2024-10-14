/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
with(obj_player){
	if(place_meeting(x, y, obj_forest)){
		if(room = training_grounds){
			instance_create_depth(0, 0, -999999, obj_fade);
			room_goto(forest);
			obj_player.x = 30;
			obj_player.y = 170;
			if(instance_exists(obj_clon)){
				obj_clon.x = 30;
				obj_clon.y = 170;	
			}
		}
	}
	if(place_meeting(x, y, obj_trainingGrounds)){
		instance_create_depth(0, 0, -999999, obj_fade);
		room_goto(training_grounds);
		if(room == konoha){
			obj_player.x = 68;
			obj_player.y = 214;
			if(instance_exists(obj_clon)){
				obj_clon.x = 68;
				obj_clon.y = 214;	
			}
		} else {
			obj_player.x = 950;
			obj_player.y = 170;
			if(instance_exists(obj_clon)){
				obj_clon.x = 950;
				obj_clon.y = 170;	
			}
		}
	}
	if(place_meeting(x, y, obj_konoha)){
		instance_create_depth(0, 0, -999999, obj_fade);
		room_goto(konoha);
		obj_player.x = 926;
		obj_player.y = 148;
		if(instance_exists(obj_clon)){
			obj_clon.x = 926;
			obj_clon.y = 148;	
		}
	}
}