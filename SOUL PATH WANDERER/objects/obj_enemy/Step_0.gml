if (hp <= 0) {
    show_debug_message("ENEMY DEAD");
    instance_destroy();
}
// Move horizontally
x += hsp;

// Increase timer
timer++;

// When timer hits max, flip direction
if (timer >= move_time) {
    hsp = -hsp;
    timer = 0;
}

// Flip sprite based on direction
facing = (hsp > 0) ? "right" : "left";
// Base row selection
var base_index = 0;
switch (facing) {
    case "down":  base_index = 0;  break;
    case "left":  base_index = 4;  break;
    case "right": base_index = 8;  break;
    case "up":    base_index = 12; break;
}

var moving = (hsp != 0);

if (moving) {
    image_speed = 0.15;
    var frame_in_row = (image_index - base_index);
    if (frame_in_row < 0 || frame_in_row >= 4) {
        image_index = base_index;
    }
} else {
    image_speed = 0;
    image_index = base_index;
}