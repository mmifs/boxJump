//Shoot grapple hook
if(!instance_exists(oGrappleHook)){
	instance_create_depth(x+(1*faceDirection),y,layer_get_depth(global.room_id)-1, oGrappleHook)
} else {
	grapple=false;
	oGrappleHook.swingD=0;
	instance_destroy(oGrappleHook);
	grv=0.3;
}