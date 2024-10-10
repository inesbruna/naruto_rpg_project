/// @description Inserir descrição aqui
//Inventory
image_speed = 0.3;
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

//quests
quest[0] = noone;
quest[1] = noone;
quest[2] = noone;
quest[3] = noone;
quest[4] = noone;
