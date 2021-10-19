//destroy@range
if(x>=oPlayer.x+700||x<=oPlayer.x-700||y>=oPlayer.y+500||y<=oPlayer.y-500){
	instance_destroy();
}

//predict collision

x = x+hspeed;
y = y+vspeed;