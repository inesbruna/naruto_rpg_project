/// @description SET CONFIG

//----------state----------
state = "free";
lastState = "";

//----------Triggers----------

transformation = 0;
transforming = false;

//Combo
comboCounter = 0; //Step of combo
nextCombo = false; //Cooldown between a combo movement and another one
afterCombo = false; //Cooldown to make a combo again

timer = 0;

throwCooldown = false;
substitutionCooldown = false;

skill1 = false;
usingSkill1 = false;

chargingchakra = false;

//----------Dash Triggers----------
charDirection = 1;
lastPress = "";
dashTimer = false;
dashCooldown = false;

//----------physics----------
hspd = 0;
vspd = 0;
acc = 2;
grv = 0.3;
grounded = false;

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
//character dead
headDead = 0;
hairDead = 0;
clothingDead = 0;
//character defense
headDefense = 0;
hairDefense = 0;
eyesDefense = 0;
clothingDefense = 0;
//character defense
headPickup = 0;
hairPickup = 0;
eyesPickup = 0;
clothingPickup = 0;
//character defense
headChargingChakra = 0;
hairChargingChakra = 0;
eyesChargingChakra = 0;
clothingChargingChakra = 0;
//character defense
headThrow = 0;
hairThrow = 0;
eyesThrow = 0;
clothingThrow = 0;
