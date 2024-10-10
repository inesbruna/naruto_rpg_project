/// @creation game
tick = 0;
//player status
global.player_healthmax = 100;
global.player_health = global.player_healthmax;
global.player_chakramax = 100;
global.player_chakra = 0;
global.player_xp = 0;
global.player_level = 0;
global.player_points = 0;
global.player_strength = 10;
global.player_intelligence = 10;
global.player_clan = noone;
global.hair = 0;
global.head = 0;
global.clothing = 0;
global.hairColor = 0;
global.eyesColor = 0;



//states enemy
enum e_state{
	idle,
	chase,
	attack,
	hit,
}

//struct items
s_items = {
	//equipáveis
	anbuMask : {
		name : "Anbu Mask",
		description : "Most Anbu wear some kind of mask to conceal\ntheir identities.",
		hp : 50,
		chakra : 0,
		strength : 0,
		intelligence : 0,
		slot : 1, //head
		item_id : 0,
		type : "legendary"
	},
	samehada : {
		name : "Samehada",
		description : "Samehada is a sentient greatsword, It is described as\n'the most terrible of all the seven swords of the mist'.",
		hp : 0,
		chakra : 20,
		strength : 10,
		intelligence : 10,
		slot : 0,
		item_id : 1,
		type : "legendary"
	},
	tessen : {
		name : "Tessen",
		description : "Tessen were Japanese war fans made of heavy plates of iron",
		hp : 0,
		chakra : 0,
		strength : 0,
		intelligence : 10,
		slot : 0,
		item_id : 2,
		type : "common"
	},
	fuumaShuriken : {
		name : "Fuuma Shuriken",
		description : "The Fuuma Shuriken is a large shuriken,\nwith four blades possessing pre-eminent sharpness and lethality.",
		hp : 0,
		chakra : 0,
		strength : 10,
		intelligence : 0,
		slot : 0,
		item_id : 3,
		type : "common"
	},
	katana : {
		name : "Katana",
		description : "A regular Katana.",
		hp : 0,
		chakra : 0,
		strength : 10,
		intelligence : 0,
		slot : 0,
		item_id : 4,
		type : "common"
	},
	chakrasBlade : {
		name : "Chakra's Blade",
		description : "His are uniquely-designed trench knives worn like brass knuckles,\nwith a zigzag-shape blade to give them 'teeth'.",
		hp : 0,
		chakra : 15,
		strength : 10,
		intelligence : 5,
		slot : 0,
		item_id : 5,
		type : "common"
	},
	sandGourd : {
		name : "Sand Gourd",
		description : "A giant calabash-shaped gourd covered in designs\nand filled with chakra-infused sand which it can be freely manipulate.",
		hp : 20,
		chakra : 30,
		strength : 0,
		intelligence : 5,
		slot : 0,
		item_id : 6,
		type : "common"
	},
	regularGloves : {
		name : "Regular Gloves",
		description : "A pair of regular gloves.",
		hp : 10,
		chakra : 0,
		strength : 5,
		intelligence : 0,
		slot : 6,
		item_id : 7,
		type : "common"
	},
	ninjaHeadband : {
		name : "Ninja Headband",
		description : "A leaf village identification Headband.",
		hp : 25,
		chakra : 0,
		strength : 0,
		intelligence : 0,
		slot : 1,
		item_id : 8,
		type : "common"
	},
	chunninVest : {
		name : "Chunnin Vest",
		description : "A leaf village identification jacket\nfor those who passed the chunnin exam.",
		hp : 50,
		chakra : 0,
		strength : 0,
		intelligence : 0,
		slot : 2,
		item_id : 14,
		type : "common"
	},
	anbuVest : {
		name : "Anbu Vest",
		description : "A leaf village identification jacket\nfor those who are Anbu.",
		hp : 100,
		chakra : 0,
		strength : 0,
		intelligence : 0,
		slot : 2,
		item_id : 15,
		type : "legendary"
	},
	commonScroll : {
		name : "Common Scroll",
		description : "It's just a scroll...",
		hp : 0,
		chakra : 30,
		strength : 0,
		intelligence : 15,
		slot : 5,
		item_id : 12,
		type : "common"
	},
	narutoNecklace : {
		name : "Naruto's Necklace",
		description : "A Tsunade's gift for Naruto.",
		hp : 0,
		chakra : 10,
		strength : 0,
		intelligence : 20,
		slot : 8,
		item_id : 16,
		type : "common"
	},
	shuRing : {
		name : "Shu Ring",
		description : "A ring worn by members of Akatsuki. Once the ring is\nslipped on, it becomes sealed to the finger it is upon.",
		hp : 0,
		chakra : 0,
		strength : 0,
		intelligence : 10,
		slot : 7,
		item_id : 17,
		type : "common"
	},
	gyokiRing : {
		name : "Gyoki Ring",
		description : "A ring worn by members of Akatsuki. Once the ring is\nslipped on, it becomes sealed to the finger it is upon.",
		hp : 0,
		chakra : 0,
		strength : 0,
		intelligence : 10,
		slot : 7,
		item_id : 18,
		type : "common"
	},
	nanRing : {
		name : "Nan Ring",
		description : "A ring worn by members of Akatsuki. Once the ring is\nslipped on, it becomes sealed to the finger it is upon.",
		hp : 0,
		chakra : 0,
		strength : 0,
		intelligence : 10,
		slot : 7,
		item_id : 19,
		type : "common"
	},
	zeroRing : {
		name : "Zero Ring",
		description : "A ring worn by members of Akatsuki. Once the ring is\nslipped on, it becomes sealed to the finger it is upon.",
		hp : 0,
		chakra : 0,
		strength : 0,
		intelligence : 10,
		slot : 7,
		item_id : 20,
		type : "common"
	},
	kuRing : {
		name : "Ku Ring",
		description : "A ring worn by members of Akatsuki. Once the ring is\nslipped on, it becomes sealed to the finger it is upon.",
		hp : 0,
		chakra : 0,
		strength : 0,
		intelligence : 10,
		slot : 7,
		item_id : 21,
		type : "common"
	},
	sanRing : {
		name : "San Ring",
		description : "A ring worn by members of Akatsuki. Once the ring is\nslipped on, it becomes sealed to the finger it is upon.",
		hp : 0,
		chakra : 0,
		strength : 0,
		intelligence : 10,
		slot : 7,
		item_id : 22,
		type : "common"
	},
	gaiRing : {
		name : "Gai Ring",
		description : "A ring worn by members of Akatsuki. Once the ring is\nslipped on, it becomes sealed to the finger it is upon.",
		hp : 0,
		chakra : 0,
		strength : 0,
		intelligence : 10,
		slot : 7,
		item_id : 23,
		type : "common"
	},
	hokuRing : {
		name : "Hoku Ring",
		description : "A ring worn by members of Akatsuki. Once the ring is\nslipped on, it becomes sealed to the finger it is upon.",
		hp : 0,
		chakra : 0,
		strength : 0,
		intelligence : 10,
		slot : 7,
		item_id : 24,
		type : "common"
	},
	kaiRing : {
		name : "Kai Ring",
		description : "A ring worn by members of Akatsuki. Once the ring is\nslipped on, it becomes sealed to the finger it is upon.",
		hp : 0,
		chakra : 0,
		strength : 0,
		intelligence : 10,
		slot : 7,
		item_id : 25,
		type : "common"
	},
	seiRing : {
		name : "Sei Ring",
		description : "A ring worn by members of Akatsuki. Once the ring is\nslipped on, it becomes sealed to the finger it is upon.",
		hp : 0,
		chakra : 0,
		strength : 0,
		intelligence : 10,
		slot : 7,
		item_id : 26,
		type : "common"
	},
	konohaPants : {
		name : "Konoha's Pants",
		description : "A leaf village pants",
		hp : 50,
		chakra : 0,
		strength : 0,
		intelligence : 0,
		slot : 3,
		item_id : 27,
		type : "common"
	},
	konohaShoes : {
		name : "Konoha's Shoes",
		description : "A leaf village shoes",
		hp : 25,
		chakra : 0,
		strength : 0,
		intelligence : 0,
		slot : 4,
		item_id : 28,
		type : "common"
	},
	jacketCostume : {
		name : "Naruto's Jacket Costume",
		description : "A new unique costume for Naruto Teen Character.",
		hp : 0,
		chakra : 0,
		strength : 0,
		intelligence : 0,
		slot : 10,
		item_id : 29,
		type : "special"
	},
	//usáveis
	lamenBowl : {
		name : "Lamen Bowl",
		description : "A delicious bowl of ramen, regenerates your chakra by 50 points.",
		hp: 0,
		chakra : 0,
		strength : 0,
		intelligence : 0,
		slot : noone,
		item_id : 9,
		type : "common"
	},
	ointment : {
		name : "Ointment",
		description : "Used to regenerate small injuries, regenerates 20 health points.",
		hp: 0,
		chakra : 0,
		strength : 0,
		intelligence : 0,
		slot : noone,
		item_id : 10,
		type : "common"
	},
	largeOintment : {
		name : "Large Ointment",
		description : "A more potent version of a simple ointment, regenerates 40 health points.",
		hp: 0,
		chakra : 0,
		strength : 0,
		intelligence : 0,
		slot : noone,
		item_id : 11,
		type : "common"
	},
	dango : {
		name : "Dango",
		description : "Sweet Japanese dumplings, or dango, are bite-size balls of mochi rice, regenerates your chakra by 20 points.",
		hp: 0,
		chakra : 0,
		strength : 0,
		intelligence : 0,
		slot : noone,
		item_id : 13,
		type : "common"
	}
};

// Missions

s_quests = {
	quest0 : {
		name : "Defeat three Konoha ninjas",
		description : "There are Konoha ninjas in the forest who are waiting for training, go and defeat three of them.",
		condition : 3,
		reward_xp : 10,
		reward_ryo : 15,
		reward_item : noone
	}
};