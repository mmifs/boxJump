// Get player input
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);
key_dash = keyboard_check_pressed(vk_shift);

if (inAir && !grapple){
	mom=0.1;
} else if (!inAir && !grapple) {
	mom=0.5;
}

function resetPlayer() {
vsp = 0;
hsp = 0;
grv = 0.3;
mom = 0.5;
vMom = 0;
jump_height = -10;
jump_count = 0;
inAir = false;
dash_sp = 10;
walk_sp = 1;
faceDirection = 1;
walk_limit = 3;
dash_limit = 4;
grapple = false;
};


//Calculate Movement
var move = key_right - key_left;
if (move<0){
	if(hsp<-4){						//Changing to appropriate sprite
		sprite_index = sPlayerDash;
		image_index = 1;
	}else{
		if(inAir==1){
			sprite_index = sPlayerJump;
			image_index = 1;
		}
		else{
		sprite_index = sPlayerRunL;
		}
	}
	
}
	
if(move>0){
	if(hsp>4){						//Changing to appropriate sprite
		sprite_index = sPlayerDash;
		image_index = 2;
	}else{
		if(inAir==1){
			sprite_index = sPlayerJump;
			image_index = 2;
		}
		else{
		sprite_index = sPlayerRunR;
		}
	}
	
}

if(move != 0) {
	faceDirection = move;
}

if(move==0){
	if(faceDirection<0){			//Changing to appropriate sprite
		if(inAir==0){
		sprite_index=sPlayerIdle
		image_index=1;
		}
	}
	if(faceDirection>0){			//Changing to appropriate sprite
		if(inAir==0){
		sprite_index=sPlayerIdle
		image_index=2;
		}
	}
}
	
//Dash Movement
if (key_dash) {
	if (instance_exists(oPlayer)){
		if (hsp >= -4 && hsp <= 4 && move != 0) {
			audio_play_sound(sDash,1000,false)
		}
		hsp += move * dash;
	}
}

//Momentum Calculation
if (hsp > 0) {
	hsp -= mom;
} else if (hsp < 0) {
	hsp += mom;
}

//Speed limit & Movement Calc
walk = walk_sp*(hsp >= -walk_limit && hsp <= walk_limit);
dash = dash_sp*(hsp >= -dash_limit && hsp <= dash_limit); 
if (grapple == false){
	hsp += move * walk;
}
//Gravity Calc
vsp = vsp + grv;

//Jump Logic
if (place_meeting(x,y+1,oWall)) {
	if (inAir == 1) {
		audio_play_sound(sFloorLand,1000,false)
	}
	jump_count = 0;
	inAir = 0;	
}

if (place_meeting(x,y+1,oWall)) && (key_jump){
	audio_play_sound(sFloorJump,1000,false)
	vsp += jump_height;
	inAir = 1;
}

if (!place_meeting(x,y+1,oWall)) && (key_jump) {
	if (jump_count = 0) {
		vsp = 0;
		audio_play_sound(sDoubleJump,1000,false)
		vsp += jump_height;	
		jump_count ++;
	}
}

// Horizontal Collision
if (place_meeting(x+hsp,y,oWall)) 
{
	while (!place_meeting(x+sign(hsp),y,oWall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;

// Vertical Collision
if (place_meeting(x,y+vsp,oWall))
{
	while (!place_meeting(x,y+sign(vsp),oWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;


// Destroy self on enemy contact; can use collision event instead, killPlayer function still works
if (place_meeting(x+hsp,y,oEnemy1)) 
{
	while (!place_meeting(x+sign(hsp),y,oEnemy1))
	{
		x = x + sign(hsp);
	}
	with(oScrollingCam){ //calls killPlayer function from scrolling camera object
		killPlayer();
	}
}


//Map border instakill
if ((instance_exists(oPlayer)) && (
oPlayer.x < oRoomCon.leftBorder || 
oPlayer.x > oRoomCon.rightBorder || 
oPlayer.y > oRoomCon.bottomBorder || 
oPlayer.y < oRoomCon.topBorder)) 
{
	with(oScrollingCam){ //calls killPlayer function from scrolling camera object
		killPlayer();
	}
}

//Camera border instakill
/*if ((instance_exists(oPlayer)) && (
oPlayer.x < (oScrollingCam.x - 640) || 
oPlayer.x > (oScrollingCam.x + 640) || 
oPlayer.y < (oScrollingCam.y - 360) || 
oPlayer.y > (oScrollingCam.y + 360)))
{
	with(oScrollingCam){
		killPlayer();
	}
}*/

//Grapple hook mechanic
if (grapple == true && instance_exists(oPlayer) && instance_exists(oGrappleHook)) {

	grv = 0;   //not sure if its necessary to set these to 0
	vMom = 0;
	mom = 0;
	hspeed += 0.5*sign(oGrappleHook.x - x); //sets left and right velocity in the swing
	vspeed += vDir;  //sets velocity of swing
	if(sign(oGrappleHook.x - x) != hSwing && functionCall == 0){ //determines the x at which player passes the grapplehook x
		num = x;												 //makeshift static variable
		//vspeed = vspeed*-1;
		functionCall = 1;
	}
	if(x == num){ //vertical direction of the swing changes when player x equals the static variable
		vspeed = vspeed*-1;
	}
	if(hspeed == 0){ //vertical direction of the swing changes when the player reaches the end of the swing
		vspeed = vspeed*-1;
	}
	hSwing = sign(oGrappleHook.x - x);
	show_debug_message(hspeed);
}