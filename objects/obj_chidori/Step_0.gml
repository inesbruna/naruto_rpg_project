/// @description Hitbox & Sync

//Sync movement with player dash
x = obj_player.x - 80;
y = obj_player.y - 140;

if (obj_player.charDirection == -1){
	image_xscale = -1;	
} else {
	image_xscale = 1;	
}

//Hitbox
if(image_index >= 1 && image_index <= 6){
	//Create Hitbox
	var _hitbox = instance_create_depth(x, y, depth, obj_chidori_hitbox);
	_hitbox.player = self;
	_hitbox.image_xscale = obj_player.charDirection;	
}

if(image_index > 6){
	//Create Hitbox
	var _hitbox = instance_create_depth(x, y, depth, obj_chidoriExplosion_hitbox);
	_hitbox.player = self;
	_hitbox.image_xscale = obj_player.charDirection;	
}
