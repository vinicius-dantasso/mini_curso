/// @description Insert description here

// If Player exists
if(instance_exists(oPlayer)) {
	// Move to him by determined interpolation
	x = lerp(x, oPlayer.x, 0.05);
	y = lerp(y, oPlayer.y, 0.05);
}

