var device;
var m_x;
var m_y;
var flag=1;

for(device=0;device<5;device++) 
{
m_x=device_mouse_x(device);
m_y=device_mouse_y(device);
if(device_mouse_check_button(device,mb_left)=true){
if(place_meeting(m_x,m_y,obj_ui_left)=true){
x-=5;
sprite_index = spr_doraemonleft;
}
if (place_meeting(m_x,m_y,obj_ui_right)=true){
x+=5;
sprite_index = spr_doraemonright;
}
}
if(device_mouse_check_button_pressed(device,mb_left)=true){

if(place_meeting(m_x,m_y,obj_ui_jump)=true && place_meeting(x, y+1, obj_block)){
vspeed=-15;
sprite_index = spr_doraemonjump;
}

if(place_meeting(m_x,m_y,obj_restartbutton)=true)
{
room_restart();
score=0;
}

if(place_meeting(m_x,m_y,obj_menu)=true)
{
room_restart();
room_goto(room_lvlselect); 
}

if(place_meeting(m_x,m_y,obj_startbutton)=true)
{
room_goto_next();
}
if(place_meeting(m_x,m_y,obj_equipmentbutton)=true && flag==1 && place_meeting(x, y+1, obj_block))
{
vspeed=-25;
sprite_index = spr_doraemonwithequipment;
flag=0;
with (obj_equipmentbutton)
    {
     instance_destroy();
    }
}
if(place_meeting(m_x,m_y,obj_attackbutton)=true)
{
sprite_index = spr_doraemonwithgunleft;
var inst;
inst = instance_create(x, y+35, obj_bullet);
with (inst)
   {
   speed = 5;
   direction = 180;
   }
}

if(place_meeting(m_x,m_y,obj_iceattackbutton)=true)
{
sprite_index = spr_doraemonwithgunleft;
var inst;
inst = instance_create(x, y+35, obj_icebullet);
with (inst)
   {
   speed = 5;
   direction = 180;
   }
}

}
}
