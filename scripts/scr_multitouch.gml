{
    var device;
    var mx;
    var my;
    for(device = 0 ; device <= 4; device+=1){
        mx = device_mouse_x(device);
        my = device_mouse_y(device);
        if( device_mouse_check_button(device, mb_left) = true ){
            if( position_meeting(mx, my, obj_left) = true ){
                x -= 10;
                if(pressNum = 0) {
                    sprite_index = spr_player_left;
                    pressNum = 1;
                }
                else {
                    sprite_index = spr_player_left_mid;
                    pressNum = 0;
                }
            }
            if( position_meeting(mx, my, obj_right) = true ){
                x += 10;
                if(pressNum = 0) {
                    sprite_index = spr_player_right;
                    pressNum = 1;
                }
                else {
                    sprite_index = spr_player_right_mid;
                    pressNum = 0;
                }
            }
            if( position_meeting(mx, my, obj_up) = true ){
                y -= 10;
                if(pressNum = 0) {
                    sprite_index = spr_player_up_left;
                    pressNum = 1;
                }
                else if (pressNum = 1){
                    sprite_index = spr_player_up_mid;
                    pressNum = 2;
                }
                else {
                    sprite_index = spr_player_up_right;
                    pressNum = 0;
                }
            }
            if( position_meeting(mx, my, obj_down) = true ){
                y += 10;
                if(pressNum = 0) {
                    sprite_index = spr_player_down_left;
                    pressNum = 1;
                }
                else if (pressNum = 1){
                    sprite_index = spr_player_down_mid;
                    pressNum = 2;
                }
                else {
                    sprite_index = spr_player_down_right;
                    pressNum = 0;
                }
            }
        }
        if(device_mouse_check_button_pressed(device, mb_left) = true ){
            if( position_meeting(mx, my, obj_a) = true ){
            //Investigate
with(obj_message) {
    instance_destroy();
}
if(global.rm_name = "Main") {
    if(global.has_bone = false && distance_to_point(obj_dinosaur.x, obj_dinosaur.y) < 100) {
        instance_create(obj_dinosaur.x, obj_dinosaur.y - 130, obj_message);
        obj_message.sprite_index = spr_find_bone;
        audio_play_sound(sd_pick_tool, 1, false);
        global.has_bone = true;
    }
    if(global.has_main_note = false && distance_to_point(obj_board.x, obj_board.y) < 100) {
        instance_create(obj_board.x, obj_board.y - 130, obj_message);
        obj_message.sprite_index = spr_board_msg;
        global.has_main_note = true; 
        audio_play_sound(sd_pick_tool, 1, false);
    }
    if(distance_to_point(obj_board_two.x, obj_board_two.y) < 100) {
        instance_create(obj_board_two.x, obj_board_two.y - 130, obj_message);
        obj_message.sprite_index = spr_board_take_care;
        audio_play_sound(sd_pick_tool, 1, false);
    }
}
else if(global.rm_name = "Restaurant") {    
    if(global.has_coin = false && global.has_snack = false && distance_to_point(obj_fountain.x, obj_fountain.y) < 120) {
        instance_create(obj_fountain.x, obj_fountain.y - 130, obj_message);
        obj_message.sprite_index = spr_find_coin;
        global.has_coin = true;
        audio_play_sound(sd_pick_tool, 1, false);
    }
    //Get snack
    if(global.has_coin = true && global.has_snack = false && distance_to_point(obj_vending_machine.x, obj_vending_machine.y) < 100) {
        instance_create(obj_vending_machine.x, obj_vending_machine.y - 130, obj_message);
        obj_message.sprite_index = spr_find_snack;
        global.has_snack = true;
        audio_play_sound(sd_pick_tool, 1, false);
        global.has_coin = false;
    }
    //Hit the trap vending machine
    if(obj_vending_machine_trap.isTouched = false && global.has_coin = true && distance_to_point(obj_vending_machine_trap.x, obj_vending_machine_trap.y) < 100) {
        obj_vending_machine_trap.sprite_index = spr_vending_machine_thorn;
        instance_create(obj_vending_machine_trap.x, obj_vending_machine_trap.y + 130, obj_message);
        obj_message.sprite_index = spr_its_a_trap;
        effect_create_above(ef_explosion, x, y, 2, c_red);
        lives -= 1;
        audio_play_sound(sd_player_hurt, 1, false);
        audio_play_sound(sd_vending_trap, 1, false);
        obj_vending_machine_trap.isTouched = true;
    }
}
else if(global.rm_name = "Locker") {
    if(global.has_key = false && global.has_note_one = false && distance_to_point(obj_cabinet.x, obj_cabinet.y) < 100) {
        instance_create(obj_cabinet.x, obj_cabinet.y - 100, obj_message);
        obj_message.sprite_index = spr_no_key;
    }
    if(global.has_key = true && global.has_note_one = false && distance_to_point(obj_cabinet.x, obj_cabinet.y) < 100) {
        instance_create(obj_cabinet.x, obj_cabinet.y - 100, obj_message);
        obj_message.sprite_index = spr_note_one;
        global.has_note_one = true;
        global.has_key = false;
        audio_play_sound(sd_pick_tool, 1, false);
        obj_cabinet.sprite_index = spr_cabinet_open;
    }
}
else if(global.rm_name = "Locker Restroom") {
     if(global.has_key = false && distance_to_point(obj_sink.x, obj_sink.y) < 100) {
        instance_create(obj_sink.x, obj_sink.y + 70, obj_message);
        obj_message.sprite_index = spr_find_key;
        global.has_key = true;
        audio_play_sound(sd_pick_tool, 1, false);
    }
}
else if(global.rm_name = "China") {
    if(global.has_note_two = false && distance_to_point(obj_vase.x, obj_vase.y) < 100) {
        instance_create(obj_vase.x, obj_vase.y - 70, obj_message);
        obj_message.sprite_index = spr_note_two;
        global.has_note_two = true;
        audio_play_sound(sd_pick_tool, 1, false);
    }
    if(global.get_china_bullet = false && distance_to_point(obj_china_bullet.x, obj_china_bullet.y) < 100) {
        instance_create(obj_china_bullet.x, obj_china_bullet.y - 70, obj_message);
        obj_message.sprite_index = spr_china_bullet;
        global.get_china_bullet = true;
        global.bullet_num += 3;
        audio_play_sound(sd_colllet_bullet, 1, false);
    }
}
else if(global.rm_name = "Painting") {
    if(global.frame_hint = 0 && global.has_note_three = false && distance_to_point(obj_frame_note.x, obj_frame_note.y) < 50) {
        instance_create(obj_frame_note.x, obj_frame_note.y - 60, obj_message);
        obj_message.sprite_index = spr_msg_use_bone;
        global.frame_hint = 1;
    }
    else if(global.has_bone = true && global.frame_hint = 1 && global.has_note_three = false && distance_to_point(obj_frame_note.x, obj_frame_note.y) < 50) {
        instance_create(obj_frame_note.x, obj_frame_note.y - 60, obj_message);
        obj_message.sprite_index = spr_note_three;
        global.has_note_three = true;
        global.frame_hint = 2;
        audio_play_sound(sd_pick_tool, 1, false);
    }
    else if(global.has_bone = false && global.has_note_three = false) {
        instance_create(obj_frame_note.x, obj_frame_note.y - 60, obj_message);
        obj_message.sprite_index = spr_msg_dont_have_bone;
        global.frame_hint = 0;
    }
}
else if(global.rm_name = "Rome") {
    if(global.has_sword = false && distance_to_point(obj_sword_one.x, obj_sword_one.y) < 100) {
        with(obj_sword_one) {
            instance_destroy();
        }
        global.has_sword = true;
        audio_play_sound(sd_pick_tool, 1, false);
    }
    if(instance_exists(obj_warrior) && distance_to_point(obj_warrior.x, obj_warrior.y) < 120 && global.has_sword = true) {
        obj_warrior.warrior_lives -= 1;
        effect_create_above(ef_explosion, obj_warrior.x, obj_warrior.y, 1, c_black);
        audio_play_sound(sd_vending_trap, 1 ,false);
    }
    if(instance_exists(obj_warrior_two) && distance_to_point(obj_warrior_two.x, obj_warrior_two.y) < 120 && global.has_sword = true) {
        obj_warrior_two.warrior_lives -= 1;
        effect_create_above(ef_explosion, obj_warrior_two.x, obj_warrior_two.y, 1, c_black);
        audio_play_sound(sd_vending_trap, 1 ,false);
    }
    if(global.has_note_four = false && distance_to_point(obj_treasure.x, obj_treasure.y) < 80) {
        instance_create(obj_treasure.x, obj_treasure.y - 70, obj_message);
        obj_message.sprite_index = spr_note_four;
        obj_treasure.sprite_index = spr_treasure_open;
        global.has_note_four = true;
        audio_play_sound(sd_pick_tool, 1, false);
    }
}
else if(global.rm_name = "Greece") {
    if(global.has_note_one = true && global.has_note_two = true && global.has_note_three = true && global.has_note_four = true) {
        with(obj_door) {
            instance_destroy();
        }
    }
    else {
        instance_create(obj_door.x+50, obj_door.y - 60, obj_message);
        obj_message.sprite_index = spr_msg_should_find_pwd;
    }
}

            }
            if( position_meeting(mx, my, obj_b) = true ){
            //Bullet shoot
                if(global.bullet_num > 0) {
    audio_play_sound(sd_fire, 1, false);
    if(sprite_index = spr_player_right || sprite_index = spr_player_right_mid) {
        var bullet = instance_create(x, y+60, obj_bullet);
        bullet.sprite_index = spr_bullet_right;
        bullet.speed = 30;
        bullet.direction = 0;
    }
    if(sprite_index = spr_player_left || sprite_index = spr_player_left_mid) {
        var bullet = instance_create(x, y+60, obj_bullet);
        bullet.sprite_index = spr_bullet_left;
        bullet.speed = 30;
        bullet.direction = 180;
    }
    if(sprite_index = spr_player_up_left || sprite_index = spr_player_up_mid || sprite_index = spr_player_up_right) {
        var bullet = instance_create(x+50, y+60, obj_bullet);
        bullet.sprite_index = spr_bullet_up;
        bullet.speed = 30;
        bullet.direction = 90;
    }
    if(sprite_index = spr_player_down_left || sprite_index = spr_player_down_mid || sprite_index = spr_player_down_right) {
        var bullet = instance_create(x+50, y+50, obj_bullet);
        bullet.sprite_index = spr_bullet_down;
        bullet.speed = 30;
        bullet.direction = 270;
    }
    global.bullet_num -= 1;
}

            }
        }
    }
}
