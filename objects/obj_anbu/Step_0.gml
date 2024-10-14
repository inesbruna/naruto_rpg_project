/// @description State Machine
//gravity
vspd = vspd + grv;

if(place_meeting(x,y+vspd, obj_wall)){
	while(!place_meeting(x,y+sign(vspd),obj_wall)){
		y = y + sign(vspd); 
	}
	vspd = 0;
}
y = y + vspd;

//colisão horizontal
if(place_meeting(x+hspd, y, obj_wall)){
		while(!place_meeting(x+sign(hspd), y, obj_wall)){
			x = x + sign(hspd);
		} 
		hspd = 0;
	}                
x = x + hspd;

if (object_exists(obj_playerParent) && !dead){
	switch(state){
		case "free":
		{
			if(!hitting){
				hspd = 0;
					if(!(obj_playerParent.state = "dead")){
						//chase
						if ((distance_to_object(obj_playerParent) < 100) && (distance_to_object(obj_playerParent) > 8)){ 
							state = "chase";
							sprite_index = spr_anbu_running;
						}
						//attack
						if ((distance_to_object(obj_playerParent) < 10) && canAttack = true && grounded = true){
							attacking = true;
							canAttack = false;
							alarm[1]=120;
							hspd = 0;
							if image_xscale=+1 hspd+=2;
							if image_xscale=-1 hspd-=2;
							//create hitbox
							var _hitbox = instance_create_depth(x, y, depth, obj_enemyhitbox);
							_hitbox.anbu = self;
							_hitbox.image_xscale = image_xscale;
							//change state to attack
							state = "attack";
							sprite_index = spr_anbu_attack;
						}
					}
			}
		}
		break;
	
		case "chase":
		{
			if(!hitting){
				if (hspd != 0) image_xscale = sign(hspd);
				vir = sign(obj_playerParent.x - x);
				hspd = vir * 2;
				//idle
				if ((distance_to_object(obj_playerParent) > 100)){
					hspd = 0;
					state = "free";
					sprite_index = spr_anbu;
				}
				//attack
					if(!(obj_playerParent.state = "dead")){
						if ((distance_to_object(obj_playerParent) < 10) && canAttack = true && grounded = true){
							attacking = true;
							canAttack = false;
							alarm[1]=120;
							hspd = 0;
							if image_xscale=+1 hspd+=2;
							if image_xscale=-1 hspd-=2;
							//create hitbox
							var _hitbox = instance_create_depth(x, y, depth, obj_enemyhitbox);
							_hitbox.anbu = self;
							_hitbox.image_xscale = image_xscale;
							//change state to attack
							state = "attack";
							sprite_index = spr_anbu_attack;
						}
					}
				//idle
				if ((distance_to_object(obj_playerParent) < 8)){
					hspd = 0;
					state = "free";
					sprite_index = spr_anbu;
				}
			} 
		}
		break;
	
		case "attack":
		{
			if(!hitting){
				if(image_index >= 3 - image_speed){
					attacking = false;
					hspd = 0;
					state = "free";
					sprite_index = spr_anbu;
				}	
			}
		}
		break;
	
		case "hit": //apanhando
		{
			if(hitting = false){
				hspd = 0;
				state = "free";
				sprite_index = spr_anbu;
			}
		}
		break;
	}
}

//push
	if(hitting = true || attacking = true){
		//codigo para acelerar e desacelerar o personagem
		if hspd<0{
		hspd+=0.2
		if hspd>=0{
		hspd=0;}}

		if hspd>0{
		hspd-=0.2
		if hspd<=0{
		hspd=0;}}

		//limitar velocidade
		x+=hspd
		if hspd<-3{hspd=-3}
		x+=hspd
		if hspd>3{hspd=3}
	}


if(hp <= 0){
	dead = true;
	hp = 0;
	hspd = 0;
	sprite_index = spr_anbu_dead;
	if (image_index >= 28 - image_speed){
		global.player_xp += 10;
		instance_create_depth(x, y, 9, obj_items);
		instance_destroy();
	}

}
