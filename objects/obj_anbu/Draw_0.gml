/// @description Healthbar
draw_self();
draw_healthbar(x-20, y-35, x+25, y-30, (hp/hpmax)*100, c_black, c_red, c_green, 0, true, true);