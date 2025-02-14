/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

switch(select){
	case "Hyuuga": 
		select_x = x+(17*4);
		select_y = y+(3*4);
	break;
	case "Uzumaki":
		select_x = x+(61*4);
		select_y = y+(3*4);
	break;
	case "Uchiha":
		select_x = x+(105*4);
		select_y = y+(3*4);
	break;
}	


//uzumaki selection
if(point_in_rectangle(mouse_x, mouse_y, uzumaki_x1, uzumaki_y1, uzumaki_x2, uzumaki_y2)){
	if(mouse_check_button_pressed(mb_left)){
		select = "Hyuuga";	
	}
}
//hyuuga selection
if(point_in_rectangle(mouse_x, mouse_y, hyuuga_x1, hyuuga_y1, hyuuga_x2, hyuuga_y2)){
	if(mouse_check_button_pressed(mb_left)){
		select = "Uzumaki";	
	}
}
//uchiha selection
if(point_in_rectangle(mouse_x, mouse_y, uchiha_x1, uchiha_y1, uchiha_x2, uchiha_y2)){
	if(mouse_check_button_pressed(mb_left)){
		select = "Uchiha";	
	}
}

//hair, colors
switch(hairName_id){
	case 0: hairName = "Short Spyked";
	obj_playercreation.hair = 0;
	break;
	case 1: hairName = "Long Spyked";
	obj_playercreation.hair = 1;
	break;
	case 2: hairName = "Short Straight";
	obj_playercreation.hair = 2;
	break;
	case 3: hairName = "Messy";
	obj_playercreation.hair = 3;
	break;
}

switch(hairColor_id){
	case 0: hairColor = "White";
	obj_playercreation.hairColor = c_white;
	break;
	case 1: hairColor = "Yellow";
	obj_playercreation.hairColor = #f0b913;
	break;
	case 2: hairColor = "Maroon";
	obj_playercreation.hairColor = c_maroon;
	break;
	case 3: hairColor = "Aqua";
	obj_playercreation.hairColor = c_aqua;
	break;
	case 4: hairColor = "Red";
	obj_playercreation.hairColor = c_red;
	break;
	case 5: hairColor = "Black";
	obj_playercreation.hairColor = #262927;
	break;
	case 6: hairColor = "Caramel";
	obj_playercreation.hairColor = #bd925e;
	break;
	case 7: hairColor = "Green";
	obj_playercreation.hairColor = #1ba124;
	break;
	case 8: hairColor = "Pink";
	obj_playercreation.hairColor = #e61595;
	break;
	case 9: hairColor = "Purple";
	obj_playercreation.hairColor = #9c15e6;
	break;
}

switch(eyesColor_id){
	case 0: eyesColor = "White";
	obj_playercreation.eyesColor = c_white;
	break;
	case 1: eyesColor = "Yellow";
	obj_playercreation.eyesColor = #f0b913;
	break;
	case 2: eyesColor = "Maroon";
	obj_playercreation.eyesColor = c_maroon;
	break;
	case 3: eyesColor = "Aqua";
	obj_playercreation.eyesColor = c_aqua;
	break;
	case 4: eyesColor = "Red";
	obj_playercreation.eyesColor = c_red;
	break;
	case 5: eyesColor = "Black";
	obj_playercreation.eyesColor = #262927;
	break;
	case 6: eyesColor = "Caramel";
	obj_playercreation.eyesColor = #bd925e;
	break;
	case 7: eyesColor = "Green";
	obj_playercreation.eyesColor = #1ba124;
	break;
	case 8: eyesColor = "Pink";
	obj_playercreation.eyesColor = #e61595;
	break;
	case 9: eyesColor = "Purple";
	obj_playercreation.eyesColor = #9c15e6;
	break;
}

if(hairName_id < 0){
	hairName_id = hair_max;	
} else if (hairName_id > hair_max){
	hairName_id = 0;	
}

if(hairColor_id < 0){
	hairColor_id = color_max;	
} else if (hairColor_id > color_max){
	hairColor_id = 0;	
}

if(eyesColor_id < 0){
	eyesColor_id = color_max;	
} else if (eyesColor_id > color_max){
	eyesColor_id = 0;	
}
