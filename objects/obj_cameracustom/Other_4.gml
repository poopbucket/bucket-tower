/// @description Camera Start.
#region Camera Reset.
cameraTargetWidth = room_width;
cameraTargetHeight = room_height;
cameraTargetXorigin = 0;
cameraTargetYorigin = 0;
cameraTargetZoom = 1;
cameraTargetAngle = 0;
var region_id = noone;
with (obj_cameraRegion) {
	if (canActivate()) {
		region_id = id;
		with (other) {
			if region_id.regionClampRight {
				cameraTargetWidth = region_id.x + region_id.sprite_width;
			}
			if region_id.regionClampBottom {
				cameraTargetHeight = region_id.y + region_id.sprite_height;
			}
			if region_id.regionClampLeft {
				cameraTargetXorigin = region_id.x;
			}
			if region_id.regionClampTop {
				cameraTargetYorigin = region_id.y;
			}
			cameraTargetZoom = region_id.regionZoom;
			if (region_id.regionAngleChange) {
				cameraTargetAngle = -region_id.image_angle;
			}			
		}
	}
}
// Camera Zoom.
cameraZoom = cameraTargetZoom;
var camera_view_width = cameraViewWidth * cameraZoom;
var camera_view_height = cameraViewHeight * cameraZoom;

camera_set_view_size(view_camera[0], camera_view_width, camera_view_height);

// Camera Angle.
cameraAngle = cameraTargetAngle;

camera_set_view_angle(view_camera[0], cameraAngle);

// Camera Position.
if (instance_exists(obj_player)) {
	global.TargetCamX = obj_player.x;
	global.TargetCamY = obj_player.y - 32;	
}
var camera_target_x = global.TargetCamX - camera_view_width / 2;
var camera_target_y = global.TargetCamY - camera_view_height / 2;
	
// Clamp the target position to within the room or region.
camera_target_x = clamp(camera_target_x, cameraTargetXorigin, cameraTargetXorigin + cameraTargetWidth - camera_view_width);
camera_target_y = clamp(camera_target_y, cameraTargetYorigin, cameraTargetYorigin + cameraTargetHeight - camera_view_height);

camera_target_x = clamp(camera_target_x, 0, room_width - camera_view_width);
camera_target_y = clamp(camera_target_y, 0, room_height - camera_view_height);	

// Set Camera Position.
cameraX = camera_target_x;
cameraY = camera_target_y;
camera_set_view_pos(view_camera[0], cameraX, cameraY);

	
#endregion




















