/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
image_index = 0;

global.hair = obj_playercreation.hair;
global.head = obj_playercreation.head;
global.clothing = obj_playercreation.clothing;
global.hairColor = obj_playercreation.hairColor;
global.eyesColor = obj_playercreation.eyesColor;
global.player_clan = obj_characterCreation.select;


instance_create_depth(0, 0, -999999, obj_fade);
room_goto(konoha);