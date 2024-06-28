function scr_game_text(_text_id){
	switch(_text_id){
		case "Kakashi":
			scr_text("Welcome to the Naruto RPG Project beta test, here are the basic controls to get you started on your ninja adventure");
			scr_text("For the movement, WASD. For attack, press J key. For skill, press U!");
			scr_text("Alright, some more important controls. To pick up items on the floor or change map, press Z. To open the inventory, press I, and to access the menu, press O.");
			scr_text("And last, not least and most fun, to activate the nine-tailed fox cloak, press 1.");
			scr_text("Do you understand all?");
				scr_option("Yep!", "Kakashi - Yes");
				scr_option("Nope!", "Kakashi - No");
			break;
			case ("Kakashi - Yes"):
				scr_text("Good! Keep walking to the right to start your training.");
			break;
			case ("Kakashi - No"):
				scr_text("Talk to me again and i will repeat everything.");
			break;
	}
}