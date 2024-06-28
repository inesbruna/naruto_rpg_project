/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor 

if(obj_hud.open_inventory){
	//SLOT WEAPON
	var xx = 1115 + (1 mod rowLength) * 108 + 2;
	var yy = 461 + (1 div rowLength) * 108 + 2;
	var hover = (obj_mouse.inventoryHover == id) && (obj_mouse.slotHover == 0)
	if(inventory[0] == -1){
		draw_sprite_ext(spr_inventoryboxWeapon,hover,xx,yy, 3, 3, 0, c_white, 1);
	} else {
		draw_sprite_ext(spr_inventorybox,hover,xx,yy, 3, 3, 0, c_white, 1);
	}
	if (inventory[0] != -1){
		var alpha = 1.0;
		if (obj_mouse.inventoryDrag == id) && (obj_mouse.slotDrag == 0) alpha = 0.5;
		draw_set_alpha(alpha);
		draw_sprite_ext(spr_items, inventory[0], xx-6, yy, 3, 3, 0, c_white, 1);
		draw_set_alpha(1.0);
	}
	//SLOT HEAD
	var xx = 1248 + (1 mod rowLength) * 108 + 2;
	var yy = 253 + (1 div rowLength) * 108 + 2;
	var hover = (obj_mouse.inventoryHover == id) && (obj_mouse.slotHover == 1)
	if(inventory[1] == -1){
		draw_sprite_ext(spr_inventoryboxHead,hover,xx,yy, 3, 3, 0, c_white, 1);
	} else {
		draw_sprite_ext(spr_inventorybox,hover,xx,yy, 3, 3, 0, c_white, 1);
	}
	if (inventory[1] != -1){
		var alpha = 1.0;
		if (obj_mouse.inventoryDrag == id) && (obj_mouse.slotDrag == 1) alpha = 0.5;
		draw_set_alpha(alpha);
		draw_sprite_ext(spr_items, inventory[1], xx-6, yy, 3, 3, 0, c_white, 1);
		draw_set_alpha(1.0);
	}
	//SLOT CHEST
	var xx = 1248 + (1 mod rowLength) * 108 + 2;
	var yy = 398 + (1 div rowLength) * 108 + 2;
	var hover = (obj_mouse.inventoryHover == id) && (obj_mouse.slotHover == 2)
	if(inventory[2] == -1){
		draw_sprite_ext(spr_inventoryboxChest,hover,xx,yy, 3, 3, 0, c_white, 1);
	} else {
		draw_sprite_ext(spr_inventorybox,hover,xx,yy, 3, 3, 0, c_white, 1);
	}
	if (inventory[2] != -1){
		var alpha = 1.0;
		if (obj_mouse.inventoryDrag == id) && (obj_mouse.slotDrag == 2) alpha = 0.5;
		draw_set_alpha(alpha);
		draw_sprite_ext(spr_items, inventory[2], xx-6, yy, 3, 3, 0, c_white, 1);
		draw_set_alpha(1.0);
	}
	//SLOT PANTS
	var xx = 1248 + (1 mod rowLength) * 108 + 2;
	var yy = 533 + (1 div rowLength) * 108 + 2;
	var hover = (obj_mouse.inventoryHover == id) && (obj_mouse.slotHover == 3)
	if(inventory[3] == -1){
		draw_sprite_ext(spr_inventoryboxPants,hover,xx,yy, 3, 3, 0, c_white, 1);
	} else {
		draw_sprite_ext(spr_inventorybox,hover,xx,yy, 3, 3, 0, c_white, 1);
	}
	if (inventory[3] != -1){
		var alpha = 1.0;
		if (obj_mouse.inventoryDrag == id) && (obj_mouse.slotDrag == 3) alpha = 0.5;
		draw_set_alpha(alpha);
		draw_sprite_ext(spr_items, inventory[3], xx-6, yy, 3, 3, 0, c_white, 1);
		draw_set_alpha(1.0);
	}
	//SLOT BOOTS
	var xx = 1248 + (1 mod rowLength) * 108 + 2;
	var yy = 668 + (1 div rowLength) * 108 + 2;
	var hover = (obj_mouse.inventoryHover == id) && (obj_mouse.slotHover == 4)
	if(inventory[4] == -1){
		draw_sprite_ext(spr_inventoryboxBoots,hover,xx,yy, 3, 3, 0, c_white, 1);
	} else {
		draw_sprite_ext(spr_inventorybox,hover,xx,yy, 3, 3, 0, c_white, 1);
	}
	if (inventory[4] != -1){
		var alpha = 1.0;
		if (obj_mouse.inventoryDrag == id) && (obj_mouse.slotDrag == 4) alpha = 0.5;
		draw_set_alpha(alpha);
		draw_sprite_ext(spr_items, inventory[4], xx-6, yy, 3, 3, 0, c_white, 1);
		draw_set_alpha(1.0);
	}
	//SLOT SCROLL
	var xx = 1379 + (1 mod rowLength) * 108 + 2;
	var yy = 326 + (1 div rowLength) * 108 + 2;
	var hover = (obj_mouse.inventoryHover == id) && (obj_mouse.slotHover == 5)
	if(inventory[5] == -1){
		draw_sprite_ext(spr_inventoryboxScroll,hover,xx,yy, 3, 3, 0, c_white, 1);
	} else {
		draw_sprite_ext(spr_inventorybox,hover,xx,yy, 3, 3, 0, c_white, 1);
	}
	if (inventory[5] != -1){
		var alpha = 1.0;
		if (obj_mouse.inventoryDrag == id) && (obj_mouse.slotDrag == 5) alpha = 0.5;
		draw_set_alpha(alpha);
		draw_sprite_ext(spr_items, inventory[5], xx-6, yy, 3, 3, 0, c_white, 1);
		draw_set_alpha(1.0);
	}
	//SLOT GLOVES
	var xx = 1379 + (1 mod rowLength) * 108 + 2;
	var yy = 461 + (1 div rowLength) * 108 + 2;
	var hover = (obj_mouse.inventoryHover == id) && (obj_mouse.slotHover == 6)
	if(inventory[6] == -1){
		draw_sprite_ext(spr_inventoryboxGloves,hover,xx,yy, 3, 3, 0, c_white, 1);
	} else {
		draw_sprite_ext(spr_inventorybox,hover,xx,yy, 3, 3, 0, c_white, 1);
	}
	if (inventory[6] != -1){
		var alpha = 1.0;
		if (obj_mouse.inventoryDrag == id) && (obj_mouse.slotDrag == 6) alpha = 0.5;
		draw_set_alpha(alpha);
		draw_sprite_ext(spr_items, inventory[6], xx-6, yy, 3, 3, 0, c_white, 1);
		draw_set_alpha(1.0);
	}
	//SLOT RING 1
	var xx = 1140 + (1 mod rowLength) * 108 + 2;
	var yy = 800 + (1 div rowLength) * 108 + 2;
	var hover = (obj_mouse.inventoryHover == id) && (obj_mouse.slotHover == 7)
	if(inventory[7] == -1){
		draw_sprite_ext(spr_inventoryboxRing,hover,xx,yy, 3, 3, 0, c_white, 1);
	} else {
		draw_sprite_ext(spr_inventorybox,hover,xx,yy, 3, 3, 0, c_white, 1);
	}
	if (inventory[7] != -1){
		var alpha = 1.0;
		if (obj_mouse.inventoryDrag == id) && (obj_mouse.slotDrag == 7) alpha = 0.5;
		draw_set_alpha(alpha);
		draw_sprite_ext(spr_items, inventory[7], xx-6, yy, 3, 3, 0, c_white, 1);
		draw_set_alpha(1.0);
	}
	//SLOT AMULET
	var xx = 1248 + (1 mod rowLength) * 108 + 2;
	var yy = 800 + (1 div rowLength) * 108 + 2;
	var hover = (obj_mouse.inventoryHover == id) && (obj_mouse.slotHover == 8)
	if(inventory[8] == -1){
		draw_sprite_ext(spr_inventoryboxAmulet,hover,xx,yy, 3, 3, 0, c_white, 1);
	} else {
		draw_sprite_ext(spr_inventorybox,hover,xx,yy, 3, 3, 0, c_white, 1);
	}
	if (inventory[8] != -1){
		var alpha = 1.0;
		if (obj_mouse.inventoryDrag == id) && (obj_mouse.slotDrag == 8) alpha = 0.5;
		draw_set_alpha(alpha);
		draw_sprite_ext(spr_items, inventory[8], xx-6, yy, 3, 3, 0, c_white, 1);
		draw_set_alpha(1.0);
	}
	//SLOT RING 2
	var xx = 1356 + (1 mod rowLength) * 108 + 2;
	var yy = 800 + (1 div rowLength) * 108 + 2;
	var hover = (obj_mouse.inventoryHover == id) && (obj_mouse.slotHover == 9)
	if(inventory[9] == -1){
		draw_sprite_ext(spr_inventoryboxRing,hover,xx,yy, 3, 3, 0, c_white, 1);
	} else {
		draw_sprite_ext(spr_inventorybox,hover,xx,yy, 3, 3, 0, c_white, 1);
	}
	if (inventory[9] != -1){
		var alpha = 1.0;
		if (obj_mouse.inventoryDrag == id) && (obj_mouse.slotDrag == 9) alpha = 0.5;
		draw_set_alpha(alpha);
		draw_sprite_ext(spr_items, inventory[9], xx-6, yy, 3, 3, 0, c_white, 1);
		draw_set_alpha(1.0);
	}
}

