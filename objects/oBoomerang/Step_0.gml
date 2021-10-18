hspeed -= mom*bDirection;
if(x>=oPlayer.x+700||x<=oPlayer.x-700||y>=oPlayer.y+500||y<=oPlayer.y-500){
	instance_destroy();
}
if(bounceCount==0){
	mom = mom*(-1);
}
show_debug_message(bDirection);