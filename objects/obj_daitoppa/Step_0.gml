/// @description Draw & Timer

if(image_index > 2 && image_index <= 4){
	//Create Hitbox
	var _hitbox = instance_create_depth(x, y, depth, obj_daitoppa_hitbox);
	_hitbox.player = self;
	_hitbox.image_xscale = obj_player.charDirection;	
}

if !(obj_player.state == "wait"){
	instance_destroy();
}

y = obj_player.y + 60;