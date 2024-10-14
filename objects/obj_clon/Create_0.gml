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

//Lifetime
lifetime = 3000;

//Stats
hp = global.player_healthmax/5;
hpmax = global.player_healthmax/5;

//Assets
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
headCombo3 = 0;
hairCombo3 = 0;
eyesCombo3 = 0;
clothingCombo3 = 0;
//character hit
headHit = 0;
hairHit = 0;
clothingHit = 0;
//character dead
headDead = 0;
hairDead = 0;
clothingDead = 0;
