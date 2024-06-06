/// @description Insert description here

switch(state) {
	case ENEMYSTATE.ALIVE:
		
		// Set the direction to where it need to go
		var _dir = point_direction(x,y,x+sign(spd),y);

		// Calculates the line between Enemy speed and where it needs to go
		horizontal_speed = lengthdir_x(spd, _dir);

		// Collision with invisible wall
		if(place_meeting(x,y,oBounce)) {
			// Change direction it will move
			if(dir == 0) dir = 1;
			else dir = 0;
		}

		// Change direction it will move
		switch(dir) {
			case 0:
				sprite_index = sEnemy_Run_Right;
				x += horizontal_speed;
			break;
			case 1:
				sprite_index = sEnemy_Run_Left;
				x -= horizontal_speed;
			break;
			default: break;
		}
		
	break;
	
	case ENEMYSTATE.DEAD:
		sprite_index = sEnemy_Death;
		if(image_index >= 5)
			instance_destroy();
	break;
}
