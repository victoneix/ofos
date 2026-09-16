spd = 1.8;
hspd = 0;
vspd = 0;
grav = 0.3;

jump_height = 4;
coyote_time_max = 5;
coyote_time = 0;

moving = function(){
	var _right	= keyboard_check(ord("D"));
	var _left	= keyboard_check(ord("A"));
	var _up		= keyboard_check_pressed(ord("W"));
	var _place_down	= place_meeting(x,y+1,obj_collision);
	var _place_top	= place_meeting(x,y-1,obj_collision);
	
	hspd = (_right - _left)*spd;
	vspd += grav;
	vspd = clamp(vspd, -5, 5);
	
	if(_place_down || _place_top){
		coyote_time = coyote_time_max;
	} else{
		coyote_time--;
	}
	
	if(coyote_time > 0 && _up){
		coyote_time = 0;
		vspd = 0;
		if(_place_down){
			vspd -= jump_height;
		} else if(_place_top){
			vspd += jump_height;
		}
	}
}

collision = function(){
	repeat(abs(hspd)){
		if(place_meeting(x+sign(hspd),y,obj_collision)){
			hspd = 0;
			break;
		} else{
			x+=sign(hspd);
		}
	}
	
	repeat(abs(vspd)){
		if(place_meeting(x,y+sign(vspd),obj_collision)){
			vspd = 0;
			break;
		} else{
			y+=sign(vspd);
		}
	}
}