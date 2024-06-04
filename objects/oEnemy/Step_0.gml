/// @description Insert description here

var _dir = point_direction(x,y,x+sign(spd),y);

horizontal_speed = lengthdir_x(spd, _dir);

if(place_meeting(x,y,oBounce)) {
	if(dir == 0) dir = 1;
	else dir = 0;
}

switch(dir) {
	case 0: x += horizontal_speed; break;
	case 1: x -= horizontal_speed; break;
	default: break;
}

