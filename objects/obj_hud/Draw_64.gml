draw_set_font(fnt_player_name);

if(instance_exists(obj_konohaenemy)){
	draw_text(0, 500, obj_konohaenemy.hspd);
}

//healthbar e chakrabar
draw_healthbar(135, 105, 575, 146, global.player_chakra, c_black, c_blue, c_blue, 0, true, false);
draw_healthbar(120, 55, 595, 101, (global.player_health / global.player_healthmax) * 100, c_black, c_red, c_green, 0, true, false);
draw_text(275,70, string(global.player_health) + "/" + string(global.player_healthmax));
draw_healthbar(700, 1016, 1225, 1044, (global.player_xp/(global.player_level * 100))*100, c_black, c_aqua, c_aqua, 0, true, false);
draw_sprite_ext(spr_hud, -1, 0, 0, 3, 3, 0, c_white, 1);
draw_sprite_ext(obj_player.headStance, -1, 116, 375, 6, 6, 0, c_white, 1);
draw_sprite_ext(obj_player.hairStance, -1, 116, 375, 6, 6, 0, global.hairColor, 1);
draw_sprite_ext(obj_player.eyesStance, -1, 116, 375, 6, 6, 0, global.eyesColor, 1);
draw_sprite_part_ext(obj_player.clothingStance, -1, 0, 0, 30, 8, 38, 109, 6, 6, c_white, 1);
draw_sprite_ext(spr_xpbar, -1, 960, 1030, 3, 3, 0, c_white, 1);
draw_text(50,155, "Player"); //FUTURE PLAYER NAME
draw_text(50,185, "Level: ");
draw_text(164,183, global.player_level);

//menu
if(open_menu){
	draw_sprite_ext(spr_menu, -1, 500, 200, 3, 3, 0, c_white, 1);
	draw_text(560, 240, "Nickname: ");
	draw_text(560, 270, "Level: ");
	draw_text(560, 300, "Clan: " + string(global.player_clan));
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

if(global.player_health <= 0){
	draw_text(300,600,"You died, press enter to respawn.");
}

