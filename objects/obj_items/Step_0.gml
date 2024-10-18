/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
image_index = item;

//Gravity
vspd = vspd + grv;

//Vertical Collision
if(!place_meeting(x, y, obj_doryuheki_hitbox)){
	if(place_meeting(x,y+vspd, obj_wall)){
		while(!place_meeting(x,y+sign(vspd),obj_wall)){
			y = y + sign(vspd); 
		}
		vspd = 0;
	}
}
y = y + vspd;