/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
image_index = struct_names_count(obj_game.s_items);
image_speed = 0;
alarm[0] = 5000;
randomize();
items = variable_struct_get_names(obj_game.s_items);
item = irandom(array_length(items)-1);