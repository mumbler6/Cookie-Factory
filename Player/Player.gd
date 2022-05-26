extends KinematicBody2D

const speed = 250
var velocity = Vector2()

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("move_down"):
		velocity.y = speed
	elif Input.is_action_pressed("move_up"):
		velocity.y = -speed
	else:
		velocity.y = 0
	
	if Input.is_action_pressed("move_left"):
		velocity.x = -speed
	elif Input.is_action_pressed("move_right"):
		velocity.x = speed
	else:
		velocity.x = 0
	

	
	velocity = move_and_slide(velocity)
	
