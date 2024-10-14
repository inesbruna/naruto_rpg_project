/// @description State Machine

//Character
scr_character();

//Gravity
vspd = vspd + grv;

if(place_meeting(x,y+vspd, obj_wall)){
	while(!place_meeting(x,y+sign(vspd),obj_wall)){
		y = y + sign(vspd); 
	}
	vspd = 0;
}
y = y + vspd;

//Horizontal Collision
if(place_meeting(x+hspd, y, obj_wall)){
		while(!place_meeting(x+sign(hspd), y, obj_wall)){
			x = x + sign(hspd);
		} 
		hspd = 0;
	}                
x = x + hspd;

//Push and Pull
if(state = "hit" || state = "attack"){
	if hspd<0{
	hspd+=0.2
	if hspd>=0{
	hspd=0;}}

	if hspd>0{
	hspd-=0.2
	if hspd<=0{
	hspd=0;}}

	x+=hspd
	if hspd<-3{hspd=-3}
	x+=hspd
	if hspd>3{hspd=3}
}

//End of the Lifetime
lifetime -= 1;
if (lifetime <= 0){
	state = "dead";	
}


//State Machine

switch(state){
	case "free":
	
		if(instance_exists(obj_enemyparent) && !obj_enemyparent.dead){
			//Chase
			if ((distance_to_object(obj_enemyparent) < 400) && (distance_to_object(obj_enemyparent) > 8)){ 
				state = "chase";
			}

			//Attack
			if ((distance_to_object(obj_enemyparent) < 10) && canAttack = true && grounded = true){		
				//Change state to attack
				state = "attack";
			}
									
			//Chase Player
			if (distance_to_object(obj_enemyparent) > 400){
				if ((distance_to_object(obj_player) > 8)){ 
					state = "chase_player";
				}
			}
		}

		//Chase Player
		if (!instance_exists(obj_enemyparent)){
			if ((distance_to_object(obj_player) > 8)){ 
				state = "chase_player";
			}
		}
		
		//Hit
		if(place_meeting(x, y, obj_enemyhitbox)){
			state = "hit";
		}
			
	break;
	
	case "chase_player":
		if (hspd != 0) charDirection = sign(hspd);
		vir = sign(obj_player.x - x);
		hspd = vir * 3;
			
		//Chase
		if(instance_exists(obj_enemyparent) && !obj_enemyparent.dead){
			if (distance_to_object(obj_enemyparent) < 400){
				state = "chase";
			}
		}
		
		//Free
		if (distance_to_object(obj_player) < 8){
			hspd = 0;
			state = "free";
		}
		
	break;
	
	case "chase":
		
		if (hspd != 0) charDirection = sign(hspd);
		vir = sign(obj_enemyparent.x - x);
		hspd = vir * 2;
		
		//Free
		if ((distance_to_object(obj_enemyparent) > 400) || (distance_to_object(obj_enemyparent) < 8)){
			hspd = 0;
			state = "free";
		}
		
		//Attack
		if ((distance_to_object(obj_enemyparent) < 10) && canAttack = true && grounded = true){
			canAttack = false;
			alarm[0]=120;
			hspd = 0;
			if charDirection=+1 hspd+=2;
			if charDirection=-1 hspd-=2;
			
			//Create hitbox
			var _hitbox = instance_create_depth(x, y, depth, obj_narutohitbox);
			_hitbox.naruto = self;
			_hitbox.charDirection = charDirection;
			
			//Change state to attack
			state = "attack";
		}
			
		//Hit
		if(place_meeting(x, y, obj_enemyhitbox)){
			state = "hit";
		}

	break;
	
	case "attack":	
		
		canAttack = false;
		alarm[0]=120;
		hspd = 0;
		if charDirection=+1 hspd+=2;
		if charDirection=-1 hspd-=2;
							
		//Create Hitbox
		var _hitbox = instance_create_depth(x, y, depth, obj_narutohitbox);
		_hitbox.naruto = self;
		_hitbox.charDirection = charDirection;
			
		//Hit
		if(place_meeting(x, y, obj_enemyhitbox)){
			state = "hit";
		}
			
		timer = 30;
		lastState = "attack";
		state = "wait";
		
	break;
	
	case "hit": //Getting Hit
	{
		hspd = 0;			
		hp -= 5; //Reduce Clon Health
		if charDirection=+1 hspd-=2;
		if charDirection=-1 hspd+=2;
	
		alarm[0]=30;
		audio_play_sound(snd_hit, 1, 0);
			
		//Hit
		if(place_meeting(x, y, obj_enemyhitbox)){
			state = "hit";
		}
			
		lastState = "hit";
		timer = 10;
		state = "wait";
			
	}
	break;
	
	case "dead":
		hp = 0;
		hspd = 0;
		if (image_index >= image_number - image_speed){
			instance_create_depth(x, y, 9, obj_smoke);
			audio_play_sound(snd_smoke, 0, false);
			instance_destroy();
		}
	break;
		
	case "wait":
		//Getting hit
		if (place_meeting(x,y,obj_enemyhitbox)){
			state = "hit";	
		}
		
		//Acceleration and Break
		if hspd<0{
		hspd+=0.2
		if hspd>=0{
		hspd=0;}}

		if hspd>0{
		hspd-=0.2
		if hspd<=0{
		hspd=0;}}

		//Speed Limit
		x+=hspd
		if hspd<-4{hspd=-4}
		x+=hspd
		if hspd>4{hspd=4}
		
		if timer <= 0 {
			state = "free";
		} else {
			timer--;
		}
	break;
}


if(hp <= 0){
	state = "dead";
}
