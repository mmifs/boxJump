// Get player input
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);
key_dash = keyboard_check_pressed(vk_shift);


//Calculate Movement
var move = key_right - key_left;
if (move<0){
	if(hsp<-4){						//Changing to appropriate sprite
		sprite_index = sPlayerDash;
		image_index = 1;
	}else{
		sprite_index = sPlayerRunL;
	}
	
}
	
if(move>0){
	if(hsp>4){						//Changing to appropriate sprite
		sprite_index = sPlayerDash;
		image_index = 2;
	}else{
		sprite_index = sPlayerRunR;
	}
	
}

if(move != 0) {
	faceDirection = move;
}

if(move==0){
	if(faceDirection<0){			//Changing to appropriate sprite
		sprite_index=sPlayerIdle
		image_index=1;
	}
	if(faceDirection>0){			//Changing to appropriate sprite
		sprite_index=sPlayerIdle
		image_index=2;
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

//Speed limit
walk = walk_sp*(hsp >= -walk_limit && hsp <= walk_limit);
dash = dash_sp*(hsp >= -dash_limit && hsp <= dash_limit); 
hsp += move * walk;

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

//Camera border instakill------------------------------------WIP
/*if (/*(instance_exists(oPlayer)) && (
oPlayer.x < camera_get_view_x(oScrollingCam.camera) || 
oPlayer.x > camera_get_view_x(oScrollingCam.camera) + camera_get_view_width(oScrollingCam.camera) || 
oPlayer.y > camera_get_view_y(oScrollingCam.camera) + camera_get_view_height(oScrollingCam.camera) || 
oPlayer.y < camera_get_view_y(oScrollingCam.camera)))
{
	show_debug_message("it works");
	/*with(oScrollingCam){
		killPlayer();
	}
}*/