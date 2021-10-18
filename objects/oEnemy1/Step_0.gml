//show_debug_message(hp);
//Chase AI
if (instance_exists(oPlayer)){
	active = point_distance(x, y, oPlayer.x, oPlayer.y) <= 300 //calc distance to player
	var move = sign(oPlayer.x-x) //calculate if player is left or right

	if (active) //if player in range
	{
		active = point_distance(x, y, oPlayer.x, oPlayer.y) <= 800
		if((oPlayer.x-x > -800 && oPlayer.x-x < 0) || (oPlayer.x-x > 0 && oPlayer.x-x < 800)){ //x distance chase
			walk = walk_sp*(hspeed >= -walk_limit && hspeed <= walk_limit); //calc speed*direction
			hspeed += move*walk; //move towards player
		}
		if ((oPlayer.y-y <= 0) && place_meeting(x,y+1,oWall) && oPlayer.vsp == 0){ //if player is touching wall and above
			vspeed += jump_height; //jump
		}
	}
}

//Momentum calc
if (hspeed > 0) {
	hspeed -= mom;
} else if (hspeed < 0) {
	hspeed += mom;
}

//Gravity Calc
vspeed = vspeed + grv;

// Horizontal Collision
if (place_meeting(x+hspeed,y,oWall)) 
{
	while (!place_meeting(x+sign(hspeed),y,oWall))
	{
		x = x + sign(hspeed);
	}
	hspeed = 0;
}

// Vertical Collision
if (place_meeting(x,y+vspeed,oWall))
{
	while (!place_meeting(x,y+sign(vspeed),oWall))
	{
		y = y + sign(vspeed);
	}
	vspeed = 0;
}