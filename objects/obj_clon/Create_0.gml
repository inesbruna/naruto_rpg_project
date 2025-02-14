/// @description Variables

//Physics
hspd = 0;
vspd = 0;
grv = 0.3;
charDirection = 1;
grounded = true;

//States
state = "free";
canAttack = true;
lastState = "";
timer = 0;

//Transformation
transformation = 0;
jinchuuriki_color = c_red;

//Transformation Offset
scr_offsets();

//Lifetime
lifetime = 3000;

//Stats
hp = global.player_healthmax/5;
hpmax = global.player_healthmax/5;

//Animation Control
img_speed = 8;
img_frame = 0;
img_index = 0;
total_frames = 0;

//Assets
//actual
head = 0;
hair = 0;
eyes = 0;
clothing = 0;
//character stance
headStance = 0;
hairStance = 0;
eyesStance = 0;
clothingStance = 0;
//character running
headRunning = 0;
hairRunning = 0;
eyesRunning = 0;
clothingRunning = 0;
//character attack
headAttack = 0;
hairAttack = 0;
eyesAttack = 0;
clothingAttack = 0;
//character hit
headHit = 0;
hairHit = 0;
clothingHit = 0;
//character dead
headDead = 0;
hairDead = 0;
clothingDead = 0;
