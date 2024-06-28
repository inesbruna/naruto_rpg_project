/// @description Inserir descrição aqui
//Inventory
depth = -99;
#macro INVENTORY_SLOTS 24 
rowLength = 4;
inventory = array_create(INVENTORY_SLOTS, -1);
instance_create_depth(0, 0, -950, obj_equipments);
randomize();

//stack
maxStack = 99;
stack = array_create(INVENTORY_SLOTS, 0);

//menu-inventory
open_menu = false;
open_inventory = false;

//player status
global.player_healthmax = 100;
global.player_health = global.player_healthmax;
global.player_chakramax = 100;
global.player_chakra = 0;
global.player_xp = 0;
global.player_level = 0;
global.player_points = 0;
global.player_strength = 10;
global.player_intelligence = 10;

