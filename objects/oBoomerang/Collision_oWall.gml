//Wall bounce mechanic
if(bounceCount>0){
	hspeed=hspeed*-1;
	bounceCount=0;
}
else{    
	instance_destroy(); 
}						