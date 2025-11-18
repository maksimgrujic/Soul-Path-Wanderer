// Input
var move_x = keyboard_check(vk_right) - keyboard_check(vk_left);
var move_y = keyboard_check(vk_down)  - keyboard_check(vk_up);
var moving = (move_x != 0 || move_y != 0);
var move_speed = 2;

// Normalize diagonal movement
if (moving) {
    var len = point_distance(0, 0, move_x, move_y);
    if (len != 0) {
        move_x /= len;
        move_y /= len;
    }
}

// Collision movement
if (!place_meeting(x + move_x * move_speed, y, obj_wall) 
&& !place_meeting(x + move_x * move_speed, y, obj_enemy)) {
    x += move_x * move_speed;
}

if (!place_meeting(x, y + move_y * move_speed, obj_wall)
&& !place_meeting(x, y + move_y * move_speed, obj_enemy)) {
    y += move_y * move_speed;
}

// Determine facing
if (moving) {
    if (abs(move_x) > abs(move_y)) {
        facing = (move_x > 0) ? "right" : "left";
    } else {
        facing = (move_y > 0) ? "down" : "up";
    }
}

// Base index per direction
// Adjust these four numbers if your sprite rows differ.
// Generally with 4x4 sheets: down=0, left=4, right=8, up=12.
var base_index = 0;
switch (facing) {
    case "down":  base_index = 0;  break;
    case "left":  base_index = 4;  break;
    case "right": base_index = 8;  break;
    case "up":    base_index = 12; break;
}

// Animation logic
if (moving) {
    image_speed = 0.15;

    // Keep animation within 4 frames per direction
    var frame_in_row = (image_index - base_index);
    if (frame_in_row < 0 || frame_in_row >= 4) {
        image_index = base_index; // reset to start of this row if out of range
    }
} else {
    image_speed = 0;
    image_index = base_index; // idle frame
}

// Safety
image_angle = 0;