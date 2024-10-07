/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
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

if (object_exists(obj_player) && !dead){
	switch(state){
		case e_state.idle:
		{
			if(!hitting){
				hspd = 0;
					if(!obj_player.dead){
						//chase
						if ((distance_to_object(obj_player) < 100) && (distance_to_object(obj_player) > 3)){ 
							state = e_state.chase;
							sprite_index = spr_konohaenemy_running;
						}
						//attack
						if ((distance_to_object(obj_player) < 3) && canAttack = true && grounded = true){
							attacking = true;
							canAttack = false;
							alarm[1]=120;
							hspd = 0;
							if image_xscale=+1 hspd+=2;
							if image_xscale=-1 hspd-=2;
							//create hitbox
							var _hitbox = instance_create_depth(x, y, depth, obj_enemyhitbox);
							_hitbox.konohaenemy = self;
							_hitbox.image_xscale = image_xscale;
							//change state to attack
							state = e_state.attack;
							sprite_index = spr_konohaenemy_attack;
						}
					}
			}
		}
		break;
	
		case e_state.chase:
		{
			if(!hitting){
				if (hspd != 0) image_xscale = sign(hspd);
				vir = sign(obj_player.x - x);
				hspd = vir * 2;
				//idle
				if ((distance_to_object(obj_player) > 100)){
					state = e_state.idle;
					sprite_index = spr_konohaenemy;
				}
				//attack
					if(!obj_player.dead){
						if ((distance_to_object(obj_player) < 3) && canAttack = true && grounded = true){
							attacking = true;
							canAttack = false;
							alarm[1]=120;
							hspd = 0;
							//create hitbox
							var _hitbox = instance_create_depth(x, y, depth, obj_enemyhitbox);
							_hitbox.konohaenemy = self;
							_hitbox.image_xscale = image_xscale;
							//change state to attack
							state = e_state.attack;
							sprite_index = spr_konohaenemy_attack;
						}
					}
			} 
		}
		break;
	
		case e_state.attack:
		{
			if(!hitting){
				if(image_index >= 3 - image_speed){
					attacking = false;
					state = e_state.idle;
					sprite_index = spr_konohaenemy;
				}	
			}
		}
		break;
	
		case e_state.hit: //apanhando
		{
			if(hitting = false){
				hspd = 0;
				state = e_state.idle;
				sprite_index = spr_konohaenemy;
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
	sprite_index = spr_konohaenemy_dead;
	if (image_index >= 28 - image_speed){
		global.player_xp += 10;
		instance_create_depth(x, y, 9, obj_items);
		instance_destroy();
	}
	//quests counters
	
}
