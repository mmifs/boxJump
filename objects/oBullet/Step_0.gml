/*if (place_meeting(x+hspeed,y,oEnemy1)) 
{
	while (!place_meeting(x+sign(hspeed),y,oEnemy1))
	{
		x = x + sign(hspeed);
	}
	instance_destroy();
	instance_destroy(other);
}*/

if (place_meeting(x+hspeed,y,oWall)) 
{
	while (!place_meeting(x+sign(hspeed),y,oWall))
	{
		x = x + sign(hspeed);
	}
	instance_destroy();
}