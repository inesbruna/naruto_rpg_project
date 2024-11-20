/// @description Draw & Timer
image_xscale = skillDirection;

if(image_index > 0 && image_index <= 8){
	//Create Hitbox
	var _hitbox = instance_create_depth(x, y, depth, obj_suiryuudan_hitbox);
	_hitbox.player = self;
	_hitbox.image_xscale = obj_player.charDirection;	
}

//Movement
x = x + (5*skillDirection);