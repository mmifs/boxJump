// Get player input
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);
key_dash = keyboard_check_pressed(vk_up);

//Calculate Movement
var move = key_right - key_left;
if (move<0){
	
	image_index = 1;
}
	
if(move>0){
		
	image_index = 2;
}
	
//Dash Movement
if (key_dash) {
	hsp += move * dash;
	key_left = 0;
	key_right = 0;
}

//Momentum Calculation
if (hsp > 0) {
	hsp -= mom;
} else if (hsp < 0) {
	hsp += mom;
} else {
	hsp = 0;
}

//Speed limit
walk = walk_sp*(hsp >= -3 && hsp <= 3);
dash = dash_sp*(hsp >= -4 && hsp <= 4); 
hsp += move * walk;

//Gravity Calc
vsp = vsp + grv;

//Jump Logic
if (place_meeting(x,y+1,oWall)) {
	jump_count = 0;
}

if (place_meeting(x,y+1,oWall)) && (key_jump)
{
	vsp += jump_height;
}

if (!place_meeting(x,y+1,oWall)) && (key_jump) {
	if (jump_count = 0) {
		vsp = 0;
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

// Destroy self on enemy contact
if (place_meeting(x+hsp,y,oEnemy1)) 
{
	while (!place_meeting(x+sign(hsp),y,oEnemy1))
	{
		x = x + sign(hsp);
	}
	instance_destroy();
}

if(move != 0) {
	faceDirection = move;
}