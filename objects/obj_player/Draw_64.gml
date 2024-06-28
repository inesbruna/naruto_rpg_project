/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
draw_set_font(fnt_player_name);
/*draw_text(0,50, attacking);
draw_text(0,100, dead);
draw_text(0,150, canAttack);
draw_text(0,200, afterCombo);
draw_text(0,250, defense); */

//healthbar e chakrabar

draw_healthbar(135, 105, 575, 146, global.player_chakra, c_black, c_blue, c_blue, 0, true, false);
draw_healthbar(120, 55, 595, 101, (global.player_health / global.player_healthmax) * 100, c_black, c_red, c_green, 0, true, false);
draw_text(180,70, string(global.player_health) + "/" + string(global.player_healthmax));
draw_healthbar(800, 1005, 1325, 1039, (global.player_xp/(global.player_level * 100))*100, c_black, c_aqua, c_aqua, 0, true, false);
draw_sprite_ext(spr_hud, -1, 0, 0, 3, 3, 0, c_white, 1);
draw_sprite_ext(spr_xpbar, -1, 800, 1005, 3, 3, 0, c_white, 1);
draw_text(44,153, "Naruto"); //FUTURE PLAYER NAME
draw_text(44,183, "Level: ");
draw_text(164,183, global.player_level);


//you died and pvp on
if(dead){
	draw_text(room_height/2, room_width/2, "Voce morreu");
}
  