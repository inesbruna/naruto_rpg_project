/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor 
//menu
if(open_menu){
	draw_sprite_ext(spr_menu, -1, 500, 200, 3, 3, 0, c_white, 1);
	draw_text(560, 240, "Nickname: ");
	draw_text(560, 270, "Level: ");
	draw_text(560, 300, "Class: noone");
	draw_sprite(spr_rasengan, -1, 550, 450);
	draw_text(650, 465, "Skill 1: Rasengan");
	draw_text(1200, 420, "Status");
	draw_text(1200, 450, "HP: " + string(global.player_healthmax));
	draw_text(1200, 480, "Chakra: " + string(global.player_chakramax));
	draw_text(1200, 510, "Strength: " + string(global.player_strength));
	draw_text(1200, 540, "Intelligence: " + string(global.player_intelligence));
}

if(open_inventory){
	draw_sprite_ext(spr_inventory, -1, 500, 130, 3, 3, 0, c_white, 1);

	for (var i = 0; i < INVENTORY_SLOTS; i += 1)
	{
		var xx = 577 + (i mod rowLength) * 108 + 2;
		var yy = 370 + (i div rowLength) * 108 + 2;
		var hover = (obj_mouse.inventoryHover == id) && (obj_mouse.slotHover == i)
		draw_sprite_ext(spr_inventorybox,hover,xx,yy, 3, 3, 0, c_white, 1);
		if (inventory[i] != -1){
			var alpha = 1.0;
			if (obj_mouse.inventoryDrag == id) && (obj_mouse.slotDrag == i) alpha = 0.5;
			draw_set_alpha(alpha);
			draw_sprite_ext(spr_items, inventory[i], xx-6, yy, 3, 3, 0, c_white, 1);
			draw_text(xx+80, yy+72, stack[i]);
			draw_set_alpha(1.0);
		}
	}
}

