//Wall bounce mechanic
if(bounceCount=1){
	keepMom=hspeed;
	hspeed=0;
	hspeed = keepMom*-1;
	bounceCount=0;
	show_debug_message(bounceCount);
}
if(bounceCount==0){     //moves into this condition check before boomerang can bounce. 
	instance_destroy(); //either events are static rather than dynamic, 
}						//or collision still occuring when condition is checked