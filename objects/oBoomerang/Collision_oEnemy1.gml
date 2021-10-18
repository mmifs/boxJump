other.hp-=damage;
instance_destroy();

//knockback
if (x-other.x>0){
	other.hspeed += knockback;
}else if(x-other.x<0){
	other.hspeed -= knockback;
}