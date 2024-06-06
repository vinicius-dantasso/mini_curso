/// @description Insert description here

// Movement and Jump Buttons
var _horizontal_dir = -keyboard_check(ord("A"))+keyboard_check(ord("D")); 
var _vertical_dir = keyboard_check_pressed(vk_space);

// Set the direction the Player will move
var _dir = point_direction(x,y,x+_horizontal_dir,y+_vertical_dir);

// If Player is moving set the speed to 3
if(_horizontal_dir != 0)
	spd = 3.0;
else
	spd = 0.0;

// Change Player Sprite
switch(_horizontal_dir) {
	case -1: 
		looking_direction = -1;
		sprite_index = sPlayer_Run_Right;
	break;
	case 1:
		looking_direction = 1;
		sprite_index = sPlayer_Run_Left;
	break;
	default:
		if(looking_direction == -1)
			sprite_index = sPlayer_Idle_Left;
		else
			sprite_index = sPlayer_Idle_Right;
	break;
}
	
// Calculates the line between Player speed and where we need to move
horizontal_speed = lengthdir_x(spd, _dir);

// Horizontal Collision
if(place_meeting(x+horizontal_speed,y,oWall)) {
	while(!place_meeting(x+sign(horizontal_speed),y,oWall)) {
		x+=sign(horizontal_speed);
	}
	horizontal_speed = 0.0;
}

x += horizontal_speed;

// Apply gravity
vertical_speed += grav;
if(vertical_speed >= max_grav)
	vertical_speed = max_grav;

// If on ground and press to jump, Jump
if(on_ground && _vertical_dir) {
	vertical_speed = 0.0;
	vertical_speed -= jump_height;
	on_ground = false;
}

// Vertical Collision
if(place_meeting(x,y+vertical_speed,oWall)) {
	while(!place_meeting(x,y+sign(vertical_speed),oWall)) {
		y+=sign(vertical_speed);
	}
	vertical_speed = 0.0;
	on_ground = true;
}

y += vertical_speed;

// Shoot knife
var _shoot = mouse_check_button_pressed(mb_left);

if(_shoot and alarm[0] <= 0) {
	alarm[0] = 30;
	var _knife = instance_create_depth(x,y,0,oKnife);	
}



