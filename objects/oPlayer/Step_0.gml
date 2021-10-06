// Get player input

key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);
key_dash = keyboard_check_pressed(vk_up);

//Calculate Movement

var move = key_right - key_left;


hsp += move * walksp; //+= allows to slide bc does not strictly set variable

//momentum calculation below

// dash

var dash = function () {
		var move = key_right - key_left;
		if (key_dash) {
			dashable = true;
			//show_debug_message(move);
			start_timer = true;
			if (start_timer == true) {timer = room_speed * 2}

			if (timer > 0) {hsp += (move * dash_sp); timer--;}

			if (timer == 0)
			{
			 dashable = false;
			 timer = -1; 
			 start_timer = false;
			}
			return dashable
		} else {

	dashable = false;
	return dashable
	};

}

var dashable = dash();
show_debug_message(dash());
//show_debug_message(dash());
/*if (key_dash) {
	var dashable = true;
	hsp += (move * dash_sp);
	show_debug_message(move);
	var i = 0;
	while (dashable = true) 
	{
		if (i > 10) {
			
			dashable = false;
			break;
			};
		i++;
		
	};
	return dashable
};*/
//show_debug_message(dashable);
//show_debug_message(hsp);
if (hsp > 0) {
	hsp = (hsp - mom);
} else if (hsp < 0) {
	hsp = (hsp + mom);
} else {
	hsp = 0;
};

if (hsp >= 5 && dashable = false) {
	hsp = 5
} else if (hsp <= -5 && dashable = false) {
	hsp = -5
};


vsp = vsp + grv;


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