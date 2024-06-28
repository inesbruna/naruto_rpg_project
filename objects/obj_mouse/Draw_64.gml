/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var mx = (window_mouse_get_x()/window_get_width()) * display_get_gui_width();
var my = (window_mouse_get_y()/window_get_height()) * display_get_gui_height();

if (itemDrag != -1){
	draw_set_alpha(0.5);
	draw_sprite_ext(spr_items, itemDrag, mx, my, 3, 3, 0, c_white, 0.5);
	draw_set_alpha(1.0);
}

if ((slotHover != -1) && (inventoryHover.inventory[slotHover] != -1)){ //Verificar slot
	var items = variable_struct_get_names(obj_game.s_items);
		for (var i = array_length(items)-1; i >= 0; --i) {
		    var k = items[i];
			var v = variable_struct_get(obj_game.s_items, k);
		if(inventoryHover.inventory[slotHover] == v.item_id){
			var name = v.name;
			var description = v.description;
			var hp = v.hp;
			var chakra = v.chakra;
			var strength = v.strength;
			var intelligence = v.intelligence;
			var type = v.type;
		}
	}
	if(type == "legendary") draw_set_color(c_purple);
	draw_text(577, 160, name);
	draw_set_color(c_white);
	draw_text(577, 180, description);
	draw_text(577, 240, "Health: " + string(hp));
	draw_text(807, 240, "Chakra: " + string(chakra));
	draw_text(577, 270, "Strength: " + string(strength));
	draw_text(807, 270, "Intelligence: " + string(intelligence));
}

if (state == stateThrow){
	xx = 750;
	yy = 230;
	draw_sprite_ext(spr_warning, -1, xx, yy, 3, 3, 0, c_white, 1);
	draw_text(xx+25, yy+25, "Do you really wanna\nthrow away this item?");
	if point_in_circle(mx, my, xx+400, yy+152, 36)
	{
		draw_sprite_ext(spr_confirm, 1, xx+400, yy+172, 3, 3, 0, c_white, 1);	
	} else {
		draw_sprite_ext(spr_confirm, 0, xx+400, yy+172, 3, 3, 0, c_white, 1);	
	}
	if point_in_circle(mx, my, xx+490, yy+152, 36)
	{
		draw_sprite_ext(spr_recuse, 1, xx+490, yy+172, 3, 3, 0, c_white, 1);	
	} else {
		draw_sprite_ext(spr_recuse, 0, xx+490, yy+172, 3, 3, 0, c_white, 1);	
	}
}


/*
if(instance_exists(obj_hud) && instance_exists(obj_equipments)){
	draw_text(200, 140, "Item Carregado: " + string(itemDrag));
	draw_text(200, 170, "Slot do Item Carregado (slotDrag): " + string(slotDrag));
	draw_text(200, 200, "Slot apontado atual (slotHover): " + string(slotHover));
	draw_text(200, 230, "ID 1 (inventoryDrag): " + string(inventoryDrag));
	draw_text(200, 260, "ID 2 (inventoryHover): " + string(inventoryHover));
	if (slotHover >= 0 && slotHover <= 23 ){
		//draw_text(200, 230, "ID do item carregado: " + string(obj_hud.inventory[slotDrag]));
		draw_text(200, 290, "ID do item apontado (inventory): " + string(obj_hud.inventory[slotHover]));
	}
	if (slotHover >= 0 && slotHover <= 23 ){
		//draw_text(200, 230, "ID do item carregado: " + string(obj_hud.inventory[slotDrag]));
		draw_text(200, 320, "ID do item apontado (equip): " + string(obj_equipments.inventory[slotHover]));
	}
}*/
