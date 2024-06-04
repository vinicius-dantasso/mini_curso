/// @description Insert description here

// Movement
var _horizontal_dir = -keyboard_check(ord("A"))+keyboard_check(ord("D")); 
var _vertical_dir = keyboard_check_pressed(vk_space);

var _dir = point_direction(x,y,x+_horizontal_dir,y+_vertical_dir);

if(_horizontal_dir != 0)
	spd = 3.0;
else
	spd = 0.0;
	
horizontal_speed = lengthdir_x(spd, _dir);

// Horizontal Collision
if(place_meeting(x+horizontal_speed,y,oWall)) {
	while(!place_meeting(x+sign(horizontal_speed),y,oWall)) {
		x+=sign(horizontal_speed);
	}
	horizontal_speed = 0.0;
}

x += horizontal_speed;

// Vertical Collision
vertical_speed += grav;

if(on_ground && _vertical_dir) {
	vertical_speed = 0.0;
	vertical_speed -= jump_height;
	on_ground = false;
}

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

if(_shoot) {
	var _knife = instance_create_depth(x,y,0,oKnife);	
}



