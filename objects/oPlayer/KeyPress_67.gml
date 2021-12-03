//Shoot grapple hook
if(!instance_exists(oGrappleHook)){
	instance_create_depth(x,y,layer_get_depth(global.room_id)-1, oGrappleHook)
} else {
	instance_destroy(oGrappleHook)
}