if(keyboard_check(vk_up)){
	if(keyboard_check(vk_right)){		
	vspeed = -20;
	hspeed = 20*oPlayer.faceDirection;
	}
	else if(keyboard_check(vk_left)){
		vspeed = -20;
		hspeed = 20*oPlayer.faceDirection;
	}
	else{
		vspeed = -20;
	}
}
else{
	hspeed = 20*oPlayer.faceDirection;
}