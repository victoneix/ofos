image_index = global.active;
if(instance_place(x,y,obj_player) && keyboard_check_pressed(ord("E"))){
	global.active =! global.active;
	with(obj_player){
		grav *= -1;
	}
}