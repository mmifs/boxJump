show_debug_message("cam left border:");
show_debug_message(camera_get_view_x(oScrollingCam.camera));
show_debug_message("cam right border:");
show_debug_message(camera_get_view_x(oScrollingCam.camera) + camera_get_view_width(oScrollingCam.camera));
show_debug_message("cam top border:");
show_debug_message(camera_get_view_y(oScrollingCam.camera));
show_debug_message("cam bottom border:");
show_debug_message(camera_get_view_y(oScrollingCam.camera) + camera_get_view_height(oScrollingCam.camera));
//show_debug_message();