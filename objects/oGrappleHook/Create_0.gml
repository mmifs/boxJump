//swingMom = 3; //swing accel ?

//aim either diagonal or straight up
vspeed = -10;
if(keyboard_check(vk_up)){
	hspeed = 0;
}else{
	hspeed = 10*oPlayer.faceDirection;
}



//Pseudocode

/*
GRAPPLE OBJECT CODE
//CREATE EVENT// **DONE**
set VSPEED upwards
set HSPEED in player direction

//COLLISION WITH TERRAIN EVENT// **DONE**
set VSPEED to 0
set HSPEED to 0

//STEP EVENT// **DONE**
if grapple hook gets too far from player
	destroy grapple hook

PLAYER OBJECT CODE
//KEY PRESS C EVENT// **DONE**
create grapple hook

*/

/*
//STEP EVENT// PARTIALLY DONE, SEE STEP EVENT**
if grapple hook touches wall object
	if player is in the air
		player swings in character's current dirrection
		(set VSPEED to a positive number. VSPEED increases MOMENTUM until player x position
		is the same as grapple hook, then VSPEED and MOMENTUM reverses.)
		(set HSPEED to number in current player direction. HSPEED increases MOMENTUM until
		player x position is the same as grapple hook, then MOMENTUM reverses.)
			if player jumps
				destroy grapple hook

//COLLISION WITH TERRAIN EVENT//
if grapple hook exists
	destroy grapple hook
	set VSPEED to 0, or player movement (arrow keys currently pressed)
	set HSPEED to 0, or player movement (arrow keys currently pressed)

*/
//not sure how to make the grapple hook stay attached to the player while swinging