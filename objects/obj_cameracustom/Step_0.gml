/// @description Camera Stuff.
#macro lerp_speed 0.25

// Camera Shake.
var shake_value_x = 0;
var shake_value_y = 0;
shakeMag = approach(shakeMag, 0, shakeMagAcc);

if (shakeMag != 0) {
	shake_value_x += irandom_range((-shakeMag), shakeMag);
	shake_value_y += irandom_range((-shakeMag), shakeMag);
}

// Camera Zoom.
cameraZoom = lerp(cameraZoom, cameraTargetZoom, lerp_speed)
var camera_view_width = (cameraViewWidth * cameraZoom);
var camera_view_height = (cameraViewHeight * cameraZoom);

camera_set_view_size(view_camera[0], camera_view_width, camera_view_height);

// Camera Angle.
cameraAngle = lerp(cameraAngle, cameraTargetAngle, lerp_speed)
camera_set_view_angle(view_camera[0], cameraAngle);

// Camera Position.

var camera_target_x = (global.TargetCamX - camera_view_width / 2);
var camera_target_y = (global.TargetCamY - camera_view_height / 2);


// Clamp the target position to within the room or region.
camera_target_x = clamp(camera_target_x, cameraTargetXorigin, cameraTargetWidth - camera_view_width);
camera_target_y = clamp(camera_target_y, cameraTargetYorigin, cameraTargetHeight - camera_view_height);

camera_target_x = clamp(camera_target_x, 0, room_width - camera_view_width);
camera_target_y = clamp(camera_target_y, 0, room_height - camera_view_height);	

// Smoothen Camera.
cameraX = lerp(cameraX, camera_target_x, lerp_speed);
cameraY = lerp(cameraY, camera_target_y, lerp_speed);

// Set Camera Position.
camera_set_view_pos(view_camera[0], cameraX + shake_value_x, cameraY + shake_value_y); 