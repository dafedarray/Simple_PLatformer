extends KinematicBody2D

const GRAVITY=2000
var velocity=Vector2()
const UP=Vector2(0,-1)
const WLKSPD=50
const JUMP_SPEED=500

func _physics_process(delta):
	fall(delta)
	walk()
	jump()
	move_and_slide(velocity,UP)	

func _process(delta):		
	update_animation(velocity)
	pass
	
	
func fall(delta):
	if is_on_ceiling():
		velocity.y=0
	if is_on_floor():
		velocity.y=0
	else:
		velocity.y += GRAVITY*delta

func walk():
	if Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left"):
		velocity.x=WLKSPD
	#	$Sprite.update_sprite("Walk")
	elif Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
		velocity.x=-WLKSPD
	#	$Sprite.update_sprite("Walk")
	else:
		velocity.x=0
	#	$Sprite.update_sprite("Idle")

func jump():
	if is_on_floor() and Input.is_action_pressed("ui_up"):
		velocity.y = -JUMP_SPEED
		#$Sprite.update_sprite("Jump")

func update_animation(velocity):
	$Sprite.update_sprite(velocity)






