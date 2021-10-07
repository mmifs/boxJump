// Get player input
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);
key_dash = keyboard_check_pressed(vk_up);


//Calculate Movement
var move = key_right - key_left;
hsp += move * walksp;
show_debug_message(walksp);

//Dash Movement
if (key_dash) {
	hsp += move * dash_sp;
	key_left = 0;
	key_right = 0;
};

//Momentum Calculation
if (hsp > 0) {
	hsp -= mom;
} else if (hsp < 0) {
	hsp += mom;
} else {
	hsp = 0;
};

//Speed limit
if (hsp > 3) {
	walksp = 0;
} else if (hsp < -3) {
	walksp = 0;
} else {
	walksp = 1;
};

//Gravity Calc
vsp = vsp + grv;

//If touching ground & jump pressed
if (place_meeting(x,y+1,oWall)) && (key_jump)
{
	vsp = -10;
};

// Horizontal Collision
if (place_meeting(x+hsp,y,oWall)) 
{
	while (!place_meeting(x+sign(hsp),y,oWall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
};

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