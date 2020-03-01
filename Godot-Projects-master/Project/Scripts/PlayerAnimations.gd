extends AnimatedSprite

func update_sprite(velocity):	
	if velocity.x<0:
		play("Walk")
		flip_h=true
	elif velocity.x>0:
		play("Walk")
		flip_h=false
	elif velocity.y < 0 or velocity.y>0:
		play("Jump")
	else :
		play("Idle")
	
	

