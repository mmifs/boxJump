hspeed -= 0.3*bDirection;
vspeed -= 0.065;
if(x>=oPlayer.x+700||x<=oPlayer.x-700||y>=oPlayer.y+500||y<=oPlayer.y-500){
	instance_destroy();
}
show_debug_message(bounceCount);