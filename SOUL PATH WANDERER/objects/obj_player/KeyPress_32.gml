var offset_x = 0;
var offset_y = 0;

switch (facing) {
    case "right": offset_x = 16; break;
    case "left":  offset_x = -16; break;
    case "up":    offset_y = -16; break;
    case "down":  offset_y = 16; break;
}

// Create the hitbox IN FRONT OF THE PLAYER
var hb = instance_create_layer(x + offset_x, y + offset_y, "Instances", obj_attackHitbox);

show_debug_message("Attack! Facing: " + facing + " | Hitbox at: " + string(x + offset_x) + ", " + string(y + offset_y));

window_set_caption("ATTACK!");