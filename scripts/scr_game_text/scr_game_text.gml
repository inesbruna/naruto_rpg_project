///@param text_id
function scr_game_text(_text_id){
	switch(_text_id){
		case "Kakashi":
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
	}
}