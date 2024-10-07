/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

draw_sprite_ext(spr_clans, -1, x-50, y, 4, 4, 0, c_white, 1);
draw_sprite_ext(spr_uzumakiClan, -1, uzumaki_x1+2, uzumaki_y1+2, 4, 4, 0, c_white, 1);
draw_sprite_ext(spr_hyuugaClan, -1, hyuuga_x1+2, hyuuga_y1+2, 4, 4, 0, c_white, 1);
draw_sprite_ext(spr_uchihaClan, -1, uchiha_x1+2, uchiha_y1+2, 4, 4, 0, c_white, 1);
draw_sprite_ext(spr_clansSelect, -1, select_x-50, select_y, 4, 4, 0, c_white, 1);


draw_set_font(fnt_player_name);
draw_set_color(c_white);
draw_text(1350, 580, hairName);
draw_text(1350, 670, hairColor);
draw_text(1350, 760, eyesColor);