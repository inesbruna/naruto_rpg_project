if(grounded){
	gpu_set_fog(true, c_black, 0, 1);
	draw_sprite_pos(sprite_index, image_index, x-(sprite_width/2)-5, y+42, x+(sprite_width/2)-5, y+42, x+(sprite_width/2), y+26, x-(sprite_width/2), y+26, .5);
	gpu_set_fog(false, c_black, 0, 0);
}

draw_self();

if (chargingchakra){
	draw_sprite(spr_chakra, -1, x, y);	
}

if(transformation == 1){
	draw_sprite_ext(spr_yellowAura, -1, x, y+10, 1, 1, 0, c_white, 0.65);
}