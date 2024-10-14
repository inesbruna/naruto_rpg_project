/// @description State Machine

//Character
scr_character();

//Keyboard functions
var	_left = keyboard_check(vk_left);
var _right = keyboard_check(vk_right);
var _jump = keyboard_check(vk_up);
var _combo = keyboard_check(ord("A"));
var _throw = keyboard_check(ord("X"));
var _defense = keyboard_check(ord("S"));
var _charge = keyboard_check(ord("D"));
var _transform = keyboard_check_pressed(ord("C"));
var _skill1 = keyboard_check_pressed(ord("Q"));
var _skill2 = keyboard_check_pressed(ord("W"));
var _skill3 = keyboard_check_pressed(ord("E"));
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
		instance_create_depth(x+9, y-4, 9, obj_dust);
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
		if (keyboard_check_released(vk_left)) && grounded && !dashTimer{ //left
			dashTimer = true;
			lastPress = "A";
			alarm[6] = 10; //Timer to press again
		}
		if (keyboard_check_released(vk_right)) && grounded && !dashTimer{ //right
			dashTimer = true;
			lastPress = "D";
			alarm[6] = 10; //Timer to press again
		}
		
		if(dashTimer = true && lastPress = "D"){
			if(keyboard_check_pressed(vk_left)){
				dashTimer = false;	
			}
		} else if(dashTimer = true && lastPress = "A"){
			if(keyboard_check_pressed(vk_right)){
				dashTimer = false;	
			}		
		}
		
		//Dash Second Press
		if (((_left) || (_right)) && grounded && !dashCooldown && dashTimer){ //left
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
		if (_defense){
			state = "defense";	
			hspd = 0; //Stop character from moving
		}
		
		//Pick up
		if (place_meeting(x, y, obj_items) && _pickup){
			state = "pickup";	
		}
		
		//Charging Chakra
		if (_charge){
			state = "charge";	
		}
		
		//Throw itens
		if (_throw && !throwCooldown){
			hspd = 0;
			throwCooldown = true;
			alarm[0] = 120;
			instance_create_depth(x+20, y-45, 99, obj_kunai);
			obj_kunai.image_xscale = charDirection;
			audio_play_sound(snd_slash, 0, false);
			lastState = "throw";
			timer = 10;
			state = "wait";
		}
		
		//Skill 1
		if (_skill1){
			if(!instance_exists(obj_clon) && global.player_chakra >= 30){
				hspd = 0;
				instance_create_depth(x-30, y, 99, obj_clon);
				instance_create_depth(x-30, y, 9, obj_smoke);
				audio_play_sound(snd_jutsu, 0, false);
				audio_play_sound(snd_smoke, 0, false);
				global.player_chakra -= 30;
				lastState = "clon";
				timer = 25;
				state = "wait";
			}
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
		var _hitbox = instance_create_depth(x, y-30, depth, obj_narutohitbox);
		_hitbox.player = self;
		_hitbox.image_xscale = charDirection;
	
		//Start Combo
		if(comboCounter == 0){
			nextCombo = true;
			comboCounter = 1;
			audio_play_sound(snd_combo1, 1, 0);
			alarm[2] = 45;
			timer = 24;
			lastState = "combo";
			state = "wait";
			
		} else if (comboCounter == 1){
			nextCombo = true;
			comboCounter = 2;
			audio_play_sound(snd_combo2, 1, 0);
			alarm[2] = 45;
			timer = 24;
			lastState = "combo";
			state = "wait";
			
		} else if (comboCounter == 2) {
			afterCombo = true;
			comboCounter = 0;
			audio_play_sound(snd_combo3, 1, 0);
			alarm[3] = 60;
			timer = 24;
			lastState = "combo";
			state = "wait";
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
			audio_play_sound(snd_hit, 1, 0); //Play Audio
			//Knockback
			if obj_enemyhitbox.image_xscale=+1 hspd+=1; 
			if obj_enemyhitbox.image_xscale=-1 hspd-=1;
		}
		
		//Kawarimi no Jutsu
		if(place_meeting(x, y, obj_enemyhitbox) && !substitutionCooldown){
			if(_left){
				substitutionCooldown = true;
				alarm[1] = 300;
				audio_play_sound(snd_smoke, 0, false);
				instance_create_depth(x, y, -99, obj_smoke);
				instance_create_depth(x, y-15, -99, obj_log);
				global.player_chakra -= 15;
				x -= 100;
				y -= 20;
			} else if (_right){
				substitutionCooldown = true;
				alarm[1] = 300;
				audio_play_sound(snd_smoke, 0, false);
				instance_create_depth(x, y, -99, obj_smoke);
				instance_create_depth(x, y-15, -99, obj_log);
				global.player_chakra -= 15;
				x += 100;
				y -= 20;
			}
		}
		
		if(keyboard_check_released(ord("S"))){
			state = "free";	
		}
		
	break;
	
	case "pickup":
		hspd = 0;
		sprite_index = 0;
		audio_play_sound(snd_item, 1, 0); //Play Audio
		lastState = "pickup";
		timer = 10;
		state = "wait";
	break;
	
	case "charge":
		hspd = 0;
		global.player_chakra += 0.5;
		if(keyboard_check_released(ord("D"))){
			state = "free";	
		}
	break;
	
}