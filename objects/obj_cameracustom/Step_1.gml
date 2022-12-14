/// @description Camera Regions and Player Position.

// Camera Regions
var region_id = noone;
with (obj_cameraRegion) {
	if (canActivate()) {
		region_id = id;
		with (other) {
			if (region_id.regionClampRight) {
				cameraTargetWidth = lerp(cameraTargetWidth, region_id.x + region_id.sprite_width, 0.25);
			} else {
				cameraTargetWidth = lerp(cameraTargetWidth, room_width, 0.15);				
			}
			if (region_id.regionClampBottom) {
				cameraTargetHeight = lerp(cameraTargetHeight, region_id.y + region_id.sprite_height, 0.25);
			} else {
				cameraTargetHeight = lerp(cameraTargetHeight, room_height, 0.15);
			}
			if (region_id.regionClampLeft) {
				cameraTargetXorigin = lerp(cameraTargetXorigin, region_id.x, 0.25);
			} else {
				cameraTargetXorigin = lerp(cameraTargetXorigin, 0, 0.15);
			}
			if (region_id.regionClampTop) {
				cameraTargetYorigin = lerp(cameraTargetYorigin, region_id.y, 0.25);		
			} else {
				cameraTargetYorigin = lerp(cameraTargetYorigin, 0, 0.15);	
			}
			cameraTargetZoom = lerp(cameraTargetZoom, region_id.regionZoom, 0.25);
			if (region_id.regionAngleChange) {
				cameraTargetAngle = lerp(cameraTargetAngle, -region_id.image_angle, 0.25);
			}
		}
	}
}

if (!instance_exists(region_id)) {
	cameraTargetWidth = lerp(cameraTargetWidth, room_width, 0.15);
	cameraTargetHeight = lerp(cameraTargetHeight, room_height, 0.15);
	cameraTargetXorigin = lerp(cameraTargetXorigin, 0, 0.15);
	cameraTargetYorigin = lerp(cameraTargetYorigin, 0, 0.15);	
	cameraTargetAngle = lerp(cameraTargetAngle, 0, 0.15);
}

// Camera Position.
if (instance_exists(obj_player)) {
	global.TargetCamX = obj_player.x;
	global.TargetCamY = obj_player.y - 32;
}

















