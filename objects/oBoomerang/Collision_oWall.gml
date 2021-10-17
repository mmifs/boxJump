//Wall bounce mechanic
if(bounceCount==1){
	hspeed=hspeed*-1;
	bounceCount=0;
}else{    
	instance_destroy(); 
}						