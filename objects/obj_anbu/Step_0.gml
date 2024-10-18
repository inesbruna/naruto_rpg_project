/// @description State Machine
//Gravity
vspd = vspd + grv;

//Vertical Collision
if(!place_meeting(x, y, obj_doryuheki_hitbox)){
	if(place_meeting(x,y+vspd, obj_wall)){
		while(!place_meeting(x,y+sign(vspd),obj_wall)){
			y = y + sign(vspd); 
		}
		grounded = true;
		vspd = 0;
	} else {
		grounded = false;	
	}
}
y = y + vspd;
	
//Horizontal Collision
if(!place_meeting(x, y, obj_doryuheki_hitbox)){
	if(place_meeting(x+hspd, y, obj_wall)){
		while(!place_meeting(x+sign(hspd), y, obj_wall)){
			x = x + sign(hspd);
		} 
		hspd = 0;
	}  
}
x = x + hspd;

//Unstuck 
if(instance_exists(obj_doryuheki)){
	if(obj_doryuheki.image_index >= 6){
		if(place_meeting(x, y, obj_doryuheki)){
			if (x < obj_doryuheki.x){
				x -= 5;
			} else {
				x += 5;	
			}
		}
	}
}

//Push and Pull
if(state = "hit" || state = "attack" || state = "air"){
	
	//Horizontal Break
	if hspd<0{
	hspd+=0.2
	if hspd>=0{
	hspd=0;}}

	if hspd>0{
	hspd-=0.2
	if hspd<=0{
	hspd=0;}}
	
	//Horizontal Limit
	x+=hspd
	if hspd<-3{hspd=-3}
	x+=hspd
	if hspd>3{hspd=3}
	
	//Vertical Limit
	if vspd<-5{vspd=-5}
	if vspd>5{vspd=5}
}

//State Machine
switch(state){
	case "free":	
		if(instance_exists(obj_playerParent) && !(obj_playerParent.state = "dead")){
			//Chase
			if ((distance_to_object(obj_playerParent) < 100) && (distance_to_object(obj_playerParent) > 8)){ 
				state = "chase";
				image_index = 0;
				sprite_index = spr_anbu_running;
			}

			//Attack
			if ((distance_to_object(obj_playerParent) < 10) && canAttack){		
				//Change state to attack
				state = "attack";
				image_index = 0;
				sprite_index = spr_anbu_attack;
				
				canAttack = false;
				endAction = false;
				alarm[0]=120;
				alarm[1]=30;
				hspd = 0;
				if image_xscale=+1 hspd+=2;
				if image_xscale=-1 hspd-=2;
							
				//Create Hitbox
				var _hitbox = instance_create_depth(x, y, depth, obj_enemyhitbox);
				_hitbox.anbu = self;
				_hitbox.image_xscale = image_xscale;
			}
		}
		
		//Hit
		if(place_meeting(x, y, obj_narutohitbox) || place_meeting(x, y, obj_kunai)){
			state = "hit";
			image_index = 0;
			sprite_index = spr_anbu_hit;
			endAction = false;
			alarm[1] = 30;
			hspd = 0;			
			hp -= global.player_strength; 
			if image_xscale=+1 hspd-=2;
			if image_xscale=-1 hspd+=2;
	
			alarm[0]=30;
			audio_play_sound(snd_hit, 1, 0);
		}

			
	break;
	
	case "chase":
		
		if (hspd != 0) image_xscale = sign(hspd);
		vir = sign(obj_playerParent.x - x);
		hspd = vir * 2;
		
		//Free
		if ((distance_to_object(obj_playerParent) > 100) || (distance_to_object(obj_playerParent) < 8)){
			hspd = 0;
			state = "free";
			image_index = 0;
			sprite_index = spr_anbu;
		}
		
		//Attack
		if ((distance_to_object(obj_playerParent) < 10) && canAttack == true){		
			//Change state to attack
			state = "attack";
			image_index = 0;
			sprite_index = spr_anbu_attack;
			
			canAttack = false;
			endAction = false;
			alarm[0]=120;
			alarm[1]=30;
			hspd = 0;
			if image_xscale=+1 hspd+=2;
			if image_xscale=-1 hspd-=2;
							
			//Create Hitbox
			var _hitbox = instance_create_depth(x, y, depth, obj_enemyhitbox);
			_hitbox.anbu = self;
			_hitbox.image_xscale = image_xscale;
		}
			
		//Hit
		if(place_meeting(x, y, obj_narutohitbox) || place_meeting(x, y, obj_kunai)){
			state = "hit";
			image_index = 0;
			sprite_index = spr_anbu_hit;
			endAction = false;
			alarm[1] = 30;
			hspd = 0;			
			hp -= global.player_strength; 
			if image_xscale=+1 hspd-=2;
			if image_xscale=-1 hspd+=2;
	
			alarm[0]=30;
			audio_play_sound(snd_hit, 1, 0);
		}

	break;
	
	case "attack":	
			
		//Hit
		if(place_meeting(x, y, obj_narutohitbox) || place_meeting(x, y, obj_kunai)){
			state = "hit";
			image_index = 0;
			sprite_index = spr_anbu_hit;
			hp -= global.player_strength;
			endAction = false;
			alarm[1] = 30;
			hspd = 0;			
			hp -= global.player_strength; 
			if image_xscale=+1 hspd-=2;
			if image_xscale=-1 hspd+=2;
	
			alarm[0]=30;
			audio_play_sound(snd_hit, 1, 0);
		}

		if(endAction = true){
			state = "free";	
			image_index = 0;
			sprite_index = spr_anbu;
		}
		
	break;
	
	case "hit": //Getting Hit
	{
			
		//Hit
		if(place_meeting(x, y, obj_narutohitbox) || place_meeting(x, y, obj_kunai)){
			state = "hit";
			image_index = 0;
			sprite_index = spr_anbu_hit;
			hp -= global.player_strength;
			endAction = false;
			alarm[1] = 30;
			hspd = 0;			
			hp -= global.player_strength; 
			if image_xscale=+1 hspd-=2;
			if image_xscale=-1 hspd+=2;
	
			alarm[0]=30;
			audio_play_sound(snd_hit, 1, 0);
		}
		
		if(endAction = true){
			state = "free";	
			image_index = 0;
			sprite_index = spr_anbu;
		}
		
		if(!grounded){
			state = "air";
			sprite_index = spr_anbu_air;
		}
			
	}
	break;
	
	case "air":
		sprite_index = spr_anbu_air;
	
		if(grounded){
			state = "free";
			sprite_index = spr_anbu;
			hspd = 0;
		}
	break;
	
	case "dead":
		hp = 0;
		hspd = 0;
		if (image_index >= image_number - image_speed){
			global.player_xp += 10;
			instance_create_depth(x, y, 9, obj_items);
			instance_destroy();
		}
	break;
}

if (sign(vspd) < 0) state = "air";

if(hp <= 0){
	state = "dead";
	sprite_index = spr_anbu_dead;
}
