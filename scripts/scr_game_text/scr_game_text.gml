///@param text_id
function scr_game_text(_text_id){
	switch(_text_id){
		case "Kakashi":
			scr_text("Hello, what do you need?", "Kakashi", -1);
				scr_option("Can you help me?", "Kakashi - Help");
				scr_option("Can i graduate?", "Kakashi - Graduate");
				scr_option("I want a jinchuuriki.", "Kakashi - Jinchuuriki");
			break;
		
			// Help !
		
			case ("Kakashi - Help"):
				scr_text("Welcome to the Naruto RPG Project beta test, here are the basic controls to get you started on your ninja adventure.", "Kakashi", -1);
				scr_text("For the movement, use the arrows keys. For attack, press A key, for guard, use S key, and for charge chakra use D key. Use X key to throw kunais and Q key to use shadow clons.", "Kakashi", -1);
				scr_text("Alright, some more important controls. To pick up items on the floor, change map and talk to people, press Z. To open the inventory, press I, and to access the menu, press O.", "Kakashi", -1);
				scr_text("To dash, you just need to double tap the arrow key for the direction you want. And to use substitution jutsu, use the arrow key during an attack in guard state.", "Kakashi", -1);
				scr_text("Do you understand all?", "Kakashi", -1);
					scr_option("Yep!", "Kakashi - Yes");
					scr_option("Nope!", "Kakashi - No");
			break;
			
			case ("Kakashi - Yes"):
				scr_text("Yes, sir!");
				scr_text("Great, so go ahead and defeat some ninjas!", "Kakashi Happy", -1);
				break;
			
			case ("Kakashi - No"):
				scr_text("Sorry, i didn't understand correctly.");
				scr_text("Talk to me again and i will repeat everything.", "Kakashi Alert", -1);
			break;
			
			// Graduate !
			
			case ("Kakashi - Graduate"):
				if (global.player_level >= 5 && global.player_level < 15){
					if(global.player_rank = "Academy Student"){
						scr_text("Congratulations, now you are a genin!", "Kakashi", -1);
						global.player_rank = "Genin";
					} else if (global.player_rank = "Genin") {
						scr_text("You are not ready to become a chunnin yet, continue training and talk to me again when you reach at least level 15!", "Kakashi", -1);
					}
				} else {
					scr_text("You are not ready to become a genin yet, continue training and talk to me again when you reach at least level 5!", "Kakashi", -1);
				}
			break;
			
			// Jinchuuriki !
			
			case ("Kakashi - Jinchuuriki"):
				scr_text("Alright, choose one!", "Kakashi", -1);
					scr_option("Shukaku!", "Kakashi - Shukaku");
					scr_option("Matatabi!", "Kakashi - Matatabi");
					scr_option("Isobu!", "Kakashi - Isobu");
					scr_option("Son Gokuu!", "Kakashi - Gokuu");
					scr_option("Kokuou!", "Kakashi - Kokuou");
					scr_option("Saiken!", "Kakashi - Saiken");
					scr_option("Choumei!", "Kakashi - Choumei");
					scr_option("Gyuuki!", "Kakashi - Gyuuki");
					scr_option("Kurama!", "Kakashi - Kurama");
			break;
			
			case ("Kakashi - Shukaku"):
				scr_text("I want Shukaku!");
				scr_text("Alright.", "Kakashi Happy", -1);
				obj_player.jinchuuriki_color = c_orange;
			break;
			
			case ("Kakashi - Matatabi"):
				scr_text("I want Matatabi!");
				scr_text("Alright.", "Kakashi Happy", -1);
				obj_player.jinchuuriki_color = c_blue;
			break;
			
			case ("Kakashi - Isobu"):
				scr_text("I want Isobu!");
				scr_text("Alright.", "Kakashi Happy", -1);
				obj_player.jinchuuriki_color = c_gray;
			break;
			
			case ("Kakashi - Gokuu"):
				scr_text("I want Son Gokuu!");
				scr_text("Alright.", "Kakashi Happy", -1);
				obj_player.jinchuuriki_color = c_red;
			break;
			
			case ("Kakashi - Kokuou"):
				scr_text("I want Kokuou!");
				scr_text("Alright.", "Kakashi Happy", -1);
				obj_player.jinchuuriki_color = c_ltgray;
			break;
			
			case ("Kakashi - Saiken"):
				scr_text("I want Saiken!");
				scr_text("Alright.", "Kakashi Happy", -1);
				obj_player.jinchuuriki_color = c_ltgray;
			break;
			
			case ("Kakashi - Choumei"):
				scr_text("I want Choumei!");
				scr_text("Alright.", "Kakashi Happy", -1);
				obj_player.jinchuuriki_color = #ff8400;
			break;
			
			case ("Kakashi - Gyuuki"):
				scr_text("I want Matatabi!");
				scr_text("Alright.", "Kakashi Happy", -1);
				obj_player.jinchuuriki_color = #945b41;
			break;
			
			case ("Kakashi - Kurama"):
				scr_text("I want Kurama!");
				scr_text("Alright.", "Kakashi Happy", -1);
				obj_player.jinchuuriki_color = c_red;
			break;
			
		case "Sasuke":
			scr_text("Humpf, what the hell do you want?", "Sasuke", -1);
					scr_option("May i change my appearance?", "Sasuke - Appearance");
			break;
			
			case ("Sasuke - Appearance"):
				scr_text("Okay, are you ready?", "Sasuke", -1);
					scr_option("Yes!", "Sasuke - Ready");
					scr_option("Nevermind...", "Sasuke - Nevermind");
			break;
			
			case ("Sasuke - Ready"):
				obj_game.lastX = obj_player.x;
				obj_game.lastY = obj_player.y;
			
				instance_create_depth(0, 0, -999999, obj_fade);
				room_goto(character_creator);
			break;
			
			case ("Sasuke - Nevermind"):
				scr_text("Don't waste my time.", "Sasuke Angry", -1);
			break;
	}
}