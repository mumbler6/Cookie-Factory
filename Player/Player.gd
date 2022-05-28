extends KinematicBody2D

export var speed: = 250
var added_velocity = Vector2()

func _physics_process(delta: float) -> void:
<<<<<<< HEAD
	var direction: = calc_direction()
	move_and_slide(direction * speed * delta * 60) # 60 fps
=======
	var direction = calc_direction()
	var velocity = direction * speed + added_velocity
	move_and_slide(velocity)
>>>>>>> e81f0e5b6379946ce571db9728acc7c52079f2ef
	
func calc_direction() -> Vector2:
	var vel: = Vector2.ZERO
	vel.y = Input.get_axis("move_up","move_down")
	vel.x = Input.get_axis("move_left","move_right")
	return vel
