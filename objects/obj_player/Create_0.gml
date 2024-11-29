/// @description SET CONFIG

//----------State----------
state = "free";
lastState = "";

//----------Animation---------
total_frames = 0;
img_frame = 0;
img_index = 0;
img_speed = 8;

//Combo
comboCounter = 0; //Step of combo
nextCombo = false; //Cooldown between a combo movement and another one
afterCombo = false; //Cooldown to make a combo again

timer = 0;

//Transforms
transformation = 0; //Base
jinchuuriki_color = c_red;

//Cooldowns
throwCooldown = false;
substitutionCooldown = false;
skill1_cooldown = false;
skill2_cooldown = false;
skill3_cooldown = false;
skill4_cooldown = false;
skill5_cooldown = false;
skill6_cooldown = false;

skill1 = false;
usingSkill1 = false;

chargingchakra = false;

//----------Dash Triggers----------
charDirection = 1;
lastPress = "";
dashTimer = false;
dashCooldown = false;

//----------Physics----------
hspd = 0;
vspd = 0;
acc = 2;
grv = 0.3;
grounded = false;
wasGrounded = true;

// Current Player Animation
head = 0;
hair = 0;
clothing = 0;
eyes = 0;

// Stance Character Icon
headStance = 0;
hairStance = 0;
clothingStance = 0;
eyesStance = 0;