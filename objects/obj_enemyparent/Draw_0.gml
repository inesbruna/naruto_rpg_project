/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if(grounded){
	gpu_set_fog(true, c_black, 0, 1);
	draw_sprite_pos(sprite_index, image_index, x-(sprite_width/2)-5, y+42, x+(sprite_width/2)-5, y+42, x+(sprite_width/2), y+26, x-(sprite_width/2), y+26, .5);
	gpu_set_fog(false, c_black, 0, 0);
}

draw_self();