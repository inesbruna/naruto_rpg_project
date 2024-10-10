/// @description State Machine

//Character
scr_character();

//Keyboard functions
var	_left = keyboard_check(ord("A"));
var _right = keyboard_check(ord("D"));
var _jump = keyboard_check(ord("W"));
var _combo = keyboard_check(ord("J"));
var _charge = keyboard_check(ord("L"));
var _transform = keyboard_check_pressed(ord("1"));
var _skill1 = keyboard_check_pressed(ord("U"));
var _pickup = keyboard_check_pressed(ord("Z"));

//Gravity
vspd = vspd + grv;

if(place_meeting(x,y+vspd, obj_wall)){
	while(!place_meeting(x,y+sign(vspd),obj_wall)){
		y = y + sign(vspd); 
	}
	vspd = 0;
}

y = y + vspd;

//Grounded
if place_meeting(x,y+1,obj_wall){
	if(!grounded){
		audio_play_sound(snd_landing, 0, false);
		instance_create_depth(x, y+30, 9, obj_dust);
	}
	grounded = true;
	vspd = 0;
} else { grounded = false; }

//Check wall collision
if(place_meeting(x+hspd, y, obj_wall)){
	while(!place_meeting(x+sign(hspd), y, obj_wall)){
		x = x + sign(hspd);
	} 
	hspd = 0;
	}   
x = x + hspd; 

//Health Control
if(global.player_health < 0){
	global.player_health = 0;	
} else if (global.player_health > global.player_healthmax){
	global.player_health = global.player_healthmax;	
}

//Chakra Control
if(global.player_chakra < 0){
	global.player_chakra = 0;	
} else if (global.player_chakra > global.player_chakramax){
	global.player_chakra = global.player_chakramax;	
}

//Character Acceleration for Dashes and Knockups
if(state = "combo" || state = "dash" || state = "hit" || state = "defense"){
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
}

switch(state){
	case "free":	
		//Movement
		move = _right - _left;
		hspd = move * 4;
		
		//Direction
		if(_left){
			charDirection = -1;	
		} else if(_right){
			charDirection = 1;	
		}
		
		//Jump & Falling State
		if (_jump && grounded){
			audio_play_sound(snd_jump, 10, false);
		    vspd = vspd - 7;
			state = "jumping";
		}
		
		if (sign(vspd) < 0) state = "jumping";
		
		if (sign(vspd) > 0) state = "falling";
		
		//Dash First Press
		if (keyboard_check_released(ord("A"))) && grounded && !dashTimer{ //left
			dashTimer = true;
			lastPress = "A";
			alarm[6] = 10; //Timer to press again
		}
		if (keyboard_check_released(ord("D"))) && grounded && !dashTimer{ //right
			dashTimer = true;
			lastPress = "D";
			alarm[6] = 10; //Timer to press again
		}
		
		if(dashTimer = true && lastPress = "D"){
			if(keyboard_check_pressed(ord("A"))){
				dashTimer = false;	
			}
		} else if(dashTimer = true && lastPress = "A"){
			if(keyboard_check_pressed(ord("D"))){
				dashTimer = false;	
			}		
		}
		
		//Dash Second Press
		if (((keyboard_check_pressed(ord("A"))) || (keyboard_check_pressed(ord("D")))) && grounded && !dashCooldown && dashTimer){ //left
			state = "dash";
		}

		
		//Combo Grounded
		if(_combo && grounded && !afterCombo){
			state = "combo";	
		}
		
		//Getting hit
		if (place_meeting(x,y,obj_enemyhitbox)){
			state = "hit";	
		}
		
		//Dead
		if (global.player_health <= 0){
			state = "dead";	
			image_index = 0;
		}
	
		//Defense
		if (keyboard_check(ord("K"))){
			state = "defense";	
			hspd = 0; //Stop character from moving
		}
		
	break;
	
	case "jumping":
		//Movement
		move = _right - _left;
		hspd = move * 4;
		
		//Direction
		if(_left){
			charDirection = -1;	
		} else if(_right){
			charDirection = 1;	
		}
		
		//Go to falling state
		if (sign(vspd) > 0) state = "falling";	
		
		//Getting hit
		if (place_meeting(x,y,obj_enemyhitbox)){
			state = "hit";	
		}
	break;
	
	case "falling":
		//Movement
		move = _right - _left;
		hspd = move * 4;
		
		//Direction
		if(_left){
			charDirection = -1;	
		} else if(_right){
			charDirection = 1;	
		}
		
		//Go back to free state
		if (grounded && sign(vspd) <= 0) {
			image_index = 0;
			state = "free";
		}
		
		//Getting hit
		if (place_meeting(x,y,obj_enemyhitbox)){
			state = "hit";	
		}
		
	break;
	
	case "dash":
		audio_play_sound(snd_dash, 0, false);
		vspd = vspd - 3;	
		if lastPress = "A" hspd = hspd - 2;
		if lastPress = "D" hspd = hspd + 2;
		
		dashCooldown = true;
		alarm[5] = 15;
		
		state = "free";
		
	break;
	
	case "combo":
		//Getting hit
		if (place_meeting(x,y,obj_enemyhitbox)){
			state = "hit";
			global.player_health -= 5; //Reduce Player Health
		}
	
		//Preparation
		image_index = 0;
	
		//Stop Moving
		hspd = 0;
	
		//Flip & Advance
		if charDirection=1 hspd+=2;
		if charDirection=-1 hspd-=2;
	  
		//Create Hitbox
		var _hitbox = instance_create_depth(x, y, depth, obj_narutohitbox);
		_hitbox.player = self;
		_hitbox.image_xscale = image_xscale;
	
		//Start Combo
		if(comboCounter == 0){
			nextCombo = true;
			comboCounter = 1;
			audio_play_sound(snd_combo1, 1, 0);
			alarm[2] = 60;
			timer = 30;
			lastState = "combo";
			state = "wait";
			
		} else if (comboCounter == 1){
			nextCombo = true;
			comboCounter = 2;
			audio_play_sound(snd_combo2, 1, 0);
			alarm[2] = 60;
			timer = 30;
			lastState = "combo";
			state = "wait";
			
		} else if (comboCounter == 2) {
			nextCombo = true;
			comboCounter = 0;
			audio_play_sound(snd_combo3, 1, 0);
			alarm[3] = 60;
			timer = 30;
			lastState = "combo";
			state = "wait";
		}
	
	break;
	
	case "wait":
		//Getting hit
		if (place_meeting(x,y,obj_enemyhitbox)){
			state = "hit";	
		}
	
		image_speed = 0.6;
		
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
	
	case "hit":
		audio_play_sound(snd_hit, 1, 0); //Play Audio
		
		//Getting hit
		if (place_meeting(x,y,obj_enemyhitbox)){
			global.player_health -= 5; //Reduce Player Health
		}
		
		hspd = 0; //Stop character from moving
		
		//Knockback
		if(place_meeting(x,y,obj_enemyhitbox)){
			if obj_enemyhitbox.image_xscale=+1 hspd+=2; 
			if obj_enemyhitbox.image_xscale=-1 hspd-=2;
		}
		
		//Return to free state
		timer = 30;
		lastState = "hit";
		state = "wait";
	break;
	
	case "dead":
		hspd = 0; //Stop character from moving
		
		//Stop at last frame
		if(image_index > image_number-1){
			image_index = 3;	
		}
	break;
	
	case "defense":
		
		if(place_meeting(x,y,obj_enemyhitbox)){
			//Knockback
			if obj_enemyhitbox.image_xscale=+1 hspd+=1; 
			if obj_enemyhitbox.image_xscale=-1 hspd-=1;
		}
		
		if(keyboard_check_released(ord("K"))){
			state = "free";	
		}
		
	break;
}






/*
//moviment
if (!dead && !attacking && !hitting && !defense && !chargingchakra && !skill1 && !usingSkill1 && !dashing && endAction){
	move = _right - _left;
	hspd = move * 4;

	if (_jump && place_meeting(x,y+1 ,obj_wall)){
		audio_play_sound(snd_jump, 10, false);
	    vspd = vspd - 7;
	}

	if(place_meeting(x+hspd, y, obj_wall)){
		while(!place_meeting(x+sign(hspd), y, obj_wall)){
			x = x + sign(hspd);
		} 
		hspd = 0;
	}   
	x = x + hspd;              
	
	if (keyboard_check_released(ord("A"))) && canDash && grounded{ //left
		dashLeft = true;
		alarm[6] = 10;
		alarm[7] = 15;
		canDash = false;
	}
	if (keyboard_check_released(ord("D"))) && canDash && grounded{ //right
		dashRight = true;
		alarm[6] = 10;
		alarm[7] = 15;
		canDash = false;
	}
}

if (!canDash && grounded && dashTimer){
	if(keyboard_check_pressed(ord("A")) && (dashLeft = true)){
		audio_play_sound(snd_dash, 0, false);
		dashing = true;
		vspd = vspd - 3;
		dashLeft = false
		alarm[5] = 15;
		dashTimer = false;
	} else if keyboard_check_pressed(ord("D")) && (dashRight = true){
		audio_play_sound(snd_dash, 0, false);
		dashing = true;
		vspd = vspd - 3;
		dashRight = false
		alarm[5] = 15;
		dashTimer = false;
	}
	if(dashing = true){
		if image_xscale=+1 hspd = hspd + 1;
		if image_xscale=-1 hspd = hspd - 1;
		if(place_meeting(x+hspd, y, obj_wall)){
				while(!place_meeting(x+sign(hspd), y, obj_wall)){
				x = x + sign(hspd);
			} 
			hspd = 0;
		}
	}
}

//grounded
if place_meeting(x,y+1,obj_wall){
	if(sprite_index = narutoFalling && !grounded){
		audio_play_sound(snd_landing, 0, false);
		instance_create_depth(x, y+30, 9, obj_dust);
	}
	grounded = true;
} else { grounded = false; }
 
//animations
//naruto
if (!dead){
	if (transformation == 0){
		if(!attacking && !hitting && !defense && !transforming && !skill1 && !usingSkill1 && endAction){
			//correr
			if (_left && grounded) {
				sprite_index = narutoRunning;
				image_xscale = -1;
			} else if (_right && grounded){
				sprite_index = narutoRunning;
				image_xscale = 1;
			} else { sprite_index = naruto; image_speed = 0.3; }
		
			//COMBO
			if (_combo && canAttack && !afterCombo){
				if (grounded){
					//activate triggers
					attacking = true;
					canAttack = false;
					hspd = 0;
					//flip sprite
					if image_xscale=+1 hspd+=2;
					if image_xscale=-1 hspd-=2;
					//wall collision
					if(place_meeting(x+hspd, y, obj_wall)){
					while(!place_meeting(x+sign(hspd), y, obj_wall)){
						x = x + sign(hspd);
					} 
						hspd = 0;
					}     
					//create hitbox
					var _hitbox = instance_create_depth(x, y, depth, obj_narutohitbox);
					_hitbox.player = self;
					_hitbox.image_xscale = image_xscale;
					//start combo
					if(comboCounter == 0){
						image_index = 0;
						image_speed = 0.6;
						sprite_index = narutoAttack;
						audio_play_sound(snd_combo1, 1, 0);
						comboCounter = 1;
						alarm[2] = room_speed/2;
					} else if (comboCounter == 1){
						image_index = 0;
						image_speed = 0.6;
						sprite_index = narutoAttack2;
						audio_play_sound(snd_combo2, 1, 0);
						comboCounter = 2;
						alarm[2] = room_speed/2;
					} else {
						image_index = 0;
						image_speed = 0.6;
						sprite_index = narutoAttack3;
						audio_play_sound(snd_combo3, 1, 0);
						comboCounter = 0;
						afterCombo = true; //activate cooldown after a whole combo
						alarm[3] = room_speed;
					}
				}
			}
		
			if (!grounded) {
				sprite_index = narutoJumping;
				if (sign(vspd) > 0) sprite_index = narutoFalling;
			} 
		}
		
		//retornar animação após bater
		if(attacking){
			switch (comboCounter){
			case 1: if (image_index >= image_number - image_speed){
				attacking = false;
				canAttack = true;
				sprite_index = naruto;
				image_speed = 0.3;
			}
			break;
			
			case 2: if (image_index >= image_number - image_speed){
				attacking = false;
				canAttack = true;
				sprite_index = naruto;
				image_speed = 0.3;
			}
			break;
			
			case 0: if (image_index >= image_number - image_speed){
				attacking = false;
				canAttack = true;
				sprite_index = naruto;
				image_speed = 0.3;
			}
			break;
			
			}
		}
		
		//rasengan animation
		if (_skill1 && canAttack = true && global.player_chakra >= 50){
			image_speed = 0.7;
			skill1 = true;
			global.player_chakra -= 50;
			image_index = 0;
			audio_play_sound(snd_jutsu, 0, false);
		}
		
		if (skill1 = true){
			if(place_meeting(x,y, obj_enemyhitbox)){
				skill1 = false;
				sprite_index = naruto;
				image_speed = 0.3;
			}
			sprite_index = spr_naruto_chargingRasengan;
			hspd = 0;
			if (image_index >= image_number - image_speed){
				usingSkill1 = true;
				skill1 = false
				image_index = 0;
				if image_xscale=+1 hspd+=5;
				if image_xscale=-1 hspd-=5;
				//wall collision
				if(place_meeting(x+hspd, y, obj_wall)){
					while(!place_meeting(x+sign(hspd), y, obj_wall)){
						x = x + sign(hspd);
					} 
					hspd = 0;
				} 
			}
		}
		
		if (usingSkill1 = true){  
			sprite_index = spr_naruto_rasengan;
			//create hitbox
			var _hitbox = instance_create_depth(x, y, depth, obj_narutohitboxskill1);
			_hitbox.player = self;
			_hitbox.image_xscale = image_xscale;
			if (image_index >= image_number - image_speed){
				usingSkill1 = false;
				sprite_index = naruto;
				image_speed = 0.3;
				audio_play_sound(snd_rasengan, 0, false);
			}
		}
		
		//charging chakra
		if (_charge){
			chargingchakra = true;
			sprite_index = narutoCharging;
			global.player_chakra += 0.3;
			hspd = 0;
		} else {
			chargingchakra = false;	
		}
		
		//sound chakra
		if (keyboard_check_pressed(ord("L"))){
			audio_play_sound(snd_chakra, 0, true);	
		} 
		
		if (keyboard_check_released(ord("L"))){
			audio_stop_sound(snd_chakra);	
		}
		
		if(sprite_index = narutoHit && hitting = false){
			sprite_index = naruto;
		}
		
		//defense trigger
		if (keyboard_check_pressed(ord("K"))){
			defense = true;
		}
		
		if (defense = true){
			hspd = 0;
			sprite_index = narutoDefense;
		}
		
		if (keyboard_check_released(ord("K"))){
			defense = false;
			attacking = false;
			canAttack = true;
		}	
		
		if (sprite_index == narutoDefense && defense = false){
			sprite_index = naruto;
		}
		
		if(_transform && transformation == 0 && transforming == false){
			transforming = true;
			sprite_index = narutoTransform;
			image_speed = 0.5;
			hspd = 0;
		}
		
		if(transforming = true){
			hspd = 0;	
		}
		
		if (image_index >= image_number - image_speed && transforming == true){
				transformation = 1;
				transforming = false;
				global.player_healthmax += 100;
				global.player_health += 200;
				global.player_chakramax += 100;
				global.player_strength += 20;
				global.player_intelligence += 20;
				sprite_index = spr_naruto_sixpaths;
				image_speed = 0.3;
			}
			
		//Pickup Animation
		if(_pickup && endAction && place_meeting(x,y,obj_items)){
			endAction = false;
			sprite_index = narutoPickup;
			image_index = 0;
			image_speed = 0.3;
			alarm[8] = 30;
		}
	}
	
	//push
	if(!defense){
		if(hitting = true || attacking = true || usingSkill1 = true || dashing = true){
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
		}
		if(place_meeting(x+hspd, y, obj_wall)){
				while(!place_meeting(x+sign(hspd), y, obj_wall)){
				x = x + sign(hspd);
			} 
			hspd = 0;
		}
	}
}

//death
if (global.player_health <= 0){
	global.player_health = 0;
	dead = true;
	sprite_index = spr_naruto_dead;
	image_speed = 0.3;
	if(image_index >= 2 - image_speed){
		image_index = 2;	
	}
}
*/


