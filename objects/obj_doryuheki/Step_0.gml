/// @description Draw & Timer

//Timer Count
timer--;

if((image_index >= (image_number/2)) && (timer > 0)){
	image_speed = 0;
	image_index = image_number/2;
}

if(timer <= 0){
	image_speed = 0.5;
	if(image_index >= image_number -1){
		instance_destroy();
	}
}

if(image_index >= 0 && image_index <= 5){
	//Create Hitbox
	var _hitbox = instance_create_depth(x, y-30, depth, obj_doryuheki_hitbox);
	_hitbox.player = self;
	_hitbox.image_xscale = obj_player.charDirection;	
}