/// @description Hitbox & Sync

//Sync movement with player dash
x = obj_player.x + 30;
y = obj_player.y + 70;

//Hitbox
if(image_index > 1 && image_index <= 7){
	//Create Hitbox
	var _hitbox = instance_create_depth(x, y, depth, obj_chidori_hitbox);
	_hitbox.player = self;
	_hitbox.image_xscale = obj_player.charDirection;	
}

if(image_index > 7 && image_index <= 9){
	//Create Hitbox
	var _hitbox = instance_create_depth(x, y, depth, obj_chidoriExplosion_hitbox);
	_hitbox.player = self;
	_hitbox.image_xscale = obj_player.charDirection;	
}
