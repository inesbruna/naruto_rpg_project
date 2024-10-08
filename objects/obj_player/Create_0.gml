/// @description SET CONFIG

//----------state----------
state = "free";
lastState = "";

//----------animation speed----------
image_speed = 0.3;

//----------Triggers----------

transformation = 0;
transforming = false;

//Combo
comboCounter = 0; //Step of combo
nextCombo = false; //Cooldown between a combo movement and another one
afterCombo = false; //Cooldown to make a combo again

timer = 0;

hitting = false;

dead = false;

defense = false;

skill1 = false;
usingSkill1 = false;

chargingchakra = false;

endAction = true;

//----------Dash Triggers----------
charDirection = 1;
dashTimer = false;
dashCooldown = false;

//----------physics----------
hspd = 0;
vspd = 0;
acc = 2;
grv = 0.3;
grounded = false;

//----------animations----------
naruto = spr_naruto;
narutoAttack = spr_naruto_attack;
narutoAttack2 = spr_naruto_attack2;
narutoAttack3 = spr_naruto_attack3;
narutoCharging = spr_naruto_charging;
narutoDead = spr_naruto_dead;
narutoDefense = spr_naruto_defense;
narutoFalling = spr_naruto_falling;
narutoHit = spr_naruto_hit;
narutoJumping = spr_naruto_jumping;
narutoPickup = spr_naruto_pickup;
narutoRunning = spr_naruto_running;
narutoTransform = spr_naruto_transform;

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
//character jumping
headJumping = 0;
hairJumping = 0;
eyesJumping = 0;
clothingJumping = 0;
//character falling
headFalling = 0;
hairFalling = 0;
eyesFalling = 0;
clothingFalling = 0;
//character combo1
headCombo1 = 0;
hairCombo1= 0;
eyesCombo1 = 0;
clothingCombo1 = 0;
//character combo2
headCombo2 = 0;
hairCombo2= 0;
eyesCombo2 = 0;
clothingCombo2 = 0;
//character combo3
headCombo3 = 0;
hairCombo3 = 0;
eyesCombo3 = 0;
clothingCombo3 = 0;
//character hit
headHit = 0;
hairHit = 0;
clothingHit = 0;