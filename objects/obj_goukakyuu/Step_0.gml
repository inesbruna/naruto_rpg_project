/// @description Draw & Timer

if(image_index > 0 && image_index <= 5){
	//Create Hitbox
	var _hitbox = instance_create_depth(x, y, depth, obj_goukakyuu_hitbox);
	_hitbox.player = self;
	_hitbox.image_xscale = obj_player.charDirection;	
}

if !(obj_player.state == "wait"){
	instance_destroy();
}