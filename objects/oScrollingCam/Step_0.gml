//x += (xTo - x)/1300;
//leftBorder = camera_get_view_x();

//Camera moves left while player is alive
if(global.pDead == 0){
if(x < xTo){
	x += 3;
}
}
y += (yTo - y)/25;

//Camera resets when player dies
if(global.pDead == 1){
		if(x > startingX){
			x -= 20;
		}
		else{
			//global.pDead = 0;
			respawn();
		}
}


var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);

camera_set_view_mat(camera,vm);

//Functions
function respawn() {	//Respawn player on death
	instance_create_layer(oRoomCon.xPlayerOrigin,oRoomCon.yPlayerOrigin,global.room_id,oPlayer);
	global.pDead = 0;
}
function killPlayer() { //Player has died
	audio_play_sound(sDeath,1000,false)
	global.pDead = 1;
	instance_destroy(oPlayer)
}
