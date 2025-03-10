/// @description State Machine

//Character
scr_character();

if (room != character_creator){

	//Keyboard functions
	var	_left = keyboard_check(vk_left);
	var _right = keyboard_check(vk_right);
	var _jump = keyboard_check(vk_up);
	var _combo = keyboard_check(ord("A"));
	var _throw = keyboard_check(ord("X"));
	var _defense = keyboard_check(ord("S"));
	var _charge = keyboard_check(ord("D"));
	var _transform = keyboard_check_pressed(ord("C"));
	var _pickup = keyboard_check_pressed(ord("Z"));

	//Gravity
	//Stop mid-air
	if (state == "wait" && lastState == "jumpJutsuSpit" && !wasGrounded){
		//Acceleration and Break
		if vspd<0{
		vspd+=0.4
		if vspd>=0{
		vspd=0;}}

		if vspd>0{
		vspd-=0.4
		if vspd<=0{
		vspd=0;}}
	
	} else {
		vspd = vspd +grv;
	}

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

	function skills(){
		var _skill1 = keyboard_check_pressed(ord("Q"));
		var _skill2 = keyboard_check_pressed(ord("W"));
		var _skill3 = keyboard_check_pressed(ord("E"));
		var _skill4 = keyboard_check_pressed(ord("R"));
		var _skill5 = keyboard_check_pressed(ord("T"));
		var _skill6 = keyboard_check_pressed(ord("Y"));

		//Skill 1
		if (_skill1 && !skill1_cooldown){
			if(transformation != 2){
				alarm[6] = scr_shadowclon(1);
			} else {
				//alarm[6] = scr_4tailsbomb(1);	
			}
		}
		
		//Skill 2
		if (_skill2 && !skill2_cooldown){
			if(transformation != 2){
				alarm[7] = scr_doryuheki(2);
			}
		}
				
		//Skill 3
		if (_skill3 && !skill3_cooldown){
			if(transformation != 2){
				alarm[8] = scr_goukakyuu(3);
			}
		}
		
		//Skill 4
		if (_skill4 && !skill4_cooldown){
			if(transformation != 2){
				alarm[9] = scr_daitoppa(4);
			}
		}
		
		//Skill 5
		if (_skill5 && !skill5_cooldown){
			if(transformation != 2){
				alarm[10] = scr_suiryuudan(5);
			}
		}
	
		//Skill 6
		if (_skill6 && !skill6_cooldown){
			if(transformation != 2){
				alarm[11] = scr_chidori(6);
			}
		}
	}

	switch(state){
		case "free":
		
			//Movement
			var move = _right - _left;
			hspd = move * 4;
		
		
			//Direction
			if(_left){
				charDirection = -1;	
			} else if(_right){
				charDirection = 1;	
			}
		
			//Jump & Falling State
			if (_jump && grounded && !(instance_exists(obj_textbox))){
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
				alarm[5] = 10; //Timer to press again
			}
			if (keyboard_check_released(vk_right)) && grounded && !dashTimer{ //right
				dashTimer = true;
				lastPress = "D";
				alarm[5] = 10; //Timer to press again
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
				img_frame = 0;
				state = "combo";	
			}
		
			//Getting hit
			if (place_meeting(x,y,obj_enemyhitbox)){
				state = "hit";	
			}
		
			//Dead
			if (global.player_health <= 0){
				img_frame = 0;
				state = "dead";	
			
			}
	
			//Defense
			if (_defense){
				state = "defense";	
				hspd = 0; //Stop character from moving
			}
		
			//Pick up
			if (place_meeting(x, y, obj_items) && _pickup){
				img_frame = 0;
				state = "down";	
			}
		
			//Charging Chakra
			if (_charge){
				img_frame = 0;
				state = "charge";	
			}
		
			//Throw itens
			if (_throw && !throwCooldown && transformation != 2){
				img_frame = 0;
				hspd = 0;
				throwCooldown = true;
				alarm[0] = 120;
				instance_create_depth(x+20, y-45, 99, obj_kunai);
				obj_kunai.image_xscale = charDirection;
				audio_play_sound(snd_slash, 0, false);
				lastState = "throwItem";
				timer = 10;
				state = "wait";
			}
		
			//Transform
			if(_transform){
				if(transformation == 0){
					hspd = 0;
					transformation = 1;
					global.player_healthmax += 100;
					global.player_chakramax += 50;
					global.player_strength += 10;
					global.player_intelligence += 10;
				
					timer = 35;
					lastState = "transform";
					state = "wait";
					img_frame = 0;
				} else if(transformation == 2){
					hspd = 0;
					transformation = 0;
					global.player_healthmax -= 200;
					global.player_chakramax -= 1000;
					global.player_strength -= 20;
					global.player_intelligence -= 20;
				
					timer = 35;
					lastState = "detransform";
					state = "wait";
					img_frame = 0;
				} else {
					hspd = 0;
					transformation = 2;
					global.player_healthmax += 100;
					global.player_chakramax += 50;
					global.player_strength += 10;
					global.player_intelligence += 10;
				
					timer = 35;
					lastState = "transform";
					state = "wait";
					img_frame = 0;
				}
			}
		
			skills();
		
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
		
			skills();
		
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
			if lastPress = "A" hspd = hspd - 4;
			if lastPress = "D" hspd = hspd + 4;
		
			dashCooldown = true;
			alarm[4] = 15;
		
			state = "free";
		
		break;
	
		case "combo":
			//Getting hit
			if (place_meeting(x,y,obj_enemyhitbox)){
				state = "hit";
				global.player_health -= 5; //Reduce Player Health
			}
		
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
			
				if(transformation == 2){
					timer = 23;
				} else {
					timer = 24;
				}
		
				lastState = "combo";
				state = "wait";
			
			} else if (comboCounter == 1){
				nextCombo = true;
				comboCounter = 2;
				audio_play_sound(snd_combo2, 1, 0);
				alarm[2] = 45;
			
				if(transformation == 2){
					timer = 30;
				} else {
					timer = 24;
				}
			
				lastState = "combo";
				state = "wait";
			
			} else if (comboCounter == 2) {
				afterCombo = true;
				comboCounter = 0;
				audio_play_sound(snd_combo3, 1, 0);
				alarm[3] = 60;
			
				if(transformation == 2){
					timer = 30;
				} else {
					timer = 24;
				}
			
				lastState = "combo";
				state = "wait";
			}
	
		break;
	
		case "wait":
	
			if(lastState != "jutsuDashFromDown"){
				//Getting hit
				if (place_meeting(x,y,obj_enemyhitbox)){
					state = "hit";	
				}
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
		
			//Dash
			if((lastState == "jutsuDashFromDown") && (img_index > 1 && img_index <= 2)){
				hspd += 3*charDirection;
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
		break;
	
		case "defense":
		
			if(place_meeting(x,y,obj_enemyhitbox)){
				audio_play_sound(snd_hit, 1, 0); //Play Audio
				//Knockback
				if obj_enemyhitbox.image_xscale=+1 hspd+=1; 
				if obj_enemyhitbox.image_xscale=-1 hspd-=1;
			}
		
			//Kawarimi no Jutsu
			if(place_meeting(x, y, obj_enemyhitbox) && !substitutionCooldown && global.player_chakra >= 15){
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
	
		case "down":
			hspd = 0;
			audio_play_sound(snd_item, 1, 0); //Play Audio
			lastState = "down";
			timer = 10;
			state = "wait";
		break;
	
		case "charge":
			hspd = 0;
			global.player_chakra += 0.5;
			if(keyboard_check_released(ord("D"))){
				state = "free";	
			}
		
			//Getting hit
			if (place_meeting(x,y,obj_enemyhitbox)){
				state = "hit";	
			}
		break;
	}
}